const chat = document.getElementById("chat_bot");
const chat_ev = document.getElementById("chat_ev");

chat.addEventListener("mouseover", function () {
  chat_ev.setAttribute("style", "display:block;");
});
chat.addEventListener("mouseout", function () {
  chat_ev.setAttribute("style", "display:none;");
});




function remaindTime() {
  var now = new Date(); //현재시간을 구한다. 
  var end = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 21, 00, 00);

  //오늘날짜의 저녁 9시 - 종료시간기준
  var open = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 09, 00, 00);

  //오늘날짜의 오전9시 - 오픈시간기준

  var nt = now.getTime(); // 현재의 시간만 가져온다
  var ot = open.getTime(); // 오픈시간만 가져온다
  var et = end.getTime(); // 종료시간만 가져온다.

  if (nt < ot) { //현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다. 
    $(".time").fadeIn();
    $("p.time-title").html("금일 오픈까지 남은 시간");

    sec = parseInt(ot - nt) / 1000;
    day = parseInt(sec / 60 / 60 / 24);
    sec = (sec - (day * 60 * 60 * 24));
    hour = parseInt(sec / 60 / 60);
    sec = (sec - (hour * 60 * 60));
    min = parseInt(sec / 60);
    sec = parseInt(sec - (min * 60));
    if (hour < 10) { hour = "0" + hour; }
    if (min < 10) { min = "0" + min; }
    if (sec < 10) { sec = "0" + sec; }
    let h = $(".hours").html(hour);
    let m = $(".minutes").html(min);
    let s = $(".seconds").html(sec);

    $(".timer").append(h,m,s);
    
  } else if (nt > et) { //현재시간이 종료시간보다 크면
    $("p.time-title").html("금일 마감");
    $(".time").fadeOut();
  } else { //현재시간이 오픈시간보다 늦고 마감시간보다 이르면 마감시간까지 남은 시간을 구한다. 
    $(".time").fadeIn();
    $("p.time-title").html("금일 마감까지 남은 시간");
    sec = parseInt(et - nt) / 1000;
    day = parseInt(sec / 60 / 60 / 24);
    sec = (sec - (day * 60 * 60 * 24));
    hour = parseInt(sec / 60 / 60);
    sec = (sec - (hour * 60 * 60));
    min = parseInt(sec / 60);
    sec = parseInt(sec - (min * 60));
    if (hour < 10) { hour = "0" + hour; }
    if (min < 10) { min = "0" + min; }
    if (sec < 10) { sec = "0" + sec; }
    let h = $(".hours").html(hour);
    let m = $(".minutes").html(min);
    let s = $(".seconds").html(sec);

    $(".timer").append(h,m,s);
  }
}
setInterval(remaindTime, 1000); //1초마다 검사를 해주면 실시간으로 시간을 알 수 있다. 
