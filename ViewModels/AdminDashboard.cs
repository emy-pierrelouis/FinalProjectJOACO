using JOACOProjectByEmNEm.Models;

namespace JOACOProjectByEmNEm.ViewModels
{
    internal class AdminDashboard
    {
        public int ProduitId { get; set; }
        public string ProduitNom { get; set; }
        public string ProduitType { get; set; }
        public int StockQuantite { get; set; }
        public string StatutDispo { get; set; }
        public List<AdminDashboard> ProduitNonDispo { get; internal set; }
        public List<AdminDashboard> ProduitLowStock { get; internal set; }
    }
}