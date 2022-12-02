$(document).ready(function(){
    console.log("시작")
    $.ajax({
        type:"GET",
        url:"addRequest",
    
        success:function(data){
            result =  data
            $("#add_list").html(result)
        }
    })

    $.ajax({
        type:"GET",
        url:"updateRequest",
    
        success:function(data){
            result =  data
            $("#update_list").html(result)
        }
    })

    $.ajax({
        type:"GET",
        url:"deleteRequest",
    
        success:function(data){
            result =  data
            $("#delete_list").html(result)
        }
    })
})