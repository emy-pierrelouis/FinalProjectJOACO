using JOACOProjectByEmNEm.Models;
using JOACOProjectByEmNEm.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace JOACOProjectByEmNEm.Controllers
{
    public class AdminController : Controller
    {
        private readonly JoacoContext _context;

        public AdminController(JoacoContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> IndexAsync()
        {

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var userInfo = await _context.UtilisateursInfos.FirstOrDefaultAsync(u => u.Id == userId);
            var userName = userInfo?.Prenom;

            ViewData["Prenom"] = userName;

            var indisponible = await _context.Produits
                .Where(p => p.StatutDispo == "Indisponible")
                .Select(p => new AdminDashboard
                {
                    ProduitId = p.ProduitId,
                    ProduitNom = p.ProduitNom,
                    ProduitType = p.ProduitType,
                    StatutDispo = p.StatutDispo
                })
                .ToListAsync();

            var warning = await _context.Produits
                .Where(p => p.StockQuantite < 10)
                .Select(p => new AdminDashboard
                {
                    ProduitId = p.ProduitId,
                    ProduitNom = p.ProduitNom,
                    ProduitType = p.ProduitType,
                    StockQuantite = p.StockQuantite,
                })
                .ToListAsync();

            var admin = new AdminDashboard
            {
                ProduitNonDispo = indisponible,
                ProduitLowStock = warning
            };

            return View(admin);
        }
    }
}
