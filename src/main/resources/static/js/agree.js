// 약관동의 체크
// 전체ALL 체크
$("#all_check").click(function () {
  let ch = $(this).prop("checked");
  $(".agree_check").prop("checked", ch);
});
// 따로 선택
$(".agree_check").click(function () {
  let flag = true;
  $(".agree_check").each(function (idx, items) {
    let ch = $(items).prop("checked");
    if (!ch) {
      flag = false;
    }
    $("#all_check").prop("checked", flag);
  });
});
//필수 약관 동의 후 submit()강제 실행
const req = document.getElementsByClassName("req");
$("#agree_btn").click(function () {
  let result = true;
  for (let i = 0; i < req.length; i++) {
    if (!req[i].checked) {
      result = false;
      break;
    }
  }
  if (result) {
    $("#frm").submit();
  } else {
    $("#agreex").click();
  }
});
