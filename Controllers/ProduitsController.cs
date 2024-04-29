using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using JOACOProjectByEmNEm.Models;
using JOACOProjectByEmNEm.ViewModels;
using FileSignatures.Formats;
using FileSignatures;
using Microsoft.CodeAnalysis.Differencing;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;

namespace JOACOProjectByEmNEm.Controllers
{
    [Authorize(Roles ="Admin")]
    public class ProduitsController : Controller
    {
        private readonly JoacoContext _context;

        public ProduitsController(JoacoContext context)
        {
            _context = context;
        }

        // GET: Produits
        public async Task<IActionResult> Index()
        {
            var joacoContext = _context.Produits
                .Include(p => p.Inventaire)
                .Include(p => p.Media);
            return View(await joacoContext.ToListAsync());
        }

        // GET: Produits/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Produits == null)
            {
                return NotFound();
            }

            var produit = await _context.Produits
                .Include(p => p.Inventaire)
                .Include(p => p.Media)
                .FirstOrDefaultAsync(m => m.ProduitId == id);
            if (produit == null)
            {
                return NotFound();
            }

            return View(produit);
        }

        // GET: Produits/Create
        public IActionResult Create()
        {
            ViewData["InventaireId"] = new SelectList(_context.Inventaires, "InventaireId", "InventaireId");
            return View();
        }

        // POST: Produits/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> Create([Bind("ProduitId,InventaireId,ProduitType,ProduitNom,ProduitDescription,Prix,StockQuantite,StatutDispo,ProduitImg,MediaDescription")] MediaViewModel media)
        {
            
            
            if (ModelState.IsValid)
            {
                try
                {
                    string fullPath = "";

                    using (var memoStream = new MemoryStream())
                    {
                        media.ProduitImg.CopyTo(memoStream);

                        var inspector = new FileFormatInspector();

                        var format = inspector.DetermineFileFormat(memoStream);

                        if (format is Png || format is Jpeg)
                        {
                            fullPath = UploadedFile(media);
                        }
                        else
                        {
                            ViewData["TypeError"] = "Veuillez utiliser une image de type JPG ou PNG.";
                            ViewData["InventaireId"] = new SelectList(_context.Inventaires, "InventaireId", "InventaireId", media.InventaireId);
                            return View(media);
                        }
                    }

                    var produit = new Produit
                    {
                        InventaireId = media.InventaireId,
                        ProduitType = media.ProduitType,
                        ProduitNom = media.ProduitNom,
                        ProduitDescription = media.ProduitDescription,
                        Prix = media.Prix,
                        StockQuantite = media.StockQuantite,
                        StatutDispo = media.StatutDispo,
                    };

                    _context.Add(produit);
                    await _context.SaveChangesAsync();

                    var inventaire = await _context.Inventaires.FirstOrDefaultAsync(i => i.ProduitId == produit.ProduitId);

                    if (inventaire == null)
                    {
                        inventaire = new Inventaire
                        {
                            ProduitId = produit.ProduitId,
                            StockQuantite = produit.StockQuantite,
                            StatutDispo = produit.StatutDispo,
                        };
                        _context.Add(inventaire);
                    }

                    await _context.SaveChangesAsync();

                    var pic = new Media
                    {
                        ProduitId = produit.ProduitId,
                        MediaId = media.MediaId,
                        MediaChemin = fullPath,
                        MediaDescription = media.MediaDescription
                    };

                    _context.Add(pic);
                    await _context.SaveChangesAsync();

                    return RedirectToAction(nameof(Index));
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Une erreur est survenue.");
                    return RedirectToAction("Error");
                }
            }

            ViewData["InventaireId"] = new SelectList(_context.Inventaires, "InventaireId", "InventaireId", media.InventaireId);
            return View(media);
        }

        private string UploadedFile(MediaViewModel media)
        {
            string uniqueName = "";

            if (media.ProduitImg != null)
            {
                string imgFolder = "wwwroot/media/";
                uniqueName = Guid.NewGuid().ToString() + "_" + media.ProduitImg.FileName;
                string filePath = Path.Combine(imgFolder, uniqueName);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    media.ProduitImg.CopyTo(fileStream);
                }
            }

            return uniqueName;
        }

        // GET: Produits/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Produits == null)
            {
                return NotFound();
            }

            var produit = await _context.Produits.FindAsync(id);
            if (produit == null)
            {
                return NotFound();
            }

            var prodDetails = new MediaViewModel
            {
                ProduitId = produit.ProduitId,
                InventaireId = produit.InventaireId,
                ProduitNom = produit.ProduitNom,
                ProduitType = produit.ProduitType,
                ProduitDescription = produit.ProduitDescription,
                Prix = produit.Prix,
                StockQuantite = produit.StockQuantite,
                StatutDispo = produit.StatutDispo

            };

            ViewData["InventaireId"] = new SelectList(_context.Inventaires, "InventaireId", "InventaireId", produit.InventaireId);
            return View(prodDetails);
        }

        // POST: Produits/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProduitId,InventaireId,ProduitType,ProduitNom,ProduitDescription,Prix,StockQuantite,StatutDispo,ProduitImg,MediaDescription")] MediaViewModel media)
        {
            if (id != media.ProduitId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var produit = await _context.Produits.Include(p => p.Media).FirstOrDefaultAsync(p => p.ProduitId == id);

                    if (produit == null)
                    {
                        return NotFound();
                    }

                    // I'm just gonna delete images every time...
                    if (produit.Media != null && produit.Media.Any())
                    {
                        foreach (var removeMedia in produit.Media)
                        {
                            string fullpath = removeMedia.MediaChemin;
                            if (!string.IsNullOrEmpty(fullpath) && System.IO.File.Exists(fullpath))
                            {
                                System.IO.File.Delete(fullpath);
                            }
                            _context.Media.Remove(removeMedia);
                        }
                    }

                    string fullPath = "";

                    using (var memoStream = new MemoryStream())
                    {
                        media.ProduitImg.CopyTo(memoStream);

                        var inspector = new FileFormatInspector();
                        var format = inspector.DetermineFileFormat(memoStream);

                        if (format is Png || format is Jpeg)
                        {
                            fullPath = UploadedFile(media);
                        }
                        else
                        {
                            ViewData["TypeError"] = "Veuillez utiliser une image de type JPG ou PNG.";
                            ViewData["InventaireId"] = new SelectList(_context.Inventaires, "InventaireId", "InventaireId", media.InventaireId);

                            return View(media);
                        }
                    }

                    produit.InventaireId = media.InventaireId;
                    produit.ProduitType = media.ProduitType;
                    produit.ProduitNom = media.ProduitNom;
                    produit.ProduitDescription = media.ProduitDescription;
                    produit.Prix = media.Prix;
                    produit.StockQuantite = media.StockQuantite;
                    produit.StatutDispo = media.StatutDispo;

                    _context.Update(produit);
                    await _context.SaveChangesAsync();

                    var inventaire = await _context.Inventaires.FirstOrDefaultAsync(i => i.ProduitId == produit.ProduitId);

                    if (inventaire != null)
                    {
                        inventaire.StockQuantite = produit.StockQuantite;
                        inventaire.StatutDispo = produit.StatutDispo;

                        _context.Update(inventaire);
                    }
                    else
                    {
                        inventaire = new Inventaire
                        {
                            ProduitId = produit.ProduitId,
                            StockQuantite = produit.StockQuantite,
                            StatutDispo = produit.StatutDispo
                        };

                        _context.Add(inventaire);
                    }

                    await _context.SaveChangesAsync();

                    var pic = new Media
                    {
                        ProduitId = produit.ProduitId,
                        MediaId = media.MediaId,
                        MediaChemin = fullPath,
                        MediaDescription = media.MediaDescription
                    };

                    _context.Add(pic);
                    await _context.SaveChangesAsync();

                    return RedirectToAction(nameof(Index));
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(ex.Message, " :: Une erreur est survenue.");
                    return RedirectToAction("Error");
                }
            }
            ViewData["InventaireId"] = new SelectList(_context.Inventaires, "InventaireId", "InventaireId", media.InventaireId);
            return View(media);
        }

        // GET: Produits/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Produits == null)
            {
                return NotFound();
            }

            var produit = await _context.Produits
                .Include(p => p.Inventaire)
                .FirstOrDefaultAsync(m => m.ProduitId == id);
            if (produit == null)
            {
                return NotFound();
            }

            return View(produit);
        }

        // POST: Produits/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var produit = await _context.Produits.Include(p => p.Media).FirstOrDefaultAsync(p => p.ProduitId == id);

            if (produit == null)
            {
                return NotFound();
            }

            bool ongoingOrder = _context.ProduitsCommandes.Any(pc => pc.ProduitId == id);

            if (ongoingOrder)
            {
                TempData["Erreur"] = "Le produit se retrouve actuellement dans une commande en cours.";
                return RedirectToAction(nameof(Index));
            }

            if (produit.Media != null && produit.Media.Any())
            {
                foreach (var removeMedia in produit.Media)
                {
                    string fullpath = removeMedia.MediaChemin;
                    if (!string.IsNullOrEmpty(fullpath) && System.IO.File.Exists(fullpath))
                    {
                        System.IO.File.Delete(fullpath);
                    }
                    _context.Media.Remove(removeMedia);
                }
            }

            _context.Produits.Remove(produit);

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProduitExists(int id)
        {
            return (_context.Produits?.Any(e => e.ProduitId == id)).GetValueOrDefault();
        }
    }
}
