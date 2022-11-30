<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Seller</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/index.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body>
	<section class="container" style="width: 75%">
		<c:import url="../template/top_part.jsp"></c:import>
		<c:import url="../template/header.jsp"></c:import>
		<div style="margin-top: 3em; padding-bottom: 70px">

			<div class="d-flex justify-content-center mt-4">
				<div style="width: 60%; margin-bottom: 50px">
					<div class="container">
						<div class="input-form-backgroud row">
							<div class="input-form col-md-12 mx-auto">
								<h4 class="mb-3">판매자 입점 신청</h4>
								<form method="post" action="seller" id="frm" class="validation-form" novalidate>
									<sec:authorize access="isAuthenticated()">
										<sec:authentication property="Principal" var="user"/>
										<input type="text" class="form-control" id="roleNum" name="roleNum"
												value="4" hidden>
										<div class="mb-3">
											<label for="address2">ID<span class="text-muted">
											</span></label> <input type="text" class="form-control" id="id1" name="id"
												value="${user.id}" readonly>
										</div>
	
										<div class="mb-3">
											<label for="address2">이름<span class="text-muted">
											</span></label> <input type="text" class="form-control" id="name" name="name" value="${user.name}" 
											readonly>
										</div>
										<div class="mb-3">
											<label for="address2">이메일<span class="text-muted">
											</span></label> <input type="text" class="form-control" id="email" name="email"
												value="${user.email}" readonly>
										</div>
	
										<div class="mb-3">
											<label for="address2">전화번호<span class="text-muted">
											</span></label> <input type="text" class="form-control" id="phone" name="phone"
												value="${user.phone}" readonly>
										</div>
									</sec:authorize>

									<div class="mb-3">
										<label for="name">기업명</label> <input type="text"
											class="form-control" id="company" name="company" placeholder="기업명" required>
										<div class="invalid-feedback">기업명을 입력해주세요.</div>
									</div>

									<hr class="mb-4">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="aggrement" required> <label
											class="custom-control-label" for="aggrement">개인정보 수집
											및 이용에 동의합니다.</label>
									</div>
									<div class="mb-4"></div>
									<button class="btn btn-primary btn-lg btn-block" type="button"
										onclick="submitApply();" id="standingRequest" >입점 신청</button>
								</form>
							</div>
						</div>
						<footer class="my-3 text-center text-small">
							<p class="mb-1">&copy; 2022 GDShop</p>
						</footer>
						<a href="./sellerList">입점신청 리스트</a>
					</div>
				</div>
			</div>

		</div>
		<c:import url="../template/footer.jsp"></c:import>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>

		<!-- <script>
			function apply(){
				console.log("apply")
				const id = $("#id1").val();
				const eventSource = new EventSource('/sub/'+id);
				console.log(eventSource)
				eventSource.addEventListener("connect",function(event){
					let message = event.data;
					alert(message)
				})

				eventSource.addEventListener("addApply",function(event){
					let message = event.data;
					alert(message)
					
					// let data = JSON.parse(event.data);
					// console.log(data)
					// (async()=>{
					// 	const showNotificatoin = () =>{
					// 		const notification = new Notification('알림',{
					// 			body: data.content
					// 		})
	
					// 		setTimeout(()=>{
					// 			notification.close();
					// 		},10*1000);
	
					// 		notification.addEventListener("click",()=>{
					// 			window.open(data.url,'_blank');
					// 		})
					// 	}
	
					// 	let granted = false
	
					// 	if(Notification.permission ==='granted'){
					// 		granted = true;
					// 	}else if(Notification.permission!=='denied'){
					// 		let permission = await Notification.requestPermission();
					// 		granted = permission==='granted'
					// 	}
	
					// 	if(granted){
					// 		showNotificatoin();
					// 	}
	
					// })();
				})
				eventSource.addEventListener("error", function(event) {
            		eventSource.close()
        		})
			}

		</script> -->


	</section>
	<script src="/js/seller.js"></script>
</body>
</html>