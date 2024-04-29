using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using JOACOProjectByEmNEm.Models;
using JOACOProjectByEmNEm.ViewModels;
using System.Diagnostics;
using Humanizer;
using MailKit;
using Newtonsoft.Json;
using System.Security.Claims;

namespace JOACOProjectByEmNEm.Controllers
{
    public class CommandesController : Controller
    {
        private readonly JoacoContext _context;

        public CommandesController(JoacoContext context)
        {
            _context = context;
        }

        // GET: Commandes
        public async Task<IActionResult> Index()
        {
            var commandes = await _context.Commandes
                .Include(c => c.IdNavigation)
                .Include(c => c.ProduitsCommandes)
                    .ThenInclude(pc => pc.Produit)
                .ToListAsync();
            Debug.WriteLine("NEW CHECK STUFF");
            foreach (var command in commandes)
            {
                var properties = command.GetType().GetProperties();
                foreach (var property in properties)
                {
                    var value = property.GetValue(command);
                    Debug.WriteLine($"{property.Name}: {value}");
                }
            }

            var commande = commandes.Select(c => new Commande
            {   

                CommandeId = c.CommandeId,
                Id = c.IdNavigation.UserName,
                ProduitsCommandes = c.ProduitsCommandes,
                DateCommande = c.DateCommande,
                AdresseLivraison = returnAddress(c.AdresseLivraisonId),
                StatutCommande = c.StatutCommande,
                MethodePaiement = c.MethodePaiement
            }).ToList();

            return View(commande);
        }

        // GET: Commandes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var commande = await _context.Commandes
                .Include(c => c.ProduitsCommandes)
                .ThenInclude(pc => pc.Produit)
                .Include(c => c.AdresseLivraison)
                .Include(c => c.IdNavigation)
                .FirstOrDefaultAsync(m => m.CommandeId == id);

            if (commande == null)
            {
                return NotFound();
            }

            return View(commande);
        }

        // GET: Commandes/Create
        [Authorize]
        public IActionResult Create()
        {
            // Initialisez ViewData pour vos SelectList
            ViewData["RetourCommandes"] = new SelectList(_context.RetourCommandes, "RetourId", "RetourId");
            ViewData["SuiviCommandes"] = new SelectList(_context.SuiviCommandes, "SuiviId", "SuiviId");
            ViewData["Paiements"] = new SelectList(_context.Paiements, "PaiementId", "PaiementId");
            ViewData["AspNetUsers"] = new SelectList(_context.AspNetUsers, "Id", "Id");

            // Charger les produits depuis la base de données
            var produits = _context.Produits.ToList();

            // Créer une nouvelle instance de CommandeCreate
            var commandeCreate = new CommandeCreate
            {
                Produits = produits
            };

            // Passez cette instance à la vue
            return View(commandeCreate);
        }

        // GET: Commandes/SearchProducts
        [HttpGet]
        public IActionResult SearchProducts(string searchTermProduits) 
        {
            var produits = _context.Produits
                .Where(p => p.ProduitNom.Contains(searchTermProduits)) 
                .Select(p => new {
                    ProduitId = p.ProduitId,
                    ProduitNom = p.ProduitNom,
                    ProduitType = p.ProduitType,
                    ProduitDescription = p.ProduitDescription,
                })
                .ToList();

            return Json(produits);
        }

        // GET: Commandes/SearchTerm
        [HttpGet]
        public IActionResult SearchTerm(string searchTermProduits)
        {
            var produits = _context.Produits
                .Where(p => p.ProduitNom.Contains(searchTermProduits))
                .Select(p => new {
                    ProduitId = p.ProduitId,
                    ProduitNom = p.ProduitNom,
                    ProduitType = p.ProduitType,
                    ProduitDescription = p.ProduitDescription,
                })
                .ToList();

            return Json(produits);
        }

        // POST: Commandes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Prenom,Nom,NumeroCivique,NomRue,NumeroAppartement,Ville,Pays,CodePostal,SearchTerm,Produits")] CommandeCreate commandeCreate)
        {
            if (ModelState.IsValid)
            {
                var idUtilisateur = User.FindFirstValue(ClaimTypes.NameIdentifier);
                //Ajouter prénom et nom dans Utilisateurs_Info
                var nouveauUser = new UtilisateursInfo
                {
                    Id = idUtilisateur,
                    Prenom = commandeCreate.Prenom,
                    Nom = commandeCreate.Nom,
                    DateCreation = DateTime.Now
                };

                //Ajouter le prénom et nom associé à la commande 
                _context.UtilisateursInfos.Add(nouveauUser);

                // Sauvegarder les modifications dans la base de données
                await _context.SaveChangesAsync();

                var nouvelleAdresse = new Adress
                {
                    Id = nouveauUser.Id,
                    Adresse = string.IsNullOrEmpty(commandeCreate.NumeroAppartement)
                    ? $"{commandeCreate.NumeroCivique} {commandeCreate.NomRue}"
                    : $"{commandeCreate.NumeroAppartement}-{commandeCreate.NumeroCivique} {commandeCreate.NomRue}",
                    Ville = commandeCreate.Ville,
                    Pays = commandeCreate.Pays,
                    CodePostal = commandeCreate.CodePostal,
                    AdresseLivraison = $"{commandeCreate.NumeroCivique} {commandeCreate.NomRue} {commandeCreate.NumeroAppartement} {commandeCreate.Ville} {commandeCreate.Pays} {commandeCreate.CodePostal}"
                };

                //Ajouter la nouvelle adresse associé au user
                _context.Adresses.Add(nouvelleAdresse);

                // Sauvegarder les modifications dans la base de données
                await _context.SaveChangesAsync();

                var userinfo = _context.AspNetUsers.FirstOrDefault(e => e.Id == nouveauUser.Id);
                // Créer une nouvelle commande
                var nouvelleCommande = new Commande
                {
                    Id = nouveauUser.Id,
                    IdNavigation = userinfo,
                    DateCommande = DateTime.Now,
                    AdresseLivraison = nouvelleAdresse,
                    StatutCommande = "En cours",
                    MethodePaiement = "VISA",
                    AdresseLivraisonId = nouvelleAdresse.AdresseId
                };

                Debug.WriteLine("INFORMATION GOES HERE");
                Debug.WriteLine(commandeCreate.Prenom);
                Debug.WriteLine(commandeCreate.Nom);
                Debug.WriteLine(commandeCreate.NumeroCivique);
                Debug.WriteLine(commandeCreate.NomRue);
                Debug.WriteLine(commandeCreate.NumeroAppartement);
                Debug.WriteLine(commandeCreate.Ville);
                Debug.WriteLine(commandeCreate.Pays);
                Debug.WriteLine(commandeCreate.CodePostal);
                Debug.WriteLine(nouveauUser.Prenom);
                Debug.WriteLine(nouveauUser.Nom);
                Debug.WriteLine(nouvelleAdresse.Adresse);
                Debug.WriteLine(nouvelleAdresse.AdresseId); 
                Debug.WriteLine("HTML CHECK");
                Debug.WriteLine(nouvelleCommande.AdresseLivraison);
                Debug.WriteLine(nouvelleCommande.AdresseLivraison.AdresseLivraison);

                // Ajouter la nouvelle commande à votre contexte de base de données
                _context.Commandes.Add(nouvelleCommande);

                // Sauvegarder les modifications dans la base de données
                await _context.SaveChangesAsync();

                //Test again 
                nouvelleCommande.IdNavigation = userinfo;
                nouvelleCommande.AdresseLivraison = nouvelleAdresse;

                //PRODUITS COMMANDE HERE

                Debug.WriteLine("THIS IS WHAT WE GET FROM GET FROM FRONT END");
                Debug.WriteLine(commandeCreate.SearchTerm);
                var jsonstring = commandeCreate.SearchTerm;
                List<Produit> produitsList = JsonConvert.DeserializeObject<List<Produit>>(jsonstring);

                Debug.WriteLine(produitsList.Count);

                

                foreach (var produit in produitsList)
                {
                    Debug.WriteLine($"ProduitId: {produit.ProduitId}, ProduitNom: {produit.ProduitNom}, StockQuantite: {produit.StockQuantite}");

                    var produitUnite = _context.Produits.FirstOrDefault(p => p.ProduitId == produit.ProduitId);

                    decimal prixTotal = produitUnite.Prix * produit.StockQuantite;

                    var nouveauProduitsCommandes = new ProduitsCommande
                    {
                        CommandeId = nouvelleCommande.CommandeId,
                        ProduitId = produit.ProduitId,
                        Quantite = produit.StockQuantite,
                        PrixUnitaire = prixTotal
                    };

                    nouvelleCommande.ProduitsCommandes.Add(nouveauProduitsCommandes);
                    // Ajouter la nouvelle commande à votre contexte de base de données
                    _context.ProduitsCommandes.Add(nouveauProduitsCommandes);

                    // Emy to Em: I added this here. So, that the inventory updates as we go.
                    var inventaireUpdate = await _context.Produits.FindAsync(produit.ProduitId);

                    if (inventaireUpdate != null)
                    {
                        inventaireUpdate.StockQuantite -= produit.StockQuantite;
                        _context.Update(inventaireUpdate);

                        if (inventaireUpdate.StockQuantite <= 0)
                        {
                            inventaireUpdate.StatutDispo = "Indisponible";
                        }

                        _context.Update(inventaireUpdate);
                    }

                }


                // Sauvegarder les modifications dans la base de données
                await _context.SaveChangesAsync();


                // Rediriger vers l'index des commandes ou toute autre page appropriée
                return RedirectToAction(nameof(Index));
            }

            // Rechargez les données nécessaires pour la vue
            var produits = _context.Produits.ToList();
            commandeCreate.Produits = produits;
            return View(commandeCreate);
        }


        // GET: Commandes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var commande = await _context.Commandes.FindAsync(id);
            if (commande == null)
            {
                return NotFound();
            }

            ViewData["RetourCommandes"] = new SelectList(_context.RetourCommandes, "RetourId", "RetourId");
            ViewData["SuiviCommandes"] = new SelectList(_context.SuiviCommandes, "SuiviId", "SuiviId");
            ViewData["Paiements"] = new SelectList(_context.Paiements, "PaiementId", "PaiementId");
            ViewData["AspNetUsers"] = new SelectList(_context.AspNetUsers, "Id", "Id");

            return View(commande);
        }

        // POST: Commandes/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CommandeId,Id,AdresseLivraisonId,DateCommande,StatutCommande,MethodePaiement,Commentaire")] Commande commande)
        {
            if (id != commande.CommandeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(commande);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CommandeExists(commande.CommandeId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }

            ViewData["RetourCommandes"] = new SelectList(_context.RetourCommandes, "RetourId", "RetourId");
            ViewData["SuiviCommandes"] = new SelectList(_context.SuiviCommandes, "SuiviId", "SuiviId");
            ViewData["Paiements"] = new SelectList(_context.Paiements, "PaiementId", "PaiementId");
            ViewData["AspNetUsers"] = new SelectList(_context.AspNetUsers, "Id", "Id");
            return View(commande);
        }

        // GET: Commandes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var commande = await _context.Commandes
                .Include(c => c.AdresseLivraison)
                .Include(c => c.IdNavigation)
                .FirstOrDefaultAsync(m => m.CommandeId == id);

            if (commande == null)
            {
                return NotFound();
            }

            return View(commande);
        }

        // POST: Commandes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var commande = await _context.Commandes.FindAsync(id);
            if (commande == null)
            {
                return NotFound();
            }

            _context.Commandes.Remove(commande);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CommandeExists(int id)
        {
            return _context.Commandes.Any(e => e.CommandeId == id);
        }

        private Adress returnAddress(int id)
        {
            var addressinfo = _context.Adresses.FirstOrDefault(e => e.AdresseId == id);
            return addressinfo;
        }
    }
}
