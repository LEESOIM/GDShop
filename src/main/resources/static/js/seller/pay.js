$(".payNo").on("click",function(e){

    let id = $(this).prev().prev().prev().prev().prev().prev().prev().text();
    console.log("id:",id);

    Swal.fire({
        title: '판매자 등급을 회수하시겠습니까?',
        text: id,
        icon: 'warning',
        
        showCancelButton: true, // cancel버튼
        confirmButtonText: '확인', // confirm 버튼
        cancelButtonText: '취소', // cancel 버튼
        
     }).then(result => {
        if (result.isConfirmed) {

            $.ajax({
                type:"post",
                url:"/seller/payNo",
                data:{
                    "id":id
                },
                success:function(success){
                    Swal.fire('판매자 등급이 회수되었습니다.', '', 'success');
                    setTimeout(function() {
                        location.reload();
                      }, 1000);
                },
                error:function(error){
                    Swal.fire('판매자 등급 회수에 실패하였습니다.', '', 'error');
                }

            })
        }else{
            Swal.fire('취소하였습니다.', '', 'warning');
        }
     });


})