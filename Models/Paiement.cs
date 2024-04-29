using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class Paiement
{
    public int PaiementId { get; set; }

    public string Id { get; set; } = null!;

    public int CommandeId { get; set; }

    public decimal Montant { get; set; }

    public string Methode { get; set; } = null!;
}
