using JOACOProjectByEmNEm.Models;
using Microsoft.AspNetCore.Mvc;

namespace JOACOProjectByEmNEm.Controllers
{
    public class SubController : Controller
    {
        private readonly ILogger<SubController> _logger;

        private readonly JoacoContext _context;
        public SubController(ILogger<SubController> logger, JoacoContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpPost]
        public async Task<IActionResult> Subscribe(Abonnement abonnement)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    abonnement.AbonneDate = DateTime.Now;
                    _context.Abonnements.Add(abonnement);
                    await _context.SaveChangesAsync();

                    return RedirectToAction("Index", "Home");
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex.Message + " :: Une erreur est survenue.");
 
                    return View("Error");
                }
            }

            return RedirectToAction("Index", "Home");
        }
    }
}
