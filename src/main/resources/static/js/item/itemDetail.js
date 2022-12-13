$(document).ready(function () {

    //로그인내역
    $.ajax({
        type: "POST",
        url: "/mission/member",
        data: {
        },
        success: function (data) {
            alert($("#id1"))
            $("#applyCheck").click(function(){
                if(data.id==null) {
                    
                }

            })
        },
    });

    //---------------------------------------------------
    //등록날짜
    let start = new Date($('.date').val());
    //현재날짜
    let now = new Date();

    //경과시간
    let result = now.getTime() - start.getTime();
    let day = Math.abs(result / (1000 * 60 * 60 * 24)) //abs() 절대값
    console.log('경과시간', day)

    //캠페인회차
    let count = $('.count').val();
    if (day > count) {
        $("#nowCount").html(count);
        $("#applyCheck").attr("disabled", "disabled");
        $("#applyCheck").html("지원마감")
        $("#mycam").attr("style", "display: none");
    } else {
        $("#nowCount").html(Math.ceil(day)) //올림
    }


    //---------------------------------------------------
    //캠페인유형에 따른 버튼 속성
    let type = $("#camType").val();
    if (type == "추첨형") {
        $("#applyType").attr("style", "display:");
    } else {
        $("#applyBaroType").attr("style", "display:");
    }

    //강제클릭
    $("#applyCheck").click();


    let itemNum = $("#applyCheck").attr("data-itemNum-num")
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
            if (data.myCam == 0) { //지원
                $("#mycam0").attr("style", "display:");
                $("#applyCheck").attr("style", "display: none");
                $(".applyCancel").attr("style", "display:");
            } else if (data.myCam == 1) { //선정,미션중
                $("#mycam1").attr("style", "display:");
                $("#applyCheck").html("참여 중인 캠페인")
            } else if (data.myCam == 2) { //미션완료
                $("#mycam").attr("style", "display: none");
                $("#mycam2").attr("style", "display:");
                $("#applyCheck").html("모든 미션 완료")
            } else if (data.myCam == 3) { //취소
                $("#applyCheck").html("이미 지원한 캠페인")
            }

            //미션진행상황
            if (data.status == 0) { //구매인증(OCR)
                $(".mStatus0").show();
                $(".mStatus1").hide();
                $(".mStatus2").hide();
            } else if (data.status == 1) { //리뷰인증(크롤링)
                $(".mStatus0").hide();
                $(".mStatus1").show();
                $(".mStatus2").hide();
            } else if (data.status == 2) { //포인트수령
                $(".mStatus0").hide();
                $(".mStatus1").hide();
                $(".mStatus2").show();
            }
        }
    })

})


//중복지원확인
$("#applyCheck").click(function () {
    let itemNum = $(this).attr("data-itemNum-num")
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

                $("#applyCheck").attr("data-bs-toggle", "modal")
            }
        }
    })
})


//지원취소버튼
$(".applyCancel").click(function () {
    let itemNum = $("#applyCheck").attr("data-itemNum-num")
    let id = $("#id").val();
    $.ajax({
        type: "POST",
        url: "/mission/cancel",
        data: {
            itemNum: itemNum,
            id: id,
        },
        success: function (data) {
            alert('캠페인이 취소되었습니다.')
            location.reload();
        }
    })
})


