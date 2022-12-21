$(document).ready(function () {
  //등록날짜
  let start = new Date($(".date").val());
  //현재날짜
  let now = new Date();

  //경과시간
  let result = now.getTime() - start.getTime();
  let day = Math.abs(result / (1000 * 60 * 60 * 24)); //abs() 절대값
  console.log("경과시간", day);
  let itemNum = $("#applyCheck").attr("data-itemNum-num");

  //캠페인회차
  let count = $(".count").val();
  if (day > count) {
    $("#nowCount").html(count);
    $("#applyCheck").attr("disabled", "disabled");
    $("#applyCheck").html("지원마감");
    $("#mycam").attr("style", "display: none");
    //상품종료
    $.ajax({
      type: "POST",
      url: "/item/setRequest",
      data: {
        itemNum: itemNum,
        status: 5,
      },
      success: function (data) {
        if (data == 1) {
          location.href = "/"
        }
      }
    })
  } else {
    $("#nowCount").html(Math.ceil(day)); //올림
  }

  //캠페인모집률
  let applyCount = Math.ceil(day);
  $.ajax({
    type: "POST",
    url: "/mission/rate",
    data: {
      itemNum: itemNum,
      applyCount: applyCount,
    },
    success: function (data) {
      let stock = $("#stock").val()
      let rate = data / stock * 100;
      $("#applyRate").html(rate + "%")

      //모집률 100%되면 지원마감
      if (rate >= 100) {
        $("#applyCheck").html("지원마감");
        $("#applyCheck").attr("disabled", "disabled");
        location.href = "javascript:history.back();"
      }
    },
  });

  //---------------------------------------------------
  //캠페인유형에 따른 버튼 속성
  let type = $("#camType").val();
  if (type == "추첨형") {
    $("#applyType").attr("style", "display:");
  } else {
    $("#applyBaroType").attr("style", "display:");
  }

  //강제클릭
  if ($("#memberId").text() != "") {
    $("#applyCheck").click();
  } else {
    $("#applyCheck").click(function () {
      alert("로그인 후 이용해주세요 💚");
      $("#exampleModal").modal("show");
    })
  }

  $.ajax({
    type: "POST",
    url: "/mission/applyList",
    data: {
      itemNum: itemNum,
    },
    success: function (data) {
      //미션번호
      $("#missionNum").val(data.missionNum);

      //내캠페인
      if (data.myCam == 0) {
        //지원
        $("#mycam0").attr("style", "display:");
        $("#applyCheck").attr("style", "display: none");
        $(".applyCancel").attr("style", "display:");
      } else if (data.myCam == 1) {
        //선정,미션중
        $("#mycam1").attr("style", "display:");
        $("#applyCheck").html("참여 중인 캠페인");
      } else if (data.myCam == 2) {
        //미션완료
        $("#mycam").attr("style", "display: none");
        $("#mycam2").attr("style", "display:");
        $("#applyCheck").html("모든 미션 완료");
      } else if (data.myCam == 3) {
        //취소
        $("#applyCheck").html("이미 지원한 캠페인");
      }

      //미션진행상황
      if (data.status == 0) {
        //구매인증(OCR)
        $("#missionCard").attr("data-bs-target", "#missionModal");
        $(".mStatus0").show();
        $(".mStatus1").hide();
        $(".mStatus2").hide();
      } else if (data.status == 1) {
        //리뷰인증(크롤링)
        $("#missionCard").attr("data-bs-target", "#missionModal2");
        $("#missionCard").click();
        $(".mStatus0").hide();
        $(".mStatus1").show();
        $(".mStatus2").hide();
      } else if (data.status == 2) {
        //포인트수령
        $("#missionCard").attr("data-bs-target", "#missionModal3");
        if (data.myCam != 2) {
          $("#missionCard").click();
        }
        $(".mStatus0").hide();
        $(".mStatus1").hide();
        $(".mStatus2").show();
      }
    },
  });
});

//중복지원확인
$("#applyCheck").click(function () {
  let itemNum = $(this).attr("data-itemNum-num");
  $.ajax({
    type: "POST",
    url: "/mission/applyCheck",
    data: {
      itemNum: itemNum,
    },
    success: function (data) {
      if (data > 0) {
        $("#applyCheck").attr("disabled", "disabled");
      } else {
        $("#applyCheck").attr("data-bs-toggle", "modal");
      }
    }
  })
});



//지원취소버튼
$(".applyCancel").click(function () {
  let check = confirm("취소 하시면 해당 캠페인은 재지원이 불가합니다. 정말로 취소 하시겠습니까?")
  if (check) {
    let itemNum = $("#applyCheck").attr("data-itemNum-num")
    $.ajax({
      type: "POST",
      url: "/mission/cancel",
      data: {
        itemNum: itemNum,
      },
      success: function (data) {
        location.reload();
      }
    })
  }
})



//VIP권한
function VIPCheck() {
  $.ajax({
    type: "GET",
    url: "/item/VIPCheck",
    data: {},
    success: function (data) {
      if (data == 1) {
      } else {
        $("#applyCheck").attr("disabled", "disabled");
        $("#applyCheck").text("VIP회원 전용");
        alert("멤버십 결제가 필요합니다.💰");
      }
    },
  });
}
if ($("#itemRole").val() == "VIP") {
  VIPCheck();
}



//상품 등록/수정/삭제 승인
function requestOX(status,url,event){
    itemNum = $(event).attr("data-itemNum-num")
    console.log(parseInt(itemNum))
    $.ajax({
        type:"POST",
        url:url,
        data:{
            itemNum:itemNum,
            status:status
        },
        success:function(data){
            console.log(data)
            if(data==1){
                location.href="javascript:history.back();"
            }
        }
    })
 }
