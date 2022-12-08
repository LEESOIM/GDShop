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
      $("#profile_save").attr("onclick", "location.href='/member/mypage'");
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

//내 설정 - 본인확인(비밀번호 일치 검증)
$("#set_pwCheck").click(function () {
  let pw = $("#pwCheck_setInput").val();

  if (pw.length < 8 || pw.length > 20) {
    $("#pwCheck_setText").text(
      "비밀번호는 8자리 ~ 20자리 이내로 입력해주세요."
    );
    $("#pwCheck_modal").click();
    return false;
  } else if (pw.search(/\s/) != -1) {
    $("#pwCheck_setText").text("비밀번호는 공백 없이 입력해주세요.");
    $("#pwCheck_modal").click();
    return false;
  }
  $.ajax({
    type: "POST",
    url: "/member/pwCheck",
    data: {
      pw: pw,
    },
    success: function (data) {
      if (data == 0) {
        $("#pwCheck_setText").text("비밀번호가 일치하지 않습니다.");
        $("#pwCheck_modal").click();
      } else {
        location.href = "/member/set_up";
      }
    },
  });
});

//내 설정 - 본인확인(비밀번호 일치 검증)-enter
$("#pwCheck_setInput").on("keyup", function (key) {
  if (key.keyCode == 13) {
    let pw = $("#pwCheck_setInput").val();

    if (pw.length < 8 || pw.length > 20) {
      $("#pwCheck_setText").text(
        "비밀번호는 8자리 ~ 20자리 이내로 입력해주세요."
      );
      $("#pwCheck_modal").click();
      return false;
    } else if (pw.search(/\s/) != -1) {
      $("#pwCheck_setText").text("비밀번호는 공백 없이 입력해주세요.");
      $("#pwCheck_modal").click();
      return false;
    }
    $.ajax({
      type: "POST",
      url: "/member/pwCheck",
      data: {
        pw: pw,
      },
      success: function (data) {
        if (data == 0) {
          $("#pwCheck_setText").text("비밀번호가 일치하지 않습니다.");
          $("#pwCheck_modal").click();
        } else {
          location.href = "/member/set_up";
        }
      },
    });
  }
});

//내 설정 - 비밀번호 변경
$(".btnPw_change").click(function () {
  let pw = $("#cur_pw").val();
  let newPw = $("#new_pw").val();
  let newPwCheck = $("#new_pwCheck").val();
  if (pw == "" || newPw == "" || newPwCheck == "") {
    $("#pwCheck_setText2").text("빈칸을 채워주세요.");
    $("#pwText_1").text("");
    $("#cur_pw").val("");
    $("#setPw_modal").click();
    return false;
  }
  $.ajax({
    type: "POST",
    url: "/member/pwCheck",
    data: {
      pw: pw,
    },
    success: function (data) {
      if (pw.length < 8 || pw.length > 20) {
        $("#pwText_1").text("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
        $("#pwText_1").attr(
          "style",
          "font-size: 14px; color: red; padding: 2px 2px;"
        );
      } else if (pw.search(/\s/) != -1) {
        $("#pwText_1").text("비밀번호는 공백 없이 입력해주세요.");
        $("#pwText_1").attr(
          "style",
          "font-size: 14px; color: red; padding: 2px 2px;"
        );
      } else if (data == 0) {
        $("#pwText_1").text("비밀번호가 일치하지 않습니다.");
        $("#new_pw").val("");
        $("#new_pwCheck").val("");
        $("#pwText_2").text("");
        $("#pwText_3").text("");
        $("#pwText_1").attr(
          "style",
          "font-size: 14px; color: red; padding: 2px 2px;"
        );
      } else {
        $("#pwText_1").attr("style", "display:none");

        if (pw == newPw) {
          $("#pwText_2").text("기존 비밀번호와 동일합니다.");
          $("#pwText_2").attr(
            "style",
            "font-size: 14px; color: red; padding: 2px 2px;"
          );
          $("#new_pw").val("");
          $("#new_pwCheck").val("");
          $("#pwText_3").text("");
        } else if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W).{8,20}$/.test(newPw)) {
          $("#pwText_2").text(
            "비밀번호는 영문과 특수문자 숫자를 포함하며 8자 이상이어야 합니다."
          );
          $("#pwText_2").attr(
            "style",
            "font-size: 14px; color: red; padding: 2px 2px;"
          );
          $("#new_pwCheck").val("");
          $("#pwText_3").text("");
        } else if (newPw.length < 8 || newPw.length > 20) {
          $("#pwText_2").text("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
          $("#pwText_2").attr(
            "style",
            "font-size: 14px; color: red; padding: 2px 2px;"
          );
          $("#new_pwCheck").val("");
          $("#pwText_3").text("");
        } else if (newPw.search(/\s/) != -1) {
          $("#pwText_2").text("비밀번호는 공백 없이 입력해주세요.");
          $("#pwText_2").attr(
            "style",
            "font-size: 14px; color: red; padding: 2px 2px;"
          );
          $("#new_pwCheck").val("");
          $("#pwText_3").text("");
        } else if (newPw != newPwCheck) {
          $("#pwText_2").attr("style", "display:none");
          $("#pwText_3").text("새 비밀번호가 일치하지 않습니다.");
          $("#pwText_3").attr(
            "style",
            "font-size: 14px; color: red; padding: 2px 2px;"
          );
        } else {
          $("#pwText_3").attr("style", "display:none");
          $.ajax({
            type: "POST",
            url: "/member/changePw",
            data: {
              pw: newPwCheck,
            },
            success: function (data) {
              if (data == 1) {
                $("#pwCheck_icon").attr("style", "color:green");
                $("#pwCheck_icon").attr("class", "fa-solid fa-check");
                $("#pwCheck_setText3").attr("style", "color:green");
                $("#pwCheck_setText3").text("변경 성공");
                $("#setPw_change").click();
              } else {
                $("#pwCheck_setText3").text("변경 실패");
                $("#setPw_change").click();
              }
            },
          });
        }
      }
    },
  });
});

//내 설정 페이지
//폰 번호 변경
$("#phoneUpdate_btn").click(function () {
  let phone = $("#phoneUpdate_input").val();
  if (phone == "") {
    $("#phoneUpdate_Check").attr("style", "color: red; font-size: 14px;");
    $("#phoneUpdate_b").text("빈칸을 입력해주세요.");
  } else if (!/^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/) {
    $("#phoneUpdate_Check").attr("style", "color: red; font-size: 14px;");
    $("#phoneUpdate_b").text("휴대폰 정보를 확인해주세요.");
  } else if (phone.length < 11 || phone.length > 11) {
    $("#phoneUpdate_Check").attr("style", "color: red; font-size: 14px;");
    $("#phoneUpdate_b").text("휴대폰 정보를 확인해주세요.");
  } else {
    $("#phoneUpdate_Check").attr("style", "display:none");
    $.ajax({
      type: "POST",
      url: "/member/changePhone",
      data: {
        phone: phone,
      },
      success: function (data) {
        if (data == 1) {
          location.href = "/member/set_up";
        } else {
          alert("변경 실패");
        }
      },
    });
  }
});

//이메일변경
$("#emailUpdate_btn").click(function () {
  let e = $("#email_e").val();
  let emailOption = $("#email_option").val();
  if (e == "" || emailOption == "선택") {
    $("#emailUpdate_Check").attr("style", "color: red; font-size: 14px;");
    $("#emailUpdate_b").text("빈칸을 입력해주세요.");
  } else if (!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])/.test(e)) {
    $("#emailUpdate_Check").attr("style", "color: red; font-size: 14px;");
    $("#emailUpdate_b").text("이메일 주소를 확인해주세요.");
  } else {
    $("#emailUpdate_Check").attr("style", "display:none");
    $.ajax({
      type: "POST",
      url: "/member/changeEmail",
      data: {
        e: e,
        mailOption: emailOption,
      },
      success: function (data) {
        if (data == 1) {
          location.href = "/member/set_up";
        } else {
          alert("변경실패");
        }
      },
    });
  }
});

//탈퇴하기 - 동의 후 탈퇴하기 버튼 클릭
$("#withdrawal_btn").click(function () {
  let checked = $("#flexCheckChecked").prop("checked");
  if (checked == true) {
    $("#withdrawal_modal").click();
  }
});

//탈퇴하기 비번 입력 후 탈퇴
$("#withdrawal_updateBtn").click(function () {
  let pw = $("#withdrawal_pw").val();
  if (pw == "") {
    $("#withdrawal_pwCheck").text("비밀번호를 입력해주세요.");
    $("#withdrawal_pwCheck").attr("style", "font-size: 14px; color:red");
  } else {
    $("#withdrawal_pwCheck").text("");
    $.ajax({
      type: "POST",
      url: "/member/pwCheck",
      data: {
        pw: pw,
      },
      success: function (data) {
        if (data == 0) {
          $("#withdrawal_pwCheck").text("비밀번호가 다릅니다.");
          $("#withdrawal_pwCheck").attr("style", "font-size: 14px; color:red");
        } else {
          $("#withdrawal_pwCheck").text("");
          $.ajax({
            type: "POST",
            url: "/member/withdrawal",
            data: {},
            success: function (data) {
              if (data == 1) {
                location.href = "/member/logout";
              } else {
                alert("실패");
              }
            },
          });
        }
      },
    });
  }
});
//포인트 출금
$("#withdraw_btn").click(function () {
  let point = $("#withdraw_point").val();
  let bank = $("select[name='bank']").val();
  let name = $("#bank_name").val();
  let account = $("#account").val();
  let select = $(':radio[name="nat"]:checked').length;

  if (
    point == "" ||
    bank == "은행 선택" ||
    name == "" ||
    account == "" ||
    select < 1
  ) {
    $("#withdraw_text").attr("style", "color:red; font-weight:bold");
    $("#withdraw_text").text("빈칸을 채워주세요.");
  } else {
    $.ajax({
      type: "POST",
      url: "/member/getPoint_3",
      data: {},
      success: function (data) {
        if (point < 0) {
          $("#withdraw_text").attr("style", "color:red; font-weight:bold");
          $("#withdraw_text").text("정확한 금액을 입력하세요.");
        } else if (point > data) {
          $("#withdraw_text").attr("style", "color:red; font-weight:bold");
          $("#withdraw_text").text("출금가능 금액보다 초과 입력하였습니다.");
        } else if (data == 0) {
          $("#withdraw_text").attr("style", "color:red; font-weight:bold");
          $("#withdraw_text").text("출금가능한 포인트가 없습니다.");
        } else {
          let result = data - point;
          //result값 보내서 point_3값 업데이트하기
          $.ajax({
            type: "POST",
            url: "/member/setResultPoint_3",
            data: {
              point: result,
            },
            success: function (data) {
              if (data == 1) {
                //출금예정데이터 업데이트
                $.ajax({
                  type: "POST",
                  url: "/member/setResultPoint",
                  data: {
                    point: point,
                  },
                  success: function (data) {
                    $("#withdraw_sum").text(data);
                    location.href = "/member/point";
                  },
                });
              }
            },
          });
        }
      },
    });
  }
});

//출금 - 최대금액입력 체크박스
$(document).ready(function () {
  $("input[type=checkbox][name=limit]").change(function () {
    if ($(this).prop("checked")) {
      $.ajax({
        type: "POST",
        url: "/member/getPoint_3",
        data: {},
        success: function (data) {
          $("#withdraw_point").val(data);
        },
      });
    } else {
      $("#withdraw_point").val("");
    }
  });
});

//등급확인
//VIP등급 확인되면 페이지 변경
function getVIP() {
  $.ajax({
    type: "POST",
    url: "/member/VIP",
    data: {},
    success: function (data) {
      if (data == 1) {
        getVIPlist();
      } else {
        getUserGrade();
      }
    },
  });
}

//vip등급 페이지
function getVIPlist() {
  $.ajax({
    type: "POST",
    url: "/member/VIP_list",
    data: {},
    success: function (data) {
      $("#grade_box").html(data);
    },
  });
}
//member등급 페이지
function getUserGrade() {
  $.ajax({
    type: "POST",
    url: "/member/member_list",
    data: {},
    success: function (data) {
      $("#grade_box").html(data);
    },
  });
}

//계정 닉네임 변경 요청
$("#nick_btn").click(function () {
  let nickName = $("#nick_text").val();
  $.ajax({
    type: "POST",
    url: "/member/nickUpdate",
    data: {
      nickName: nickName,
    },
    success: function (data) {
      if (data == 1) {
        $("#f_nickName").attr("style", "display:none");
        location.href = "/member/mypage";
      } else {
        $("#t_nickName").attr("style", "display:none");
        location.href = "/member/mypage";
      }
    },
  });
});

$("#nick_btn2").click(function () {
  let nickName_N = $("#nickN_text").val();
  $.ajax({
    type: "POST",
    url: "/member/nickUpdate",
    data: {
      nickName_N: nickName_N,
    },
    success: function (data) {
      if (data == 1) {
        $("#n_nickName").attr("style", "display:none");
        location.href = "/member/mypage";
      } else {
        $("#na_nickName").attr("style", "display:none");
        location.href = "/member/mypage";
      }
    },
  });
});

$(".order").change(function () {
  $("#order_btn").click();
});
