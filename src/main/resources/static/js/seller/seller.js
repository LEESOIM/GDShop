window.addEventListener('load', () => {
	const forms = document.getElementsByClassName('validation-form');
	Array.prototype.filter.call(forms, (form) => {
		form.addEventListener('submit', function(event) {
			if (form.checkValidity() === false) {
				event.preventDefault();
				event.stopPropagation();
			}
			form.classList.add('was-validated');
		}, false);
	});
}, false);

$("#standingRequest").on("click", function(e) {
	console.log("================================");
	let id = $("#id2").val();
	let name = $("#name").val();
	let email = $("#email").val();
	let phone = $("#phone").val();
	let company = $("#company").val();
	let agree = $("#aggrement").is(':checked');

	console.log("1.ID명:" + id);
	console.log("2.이름:" + name);
	console.log("3.이메일:" + email);
	console.log("4.전화번호:" + phone);
	console.log("5.기업명:" + company);
	console.log("6.동의:" + agree);

	if (id != null && name != null && email != null && phone != null && company != "" && agree) {

		$.ajax({
			type: "post",
			url: "/seller/seller",
			traditional: true,
			contentType: 'application/json;charset=utf-8',
			data: JSON.stringify({
				"id": id,
				"name": name,
				"email": email,
				"phone": phone,
				"company": company
			}),
			success: function(result) {
				Swal.fire({
					title: "입점 신청이 완료되었습니다.",
					icon: "success", //warning,error,success,info,question
					showCancelButton: true, 
        			confirmButtonText: '확인',
        			cancelButtonText: '취소', 
				})
				setTimeout(function() {
					location.reload();
				  }, 1000);
				console.log("================ajax성공");
			},
			error: function() {
				Swal.fire('이미 입점신청을 하였습니다.', '관리자의 승인을 기다려주세요', 'warning');
				console.log("================ajax실패");
			}
		})
	}
	else{
		Swal.fire('로그인이 필요합니다.', '', 'error');
	}
});