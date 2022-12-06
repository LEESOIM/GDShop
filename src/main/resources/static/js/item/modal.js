$("#check").click(function(){
    if($("#check").is(":checked")) {
        $("#apply").attr("disabled",false)
    } else {
        $("#apply").attr("disabled",true)
    }
})

$("#apply").on("click", function(){
    $("#roulette").slideDown(4000);
    
    
})

$("#apply").click(function() {
    let itemNum = $(this).attr("data-itemNum-num")
    $.ajax({
        type: "POST",
        url: "/mission/apply",
        data: {
            itemNum: itemNum,
        },
        success: function(data) {
            if(data==1) {
                $("#okBtn").click(function(){
                    $("#okBtn").attr("onclick", "location.href=item/detail?"+itemNum);
                })
            }
        }
    })

})