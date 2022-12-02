<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home</title>
<c:import url="./template/library.jsp"></c:import>
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/header.css" />
<style type="text/css">
.tab0 {
	padding-bottom: 3px;
	border-bottom: 5px rgb(139, 176, 89) solid;
}
.tab0 a {
	font-weight: bold;
	color: rgb(139, 176, 89);
}
</style>
</head>
<body>
		<c:import url="./template/top_part.jsp"></c:import>
		<c:import url="./template/header.jsp"></c:import>
		<!-- 홈페이지 배너 -->	
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="/images/main2.avif" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="/images/main1.avif" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="/images/main3.avif" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>

		<!-- 최신순 -->
		<div class="container" style="width: 65%; margin-top: 4em; padding-bottom: 70px">
			<div style="height: 40px; font-size: 22px; font-weight: 600; letter-spacing: -0.03em; margin-bottom: 20px;">따끈따끈~ 방금 오픈한 캠페인</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4" style="height: 380px">
				<c:forEach items="${list }" var="vo">
					<div>
						<div class="d-flex flex-column" style="width: 250px; height: 380px">
							<div> <img src="/file/item/${vo.itemFileVOs[0].fileName}" style="width: 250px; height: 250px; border-radius: 15px"> </div>

							<div class="d-flex flex-column" style="width: 250px; height: 130px">
								<div class="d-flex justify-content-start pt-1" style="font-size: 14px">
									<c:choose>
										<c:when test="${vo.shop eq '쿠팡'}">
											<div style="color: red">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.shop eq '네이버'}">
											<div style="color: #2DB400">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.shop eq '인스타그램'}">
											<div style="color: purple">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:otherwise>
											<div style="color: #646464">
												<b>${vo.shop }</b>
											</div>
										</c:otherwise>
									</c:choose>
									<span class="px-1" style="color: grey">|</span>
									<div style="color: grey">${vo.sellerVO.company }</div>
								</div>
							</div>
							<div class="my-1">
								<p style="font-size: 16px; height: 50px; margin: 0; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
									<b>${vo.title }</b>
								</p>
							</div>
							<div class="d-flex justify-content-start">
								<div style="text-decoration: line-through; color: grey; font-size: 15px;" class="pe-2">
									<b>${vo.price }원</b>
								</div>

								<c:if test="${vo.type eq 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">보상금액</div>
									<div style="font-size: 18px; line-height: 22px; color: blue">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.point }" />원</b>
									</div>
								</c:if>

								<c:if test="${vo.type ne 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">실제구매가</div>
									<div style="font-size: 18px; line-height: 22px; color: blue">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price-vo.point }" />원</b>
									</div>
								</c:if>

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

		<!-- 인기순 -->
		<div class="container" style=" width:65%; padding-top: 4em; padding-bottom: 70px;">
			<div class="d-flex justify-content-between">
				<div style="height: 40px; font-size: 22px; font-weight: 600; letter-spacing: -0.03em; margin-bottom: 20px;">실시간 인기 캠페인!</div>
				<div class="more"> 더보기 <i class="fa-solid fa-circle-chevron-right" style="color: rgb(130, 203, 41)"></i>
				</div>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4"
				style="height: 380px">
				<c:forEach items="${listHit }" var="vo">
					<div>
						<div class="d-flex flex-column" style="width: 250px; height: 380px">
							<div> <img src="/file/item/${vo.itemFileVOs[0].fileName}" style="width: 250px; height: 250px; border-radius: 15px"> </div>

							<div class="d-flex flex-column" style="width: 250px; height: 130px">
								<div class="d-flex justify-content-start pt-1" style="font-size: 14px">
									<c:choose>
										<c:when test="${vo.shop eq '쿠팡'}">
											<div style="color: red">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.shop eq '네이버'}">
											<div style="color: #2DB400">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.shop eq '인스타그램'}">
											<div style="color: purple">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:otherwise>
											<div style="color: #646464">
												<b>${vo.shop }</b>
											</div>
										</c:otherwise>
									</c:choose>
									<span class="px-1" style="color: grey">|</span>
									<div style="color: grey">${vo.sellerVO.company }</div>
								</div>
							</div>
							<div class="my-1">
								<p style="font-size: 16px; height: 50px; margin: 0; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
									<b>${vo.title }</b>
								</p>
							</div>
							<div class="d-flex justify-content-start">
								<div style="text-decoration: line-through; color: grey; font-size: 15px;" class="pe-2">
									<b>${vo.price }원</b>
								</div>

								<c:if test="${vo.type eq 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">보상금액</div>
									<div style="font-size: 18px; line-height: 22px; color: blue">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.point }" />원</b>
									</div>
								</c:if>

								<c:if test="${vo.type ne 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">실제구매가</div>
									<div style="font-size: 18px; line-height: 22px; color: blue">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price-vo.point }" />원</b>
									</div>
								</c:if>

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
		<!-- VIP전용 -->
		<div style="background-color: #E8F5FF;">
		<div class="container" style=" width:65%; padding-top: 4em; padding-bottom: 70px;">
			<div class="d-flex justify-content-between">
				<div style="height: 40px; font-size: 22px; font-weight: 600; letter-spacing: -0.03em; margin-bottom: 20px;">프리미엄 상품을 만나보세요</div>
				<div class="more"><a href="./tab/tab4" style="text-decoration: none; color: black;"> 더보기 <i class="fa-solid fa-circle-chevron-right" style="color: rgb(130, 203, 41);"></i></a>
				</div>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4"
				style="height: 380px">
				<c:forEach items="${listHit }" var="vo">
					<div>
						<div class="d-flex flex-column" style="width: 250px; height: 380px">
							<div> <img src="/file/item/${vo.itemFileVOs[0].fileName}" style="width: 250px; height: 250px; border-radius: 15px"> </div>

							<div class="d-flex flex-column" style="width: 250px; height: 130px">
								<div class="d-flex justify-content-start pt-1" style="font-size: 14px">
									<c:choose>
										<c:when test="${vo.shop eq '쿠팡'}">
											<div style="color: red">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.shop eq '네이버'}">
											<div style="color: #2DB400">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.shop eq '인스타그램'}">
											<div style="color: purple">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:otherwise>
											<div style="color: #646464">
												<b>${vo.shop }</b>
											</div>
										</c:otherwise>
									</c:choose>
									<span class="px-1" style="color: grey">|</span>
									<div style="color: grey">${vo.sellerVO.company }</div>
								</div>
							</div>
							<div class="my-1">
								<p style="font-size: 16px; height: 50px; margin: 0; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
									<b>${vo.title }</b>
								</p>
							</div>
							<div class="d-flex justify-content-start">
								<div style="text-decoration: line-through; color: grey; font-size: 15px;" class="pe-2">
									<b>${vo.price }원</b>
								</div>

								<c:if test="${vo.type eq 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">보상금액</div>
									<div style="font-size: 18px; line-height: 22px; color: blue">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.point }" />원</b>
									</div>
								</c:if>

								<c:if test="${vo.type ne 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">실제구매가</div>
									<div style="font-size: 18px; line-height: 22px; color: blue">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price-vo.point }" />원</b>
									</div>
								</c:if>

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
	</div>
		<!-- ??? -->
		<div class="container" style=" width:65%; padding-top: 4em; padding-bottom: 70px;">
			<div class="d-flex justify-content-between">
				<div style="height: 40px; font-size: 22px; font-weight: 600; letter-spacing: -0.03em; margin-bottom: 20px;">
				마감 임박 캠페인, 놓치지 마세요? 지금 당첨 확률 높은 캠페인?</div>
				<div class="more"> 더보기 <i class="fa-solid fa-circle-chevron-right" style="color: rgb(130, 203, 41)"></i>
				</div>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4"
				style="height: 380px">
				<c:forEach items="${listHit }" var="vo">
					<div>
						<div class="d-flex flex-column" style="width: 250px; height: 380px">
							<div> <img src="/file/item/${vo.itemFileVOs[0].fileName}" style="width: 250px; height: 250px; border-radius: 15px"> </div>

							<div class="d-flex flex-column" style="width: 250px; height: 130px">
								<div class="d-flex justify-content-start pt-1" style="font-size: 14px">
									<c:choose>
										<c:when test="${vo.shop eq '쿠팡'}">
											<div style="color: red">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.shop eq '네이버'}">
											<div style="color: #2DB400">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:when test="${vo.shop eq '인스타그램'}">
											<div style="color: purple">
												<b>${vo.shop }</b>
											</div>
										</c:when>
										<c:otherwise>
											<div style="color: #646464">
												<b>${vo.shop }</b>
											</div>
										</c:otherwise>
									</c:choose>
									<span class="px-1" style="color: grey">|</span>
									<div style="color: grey">${vo.sellerVO.company }</div>
								</div>
							</div>
							<div class="my-1">
								<p style="font-size: 16px; height: 50px; margin: 0; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
									<b>${vo.title }</b>
								</p>
							</div>
							<div class="d-flex justify-content-start">
								<div style="text-decoration: line-through; color: grey; font-size: 15px;" class="pe-2">
									<b>${vo.price }원</b>
								</div>

								<c:if test="${vo.type eq 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">보상금액</div>
									<div style="font-size: 18px; line-height: 22px; color: blue">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.point }" />원</b>
									</div>
								</c:if>

								<c:if test="${vo.type ne 'SNS미션'}">
									<div class="pe-1" style="color: gray; font-size: 14px; line-height: 23px">실제구매가</div>
									<div style="font-size: 18px; line-height: 22px; color: blue">
										<b><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price-vo.point }" />원</b>
									</div>
								</c:if>

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
	
		<c:import url="./template/footer.jsp"></c:import>
	<script src="/js/index.js"></script>
	<script src="/js/timer.js"></script>
</body>
</html>