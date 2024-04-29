using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class Media
{
    public int MediaId { get; set; }

    public int ProduitId { get; set; }

    public string MediaChemin { get; set; } = null!;

    public string MediaDescription { get; set; } = null!;

    public virtual Produit Produit { get; set; } = null!;
}
