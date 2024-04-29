using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace JOACOProjectByEmNEm.Models;

public partial class JoacoContext : DbContext
{
    public JoacoContext()
    {
    }

    public JoacoContext(DbContextOptions<JoacoContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Abonnement> Abonnements { get; set; }

    public virtual DbSet<Adress> Adresses { get; set; }

    public virtual DbSet<AspNetRole> AspNetRoles { get; set; }

    public virtual DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; }

    public virtual DbSet<AspNetUser> AspNetUsers { get; set; }

    public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }

    public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }

    public virtual DbSet<AspNetUserToken> AspNetUserTokens { get; set; }

    public virtual DbSet<Blog> Blogs { get; set; }

    public virtual DbSet<Commande> Commandes { get; set; }

    public virtual DbSet<Inventaire> Inventaires { get; set; }

    public virtual DbSet<Media> Media { get; set; }

    public virtual DbSet<Message> Messages { get; set; }

    public virtual DbSet<Paiement> Paiements { get; set; }

    public virtual DbSet<Produit> Produits { get; set; }

    public virtual DbSet<ProduitsCommande> ProduitsCommandes { get; set; }

    public virtual DbSet<RetourCommande> RetourCommandes { get; set; }

    public virtual DbSet<SuiviCommande> SuiviCommandes { get; set; }

    public virtual DbSet<UtilisateursInfo> UtilisateursInfos { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=ConnectionStrings:DefaultConnection");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Abonnement>(entity =>
        {
            entity.HasKey(e => e.AbonneId).HasName("PK__Abonneme__47300D04DE84B93A");

            entity.ToTable("Abonnement");

            entity.HasIndex(e => e.AbonneEmail, "UC_Abonnement_abonne_email").IsUnique();

            entity.Property(e => e.AbonneId).HasColumnName("abonne_id");
            entity.Property(e => e.AbonneDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("abonne_date");
            entity.Property(e => e.AbonneEmail)
                .HasMaxLength(255)
                .HasColumnName("abonne_email");
        });

        modelBuilder.Entity<Adress>(entity =>
        {
            entity.HasKey(e => e.AdresseId).HasName("PK_Adresse_Utilisateurs");

            entity.Property(e => e.AdresseId).HasColumnName("adresse_id");
            entity.Property(e => e.Adresse)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("adresse");
            entity.Property(e => e.AdresseLivraison)
                .HasMaxLength(200)
                .IsFixedLength()
                .HasColumnName("adresse_livraison");
            entity.Property(e => e.CodePostal)
                .HasMaxLength(7)
                .IsFixedLength()
                .HasColumnName("code_postal");
            entity.Property(e => e.Id).HasMaxLength(450);
            entity.Property(e => e.Pays)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("pays");
            entity.Property(e => e.Ville)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("ville");

            entity.HasOne(d => d.IdNavigation).WithMany(p => p.Adresses)
                .HasForeignKey(d => d.Id)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Adresses_AspNetUsers");
        });

        modelBuilder.Entity<AspNetRole>(entity =>
        {
            entity.HasIndex(e => e.NormalizedName, "RoleNameIndex")
                .IsUnique()
                .HasFilter("([NormalizedName] IS NOT NULL)");

            entity.Property(e => e.Name).HasMaxLength(256);
            entity.Property(e => e.NormalizedName).HasMaxLength(256);
        });

        modelBuilder.Entity<AspNetRoleClaim>(entity =>
        {
            entity.HasIndex(e => e.RoleId, "IX_AspNetRoleClaims_RoleId");

            entity.HasOne(d => d.Role).WithMany(p => p.AspNetRoleClaims).HasForeignKey(d => d.RoleId);
        });

        modelBuilder.Entity<AspNetUser>(entity =>
        {
            entity.HasIndex(e => e.NormalizedEmail, "EmailIndex");

            entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex")
                .IsUnique()
                .HasFilter("([NormalizedUserName] IS NOT NULL)");

            entity.Property(e => e.Email).HasMaxLength(256);
            entity.Property(e => e.NormalizedEmail).HasMaxLength(256);
            entity.Property(e => e.NormalizedUserName).HasMaxLength(256);
            entity.Property(e => e.UserName).HasMaxLength(256);

            entity.HasMany(d => d.Roles).WithMany(p => p.Users)
                .UsingEntity<Dictionary<string, object>>(
                    "AspNetUserRole",
                    r => r.HasOne<AspNetRole>().WithMany().HasForeignKey("RoleId"),
                    l => l.HasOne<AspNetUser>().WithMany().HasForeignKey("UserId"),
                    j =>
                    {
                        j.HasKey("UserId", "RoleId");
                        j.ToTable("AspNetUserRoles");
                        j.HasIndex(new[] { "RoleId" }, "IX_AspNetUserRoles_RoleId");
                    });
        });

        modelBuilder.Entity<AspNetUserClaim>(entity =>
        {
            entity.HasIndex(e => e.UserId, "IX_AspNetUserClaims_UserId");

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserClaims).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<AspNetUserLogin>(entity =>
        {
            entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

            entity.HasIndex(e => e.UserId, "IX_AspNetUserLogins_UserId");

            entity.Property(e => e.LoginProvider).HasMaxLength(128);
            entity.Property(e => e.ProviderKey).HasMaxLength(128);

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserLogins).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<AspNetUserToken>(entity =>
        {
            entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

            entity.Property(e => e.LoginProvider).HasMaxLength(128);
            entity.Property(e => e.Name).HasMaxLength(128);

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserTokens).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<Blog>(entity =>
        {
            entity.HasKey(e => e.ArticleId);

            entity.ToTable("Blog");

            entity.Property(e => e.ArticleId).HasColumnName("article_id");
            entity.Property(e => e.ArticleContenu)
                .HasColumnType("text")
                .HasColumnName("article_contenu");
            entity.Property(e => e.ArticleTitre)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("article_titre");
            entity.Property(e => e.Auteur)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("auteur");
            entity.Property(e => e.DatePublication)
                .HasColumnType("date")
                .HasColumnName("date_publication");
            entity.Property(e => e.Id).HasMaxLength(450);

            entity.HasOne(d => d.IdNavigation).WithMany(p => p.Blogs)
                .HasForeignKey(d => d.Id)
                .HasConstraintName("FK_Blog_AspNetUsers");
        });

        modelBuilder.Entity<Commande>(entity =>
        {
            entity.HasKey(e => e.CommandeId);

            entity.Property(e => e.CommandeId).HasColumnName("commande_id");
            entity.Property(e => e.AdresseLivraisonId).HasColumnName("adresse_livraison_id");
            entity.Property(e => e.Commentaire)
                .HasColumnType("text")
                .HasColumnName("commentaire");
            entity.Property(e => e.DateCommande)
                .HasColumnType("date")
                .HasColumnName("date_commande");
            entity.Property(e => e.Id).HasMaxLength(450);
            entity.Property(e => e.MethodePaiement)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("methode_paiement");
            entity.Property(e => e.StatutCommande)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("statut_commande");

            entity.HasOne(d => d.AdresseLivraison).WithMany(p => p.Commandes)
                .HasForeignKey(d => d.AdresseLivraisonId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Commandes_Adresses");

            entity.HasOne(d => d.IdNavigation).WithMany(p => p.Commandes)
                .HasForeignKey(d => d.Id)
                .HasConstraintName("FK_Commandes_AspNetUsers");
        });

        modelBuilder.Entity<Inventaire>(entity =>
        {
            entity.ToTable("Inventaire");

            entity.Property(e => e.InventaireId).HasColumnName("inventaire_id");
            entity.Property(e => e.ProduitId).HasColumnName("produit_id");
            entity.Property(e => e.StatutDispo)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("statu_dispo");
            entity.Property(e => e.StockQuantite).HasColumnName("stock_quantite");
        });

        modelBuilder.Entity<Media>(entity =>
        {
            entity.HasKey(e => e.MediaId);

            entity.Property(e => e.MediaId).HasColumnName("media_id");
            entity.Property(e => e.MediaChemin)
                .HasColumnType("text")
                .HasColumnName("media_chemin");
            entity.Property(e => e.MediaDescription)
                .HasColumnType("text")
                .HasColumnName("media_description");
            entity.Property(e => e.ProduitId).HasColumnName("produit_id");

            entity.HasOne(d => d.Produit).WithMany(p => p.Media)
                .HasForeignKey(d => d.ProduitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Media_Produits");
        });

        modelBuilder.Entity<Message>(entity =>
        {
            entity.HasKey(e => e.MessageId);

            entity.Property(e => e.MessageId).HasColumnName("message_id");
            entity.Property(e => e.Contenu)
                .HasColumnType("text")
                .HasColumnName("contenu");
            entity.Property(e => e.Id).HasMaxLength(450);
            entity.Property(e => e.Sujet)
                .HasMaxLength(50)
                .HasColumnName("sujet");

            entity.HasOne(d => d.IdNavigation).WithMany(p => p.Messages)
                .HasForeignKey(d => d.Id)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Messages_AspNetUsers");
        });

        modelBuilder.Entity<Paiement>(entity =>
        {
            entity.HasKey(e => e.PaiementId);

            entity.Property(e => e.PaiementId).HasColumnName("paiement_id");
            entity.Property(e => e.CommandeId).HasColumnName("commande_id");
            entity.Property(e => e.Id).HasMaxLength(450);
            entity.Property(e => e.Methode)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("methode");
            entity.Property(e => e.Montant)
                .HasColumnType("decimal(10, 0)")
                .HasColumnName("montant");
        });

        modelBuilder.Entity<Produit>(entity =>
        {
            entity.Property(e => e.ProduitId).HasColumnName("produit_id");
            entity.Property(e => e.InventaireId).HasColumnName("inventaire_id");
            entity.Property(e => e.Prix)
                .HasColumnType("decimal(10, 0)")
                .HasColumnName("prix");
            entity.Property(e => e.ProduitDescription)
                .HasColumnType("text")
                .HasColumnName("produit_description");
            entity.Property(e => e.ProduitNom)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("produit_nom");
            entity.Property(e => e.ProduitType)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("produit_type");
            entity.Property(e => e.StatutDispo)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("statut_dispo");
            entity.Property(e => e.StockQuantite).HasColumnName("stock_quantite");

            entity.HasOne(d => d.Inventaire).WithMany(p => p.Produits)
                .HasForeignKey(d => d.InventaireId)
                .HasConstraintName("FK_Produits_Inventaire1");
        });

        modelBuilder.Entity<ProduitsCommande>(entity =>
        {
            entity.HasKey(e => e.ProduitCommandeId);

            entity.ToTable("Produits_Commandes");

            entity.Property(e => e.ProduitCommandeId).HasColumnName("produit_commande_id");
            entity.Property(e => e.CommandeId).HasColumnName("commande_id");
            entity.Property(e => e.PrixUnitaire)
                .HasColumnType("decimal(10, 0)")
                .HasColumnName("prix_unitaire");
            entity.Property(e => e.ProduitId).HasColumnName("produit_id");
            entity.Property(e => e.Promotions)
                .HasColumnType("decimal(10, 0)")
                .HasColumnName("promotions");
            entity.Property(e => e.Quantite).HasColumnName("quantite");

            entity.HasOne(d => d.Commande).WithMany(p => p.ProduitsCommandes)
                .HasForeignKey(d => d.CommandeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Produits_Commandes_Commandes");

            entity.HasOne(d => d.Produit).WithMany(p => p.ProduitsCommandes)
                .HasForeignKey(d => d.ProduitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Produits_Commandes_Produits");
        });

        modelBuilder.Entity<RetourCommande>(entity =>
        {
            entity.HasKey(e => e.RetourId);

            entity.ToTable("Retour_Commandes");

            entity.Property(e => e.RetourId).HasColumnName("retour_id");
            entity.Property(e => e.CommandeId).HasColumnName("commande_id");
            entity.Property(e => e.DateRetour)
                .HasColumnType("date")
                .HasColumnName("date_retour");
            entity.Property(e => e.Raison)
                .HasColumnType("text")
                .HasColumnName("raison");
            entity.Property(e => e.StatutRetour)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("statut_retour");

            entity.HasOne(d => d.Commande).WithMany(p => p.RetourCommandes)
                .HasForeignKey(d => d.CommandeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Retour_Commandes_Commandes");
        });

        modelBuilder.Entity<SuiviCommande>(entity =>
        {
            entity.HasKey(e => e.SuiviId);

            entity.ToTable("Suivi_Commandes");

            entity.Property(e => e.SuiviId).HasColumnName("suivi_id");
            entity.Property(e => e.CommandeId).HasColumnName("commande_id");
            entity.Property(e => e.Commentaire)
                .HasColumnType("text")
                .HasColumnName("commentaire");
            entity.Property(e => e.DateSuivi)
                .HasColumnType("date")
                .HasColumnName("date_suivi");
            entity.Property(e => e.Statut)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("statut");
        });

        modelBuilder.Entity<UtilisateursInfo>(entity =>
        {
            entity.HasKey(e => e.UtilisateurId);

            entity.ToTable("Utilisateurs_info");

            entity.Property(e => e.UtilisateurId).HasColumnName("utilisateur_id");
            entity.Property(e => e.DateCreation)
                .HasColumnType("date")
                .HasColumnName("date_creation");
            entity.Property(e => e.Id).HasMaxLength(450);
            entity.Property(e => e.Nom)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("nom");
            entity.Property(e => e.Prenom)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("prenom");

            entity.HasOne(d => d.IdNavigation).WithMany(p => p.UtilisateursInfos)
                .HasForeignKey(d => d.Id)
                .HasConstraintName("FK_Utilisateurs_info_AspNetUsers");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
