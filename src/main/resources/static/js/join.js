//회원가입 비밀번호, 이메일, 폰번호 유효성검사 정규식 적용
$("#join_pw").focusout(function () {
  let pw = $("#join_pw").val();

  if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W).{8,20}$/.test(pw)) {
    $("#pw_resultText").text(
      "비밀번호는 영문과 특수문자 숫자를 포함하며 8자 이상이어야 합니다."
    );
    $("#join_result").attr("type", "button");
  } else {
    $("#pw_resultText").text("");
    $("#join_result").attr("type", "submit");
  }
});
$("#join_e").focusout(function () {
  let e = $("#join_e").val();
  if (!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])/.test(e)) {
    $("#join_eText").text("이메일 주소를 확인해주세요.");
    $("#join_result").attr("type", "button");
  } else {
    $("#join_eText").text("");
    $("#join_result").attr("type", "submit");
  }
});

$("#join_phone").focusout(function () {
  let phone = $("#join_phone").val();
  if (!/^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/.test(phone)) {
    $("#join_phoneText").text("휴대폰 정보를 확인해주세요.");
    $("#join_result").attr("type", "button");
  } else {
    $("#join_phoneText").text("");
    $("#join_result").attr("type", "submit");
  }
});
