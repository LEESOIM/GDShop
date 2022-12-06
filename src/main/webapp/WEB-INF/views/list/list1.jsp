<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>추첨형 게시판</title>
<c:import url="../template/library.jsp"></c:import>
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/list.css" />

<style type="text/css">
.tab1 {
	padding-bottom: 3px;
	border-bottom: 5px rgb(139, 176, 89) solid;
}

.tab1 a {
	font-weight: bold;
	color: rgb(139, 176, 89);
}
</style>
</head>
<body>
		<c:import url="../template/top_part.jsp"></c:import>
		<c:import url="../template/header.jsp"></c:import>
	<section class="container" style="width: 65%">

		<div style="margin-top: 3em; padding-bottom: 70px">

			<div class="campaign">
				<div class="campaign-title">추첨형</div>
				<div class="campaign-content">지원한 참여자 중 매일 정해진 추첨 인원만큼 랜덤으로 선정되는 무작위 선정 방식</div>
			</div>

			<div class="search mb-5" style="border-bottom: 1px solid #d8d8d8;">
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

		
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
				<c:forEach items="${list1 }" var="vo" >
				<div>
					<div class="d-flex flex-column" style="width: 250px; height: 380px; margin-bottom: 50px">
						<div>
							<a href="/item/detail?itemNum=${vo.itemNum }">
							<img src="/file/item/${vo.itemFileVOs[0].fileName}" style="width: 250px; height: 250px; border-radius: 15px"></a>
						</div>

						<div class="d-flex flex-column" style="width: 250px; height: 130px">
							<div class="d-flex justify-content-start pt-1" style="font-size: 14px">
								<c:choose>
									<c:when test="${vo.shop eq '쿠팡'}"><div style="color: red"><b>${vo.shop }</b></div></c:when>
									<c:when test="${vo.shop eq '네이버'}"><div style="color: #2DB400"><b>${vo.shop }</b></div></c:when>
									<c:when test="${vo.shop eq '인스타그램'}"><div style="color: purple"><b>${vo.shop }</b></div></c:when>
									<c:otherwise><div style="color: #646464"><b>${vo.shop }</b></div></c:otherwise>
								</c:choose>
							<span class="px-1" style="color: grey">|</span>
								<div style="color: grey">${vo.sellerVO.company }</div>
							</div>
							</div>
							<div class="my-1">
								<p style="font-size: 16px; height: 50px; margin: 0; 
								overflow: hidden; text-overflow: ellipsis; 
								display: -webkit-box;
    							-webkit-line-clamp: 2;
    							-webkit-box-orient: vertical;"><b>${vo.title }</b></p>
							</div>
							<div class="d-flex justify-content-start">
								<div style="text-decoration: line-through; color: grey; font-size: 15px;" class="pe-2"><b>${vo.price }원</b></div>
								<div class="pe-1" style="color:gray; font-size: 14px; line-height: 23px">실제구매가</div>
								<div style="font-size: 18px; line-height: 22px; color: blue">
								
								<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price-vo.point }" />원</b>
								</div>
							</div>
							<div class="d-flex justify-content-between">
								<div style="font-size: 18px; color: blue">
									<i class="fa-regular fa-clock"></i> 
									<input type="hidden" value="${vo.date}" class="date"> 
									<input type="hidden" value="${vo.count}" class="count"> 
									<b class="time"></b>
									<b><span class="hours"></span><span class="minutes"></span><span class="seconds"></span></b>
								</div>
								<div style="font-size: 12px; line-height: 28px; color: gray">마감임박</div>
							</div>
						</div>
					</div>
				</c:forEach>
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
	</section>
		<c:import url="../template/footer.jsp"></c:import>
	<script src="/js/index.js"></script>
	<script src="/js/timer.js"></script>
</body>
</html>

