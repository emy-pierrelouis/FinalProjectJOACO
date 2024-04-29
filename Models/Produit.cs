using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class Produit
{
    public int ProduitId { get; set; }

    public int? InventaireId { get; set; }

    public string ProduitType { get; set; } = null!;

    public string ProduitNom { get; set; } = null!;

    public string ProduitDescription { get; set; } = null!;

    public decimal Prix { get; set; }

    public int StockQuantite { get; set; }

    public string StatutDispo { get; set; } = null!;

    public virtual Inventaire? Inventaire { get; set; }

    public virtual ICollection<Media> Media { get; set; } = new List<Media>();

    public virtual ICollection<ProduitsCommande> ProduitsCommandes { get; set; } = new List<ProduitsCommande>();
}
