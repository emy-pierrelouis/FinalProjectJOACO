using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class Adress
{
    public int AdresseId { get; set; }

    public string Id { get; set; } = null!;

    public string Adresse { get; set; } = null!;

    public string Ville { get; set; } = null!;

    public string Pays { get; set; } = null!;

    public string CodePostal { get; set; } = null!;

    public string? AdresseLivraison { get; set; }

    public virtual ICollection<Commande> Commandes { get; set; } = new List<Commande>();

    public virtual AspNetUser IdNavigation { get; set; } = null!;
}
