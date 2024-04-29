const questions = document.getElementsByClassName("question");


for (let i = 0; i < questions.length; i++) {
    questions[i].addEventListener("click", function () {
        const answer = this.nextElementSibling;
        if (answer.style.display === "none" || answer.style.display === "") {
            answer.style.display = "block";
        }
        else {
            answer.style.display = "none";
        }
    });
}