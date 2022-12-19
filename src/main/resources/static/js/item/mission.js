//등록날짜
let start = new Date($('.date').val());
//현재날짜
let now = new Date();
//경과시간
let result = now.getTime() - start.getTime();
let day = Math.abs(result / (1000 * 60 * 60 * 24))
//몇번째 회차에 지원했는지
let applyCount = Math.ceil(day)


//캠페인 약관 동의
$("#check").click(function () {
    if ($("#check").is(":checked")) {
        $("#apply").attr("disabled", false)
    } else {
        $("#apply").attr("disabled", true)
    }
})

$("#checkBaro").click(function () {
    if ($("#checkBaro").is(":checked")) {
        $("#applyBaro").attr("disabled", false)
    } else {
        $("#applyBaro").attr("disabled", true)
    }
})

//추첨형 지원하기
$("#apply").click(function () {
    let itemNum = $(this).attr("data-itemNum-num")

    $.ajax({
        type: "POST",
        url: "/mission/apply",
        data: {
            itemNum: itemNum,
            applyCount: applyCount,
        },
        success: function (data) {
            alert(count)
            if (data == 1) {
                $(".okBtn").click(function () {
                    $(".okBtn").attr("onclick", "location.href=item/detail?" + itemNum);
                })
            }
        }
    })
})


//즉석추첨형 지원하기
$("#applyBaro").click(function () {

    $("#roulette").delay(3500).fadeIn(2000);
    $("#rouletteF").delay(3500).fadeIn(2000);
    console.log(result % 2)

    //룰렛 글귀
    if (result % 2 == 0) {
        //탈락
        $("#missionX").attr("style", "display:");
        let itemNum = $("#applyCheck").attr("data-itemNum-num")
        $.ajax({
            type: "POST",
            url: "/mission/fail",
            data: {
                itemNum: itemNum,
            },
            success: function (data) {
                if (data == 1) {
                    $(".okBtn").click(function () {
                        $(".okBtn").attr("onclick", "location.href=item/detail?" + itemNum);
                    })
                }
            }
        })
    } else {
        //선정
        $("#missionO").attr("style", "display:");
        let itemNum = $(this).attr("data-itemNum-num")
        $.ajax({
            type: "POST",
            url: "/mission/apply",
            data: {
                itemNum: itemNum,
                applyCount: applyCount,
            },
            success: function (data) {
                if (data == 1) {
                    $(".okBtn").click(function () {
                        $(".okBtn").attr("onclick", "location.href=item/detail?" + itemNum);
                    })
                }
            }
        })
    }
})


//OCR
$("#ocrSubmit").click(function () {
    let form = $("form")[0];        
    let formData = new FormData(form);

    $.ajax({
        type: "POST",
        url: "/purchase/setPurchase",
        cache : false,
        processData: false,
        contentType: false,
        data: formData,
        success: function (data) {
            if(data==0) {
                alert("주문번호를 다시 확인해주세요.")
            }else if(data==2) {
                alert("결제금액을 다시 확인해주세요.")
            }else {
                $("ocrSubmit").attr("type", "submit")
                location.reload();
            }
        }
    })
})

//Review
$("#reviewSubmit").click(function () {
    let formData = $("#reviewC").serialize();

    $.ajax({
        type: "POST",
        url: "/review/getReview",
        cache : false,
        data: formData,
        success: function (data) {
            if(data==0) {
                alert("[리뷰 인증 실패] \n 계정정보, 작성일을 다시 확인해주세요.")
            }else if(data==2) {
                alert("리뷰 내용이 너무 짧습니다. 리뷰를 더 길게 작성해주세요.")
            }else {
                $("reviewSubmit").attr("type", "submit")
                location.reload();
            }
        }
    })
})


//포인트 수령
$("#pointBtn").click(function () {
    let point = $("#pointResult").val();
    let itemNum = $("#itemNumResult").val();
    $.ajax({
        type: "POST",
        url: "/mission/point",
        data: {
            point: point,
            itemNum: itemNum,
        },
        success: function (data) {
            if(data==1) {
                alert("🎊 모든 미션이 완료되었습니다 🎊")
                location.reload();
            }
        }
    })
})