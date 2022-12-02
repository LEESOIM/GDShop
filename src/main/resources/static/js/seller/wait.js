$(".wait").on("click",function(e){

    let id = $(this).prev().prev().prev().prev().prev().prev().text();
    console.log("id:",id);

    Swal.fire({
        title: '입점신청을 승인하시겠습니까?',
        text: id,
        icon: 'warning', //warning,error,success,info,question
        
        showCancelButton: true, // cancel버튼
        confirmButtonText: '확인', // confirm 버튼 텍스트 지정
        cancelButtonText: '취소', // cancel 버튼 텍스트 지정
        
     }).then(result => {
        if (result.isConfirmed) {
        
            $.ajax({
                type:"post",
                url:"/seller/wait",
                traditional:true,
                contentType:'application/json',
                data:JSON.stringify({
                    "id":id
                }),
                success:function(success){
                    Swal.fire('입점신청이 승인되었습니다.', '', 'success');
                    setTimeout(function() {
                        location.reload();
                      }, 1000);
                },
                error:function(error){
                    Swal.fire('입점신청에 실패하였습니다.', '', 'error');
                }

            })

        }else{
            Swal.fire('취소하였습니다.', '', 'warning');
        }
     });


})


$(".waitNo").on("click",function(e){

    let id = $(this).prev().prev().prev().prev().prev().prev().prev().text();
    console.log("id:",id);

    Swal.fire({
        title: '입점신청을 거절하시겠습니까?',
        text: id,
        icon: 'warning',
        
        showCancelButton: true, // cancel버튼
        confirmButtonText: '확인', // confirm 버튼
        cancelButtonText: '취소', // cancel 버튼
        
     }).then(result => {
        if (result.isConfirmed) {

            $.ajax({
                type:"post",
                url:"/seller/waitNo",
                traditional:true,
                contentType:'application/json',
                data:JSON.stringify({
                    "id":id
                }),
                success:function(success){
                    Swal.fire('입점신청이 거절되었습니다.', '', 'success');
                    setTimeout(function() {
                        location.reload();
                      }, 1000);
                },
                error:function(error){
                    Swal.fire('입점신청 거절에 실패하였습니다.', '', 'error');
                }

            })
        }else{
            Swal.fire('취소하였습니다.', '', 'warning');
        }
     });


})