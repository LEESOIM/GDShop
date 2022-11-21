<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								<form class="validation-form" novalidate>

									<div class="mb-3">
										<label for="address2">ID<span class="text-muted">&nbsp;(로그인
												필요)</span></label> <input type="text" class="form-control" id="id1"
											placeholder="ID를 입력해주세요.">
									</div>

									<div class="mb-3">
										<label for="name">기업명</label> <input type="text"
											class="form-control" id="company" placeholder="기업명" value=""
											required>
										<div class="invalid-feedback">기업명을 입력해주세요.</div>
									</div>
									<div class="mb-3">
										<label for="root">카드사</label> <select
											class="custom-select d-block w-100" id="card" required>
											<!-- <option disabled selected hidden>카드사를 선택해주세요</option> -->
											<option>신한카드</option>
											<option>KB국민카드</option>
											<option>삼성카드</option>
											<option>NH농협카드</option>
											<option>현대카드</option>
											<option>우리카드</option>
											<option>하나카드</option>
											<option>롯데카드</option>
											<option>IBK기업은행</option>
											<option>CITI카드</option>
											<option>BNK부산은행</option>
											<option>DGB대구은행</option>
											<option>BNK경남은행</option>
											<option>SC제일은행</option>
											<option>KJ광주은행</option>
											<option>JB전북카드</option>
											<option>SH수협카드</option>
											<option>제주VISA카드</option>
											<option>BC카드</option>
										</select>
										<div class="invalid-feedback">카드사를 선택해주세요.</div>
									</div>

									<div class="mb-3">
										<label for="address">카드번호</label> <input type="text"
											class="form-control" id="cardNum" placeholder="카드번호" required>
										<div class="invalid-feedback">카드번호를 입력해주세요.</div>
									</div>

									<div class="row">
										<div class="col-md-8 mb-3">
											<label for="root">대표 상품 카테고리</label> <select
												class="custom-select d-block w-100" id="category" required>
												<!-- <option>전체</option> -->
												<option>의류</option>
												<option>패션의류/잡화</option>
												<option>뷰티</option>
												<option>출산/유아동</option>
												<option>식품</option>
												<option>주방용품</option>
												<option>생활용품</option>
												<option>홈인테리어</option>
												<option>가전디지털</option>
												<option>스포츠/레저</option>
												<option>자동차용품</option>
												<option>도서/음반DVD</option>
												<option>완구/취미</option>
												<option>문구/오피스</option>
												<option>반려동물용품</option>
												<option>헬스/건강식품</option>
												<option>여행/티켓</option>
											</select>
											<div class="invalid-feedback">카테고리를 선택해주세요.</div>
										</div>
									</div>
									<hr class="mb-4">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="aggrement" required> <label
											class="custom-control-label" for="aggrement">개인정보 수집
											및 이용에 동의합니다.</label>
									</div>
									<div class="mb-4"></div>
									<button class="btn btn-primary btn-lg btn-block" type="submit"
										id="standingRequest">입점 신청</button>
								</form>
							</div>
						</div>
						<footer class="my-3 text-center text-small">
							<p class="mb-1">&copy; 2022 GDShop</p>
						</footer>
					</div>
				</div>
			</div>

		</div>
		<c:import url="../template/footer.jsp"></c:import>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>
	</section>
	<script src="/js/seller.js"></script>
</body>
</html>