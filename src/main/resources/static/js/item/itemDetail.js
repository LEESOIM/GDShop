$(document).ready(function () {

    //등록날짜
    let start = new Date($('.date').val());
    //현재날짜
    let now = new Date();

    let result = now.getTime() - start.getTime();
    let day = Math.abs(result / (1000 * 60 * 60 * 24))

    console.log('경과시간', day)

    $("#nowCount").html(Math.ceil(day))
})

