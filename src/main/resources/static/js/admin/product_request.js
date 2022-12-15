$(document).ready(function(){
    console.log("시작")
    $.ajax({
        type:"GET",
        url:"add_request",
    
        success:function(data){
            result =  data
            $("#pdList").html(result)
        }
    })
})

let selected = $("#add")


function getAdd(event){
    if(selected!=null){
        selected.removeClass("active")
        $(event).addClass("active")
        selected=$("#add")
    }
    $.ajax({
        type:"GET",
        url:"add_request",
        data:{
            page:1,
            kind:$("select[name='kind']").val(),
            search:$("#search").val()
        },
        success:function(data){
            result = data  
            $("#pdList").html(result)
        }
    })
}


function getUpdate(event){
    if(selected!=null){
        selected.removeClass("active")
        $(event).addClass("active")
        selected=$("#update")
    }
    $.ajax({
        type:"GET",
        url:"update_request",
        data:{
            page:1,
            kind:$("select[name='kind']").val(),
            search:$("#search").val()
        },
        success:function(data){
            result = data
            $("#pdList").html(result)
        }
    })
}

function getDelete(event){
    if(selected!=null){
        selected.removeClass("active")
        $(event).addClass("active")
        selected=$("#delete")
    }
    $.ajax({
        type:"GET",
        url:"delete_request",
        data:{
            page:1,
            kind:$("select[name='kind']").val(),
            search:$("#search").val()
        },
        success:function(data){
            result = data   
            $("#pdList").html(result)
        }
    })
}

function getReject(event){
    if(selected!=null){
        selected.removeClass("active")
        $(event).addClass("active")
        selected=$("#reject")
    }
    $.ajax({
        type:"GET",
        url:"reject_request",
        data:{
            page:1,
            kind:$("select[name='kind']").val(),
            search:$("#search").val()
        },
        success:function(data){
            result = data   
            $("#pdList").html(result)
        }
    })
}


function search_onclick_subm(){
    let url
    let kind = $("select[name='kind']").val()
    let search = $("#search").val()
    if(selected.attr("data-kind")=='add'){
        console.log('add')
        url="add_request"
    }else if(selected.attr("data-kind")=='update'){
        console.log('up')
        url="update_request"
    }else if(selected.attr("data-kind")=='delete'){
        console.log('del')
        url="delete_request"
    }else{
        console.log('rej')
        url="reject_request"
    }
    $.ajax({
        type:"GET",
        url:url,
        data:{
            kind:kind,
            search:search
        },
        success:function(data){
            result = data  
            $("#pdList").html(result)
        }
    })
}
//검색버튼 클릭
$("#search_btn").click(function(){
    let url
    let kind = $("select[name='kind']").val()
    let search = $("#search").val()
    if(selected.attr("data-kind")=='add'){
        console.log('add')
        url="add_request"
    }else if(selected.attr("data-kind")=='update'){
        console.log('up')
        url="update_request"
    }else if(selected.attr("data-kind")=='delete'){
        console.log('del')
        url="delete_request"
    }else{
        console.log('rej')
        url="reject_request"
    }
    $.ajax({
        type:"GET",
        url:url,
        data:{
            kind:kind,
            search:search
        },
        success:function(data){
            result = data  
            $("#pdList").html(result)
        }
    })
})

function getDetail(event){
    console.log($(event).children("td.itemnum").text())
    itemNum = $(event).children("td.itemnum").text()
    location.href="/item/detail?itemNum="+itemNum
}