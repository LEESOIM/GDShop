

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

submitApply();
function submitApply(){
	console.log("================submitApply=============");
	let id = $("#id1").val();
	let name = $("#name").val();
	let email = $("#email").val();
	let phone = $("#phone").val();
	let company = $("#company").val();
	let agree = $("#aggrement").is(':checked');
	if(id!=null && name!=null && email!=null && phone!=null && company!="" && agree){
		console.log("if문통과");
		$("#frm").submit();
	}
}
// $("#standingRequest").on("click",function(e){
// 	e.preventDefault();
// 	console.log("================================");
// 	let id = $("#id1").val();
// 	let name = $("#name").val();
// 	let email = $("#email").val();
// 	let phone = $("#phone").val();
// 	let company = $("#company").val();
// 	let agree = $("#aggrement").is(':checked');

// 	console.log("1.ID명:"+id);
// 	console.log("2.이름:"+name);
// 	console.log("3.이메일:"+email);
// 	console.log("4.전화번호:"+phone);
// 	console.log("5.기업명:"+company);
// 	console.log("6.동의:"+agree);
	

// 	if(id!=null && name!=null && email!=null && phone!=null && company!="" && agree){
// 		console.log("if문통과");

// 		$.ajax({
// 			type:"post",
// 			url:"/seller/seller",
// 			traditional:true,
// 			contentType:'application/json',
// 			data:JSON.stringify({
// 				"id":id,
// 				"roleNum":"4",
// 				"name":name,
// 				"email":email,
// 				"phone":phone,
// 				"company":company
// 			}),
// 			success:function(data){
// 				console.log(data)
// 				console.log("================ajax성공");
// 			},
// 			error:function(){
// 				console.log("================ajax실패");
// 			}
			
// 		})
// 	}


// });