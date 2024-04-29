using JOACOProjectByEmNEm.Models;

namespace JOACOProjectByEmNEm.ViewModels
{
    public class CommandeCreate
    {
        // Informations utilisateur
        public string? Prenom { get; set; }
        public string? Nom { get; set; }

        // Informations d'adresse
        public string? NumeroCivique { get; set; }
        public string? NomRue { get; set; }
        public string? NumeroAppartement { get; set; }
        public string? Ville { get; set; }
        public string? Pays { get; set; }
        public string? CodePostal { get; set; }

        // Détails de la commande
        public Commande? Commande { get; set; }

        // Liste des produits et barre de recherche
        public string? SearchTerm { get; set; }
        public List<Produit>? Produits { get; set; }
    }
}