
$("#card").val("");
$("#category").val("");

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

$("#standingRequest").on("click",function(){
	console.log("================================");
	let id = $("#id1").val();
	let company = $("#company").val();
	let card = $("#card").val();
	let cardNum = $("#cardNum").val();
	let category = $("#category").val();

	console.log("1.ID명:"+id);
	console.log("2.기업명:"+company);
	console.log("3.카드사:"+card);
	console.log("4.카드번호:"+cardNum);
	console.log("5.대표 상품 카테고리:"+category);
	
	if(id!=null && company!=null && card!=null && cardNum!=null && category!=null){
		$.ajax({
			type:"post",
			url:"/seller/seller",
			traditional:false,
			data:{
				id,
				company,
				card,
				cardNum,
				category
			},
			success:function(response){
				console.log("===========Controller전송==========");
			}
		})
	}
});