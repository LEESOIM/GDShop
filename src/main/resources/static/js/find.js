//아이디 찾기
$("#find_btn").click(function () {
  let name = $("#find_name").val();
  let birth = $("#find_birth").val();
  let phone = $("#find_phone").val();
  if (name == "" || birth == "" || phone == "") {
    document.getElementById("idFind_modal").click();
    $("#findId_text").text("빈칸을 모두 입력해주세요.");
  } else {
    $.ajax({
      type: "POST",
      url: "find_id",
      data: {
        name: name,
        birth: birth,
        phone: phone,
      },
      success: function (data) {
        if (data == "") {
          document.getElementById("idFind_modal").click();
          $("#findId_icon").attr("class", "fa-solid fa-ghost");
          $("#findId_text").text("일치하는 정보가 없습니다.");
        } else {
          document.getElementById("idFind_modal").click();
          $("#findId_icon").attr("class", "fa-brands fa-pagelines");
          $("#findId_text").text("회원님의 아이디는 " + data + "입니다.");
        }
      },
    });
  }
});

//비밀번호 찾기
$("#findPw_btn").click(function () {
  let id = $("#findPw_id").val();
  let birth = $("#findPw_birth").val();
  let phone = $("#findPw_phone").val();
  if (id == "" || birth == "" || phone == "") {
    document.getElementById("pwFind_modal").click();
    $("#findPw_text").text("빈칸을 모두 입력해주세요.");
  } else {
    $.ajax({
      type: "POST",
      url: "find_pw",
      data: {
        id: id,
        birth: birth,
        phone: phone,
      },
      success: function (data) {
        if (data == "") {
          document.getElementById("pwFind_modal").click();
          $("#findPw_icon").attr("class", "fa-solid fa-ghost");
          $("#findPw_text").text("일치하는 정보가 없습니다.");
        } else {
          document.getElementById("pwFind_modal").click();
          $("#findPw_icon").attr("class", "fa-solid fa-envelope");
          $("#findPw_text").text("메일 전송 완료");
          $("#find_pwBTN").attr("onclick", "location.href='/'");
        }
      },
    });
  }
});