function filtrerParType()
{
    /*doing my best to keep the variable closer to french for you*/
    let typeSelection = document.getElementById("proFilType").value;
    let listeProduit = document.getElementsByClassName("filtre");

    for (let i = 0; i < listeProduit.length; i++)
    {
        let typeProduit = listeProduit[i].querySelector(".typeSelect");

        if (typeSelection === "all" || typeSelection === typeProduit.textContent.trim())
        {
            listeProduit[i].style.display = "table-row";
        }
        else
        {
            listeProduit[i].style.display = "none";
        }
    }
}