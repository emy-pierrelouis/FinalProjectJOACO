using JOACOProjectByEmNEm.Models;
using JOACOProjectByEmNEm.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace JOACOProjectByEmNEm.Controllers
{
    public class ShopController : Controller
    {
        private readonly ILogger<ShopController> _logger;

        private readonly JoacoContext _context;

        public ShopController(ILogger<ShopController> logger, JoacoContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            var produits = _context.Produits
                .Where(p => p.StatutDispo == "Disponible")
                .Select(
            p => new ProdCatalog
            {
                ProduitId = p.ProduitId,
                ProduitNom = p.ProduitNom,
                ProduitType = p.ProduitType,
                Prix = p.Prix,
                Media = p.Media
            });

            return View(produits);
        }

        public IActionResult Details(int id)
        {
            var produits = _context.Produits
                .Where(p => p.ProduitId == id)
                .Select(
            p => new ProdCatalog
            {
                ProduitNom = p.ProduitNom,
                Description = p.ProduitDescription,
                Prix = p.Prix,
                StatutDispo = p.StatutDispo,
                Media = p.Media
            }).FirstOrDefault();

            if (produits == null)
            {
                return NotFound();
            }

            return View(produits);
        }
    }
}
