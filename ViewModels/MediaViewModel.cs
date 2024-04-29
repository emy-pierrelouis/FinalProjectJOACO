namespace JOACOProjectByEmNEm.ViewModels
{
    public class MediaViewModel
    {
        public int ProduitId { get; set; }

        public int? InventaireId { get; set; }

        public string ProduitType { get; set; } = null!;

        public string ProduitNom { get; set; } = null!;

        public string ProduitDescription { get; set; } = null!;

        public decimal Prix { get; set; }

        public int StockQuantite { get; set; }

        public string StatutDispo { get; set; } = null!;
        public int MediaId { get; set; }
        public string MediaDescription { get; set; } = null!;
        public IFormFile ProduitImg { get; set; } = null!;
    }
}