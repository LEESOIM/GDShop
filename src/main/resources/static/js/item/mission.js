//캠페인 약관 동의
$("#check").click(function(){
    if($("#check").is(":checked")) {
        $("#apply").attr("disabled",false)
    } else {
        $("#apply").attr("disabled",true)
    }
})

$("#checkBaro").click(function(){
    if($("#checkBaro").is(":checked")) {
        $("#applyBaro").attr("disabled",false)
    } else {
        $("#applyBaro").attr("disabled",true)
    }
})

//추첨형 지원하기
$("#apply").click(function() {
    let itemNum = $(this).attr("data-itemNum-num")
    
    $.ajax({
        type: "POST",
        url: "/mission/apply",
        data: {
            itemNum: itemNum,
        },
        success: function(data) {
            if(data==1) {
                $(".okBtn").click(function(){
                    $(".okBtn").attr("onclick", "location.href=item/detail?"+itemNum);
                })
            }
        }
    })
})


//즉석추첨형 지원하기
$("#applyBaro").click(function() {
    let itemNum = $(this).attr("data-itemNum-num")
    
    //룰렛 글귀
    $("#roulette").delay(3500).fadeIn(2000);
    $("#rouletteF").delay(3500).fadeIn(2000);
    
    $.ajax({
        type: "POST",
        url: "/mission/apply",
        data: {
            itemNum: itemNum,
        },
        success: function(data) {
            if(data==1) {
                $(".okBtn").click(function(){
                    $(".okBtn").attr("onclick", "location.href=item/detail?"+itemNum);
                })
            }
        }
    })
})


