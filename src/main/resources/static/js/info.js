// 포인트 상세-포인트 안내탭
const t_btn = document.getElementsByClassName("t_btn");
const toggle_box = document.getElementsByClassName("toggle_box");
const minus = document.getElementsByClassName("minus");
const plus = document.getElementsByClassName("plus");
const line_box = document.getElementsByClassName("line_box");

for (let i = 0; i < t_btn.length; i++) {
  t_btn[i].addEventListener("click", function () {
    if (toggle_box[i].style.display == "none") {
      toggle_box[i].style.display = "block";
      plus[i].style.display = "none";
      minus[i].style.display = "block";
      line_box[i].style.display = "block";
    } else {
      toggle_box[i].style.display = "none";
      plus[i].style.display = "block";
      minus[i].style.display = "none";
      line_box[i].style.display = "none";
    }
  });
}
