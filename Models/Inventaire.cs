using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class Inventaire
{
    public int InventaireId { get; set; }

    public int ProduitId { get; set; }

    public int StockQuantite { get; set; }

    public string StatutDispo { get; set; } = null!;

    public virtual ICollection<Produit> Produits { get; set; } = new List<Produit>();
}
