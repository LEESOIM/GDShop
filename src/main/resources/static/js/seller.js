swal({
	title: "입점 신청 하시겠습니까?",
	icon: "info", //warning,error,success,info,question
	buttons: true,
	dangerMode: true
})
.then((asd)=>{
	if(asd){
		console.log("sibal");
	}else{
		console.log("nonononononono");
	}
})

//$("*") 전체
//$("#아이디명") 아이디
//$(".클래스명") 클래스
//$("요소명") 요소
//$("선택1,선택2") 그룹
//$("요소.클래스명") 종속1
//$("요소.#아이디명") 종속2
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

$("#standingRequest").on("click",function(e){
	console.log("================================");
	let id = $("#id1").val();
	let name = $("#name").val();
	let email = $("#email").val();
	let phone = $("#phone").val();
	let company = $("#company").val();
	let agree = $("#aggrement").is(':checked');

	console.log("1.ID명:"+id);
	console.log("2.이름:"+name);
	console.log("3.이메일:"+email);
	console.log("4.전화번호:"+phone);
	console.log("5.기업명:"+company);
	console.log("6.동의:"+agree);
	

	if(id!=null && name!=null && email!=null && phone!=null && company!="" && agree){
		swal({
			title: "입점 신청 하시겠습니까?",
			icon: "info", //warning,error,success,info,question
			buttons: true,
			dangerMode: true
		})
		.then((qwer) => {
			if (qwer) {
				// $.ajax({
				// 	type:"post",
				// 	url:"/seller/seller",
				// 	traditional:true,
				// 	contentType:'application/json',
				// 	data:JSON.stringify({
				// 		"id":id,
				// 		"roleNum":"4",
				// 		"name":name,
				// 		"email":email,
				// 		"phone":phone,
				// 		"company":company
				// 	}),
				// 	success:function(response){
				// 		console.log("================ajax성공");
				// 	},
				// 	error:function(){
				// 		console.log("================ajax실패");
				// 	}
				// })
			}else{
				console.log("asd");
			}
		})
	}
});