$("#membership_joinBtn").click(function () {
  if ($("#memberId").text() == "") {
    console.log("로그인필요");
    console.log($("#exampleModal"));
    alert("로그인이 필요합니다");
    $("#exampleModal_membership").modal("hide");
    $("#exampleModal").modal("show");
  } else {
    alreadyPayCheck();
  }
});

function alreadyPayCheck(){
  console.log("alreadyPayCheck")
  console.log($("#memberId").text())
  $.ajax({
      type:"GET",
      url:"/membership/alreadyPayCheck",
      data:{
          id:$("#memberId").text(),
          payName:'ROLE_VIP'
      },
      success:function(data){
          console.log(data)
          check = data
          if(check){
              requestPay($("#memberName").text(), $("#memberId").text());
          }else{
              alert("이미 결제했습니다")
          }
      }
  })
}



function requestPay(buyer_name, buyer_id) {
  var IMP = window.IMP; // 생략 가능
  IMP.init("imp32668530"); // 예: imp00000000
  // IMP.request_pay(param, callback) 결제창 호출
  let orderNum = "order" + new Date().getTime();
  IMP.request_pay(
    {
      // param
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: orderNum,
      name: "ROLE_VIP",
      amount: 100,
      buyer_name: buyer_name,
      // buyer_email: "gildong@gmail.com",
      // buyer_tel: "010-4242-4242",
      // buyer_addr: "서울특별시 강남구 신사동",
      // buyer_postcode: "01181"
    },
    function (rsp) {
      // callback
      if (rsp.success) {
        // 결제 성공 시 로직,
        console.log("결제 성공");
        $.ajax({
          type: "POST",
          url: "/membership/successPay",
          data: {
            payMethod: rsp.pay_method,
            amount: rsp.paid_amount,
            orderNum: orderNum,
            payName: rsp.name,
            id: buyer_id,
          },
        }).done(function (data) {
          if (data == 1) {
            alert("결제 완료. 다시 로그인해주세요.");
            location.href = "/member/logout";
          } else {
            alert("결제 실패ㄴ");
          }
        });
      } else {
        // 결제 실패 시 로직,
        console.log("결제 실패");
        alert("결제 실패");
      }
    }
  );
}
