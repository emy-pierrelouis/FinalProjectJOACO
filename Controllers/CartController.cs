using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using JOACOProjectByEmNEm.Models;
using Stripe;
using Microsoft.Extensions.Configuration;
using JOACOProjectByEmNEm.ViewModels;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using Newtonsoft.Json;

namespace JOACOProjectByEmNEm.Controllers
{
    public class PaymentData
    {
        public string CardNumber { get; set; }
        public string ExpiryDate { get; set; }
        public string CVV { get; set; }
        public string Token { get; set; }
    }

    public class CartController : Controller
    {
        private readonly JoacoContext _context;
        private readonly IConfiguration _configuration;

        public CartController(JoacoContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration; // Initialiser IConfiguration
            StripeConfiguration.ApiKey = _configuration.GetSection("Stripe")["SecretKey"]; // Initialize Stripe with your API key
        }

        // POST: /Cart/ProcessPayment
        [HttpPost]
        public IActionResult ProcessPayment(string stripeToken)
        {

            try
            {
                var options = new PaymentIntentCreateOptions
                {
                    Amount = 1000,
                    Currency = "cad",
                    AutomaticPaymentMethods = new PaymentIntentAutomaticPaymentMethodsOptions
                    {
                        Enabled = true,
                    },
                };

                var service = new PaymentIntentService();
                var charge = service.Create(options);


                ViewBag.Message = "Payment successful";

                return RedirectToAction("PaymentSuccess");
            }
            catch (StripeException ex)
            {

                ViewBag.Error = ex.Message;
                return View("PaymentError");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "An error occurred while processing your payment.";
                return View("PaymentError");
            }
        }

        public IActionResult PaymentSuccess()
        {
            ViewBag.Message = "Payment successful";
            return View();
        }

        public IActionResult PaymentError()
        {
            ViewBag.Message = "Payment unsuccessful";

            return View();
        }

        public async Task<IActionResult> Index()
        {
            var cartItems = await _context.Commandes
                .Include(c => c.ProduitsCommandes)
                .ThenInclude(pc => pc.Produit)
                .ToListAsync();

            return View(cartItems);
        }

        [HttpGet]
        public IActionResult Checkout()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SubmitAddress([Bind("Prenom,Nom,NumeroCivique,NomRue,NumeroAppartement,Ville,Pays,CodePostal,SearchTerm,Produits")] CommandeCreate commandeCreate)
        {
            if (ModelState.IsValid)
            {

                var idUtilisateur = User.FindFirstValue(ClaimTypes.NameIdentifier);

                var nouveauUser = new UtilisateursInfo
                {
                    Id = idUtilisateur,
                    Prenom = commandeCreate.Prenom,
                    Nom = commandeCreate.Nom,
                    DateCreation = DateTime.Now
                };

                _context.UtilisateursInfos.Add(nouveauUser);

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

                _context.Adresses.Add(nouvelleAdresse);

                await _context.SaveChangesAsync();

                var userinfo = _context.AspNetUsers.FirstOrDefault(e => e.Id == nouveauUser.Id);

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

                _context.Commandes.Add(nouvelleCommande);

                await _context.SaveChangesAsync();

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
                    Debug.WriteLine($"ProduitNom: {produit.ProduitNom}, StockQuantite: {produit.StockQuantite}");
                    var productId = _context.Produits.FirstOrDefault(p => p.ProduitNom == produit.ProduitNom);

                    decimal prixTotal = productId.Prix * produit.StockQuantite;

                    var nouveauProduitsCommandes = new ProduitsCommande
                    {
                        CommandeId = nouvelleCommande.CommandeId,
                        ProduitId = productId.ProduitId,
                        Quantite = produit.StockQuantite,
                        PrixUnitaire = prixTotal
                    };

                    nouvelleCommande.ProduitsCommandes.Add(nouveauProduitsCommandes);

                    _context.ProduitsCommandes.Add(nouveauProduitsCommandes);
                }

                await _context.SaveChangesAsync();


                return RedirectToAction("Index", "Home");
            }

            var produits = _context.Produits.ToList();
            commandeCreate.Produits = produits;
            return View(commandeCreate);
        }


        private bool CommandeExists(int id)
        {
            return (_context.Commandes?.Any(e => e.CommandeId == id)).GetValueOrDefault();
        }
    }
}