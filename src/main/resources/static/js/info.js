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

//프로필 사진 삭제
$("#profile_delete").click(function () {
  let id = $("#sessionId").val();
  $.ajax({
    type: "POST",
    url: "profile_delete",
    data: {
      id: id,
    },
    success: function (data) {
      $("#profile_image").attr("src", "/file/profile/" + data);
      $("#profile_save").attr("onclick", "location.href='/member/profile'");
      $("#profile_save").attr("type", "button");
    },
  });
});

//프로필 사진 업로드 없이 적용버튼 누를 경우, button타입으로 변경
$("#profile_save").click(function () {
  if ($("#file").val() == "") {
    $("#profile_save").attr("type", "button");
  } else {
    $("#profile_save").attr("type", "submit");
  }
});
