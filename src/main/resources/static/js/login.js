//로그인 (jquery)
$("#log_btn").click(function () {
  let id = $("#id").val();
  let pw = $("#pw").val();
  console.log(id);
  console.log(pw);

  $.ajax({
    type: "POST",
    url: "/member/login",
    data: {
      id: id,
      pw: pw,
    },
    success: function (data) {
      if (data == 1) {
        window.location.reload();
      } else {
        alert("로그인 실패");
      }
    },
  });
});
