using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class Abonnement
{
    public int AbonneId { get; set; }

    public string AbonneEmail { get; set; } = null!;

    public DateTime AbonneDate { get; set; }
}
