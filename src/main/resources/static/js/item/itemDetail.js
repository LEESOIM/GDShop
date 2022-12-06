$(document).ready(function () {

    //등록날짜
    let start = new Date($('.date').val());
    //현재날짜
    let now = new Date();

    //경과시간
    let result = now.getTime() - start.getTime();
    let day = Math.abs(result / (1000 * 60 * 60 * 24))

    console.log('경과시간', day)

    let count = $('.count').val();
    if(day > count) {
        $("#nowCount").html(count)
    } else {
        $("#nowCount").html(Math.ceil(day))
    }

    //강제클릭
    $("#applyCheck").click();

    //미션상황!!
    let itemNum = $("#applyCheck").attr("data-itemNum-num")
    $.ajax({
        type: "POST",
        url: "/mission/applyList",
        data: {
            itemNum: itemNum,
        },
        success: function(data) {
            if(data==0) {
                $("#mycam0").attr("style","display:");
            } else if (data==1) {
                $("#mycam").attr("style","display: none");
                $("#mycam1").attr("style","display:");
            } else if (data==2) {
                $("#mycam").attr("style","display: none");
                $("#mycam2").attr("style","display:");
            }
        }
    })
})


$("#applyCheck").click(function() {
    let itemNum = $(this).attr("data-itemNum-num")
    $.ajax({
        type: "POST",
        url: "/mission/applyCheck",
        data: {
            itemNum: itemNum,
        },
        success: function(data) {
            if(data>0) {
                $("#applyCheck").attr("disabled","disabled");
                $("#applyCheck").html("동일 판매자 참여불가")
            } else {
                $("#applyCheck").attr("data-bs-toggle","modal")
            }
        }
    })
})