const select = document.getElementById("inputGroupSelect01");
const direct = document.getElementById("direct");
const email_input = document.getElementById("email_input");
select.addEventListener("click", function () {
  if (select.value == "5") {
    select.setAttribute("style", "display:none");
    email_input.setAttribute("style", "display:block");
  }
});
