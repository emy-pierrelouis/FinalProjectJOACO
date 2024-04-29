using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class RetourCommande
{
    public int RetourId { get; set; }

    public int CommandeId { get; set; }

    public string Raison { get; set; } = null!;

    public DateTime DateRetour { get; set; }

    public string StatutRetour { get; set; } = null!;

    public virtual Commande Commande { get; set; } = null!;
}
