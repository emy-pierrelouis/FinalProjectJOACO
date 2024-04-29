using JOACOProjectByEmNEm.Models;

namespace JOACOProjectByEmNEm.ViewModels
{
    internal class HomeProd
    {
        public int ProduitId { get; set; }
        public string ProduitNom { get; set; }
        public decimal Prix { get; set; }

        public virtual ICollection<Media> Media { get; set; } = new List<Media>();
    }
}