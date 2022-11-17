//로그인
// log_btn.addEventListener("click", function () {
//   const xhttp = new XMLHttpRequest();
//   xhttp.open("POST", "/member/login");
//   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//   xhttp.send("id=" + id + "&pw=" + pw);
//   xhttp.onreadystatechange = function () {
//     if (this.readyState == 4 && this.status == 200) {
//       if (xhttp.responseText == 1) {
//         window.location.reload();
//       } else {
//         alert("정보가 다릅니다!");
//       }
//     }
//   };
// });

//jquery
$("#log_btn").click(function () {
  let id = $("#id").val();
  let pw = $("#pw").val();
  console.log(id);
  console.log(pw);
});
