preCheck();

function preCheck(){
    if($('#pre').attr("value")=='true'){
        $('#pre').removeClass('disabled')
    }else if($('#pre').attr("value")=='false'){
        $('#pre').addClass('disabled')
    }
}

