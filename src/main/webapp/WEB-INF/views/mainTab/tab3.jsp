<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MainTab3</title>
<c:import url="../template/library.jsp"></c:import>
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/list.css" />

<style type="text/css">
.tab3 {
	padding-bottom: 7px;
	border-bottom: 5px rgb(139, 176, 89) solid;
}

.tab3 a {
	font-weight: bold;
	color: rgb(139, 176, 89);
}
</style>
</head>
<body>
	<section class="container" style="width: 75%">
		<c:import url="../template/top_part.jsp"></c:import>
		<c:import url="../template/header.jsp"></c:import>

		<div style="margin-top: 3em; padding-bottom: 70px">

			<div class="campaign">
				<div class="campaign-title">초간단 미션</div>
				<div class="campaign-content">구매하기 미션 없이 참여하기 미션을 수행하고 포인트를 수령하는 방식</div>
			</div>
			
			<div class="search">
				<div class="available">
					<input type="checkbox" value="" id="able">
					<label for="able">지원 가능</label> 
				</div>
				<div class="order">
					<button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">최신순
					<img src="/images/borrom-arrow.svg">
					</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">추천순</a></li>
						<li><a class="dropdown-item" href="#">인기순</a></li>
						<li><a class="dropdown-item" href="#">당첨률순</a></li>
						<li><a class="dropdown-item" href="#">마감순</a></li>
					</ul>
				</div>
			</div>
			
			<div
				style="height: 40px; font-size: 22px; font-weight: 600; letter-spacing: -0.03em;">
				우리 집 오늘부터 외식없다✋온가족 먹거리🥪</div>
			<div class="d-flex justify-content-between" style="height: 380px">
				<!-- 상품1 -->
				<div>
					<div class="d-flex flex-column" style="width: 250px; height: 380px">
						<div
							style="width: 250px; height: 250px; background-image: url(https://cdn.imweb.me/upload/S2017032758d89cbde9730/5c344a55e5613.jpg); background-size: cover; background-repeat: no-repeat; background-position: center;"></div>
						<div class="d-flex flex-column"
							style="width: 250px; height: 130px">
							<div class="d-flex justify-content-start pt-1"
								style="font-size: 13.5px">
								<div style="color: red">
									<b>쿠팡</b>
								</div>
								<div class="ps-1 pe-1" style="color: rgb(147, 143, 143)">
									|</div>
								<div style="color: rgb(147, 143, 143)">[딜]풀무원</div>
							</div>
							<div class="pb-1 pt-1" style="font-size: 17.5px; height: 50px">
								<b>[로켓와우 회원만] 떡국(맛집 떡국)</b>
							</div>
							<div class="d-flex justify-content-start pb-1"
								style="padding-top: 2px">
								<div
									style="text-decoration: line-through; color: grey; font-size: 16px;"
									class="pe-2">8800</div>
								<div class="pe-1" style="font-size: 13px; line-height: 23px">
									실제구매가</div>
								<div style="font-size: 17.5px; line-height: 22px; color: blue">
									<b>100원</b>
								</div>
							</div>
							<div class="d-flex justify-content-between">
								<div style="font-size: 18px; color: blue">
									<i class="fa-regular fa-clock"></i> <b>3:39:52</b>
								</div>
								<div style="font-size: 13px; line-height: 28px; color: gray">
									마감임박</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 상품2 -->
				<div>
					<div class="d-flex flex-column" style="width: 250px; height: 380px">
						<div
							style="width: 250px; height: 250px; background-image: url(https://cdn.imweb.me/upload/S2017032758d89cbde9730/5c344a55e5613.jpg); background-size: cover; background-repeat: no-repeat; background-position: center;"></div>
						<div class="d-flex flex-column"
							style="width: 250px; height: 130px">
							<div class="d-flex justify-content-start pt-1"
								style="font-size: 13.5px">
								<div style="color: red">
									<b>쿠팡</b>
								</div>
								<div class="ps-1 pe-1" style="color: rgb(147, 143, 143)">
									|</div>
								<div style="color: rgb(147, 143, 143)">[딜]풀무원</div>
							</div>
							<div class="pb-1 pt-1" style="font-size: 17.5px; height: 50px">
								<b>[로켓와우 회원만] 떡국dsfdsfdsfdsfdsfsdf</b>
							</div>
							<div class="d-flex justify-content-start pb-1"
								style="padding-top: 2px">
								<div
									style="text-decoration: line-through; color: grey; font-size: 16px;"
									class="pe-2">8800</div>
								<div class="pe-1" style="font-size: 13px; line-height: 23px">
									실제구매가</div>
								<div style="font-size: 17.5px; line-height: 22px; color: blue">
									<b>100원</b>
								</div>
							</div>
							<div class="d-flex justify-content-between">
								<div style="font-size: 18px; color: blue">
									<i class="fa-regular fa-clock"></i> <b>3:39:52</b>
								</div>
								<div style="font-size: 13px; line-height: 28px; color: gray">
									마감임박</div>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div style="width: 250px; border: solid 2px; height: 380px"></div>
				</div>
				<div>
					<div style="width: 250px; border: solid 2px; height: 380px"></div>
				</div>
			</div>
		</div>

		<!-- 챗봇 -->
		<div>
			<div id="chat_ev" style="display: none">궁금한 부분 질문주세요!</div>
			<a class="btn" id="chat_bot"> <img id="chat_img"
				src="/images/16208041651620804165203.png" />
				<div class="pt-2">
					<b>구디 챗봇</b>
				</div> <span
				class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
				style="font-size: 13px;">+0 <span class="visually-hidden">unread
						messages</span></span></a>
		</div>

		<c:import url="../template/footer.jsp"></c:import>
	</section>
	<script src="/js/index.js"></script>
</body>
</html>

