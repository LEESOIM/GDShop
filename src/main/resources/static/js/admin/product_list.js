$(document).ready(function(){
    console.log("시작")
    $.ajax({
        type:"GET",
        url:"getPdList",
    
        success:function(data){
            result =  data
            $("#product_list").html(result)
        }
    })
})




// 검색창 input에 엔터
function search_onclick_subm(){
    getPdAjax()
}
//검색버튼 클릭
$("#search_btn").click(function(){
    getPdAjax()
})

function getPdAjax(){
    let kind = $("select[name='kind']").val()
    let search = $("#search").val()

    $.ajax({
        type:"GET",
        url:"getPdList",
        data:{
            kind:kind,
            search:search
        },
        success:function(data){
            result =  data
            $("#product_list").html(result)
        }
    })
}


function getDetail(event){
    console.log($(event).children("td.itemnum").text())
    itemNum = $(event).children("td.itemnum").text()
    location.href="/item/detail?itemNum="+itemNum
}
