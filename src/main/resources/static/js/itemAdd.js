//미션종류 선택
$(document).ready(function () {
  $(".mission1").hide();
  $(".mission2").hide();
})

$('#type1, #type2').click(function () {
  $(".mission1").show();
  $(".mission2").hide();
})

$('#type3').click(function () {
  $(".mission1").hide();
  $(".mission2").show();
})


//고객부담금 설정에 따른 name속성 부여
$("#point1").click(function () {
  $("#point2_3").attr("name", "");
  $("#pointOff").hide();
  $("#point1_3").attr("name", "point");
  $("#pointOn").show();
})

$("#point2").click(function () {
  $("#point1_3").attr("name", "");
  $("#pointOn").hide();
  $("#point2_3").attr("name", "point");
  $("#pointOff").show();
})



//고객부담금 계산
$("#price").change(function () {
  $("#point1_1").val($("#price").val());
  $("#point1_2").val("");
  $("#point1_3").val("");
  $("#point1Text").text("");

  $("#point2_1").val($("#price").val());
  $("#point2_3").val($("#price").val());
  let price = $("#price").val();
  let result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  $("#point2Text").text(result);
})

$("#point1_2").change(function () {
  let price = $("#price").val() - $("#point1_2").val();

  if (price < 0) {
    alert("고객부담금은 판매금액보다 클 수 없습니다.");
    $("#point1_2").val("");
    $("#point1_3").val("");
    $("#point1Text").text("");
  } else {
    $("#point1_3").val(price);
    let result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    $("#point1Text").text(result);
  }
})


//제공수량 > 회차
$("#count").change(function () {
  if ($("#stock").val() < $("#count").val()) {
    alert("캠페인회차는 상품 제공수량보다 클 수 없습니다.");
    $("#count").val("");
  }
})

$("#stock").change(function () {
  if ($("#stock").val() < $("#count").val()) {
    alert("총 제공수량은 캠페인 회차보다 적을 수 없습니다.");
    $("#count").val("");
  }
})