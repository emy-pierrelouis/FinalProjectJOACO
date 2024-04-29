using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class UtilisateursInfo
{
    public int UtilisateurId { get; set; }

    public string? Id { get; set; }

    public string Nom { get; set; } = null!;

    public string Prenom { get; set; } = null!;

    public DateTime DateCreation { get; set; }

    public virtual AspNetUser? IdNavigation { get; set; }
}
