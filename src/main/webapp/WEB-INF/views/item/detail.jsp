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
<title>ItemDetail</title>

<c:import url="../template/library.jsp"></c:import>
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/detail.css" />
</head>
<body>
	<c:import url="../template/top_part.jsp"></c:import>
	<c:import url="../template/header.jsp"></c:import>
	<section class="container" style="width: 65%">
		<div class="container">
			<div class="content d-flex mt-4">
				<div class="sidebar">
					<div style="height: 260px; width: 260px">
						<img src="/file/item/${vo.itemFileVOs[0].fileName}" alt="" style="height: 260px; width: 260px; border-radius: 5px" />
					</div>
					<div class="p-4" style="height: 260px; width: 260px;">
						<div class="d-flex">
							<div>${vo.shop }</div>
							<div class="mx-1">|</div>
							<div>기업명</div>
						</div>
						<div class="mt-1" style="font-size: 18px"><b>${vo.title }</b></div>
						<div style="font-size: 12px; text-align: right; color: rgb(124, 121, 132)">캠페인번호 : ${vo.itemNum }</div>
						<hr style="margin: 0;" />
						<div class="mt-4 mb-4">
							<div class="d-flex">
								<div class="me-4" style="font-size: 14px; margin: auto 0"><b>결제금액</b></div>
								<div style="font-size: 19px;"><b><fmt:formatNumber value="${vo.price }" pattern="###,###,###" />원</b></div>
								
							</div>
							<div class="d-flex">
								<div class="me-4" style="font-size: 14px; margin: auto 0"><b>완료보상</b></div>
								<div style="font-size: 19px;"><b><fmt:formatNumber value="${vo.point }" pattern="###,###,###" /></b><i class="fa-brands fa-product-hunt" style="color: #44D62C"></i></div>
							</div>
						</div>
						<hr style="margin: 0;" />
						<button class="btn btn-success w-100 mt-3" data-bs-toggle="modal"
							data-bs-target="#exampleModal_item" data-bs-whatever="@mdo">지원하기</button>
					</div>
				</div>
				<div style="height: 2000px; width: 100%; border: solid 2px blue; padding: 40px">
				<div class="mb-5">
					<b class="title">캠페인 진행 정보</b>
					<div class="d-flex mt-2" style="margin: -6px;">
						<div style="padding: 6px;">
							<div style="background-color: rgb(231, 245, 255);">
								<div class="d-flex py-3" style="width:250px;">
									<img src="/images/1회차img.svg" alt="캠페인 회차" class="ps-3 pe-2" style="width: 65px">
									<div style="width: 80%;">
										<div>캠페인 회차</div> 
										<div style="font-size: 18px"><b>/${vo.count }</b> <span style="font-size: 14px">회차</span></div>
									</div>
								</div>
							</div>
						</div>
						<div style="padding: 6px;">
							<div style="background-color: rgb(255, 240, 230);">
								<div class="d-flex py-3" style="width:250px;">
									<img src="/images/2모집률img.svg" alt="회차별 지원 현황" class="ps-3 pe-2" style="width: 65px">
									<div>
										<div>현재 모집률</div> 
										<div style="font-size: 18px"><b>0%</b></div>
									</div>
								</div>
							</div>
						</div>
						<div style="padding: 6px;">
							<div style="background-color: rgb(243, 243, 243);">
								<div class="d-flex py-3" style="width:250px;">
									<img src="/images/3시간img.svg" alt="회차 남은 시간" class="ps-3 pe-2" style="width: 65px">
									<div>
										<div>회차 남은 시간</div> 
										<div style="font-size: 18px">
											<input type="hidden" value="${vo.date}" class="date"> 
									<input type="hidden" value="${vo.count}" class="count"> 
									<b class="time"></b>
									<b><span class="hours"></span><span class="minutes"></span><span class="seconds"></span></b>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="mb-5">
					<b class="title">캠페인 기본 정보</b>
					<div class="d-flex my-4" style="font-size: 14px">
						<div style="margin:auto 0; width: 20%;"><b>캠페인 유형</b></div>
						<div style="width: 79%; border-bottom: solid 0.5px #f0f0f0; "><span>${vo.type }</span></div>
					</div>
					<div class="d-flex" style="font-size: 14px">
						<div style="margin:auto 0; width: 20%;"><b>제공 내역</b></div>
						<div style="width: 79%; border-bottom: solid 0.5px #f0f0f0; "><span>${vo.detail }</span></div>
					</div>
				</div>
				
				
				<div class="mb-5">
					<b class="title">캠페인 미션 정보</b>
					<div>미션은 아래 중 랜덤으로 부여되며, 미션에 대한 자세한 정보는 캠페인 참여 시 미션 수행 카드에서 확인 가능합니다.</div>
					<div style="background-color:rgb(243, 243, 243);">
						<div style="margin:auto 0; width: 20%;"><b>제공 내역</b></div>
						<div style="width: 79%;"><span>${vo.detail }</span></div>
					</div>
				</div>

</div>






				</div>
			</div>




			<!-- 모달창 -->
			<div class="modal fade" id="exampleModal_item" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header"
							style="background-color: #4AB34A; color: white; font-weight: bold">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								<b>미션수행카드</b>
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body p-3 mb-2 mt-2">
							<div class="d-flex justify-content-center"
								style="text-align: center">
								<div>
									<div class="mission_order">
										<span style="color: green">①</span> 구매하기
									</div>
									<div style="font-size: 13px">미진행</div>
								</div>
								<div class="solid"></div>
								<div>
									<div class="mission_order">
										<span style="color: green">②</span> 리뷰
									</div>
									<div style="font-size: 13px">미진행</div>
								</div>
								<div class="solid"></div>
								<div>
									<div class="mission_order">
										<span style="color: green">③</span> 포인트수령
									</div>
									<div style="font-size: 13px">미진행</div>
								</div>
							</div>
							<hr />

							<div class="d-flex justify-content-center">
								<button class="btn btn-outline-success" id="withdraw_btn">
									출금요청</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/js/timer.js"></script>
</body>
</html>