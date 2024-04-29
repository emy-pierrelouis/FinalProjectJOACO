document.addEventListener("DOMContentLoaded", function()
{
    const checkboxes = document.getElementsByName("produitType");

    checkboxes.forEach(checkbox =>
    {
        checkbox.addEventListener("change", filtrerParType);
    });

    const clearboxes = document.querySelector('button[type="reset"]');

        clearboxes.addEventListener("click", selectionerTout)
});

function filtrerParType()
{
    const checkboxes = document.getElementsByName("produitType");
    const listeProduit = document.querySelectorAll(".produit");

    for (let i = 0; i < listeProduit.length; i++)
    {
        let typeProduit = listeProduit[i].querySelector(".typeSelect");
        let isVisible = false;

        for (let j = 0; j < checkboxes.length; j++)
        {
            const checkbox = checkboxes[j];
            if (checkbox.checked && (checkbox.value === "all" || checkbox.value === typeProduit.textContent.trim()))
            {
                isVisible = true;
            }
        }

        if (isVisible)
        {
            listeProduit[i].style.display = "table-row";
        }
        else
        {
            listeProduit[i].style.display = "none";
        }

    }
}

function selectionerTout()
{
    const checkboxes = document.getElementsByName("produitType");

    checkboxes.forEach(checkbox => {
        checkbox.checked = checkbox.value === "all";
    });

    filtrerParType();
}
