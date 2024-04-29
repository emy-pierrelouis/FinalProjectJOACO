const searchProduits = document.getElementById("proSeaNom");

searchProduits.addEventListener("input", e =>
{
    let value = e.target.value.toLowerCase();
    let search = document.querySelectorAll(".filtre");

    search.forEach(produit =>
    {
        let nomProduit = produit.querySelector(".nomSelect").textContent.trim().toLowerCase();

        if (nomProduit.includes(value))
        {
            produit.style.display = "table-row";
        }
        else
        {
            produit.style.display = "none";
        }
    })
})