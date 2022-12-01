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


// 멤버리스트 정보 가져오기
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
    let id = $(event).attr("data-member")
    $.ajax({
        type:"GET",
        url:"detail",
        data:{
            id:id
        },
        success:function(data){
            $("#memberInfoModalLabel").text(data.id+"님의 정보")
            $("#transfer-id").val(data.id)
            $("#member-id").val(data.id)
            $("#roleNameDiv").empty()
            for(i=0; i<data.roleVOs.length;i++){

                let input = "<div class='member-roleName'>"+data.roleVOs[i].roleName.split('_')[1]
                if(data.roleVOs[i].roleName!="ROLE_MEMBER"){
                    input += "<button class='deleteRole' type='button' data-roleNum='"+data.roleVOs[i].roleNum+"'>X</button></div>"
                }else{
                    input += "</div>"
                }
                
                $("#roleNameDiv").append(input)
            }

            $("#member-name").val(data.name)
            $("#member-phone").val(data.phone)
            $("#member-email").val(data.email)
            $("#member-point").val(data.point)
            $("#member-regDate").val(data.regDate)

        }

    })
}


//========================등급 관리 ======================================
function roleDetail(event){
    let memberRole = $(event).children().children()

    $("#roleModalLabel").text($(event).prev().prev().prev().prev().text())
    // 초기화
    $("#admin").removeClass("hadRole")
    $("#seller").removeClass("hadRole")
    $("#vip").removeClass("hadRole")
    $("#member").removeClass("hadRole")
    
    for(i=0; i<memberRole.length; i++){
        if(memberRole[i].dataset.rolenum==1){
            $("#admin").addClass("hadRole")
        }
        if(memberRole[i].dataset.rolenum==2){
            $("#seller").addClass("hadRole")
        }
        if(memberRole[i].dataset.rolenum==3){
            $("#vip").addClass("hadRole")
        }
        if(memberRole[i].dataset.rolenum==4){
            $("#member").addClass("hadRole")
        }
    }
}



$(".memberRole").hover(function(event){
    $(event.target).toggleClass("roleHover")
    
},function(event){
    $(event.target).toggleClass("roleHover")
})


$(".memberRole").click(function(event){
    console.log("클릭")
    let url
    if($(event.target).hasClass("hadRole")){
        console.log("있음")
        $(event.target).toggleClass("hadRole")
        url = "deleteRole"
        roleNum=$(event.target).attr("data-rolenum") 
    }else{
        console.log("없음")
        $(event.target).toggleClass("hadRole")
        url = "addRole"
        roleNum=$(event.target).attr("data-rolenum")    
    }

    $.ajax({
        type:"POST",
        url:url,
        data:{
            id:$("#roleModalLabel").text(),
            roleNum:parseInt(roleNum)
        },
        success:function(data){   
            if(data==1){
                getMemberAjax(1)
            }
        }
    })
})

