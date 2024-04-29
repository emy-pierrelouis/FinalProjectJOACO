using JOACOProjectByEmNEm.Models;

namespace JOACOProjectByEmNEm.ViewModels
{
    public class CommandeIndex
    {
        public int? CommandeId { get; set; }
        public string? Id { get; set; }
        public List<Produit>? ProduitsCommandes { get; set; }
        public DateTime DateCommande { get; set; }
        public string? AdresseLivraison { get; set; }
        public string? StatutCommande { get; set; }
        public string? MethodePaiement { get; set; }
    }
}
