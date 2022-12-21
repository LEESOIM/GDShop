const chat = document.getElementById("chat_bot");
const chat_ev = document.getElementById("chat_ev");

chat.addEventListener("mouseover", function () {
  chat_ev.setAttribute("style", "display:block;");
});
chat.addEventListener("mouseout", function () {
  chat_ev.setAttribute("style", "display:none;");
});


$(document).ready(function(){
        $(document).snowfall();
});