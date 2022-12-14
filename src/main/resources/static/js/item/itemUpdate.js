
$(document).ready(function () {
    //미션종류
    if ($('#type1').is(":checked")) {
        $(".mission2").hide();
        $('#type2').attr('disabled', 'disabled')
        $('#type3').attr('disabled', 'disabled')
    } else if ($('#type2').is(":checked")) {
        $(".mission2").hide();
        $('#type1').attr('disabled', 'disabled')
        $('#type3').attr('disabled', 'disabled')
    } else {
        $(".mission1").hide();
        $('#type1').attr('disabled', 'disabled')
        $('#type2').attr('disabled', 'disabled')

        $("#point1_3").attr("name", "");
        $("#point2_3").attr("name", "");
        $("#point").attr("name", "point");
    }

    //고객부담금 설정에 따른 name속성 부여
    if ($("#point1").is(":checked")) {
        $("#point1_3").attr("name", "point");
        $("#point2_3").attr("name", "");
        $("#point").attr("name", "");

        //고객부담금 계산
        let result = $("#price").val() - $("#point1_3").val()
        $("#point1_2").val(result)

    } else {
        $("#point1_3").attr("name", "");
        $("#point2_3").attr("name", "point");
        $("#point").attr("name", "");
    }

})


//판매자 캠페인 수정요청
$(".upBtn").click(function () {
    let check = confirm("수정 요청 하시겠습니까? 수정 요청 후 취소할 수 없습니다.")
    if(check) {
        $(".upBtn").attr("type", "submit")
        alert("수정 요청이 완료되었습니다. (요청 후 영업일 기준 2~3일 소요)")
        location.href = "/member/product"
    } else {
        $(".upBtn").attr("type", "button")
    }
})