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
<style type="text/css">
.carousel-control-prev-icon, .carousel-control-next-icon {
    height: 30px;
    width: 30px;
    background-color: #44D62C;
    border-radius: 50%;
}
</style>
</head>
<body>
	<c:import url="../template/top_part.jsp"></c:import>
	<c:import url="../template/header.jsp"></c:import>
	<section class="container" style="width: 65%">
		<div class="container">
		<input type="hidden" value="${vo.id }" id="id">
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
						<div class="my-1" style="font-size: 18px"><b>${vo.title }</b></div>
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
						
						<button class="btn btn-success w-100 mt-3" 
							data-bs-target="#exampleModal_item" data-bs-whatever="@mdo" data-itemNum-num="${vo.itemNum }" id="applyCheck"><i class="fa-regular fa-pen-to-square me-2"></i>지원하기</button>
						<button type="button" id="cancel" class="applyCancel btn btn-outline-success w-100 mt-3" style="display: none">
						<i class="fa-solid fa-x me-2"></i>지원취소</button>
					</div>
				</div>
				
				
				<div style="width: 100%;">
				<div id="mycam0" style="display: none;">
				<div class="p-2" style="width: 90%; margin:0 auto; font-size:15px; border-radius: 4px; background-color: #fffbe6; border: 1px solid #ffe58f;">추첨형 캠페인에 지원 완료되었습니다. 모집 기간 동안 지원자를 모집한 후 랜덤으로 당첨자가 선정되며, 당첨자에게는 별도로 당첨 알림 톡이 발송됩니다.</div>
				</div>
			
			
			<div class="pb-4" id="mycam1" style="display: none;">
				<div style="width: 90%; margin:0 auto; margin-bottom: 50px; margin-top: 30px">
				<b class="title" style="font-size: 18px">지금 해야할 미션 - <span style="color: green">구매하기</span></b>
				<div class="progress">
				  <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				<div class="py-2 ps-3 mt-4" style="font-size:15px; border-radius: 4px; background-color: #fff1f0; border: 1px solid #ffa39e;">2시간  내에 구매 후 인증을 마치지 않으실 경우 자동으로 지원취소됩니다.</div>
				<div class="d-flex" style="float: right;">
					<button type="button" class="applyCancel btn btn-outline-success mt-3 me-2">
							<i class="fa-solid fa-x me-2"></i>참여취소</button>
					<button class="btn btn-success mt-3" data-bs-toggle="modal" data-bs-target="#missionModal"><i class="fa-regular fa-face-smile me-2"></i>미션수행카드</button>
				</div>
				</div>
			</div>
			
				
			<div style="padding: 30px 40px">
				<div class="pb-4" id="mycam">
					<b class="title" style="font-size: 18px">캠페인 진행 정보</b>
					<div class="d-flex mt-2" style="margin: -6px;">
						<div style="padding: 6px;">
							<div style="background-color: rgb(231, 245, 255);">
								<div class="d-flex py-3" style="width:250px; height: 85px">
									<img src="/images/1회차img.svg" alt="캠페인 회차" class="ps-3 pe-2" style="width: 65px">
									<div style="width: 80%;">
										<div>캠페인 회차</div> 
										<div style="font-size: 19px"><b id="nowCount"></b><span style="font-size: 14px"> / ${vo.count } 회차</span></div>
									</div>
								</div>
							</div>
						</div>
						<div style="padding: 6px;">
							<div style="background-color: rgb(255, 240, 230);">
								<div class="d-flex py-3" style="width:250px; height: 85px">
									<img src="/images/2모집률img.svg" alt="회차별 지원 현황" class="ps-3 pe-2" style="width: 65px">
									<div>
										<div>현재 모집률</div> 
										<div style="font-size: 19px"><b>0%</b></div>
									</div>
								</div>
							</div>
						</div>
						<div style="padding: 6px;">
							<div style="background-color: rgb(243, 243, 243);">
								<div class="d-flex py-3" style="width:250px; height: 85px">
									<img src="/images/3시간img.svg" alt="회차 남은 시간" class="ps-3 pe-2" style="width: 65px">
									<div>
										<div>회차 남은 시간</div> 
										<div style="font-size: 19px">
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
				
				
				<div class="pb-4" id="mycam2" style="display: none;">
				<b class="title" style="font-size: 18px">모든 미션을 완료한 캠페인입니다.</b>
					<div class="progress">
					  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped example" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
					</div>
				</div>
				
				<div class="py-4">
					<b class="title" style="font-size: 18px">캠페인 기본 정보</b>
					<div class="d-flex py-3" style="color: #666666">
						<div style="margin:auto 0; width: 20%;"><b>캠페인 유형</b></div>
						<div style="width: 79%; border-bottom: solid 0.5px #f0f0f0;" data-type="${vo.type }" id="type"><span>${vo.type }</span></div>
					</div>
					<div class="d-flex py-3" style="color: #666666">
						<div style="margin:auto 0; width: 20%;"><b>구매 링크</b></div>
						<div style="width: 79%; border-bottom: solid 0.5px #f0f0f0;"><a class="btn btn-success btn-sm py-0" href="${vo.url}" target="_blank">구매링크 바로가기</a></div>
					</div>
					<div class="d-flex py-3" style="color: #666666">
						<div style="margin:auto 0; width: 20%;"><b>제공 내역</b></div>
						<div style="width: 79%; border-bottom: solid 0.5px #f0f0f0; "><span>${vo.detail }</span></div>
					</div>
				</div>
				
				
				<div class="py-4">
					<b class="title" style="font-size: 18px">캠페인 미션 정보</b>
					<div class="my-3" style="font-size: 14px">미션은 아래 중 랜덤으로 부여되며, 미션에 대한 자세한 정보는 캠페인 참여 시 미션 수행 카드에서 확인 가능합니다.</div>
					
					<div id="accordionExample" style="background-color:rgb(243, 243, 243);" class="py-3">
					    <button class="accordion-button py-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1">
					       <i class="fa-solid fa-angle-right mx-3"></i> 구매하기
					    </button>
					    <div id="collapse1" class="accordion-collapse collapse ps-5" data-bs-parent="#accordionExample" style="font-size: 14px">
						• 구매링크 바로가기 버튼을 클릭하여 구매 가이드에 맞게 구매를 진행해 주세요.(2시간  이내 구매 인증 필수)
					    </div>
					    
					    <button class="accordion-button py-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2">
					        <i class="fa-solid fa-angle-right mx-3"></i> 텍스트 리뷰
					    </button>
					    <div id="collapse2" class="accordion-collapse collapse ps-5" data-bs-parent="#accordionExample" style="font-size: 14px">
					    • 상품 수령 후 해당 캠페인의 가이드를 확인하여 사진없이 텍스트 리뷰를 작성해 주세요.
					    </div>
					    <button class="accordion-button py-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3">
					       <i class="fa-solid fa-angle-right mx-3"></i> 포토 리뷰
					    </button>
					    <div id="collapse3" class="accordion-collapse collapse ps-5" data-bs-parent="#accordionExample" style="font-size: 14px">
						• 상품 수령 후 해당 캠페인의 가이드를 확인하여 텍스트와 사진을 첨부해서 리뷰를 작성해 주세요.
					    </div>
					    
					    <button class="accordion-button py-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4">
					        <i class="fa-solid fa-angle-right mx-3"></i> 배송완료인증
					    </button>
					    <div id="collapse4" class="accordion-collapse collapse ps-5" data-bs-parent="#accordionExample" style="font-size: 14px">
					    • 제품 수령 후 배송이 완료된 페이지를 캡쳐하여 인증해 주세요.
					    </div>
				  	</div>
				</div>


		<div id="carouselExampleControls" class="carousel slide py-5" data-bs-ride="carousel">
		  <div class="carousel-inner">
			  <c:forEach items="${vo.itemFileVOs }" var="file">
			  	<c:choose>
				  	<c:when test="${file eq vo.itemFileVOs[0]}">
					    <div class="carousel-item active">
					      <img src="/file/item/${file.fileName}" class="d-block w-100"/>
					    </div>
					  </c:when>
				    <c:otherwise>
					    <div class="carousel-item">
					    	<img src="/file/item/${file.fileName}" class="d-block w-100"/>
					    </div>
				    </c:otherwise>
			    </c:choose>
			  </c:forEach>
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
		
		
				<div class="py-4">
					<b class="title" style="font-size: 18px">캠페인 유의사항</b>
					<div class="mt-3 p-3" style="background-color: #fff1f0; border: 1px solid #ffa39e; font-size: 14px">
					<b>재판매</b><br>
					제공받은 제품 및 서비스를 재판매를 시도한 내용이 적발된 경우 해당 회원은 즉시 이용 정지되어 서비스 이용이 불가하며 포인트 회수 조치될 수 있습니다.<br>
					<b>미션 수행 기간 미준수</b><br>
					캠페인 선정 후 미션 수행 기간 내에 미션을 완료하지 않으면 캠페인이 취소되어 포인트를 수령하실 수 없으며, 패널티가 부과됩니다.
					(업체 측 사유로 미션 수행 기간 내 미션 완료가 불가능한 경우 구디샵 1:1문의 통해 접수해주시기 바랍니다.)<br>
					<b>포인트 부정 수령</b><br>
					구디샵에서 포인트를 지급받은 후에 제품 및 서비스를 환불 받는 것은 허용되지 않으며, 적발 시 포인트 회수 및 구디샵 이용이 불가합니다.<br>
					<b>캠페인 취소</b><br>
					구매 인증 후 단순 변심으로 인한 취소는 선정된 당일에만 가능하며, 이후 캠페인 취소 시 패널티가 부과됩니다.<br>
					<b>리뷰 컨텐츠 마케팅 및 광고에 활용</b><br>
					회원이 구디샵 및 관련 사이트 내에 광고주의 상품과 관련된 문장, 리뷰, 이미지, 동영상 등을 게시한 콘텐츠(인스타, 블로그, 쇼핑몰 리뷰, 초상권이 포함된 게시물 등)는 마케팅 및 광고에 활용 될 수 있습니다.
					</div>
				</div>		
			</div>
			</div>
			</div>
		</div>

	</section>
<c:import url="./modal.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/js/timer.js"></script>
	<script src="/js/item/itemDetail.js"></script>
</body>
</html>