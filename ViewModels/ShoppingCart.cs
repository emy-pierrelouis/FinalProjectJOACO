using JOACOProjectByEmNEm.Models;
using System.ComponentModel.DataAnnotations;

namespace JOACOProjectByEmNEm.ViewModels
{
    public class ShoppingCart
    {
        [Key] public string ShoppingId { get; set; }

        public string CartId { get; set; }
        public int Quantity { get; set; }
        public System.DateTime CartCreation { get; set; }
        public int ProduitId { get; set; }

        public virtual Produit Produit { get; set; }

    }
}
