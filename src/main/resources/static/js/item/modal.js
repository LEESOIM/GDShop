$("#check").click(function(){
    if($("#check").is(":checked")) {
        $("#apply").attr("disabled",false)
    } else {
        $("#apply").attr("disabled",true)
    }
})

$("#apply").on("click", function(event){
    $("#roulette").slideDown(4000);
})

