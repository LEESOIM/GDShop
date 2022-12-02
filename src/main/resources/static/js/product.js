
//판매자 캠페인 삭제요청
$(".delBtn").click(function(){
    let check = confirm("삭제 요청 하시겠습니까? 삭제 요청 후 취소할 수 없습니다.")
    if(check) {
        let itemNum = $(this).attr("data-itemNum-num")
        $.ajax({
            type: "GET",
            url: "/item/delete",
            data: {
                itemNum: itemNum
            },
            success: function(data) {
                if(data==1) {
                    alert("삭제 요청이 완료되었습니다. (요청 후 영업일 기준 2~3일 소요)")
                    location.reload();
                } 
            }
        })
    }
})



//판매자 캠페인 수정요청
$(".upBtn").click(function(){
    let check = confirm("수정 요청 하시겠습니까? 수정 요청 후 취소할 수 없습니다.")
    if(check) {
        let itemNum = $(this).attr("data-itemNum-num")
        location.href = "/item/update?itemNum="+itemNum;
    }
})

