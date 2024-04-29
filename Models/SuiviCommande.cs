using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class SuiviCommande
{
    public int SuiviId { get; set; }

    public int CommandeId { get; set; }

    public DateTime DateSuivi { get; set; }

    public string Statut { get; set; } = null!;

    public string Commentaire { get; set; } = null!;
}
