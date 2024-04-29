using JOACOProjectByEmNEm.Models;

namespace JOACOProjectByEmNEm.ViewModels
{
    internal class ProdCatalog
    {
        public int ProduitId { get; set; }
        public string ProduitNom { get; set; }
        public string ProduitType { get; set; }
        public string StatutDispo { get; set; }
        public string Description { get; set; }
        public decimal Prix { get; set; }

        public virtual ICollection<Media> Media { get; set; } = new List<Media>();
    }
}