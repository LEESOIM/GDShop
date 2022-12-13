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
    console.log("search",search)
    
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

                let input = "<div class='member-roleName'>"+data.roleVOs[i].roleName.split('_')[1]+"</div>"
                
                
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

//=================== 미션 관리 =============================
let selected = $("#ongoing")

function setMissionModal(event){
    console.log($(event))
    let id = $(event).parent().prev().prev().prev().prev().prev().text()
    $("#missionModalLabel").text(id)
    console.log(id)
    $.ajax({
        type:"GET",
        url:"getMission",
        data:{
            id:id,
            myCam:1
        },
        success:function(data){
            $("#missionList").html(data)
        }
    })
}

function onGoing(event){
    if(selected!=null){
        selected.removeClass("active")
        $(event).addClass("active")
        selected=$("#ongoing")
    }
    getMission(1)
}

function completed(event){
    if(selected!=null){
        selected.removeClass("active")
        $(event).addClass("active")
        selected=$("#completed")
    }
    getMission(2)
}

function cancel(event){
    if(selected!=null){
        selected.removeClass("active")
        $(event).addClass("active")
        selected=$("#cancel")
    }
    getMission(3)
}

function totalHistory(event){
    if(selected!=null){
        selected.removeClass("active")
        $(event).addClass("active")
        selected=$("#total")
    }
    $.ajax({
        type:"GET",
        url:"getMission2",
        data:{
            id:id,
        },
        success:function(data){
            $("#missionList").html(data)
        }
    })
}

function getMission(myCam){
    id = $("#missionModalLabel").text()
    console.log(id)
    $.ajax({
        type:"GET",
        url:"getMission",
        data:{
            id:id,
            myCam:myCam
        },
        success:function(data){
            $("#missionList").html(data)
        }
    })
}


function setStatus(event){
    console.log($(event).find(".status").text())
    let status = $(event).find(".status").text()
    
    if(status=="0"){
        $(event).next().find(".buy").removeClass("default")
        $(event).next().find(".buy").addClass("cur-progress")
        $(event).next().find(".buyState").text("완료")
        $(event).next().find(".buyState").addClass("bold")
        $(event).next().find(".buyText").addClass("bold")
    }else if(status=="1"){
        $(event).next().find(".buy").removeClass("default")
        $(event).next().find(".buy").addClass("cur-progress")
        $(event).next().find(".review").removeClass("default")
        $(event).next().find(".review").addClass("cur-progress")
        $(event).next().find(".buyState").text("완료")
        $(event).next().find(".reviewState").text("완료")
        $(event).next().find(".buyState").addClass("bold")
        $(event).next().find(".buyText").addClass("bold")
        $(event).next().find(".reviewState").addClass("bold")
        $(event).next().find(".reviewText").addClass("bold")
    }else{
        $(event).next().find(".buy").removeClass("default")
        $(event).next().find(".buy").addClass("cur-progress")
        $(event).next().find(".review").removeClass("default")
        $(event).next().find(".review").addClass("cur-progress")
        $(event).next().find(".point").removeClass("default")
        $(event).next().find(".point").addClass("cur-progress")
        $(event).next().find(".buyState").text("완료")
        $(event).next().find(".reviewState").text("완료")
        $(event).next().find(".pointState").text("완료")
        $(event).next().find(".buyState").addClass("bold")
        $(event).next().find(".buyText").addClass("bold")
        $(event).next().find(".reviewState").addClass("bold")
        $(event).next().find(".reviewText").addClass("bold")
        $(event).next().find(".pointState").addClass("bold")
        $(event).next().find(".pointText").addClass("bold")
    }
}