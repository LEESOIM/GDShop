
//판매자 캠페인 삭제요청
$(".delBtn").click(function(){
    alert("삭제 요청을 하시겠습니까? (요청 후 영업일 기준 2~3일 소요)")
    let itemNum = $(this).attr("data-itemNum-num")

    $.ajax({
        type: "POST",
        url: "/item/delete",
        data: {
            itemNum: itemNum
        },
        success: function(data) {
            if(data == 1) {
                $(".delBtn").attr("disabled", "true");
                $(".upBtn").attr("disabled", "true");
            }
        }
    })
})
