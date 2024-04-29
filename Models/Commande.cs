using System;
using System.Collections.Generic;

namespace JOACOProjectByEmNEm.Models;

public partial class Commande
{
    public int CommandeId { get; set; }

    public string? Id { get; set; }

    public int AdresseLivraisonId { get; set; }

    public DateTime DateCommande { get; set; }

    public string StatutCommande { get; set; } = null!;

    public string? MethodePaiement { get; set; }

    public string? Commentaire { get; set; }

    public virtual Adress AdresseLivraison { get; set; } = null!;

    public virtual AspNetUser? IdNavigation { get; set; }

    public virtual ICollection<ProduitsCommande> ProduitsCommandes { get; set; } = new List<ProduitsCommande>();

    public virtual ICollection<RetourCommande> RetourCommandes { get; set; } = new List<RetourCommande>();
}
