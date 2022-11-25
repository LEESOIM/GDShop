$(document).ready(function(){
    let roleName = $("input[name='roleName']:checked").val()
    let kind = $("select[name='kind']").val()
    let search = $("#search").val()
    console.log("시작")
    $.ajax({
        type:"POST",
        url:"member",
    
        success:function(data){
            result =  data
            $("#member_list").html(result)
        }
    })
})


// 검색창 input에 엔터
function search_onclick_subm(){
    getMemberAjax(1)
}
//검색버튼 클릭
$("#search_btn").click(function(){
    getMemberAjax(1)
})



// 라디오버튼 전체/관리자/판매자/VIP/멤버 별로 ajax로 조회
$("input[name='roleName']").change(function(){
    //console.log($("input[name='roleName']:checked").val())
    getMemberAjax(1)

 })



function getMemberAjax(page){
    console.log("멤버 ajax")
    let roleName = $("input[name='roleName']:checked").val()
    let kind = $("select[name='kind']").val()
    let search = $("#search").val()

    $.ajax({
        type:"POST",
        URL:"member",
        data:{
            roleName:roleName,
            page:page,
            kind:kind,
            search:search
        },
        success:function(data){
            result =  data
            $("#member_list").html(result)
        }
    })
}

//=========================== 멤버 상세 정보 ====================================


function memberDetail(event){
    console.log($(event).attr("data-member"))
    let id = $(event).attr("data-member")
    $.ajax({
        type:"GET",
        url:"detail",
        data:{
            id:id
        },
        success:function(data){
            $("#memberInfoModalLabel").text(data.id+"님의 정보")
            $("#member-id").val(data.id)
            $("#member-roleName").val(data.roleNum).prop("selected",true)
            // $("#member-roleName").val(data.roleName.split('_')[1])
            $("#member-name").val(data.name)
            $("#member-phone").val(data.phone)
            $("#member-email").val(data.email)
            $("#member-point").val(data.point)
            $("#member-regDate").val(data.regDate)

        }

    })

}