using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class ProduitsCommande
{
    public int ProduitCommandeId { get; set; }

    public int CommandeId { get; set; }

    public int ProduitId { get; set; }

    public int Quantite { get; set; }

    public decimal PrixUnitaire { get; set; }

    public decimal? Promotions { get; set; }

    public virtual Commande Commande { get; set; } = null!;

    public virtual Produit Produit { get; set; } = null!;
}
