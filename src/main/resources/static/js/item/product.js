//판매자 캠페인 삭제요청
$(".delBtn").click(function () {
    let check = confirm("삭제 요청 하시겠습니까? 삭제 요청 후 취소할 수 없습니다.")
    if (check) {
        let itemNum = $(this).attr("data-itemNum-num")
        $.ajax({
            type: "GET",
            url: "/item/delete",
            data: {
                itemNum: itemNum
            },
            success: function (data) {
                if (data == 1) {
                    alert("삭제 요청이 완료되었습니다. (요청 후 영업일 기준 2~3일 소요)")
                    location.reload();
                }
            }
        })
    }
})



//판매자 캠페인 수정요청
$(".upBtn").click(function () {
    let check = confirm("수정 요청 하시겠습니까? 수정 요청 후 취소할 수 없습니다.")
    if (check) {
        let itemNum = $(this).attr("data-itemNum-num")
        location.href = "/item/update?itemNum=" + itemNum;
    }
})


//추첨형 선정
$(".winBtn").click(function () {
    let e = $(this).data('itemnum');
    $.ajax({
        type: "POST",
        url: "/mission/win",
        data: {
            itemNum: e
        },
        success: function (data) {
            if(data==1) {
                alert('지원자가 선정되었습니다.')
            }
            if(data==0) {
                alert('현재 지원자가 없습니다.')
            }
        }
    })
})



function getApplyCount() {
    let e = $(".winBtn").data('itemnum');
    console.log('아이템넘',e)
    $.ajax({
        type: "POST",
        url: "/mission/waite",
        data: {
            itemNum: e,
        },
        success: function (data) {
            $(".winBtn").append(data)
        }
    })
}


//상품등록 가능한 판매자
$("#product").click(function () {
    $.ajax({
        type: "POST",
        url: "/item/itemAddRole",
        data: {
        },
        success: function (data) {
            if(data==1){
                location.href='/item/add';
            }else {
                alert("판매자 등급 결제 후 이용 가능합니다.")
            }
        }
    })
})
