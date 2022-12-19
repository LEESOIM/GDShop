<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>myCampaign</title>

<c:import url="../template/library.jsp"></c:import>

<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/list.css" />

</head>
<body>
	<div style="margin-bottom:500px;">
	<c:import url="../template/top_part.jsp"></c:import>
	<c:import url="../template/header.jsp"></c:import>
	<section class="container" style="width: 65%">

		<div style="margin-top: 3em; padding-bottom: 70px">

			<h2>
				내 캠페인
				</h2>
				<ul class="nav nav-tabs mb-4">
					<li class="nav-item"><a class="nav-link select" href="./apply" id="apply" data-value="0">지원</a></li>
					<li class="nav-item"><a class="nav-link select" href="./choice" id="choice" data-value="1">선정/미션중</a></li>
					<li class="nav-item"><a class="nav-link select" href="./complete" id="complete" data-value="2">미션완료</a></li>
					<li class="nav-item"><a class="nav-link select active" href="./cancel" id="cancel" data-value="3">취소</a></li>
				</ul>
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4" style="height: 380px">
				<c:forEach items="${list }" var="vo">
					<div style="margin-bottom:40px">
						<div class="d-flex flex-column" style="width: 250px; height: 380px">
							<div>
							<a href="/item/detail?itemNum=${vo.itemNum }">
							 <img src="/file/item/${vo.itemFileVOs[0].fileName}" style="width: 250px; height: 250px; border-radius: 15px"></a> </div>

							<div class="d-flex flex-column" style="width: 250px; height: 130px">
								<div class="d-flex justify-content-start pt-1" style="font-size: 14px">
									<c:choose>
										<c:when test="${vo.itemVO.shop eq '쿠팡'}">
											<div style="color: red">
												<b>${vo.itemVO.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.itemVO.shop eq '네이버'}">
											<div style="color: #2DB400">
												<b>${vo.itemVO.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.itemVO.shop eq '인스타그램'}">
											<div style="color: purple">
												<b>${vo.itemVO.shop }</b>
											</div>
										</c:when>
										<c:otherwise>
											<div style="color: #646464">
												<b>${vo.itemVO.shop }</b>
											</div>
										</c:otherwise>
									</c:choose>
									<span class="px-1" style="color: grey">|</span>
									<div style="color: grey">${vo.sellerVO.company }</div>
								</div>
							</div>
							<div class="my-1">
								<p style="font-size: 16px; height: 50px; margin: 0; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
									<b>${vo.itemVO.title }</b>
								</p>
							</div>
							<div class="d-flex justify-content-start">
								<div style="text-decoration: line-through; color: grey; font-size: 15px;" class="pe-2">
									<b>${vo.itemVO.price }원</b>
								</div>

								<c:if test="${vo.itemVO.type eq 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">보상금액</div>
									<div style="font-size: 18px; line-height: 22px; color: #FA6400">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.itemVO.point }" />원</b>
									</div>
								</c:if>

								<c:if test="${vo.itemVO.type ne 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">실제구매가</div>
									<div style="font-size: 18px; line-height: 22px; color: blue">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.itemVO.price-vo.itemVO.point }" />원</b>
									</div>
								</c:if>

							</div>
							<div class="d-flex justify-content-between">
								<div style="font-size: 18px; color: blue">
									<i class="fa-regular fa-clock"></i> 
									<input type="hidden" value="${vo.itemVO.date}" class="date"> 
									<input type="hidden" value="${vo.itemVO.count}" class="count"> 
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
	</div>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/js/index.js"></script>
	<script src="/js/timer.js"></script>
	<script src="/js/myCampaign.js"></script>
</body>
</html>

