using JOACOProjectByEmNEm.Models;
using JOACOProjectByEmNEm.ViewModels;

//using JOACOProjectByEmNEm.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace JOACOProjectByEmNEm.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly JoacoContext _context;

        public HomeController(ILogger<HomeController> logger, JoacoContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            // en Vedette/why I added the where = the choosing the type featured on the front page.
            var homeProduits = _context.Produits
                .Where(p => p.ProduitType == "bundle")
                .OrderByDescending( p => p.Prix)
                .Take(4)
                .Select(p => new HomeProd
                {
                    ProduitId = p.ProduitId,
                    ProduitNom = p.ProduitNom,
                    Prix = p.Prix,
                    Media = p.Media
                });

            return View(homeProduits);
        }

    public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
