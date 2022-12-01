$(".accept").on("click",function(e){

    let id = $(this).prev().prev().prev().prev().prev().prev().text();
    console.log("id:",id);

    Swal.fire({
        title: '판매자 등급을 부여하시겠습니까?',
        text: id,
        icon: 'warning', //warning,error,success,info,question
        
        showCancelButton: true, // cancel버튼
        confirmButtonText: '확인', // confirm 버튼 텍스트 지정
        cancelButtonText: '취소', // cancel 버튼 텍스트 지정
        
     }).then(result => {
        if (result.isConfirmed) {
        
            $.ajax({
                type:"post",
                url:"/seller/accept",
                traditional:true,
                contentType:'application/json',
                data:JSON.stringify({
                    "id":id
                }),
                success:function(success){
                    Swal.fire('판매자 등급이 부여되었습니다.', '', 'success');
                    setTimeout(function() {
                        location.reload();
                      }, 1000);
                },
                error:function(error){
                    Swal.fire('판매자 등급 부여에 실패하였습니다.', '', 'error');
                }

            })

        }else{
            Swal.fire('취소하였습니다.', '', 'warning');
        }
     });


})


$(".acceptNo").on("click",function(e){

    let id = $(this).prev().prev().prev().prev().prev().prev().prev().text();
    console.log("id:",id);

    Swal.fire({
        title: '승인을 취소하시겠습니까?',
        text: id,
        icon: 'warning',
        
        showCancelButton: true, // cancel버튼
        confirmButtonText: '확인', // confirm 버튼
        cancelButtonText: '취소', // cancel 버튼
        
     }).then(result => {
        if (result.isConfirmed) {

            $.ajax({
                type:"post",
                url:"/seller/acceptNo",
                data:{
                    "id":id
                },
                success:function(success){
                    Swal.fire('승인이 취소되었습니다.', '', 'success');
                    setTimeout(function() {
                        location.reload();
                      }, 1000);
                },
                error:function(error){
                    Swal.fire('승인 취소에 실패하였습니다.', '', 'error');
                }

            })
        }else{
            Swal.fire('취소하였습니다.', '', 'warning');
        }
     });


})