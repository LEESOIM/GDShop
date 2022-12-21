<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 모달창 -->
<div class="modal fade" data-bs-backdrop="static" id="exampleModal_item" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1" >
  <div class="modal-dialog" >
    <div class="modal-content" style="width: 560px">
      
      <!-- 추첨형 -->
      <div id="applyType" style="display: none">
      <div class="modal-header p-3" id="exampleModalToggleLabel" style="background-color: #4AB34A; color: white; font-weight: bold">
			<h1 class="modal-title fs-5" id="exampleModalLabel"><b>추첨형 캠페인 지원</b></h1>
		</div>
      <div class="modal-body py-3 px-4 my-3">
     	<b>추첨형 캠페인에 지원하기 전에 아래 사항을 확인해주세요.</b><br><br>
		<b style="color: #eb2f96">아직 구매하지 마세요! 당첨된 것이 아닙니다.</b><br>
		추첨형 캠페인은 모집 기간 동안 지원자를 모집한 후 랜덤으로 당첨자를 선정합니다.<br>당첨자에게는 별도로 당첨 알림 문자가 발송됩니다.
      	<div class="pt-3">
		  <input class="form-check-input" type="checkbox" id="check">
		  <label class="form-check-label" for="check">
		    <b>캠페인 유의사항을 확인하였으며, 이에 동의합니다. </b>
		   </label>
		</div>
      </div>
      <div class="modal-footer">
     	 <button type="button" class="btn btn-success" data-bs-dismiss="modal" aria-label="Close">취소</button>
	     <button type="button" class="btn btn-success" data-bs-target="#ModalToggle" data-bs-toggle="modal" id="apply" disabled data-itemNum-num="${vo.itemNum }">지원하기</button> 
      </div>	
      </div>
      	
      <!-- 즉석추첨형 -->	
      <div id="applyBaroType" style="display: none">
      	<div class="modal-header p-3" id="exampleModalToggleLabel" style="background-color: #4AB34A; color: white; font-weight: bold">
			<h1 class="modal-title fs-5" id="exampleModalLabel">
			<c:if test="${vo.type eq '즉석추첨형' }"><b>즉석 추첨형 캠페인 지원</b></c:if><c:if test="${vo.type eq 'SNS미션' }"><b>SNS 미션 캠페인 지원</b></c:if></h1>
		</div>
      <div class="modal-body py-3 px-4 my-3">
     	<b><c:if test="${vo.type eq '즉석추첨형' }"><b>즉석 추첨형</b></c:if><c:if test="${vo.type eq 'SNS미션' }"><b>SNS 미션</b></c:if> 캠페인에 지원하기 전에 아래 사항을 확인해주세요.</b><br><br>
		<b style="color: #eb2f96">캠페인에 선정되시면 2시간 내에 미션수행카드에서 구매하기 미션까지 마쳐주세요.</b><br>
		2시간 내에 미션수행카드에서 구매하기까지 완료하지 않으시면 실제 구매를 진행하셨더라도 캠페인이 자동 취소되어 포인트를 받으실 수 없으며, 동일 캠페인 재지원이 불가합니다.
      	<div class="pt-3">
		  <input class="form-check-input" type="checkbox" id="checkBaro">
		  <label class="form-check-label" for="checkBaro">
		    <b>캠페인 유의사항을 확인하였으며, 이에 동의합니다. </b>
		  </label>
		</div>
		</div>
      <div class="modal-footer">
     	 <button type="button" class="btn btn-success" data-bs-dismiss="modal" aria-label="Close">취소</button>
	     <button type="button" class="btn btn-success" data-bs-target="#ModalToggle2" data-bs-toggle="modal" id="applyBaro" disabled data-itemNum-num="${vo.itemNum }">지원하기</button> 
      </div>
      </div>

    </div>
  </div>
</div>



<!-- 추첨형 지원완료 -->
<div data-bs-backdrop="static" class="modal fade" id="ModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content p-2">
      <div class="modal-body my-2">
		<div><i class="fa-regular fa-circle-check me-2" style="color: #44D62C; font-size: 18px;"></i><b>추첨형 캠페인 지원 완료</b></div>
		<div class="mt-3">추첨형 캠페인에 지원 완료되었습니다.<br>모집 기간 동안 지원자를 모집한 후 랜덤으로 당첨자가 선정되며, 당첨자에게는 별도로 당첨 알림문자가 발송됩니다.</div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-success" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" class="okBtn" 
        onclick="window.location.href=window.location.href">확인</button>
      </div>
    </div>
  </div>
</div>



<!-- 즉석추첨형 지원완료(룰렛) -->
<div data-bs-backdrop="static" class="modal fade" id="ModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 550px">
      <div class="modal-header p-3" style="background-color: #4AB34A; color: white; font-weight: bold">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2"><b><c:if test="${vo.type eq '즉석추첨형' }">즉석 추첨</c:if><c:if test="${vo.type eq 'SNS미션' }">SNS 미션</c:if></b></h1>
      </div>
      <div class="modal-body">
        <img style="margin-left:130px; padding-top:15px; padding-bottom:30px; width:50%" src="/images/roulette.gif">
		<div id="roulette" style="text-align : center; margin-bottom: 10px; display: none; ">
			<div id="missionO" style="display: none">
			<b style="color: #eb2f96">축하해요!<br>캠페인에 선정되셨습니다!</b>
			<div style="font-size: 14px">2시간 내에 미션수행카드에서 구매하기 미션까지 인증을 완료해 주세요.<br>미완료 시 캠페인이 자동 취소되어 포인트를 받을 수 없으며, <br>동일 캠페인 재지원이 불가합니다.</div>
			</div>
			
			<div id="missionX" style="display: none">
			<b style="color: #eb2f96">아쉽지만 캠피인에 선정되지 않았습니다. 😭</b>
			</div>
		</div>
      </div>
      <div class="modal-footer" id="rouletteF" style=" display: none;">
        <button class="btn btn-success" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" class="okBtn" 
        onclick="window.location.href=window.location.href">확인</button>
      </div>
    </div>
  </div>
</div>


<!-- 미션 -->
<div class="mStatus0">
<div data-bs-backdrop="static" class=" modal fade" id="missionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog mStatus0" >
		<div class="modal-content" style="width: 600px">
			<div class="modal-header" style="background-color: #4AB34A; color: white; font-weight: bold">
				<h1 class="modal-title fs-5" id="exampleModalLabel">
					<b>미션수행카드</b>
				</h1>
			</div>
			<div class="modal-body p-3">
			<c:if test="${vo.type ne 'SNS미션' }">
				<div class="d-flex justify-content-center my-2" style="text-align: center">
					<div style="font-weight: bold;">
						<div class="mission_order">
							<i class="fa-solid fa-circle-check" style="color: green"></i> 구매하기
						</div>
						<div>미진행</div>
					</div>
					<div class="solid"></div>
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 리뷰
						</div>
						<div>미진행</div>
					</div>
					<div class="solid"></div>
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 포인트 수령
						</div>
						<div>미완료</div>
					</div>
				</div>
			</c:if>
			<c:if test="${vo.type eq 'SNS미션' }">				
				<div class="d-flex justify-content-center my-2" style="text-align: center">
					<div style="font-weight: bold;">
						<div class="mission_order">
							<i class="fa-solid fa-circle-check" style="color: green"></i> 참여하기
						</div>
						<div>미진행</div>
					</div>
					<div class="solid"></div>
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 포인트 수령
						</div>
						<div>미완료</div>
					</div>
				</div>
			</c:if>
				<hr />
		<c:if test="${vo.type ne 'SNS미션' }">
				<form id="ocr" action="/purchase/setPurchase" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${vo.itemNum }" name="itemNum">
				<div class="pe-4 py-4" style="font-size: 14px">
				<div class="d-flex pb-2">
					<div style="margin:auto 0; width: 30%; text-align: right;">
						<b>구매 URL</b>
					</div>
					<div style="width: 80%; margin-left: 15px">
						<a class="btn btn-success btn-sm py-0" href="${vo.url}" target="_blank">구매링크 바로가기</a>
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="width: 30%; text-align: right;">
						<b>미션 가이드 라인</b>
					</div>
					<div style="width: 80%; margin-left: 15px; ">
					<div class="mb-2" style="color: #198754; font-weight: bold;">✅구디샵에 등록된 계정과 실제 구매를 진행하는 계정이 서로 동일한 지 구매 전 반드시 확인해 주세요.<br>
						✅옵션 : ${vo.detail }<br>
						✅결제금액 : <fmt:formatNumber value="${vo.price }" pattern="###,###,###" />원<br></div>
						쿠팡 제품의 경우, 쿠팡 자체적으로 금액이 변동되기 때문에 구디샵에서 제시된 구매금액과 실제 구매금액이 다를 수 있습니다.<br>
						(상이한 금액으로 제품을 구매하시는 경우, 차액을 부담하여 구매하시거나 캠페인 참여 취소하실 수 있습니다. 포인트는 구디샵에 기재된 만큼만 지급됩니다.)<br><br>
						[추가 안내사항]<br>
						-자동 취소 예정 시간 이내에 구매 인증을 하지 않으면 캠페인 자동 취소됩니다.<br>
						-명시되지 않은 포인트나 할인 쿠폰, 기프트카드 등으로 최종 결제 가격이 달라지면 포인트가 지급되지 않습니다.<br>
						-업체 측 요청에 따라 체험단 선정 인원수가 변경될 수 있습니다.<br>
						-제품 품절의 경우, 캠페인 진행이 어려우므로 캠페인 취소를 부탁드립니다.<br>
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="margin:auto 0; width: 30%; text-align: right;">
						<b><span style="color: red">*</span>주문번호</b>
					</div>
					<div style="width: 80%; margin-left: 25px">
						<input class="form-control p-1" type="text" id="purNumM" name="purNumM" style="width: 300px">
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="margin:auto 0; width: 30%; text-align: right;">
						<b><span style="color: red">*</span>결제금액</b>
					</div>
					<div style="width: 80%; margin-left: 25px">
						<input class="form-control p-1" type="text" id="priceM" name="priceM" style="width: 300px">
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="margin:auto 0; width: 30%; text-align: right;">
						<b><span style="color: red">*</span>인증샷</b>
					</div>
					<div style="width: 80%; margin-left: 25px">
			  				<input type="file" class="form-control p-1" id="f" name="f" style="width: 300px">
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="margin:auto 0; width: 30%; text-align: right;"></div>
					<div style="width: 80%; margin-left: 20px">
						✅인증샷은 주문일, 주문번호, 구매상품(옵션포함), 총 결제금액이 확인되는 사진으로 등록해 주세요.<br>
						✅구디샵에 제출하신 주문정보와 실제 주문정보가 일치하지 않거나, 구매 미션 가이드에 안내된 방법과 다르게 구매한 것이 적발될 경우 추후 캠페인 취소로 진행될 수 있으며, 이에 따른 불이익(ex.포인트 미지급, 반품비 발생 등)은 구디샵에서 책임지지 않습니다.
					</div>
				</div>
				</div>

				<div class="modal-footer d-flex justify-content-center pb-0">
				<button type="button" class="btn btn-outline-success" data-bs-dismiss="modal" aria-label="Close">취소</button>
				<button type="button" class="btn btn-success" data-bs-target="#missionModal2" data-bs-toggle="modal" id="ocrSubmit">전송</button> 
				</div>
		</form>
		</c:if>
			<c:if test="${vo.type eq 'SNS미션' }">	
			<form id="ocrSNS" action="/follow/getFollow" method="post" enctype="multipart/form-data">
				<input name="itemNum" type="hidden" value="${vo.itemNum }">
				<div class="pe-4 py-4" style="font-size: 15px">
				<div class="d-flex pb-2">
					<div style="margin:auto 0; width: 30%; text-align: right;">
						<b>인스타그램 URL</b>
					</div>
					<div style="width: 80%; margin-left: 15px">
						<a class="btn btn-success btn-sm py-0" href="${vo.url}" target="_blank">링크 바로가기</a>
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="width: 30%; text-align: right;">
						<b>미션 가이드 라인</b>
					</div>
					<div style="width: 80%; margin-left: 15px; ">
					<div class="mb-2" style="color: #198754; font-weight: bold;">✅미션종류 : 인스타 팔로우<br>
						✅해당 링크로 들어가셔서 해당 인스타 팔로우 하고<br> 인증해 주세요<br>
						✅${vo.sellerSNS }<br><br>
						</div>
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="margin:auto 0; width: 30%; text-align: right;">
						<b><span style="color: red">*</span>인증샷</b>
					</div>
					<div style="width: 80%; margin-left: 25px">
			  				<input type="file" class="form-control p-1" name="f" style="width: 300px">
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="margin:auto 0; width: 30%; text-align: right;">
						<b><span style="color: red">*</span>인스타 아이디</b>
					</div>
					<div style="width: 80%; margin-left: 25px">
			  				<input type="text" class="form-control p-1" id="insta" style="width: 300px">
					</div>
				</div>
				</div>

				<div class="modal-footer d-flex justify-content-center pb-0">
				<button type="button" class="btn btn-outline-success" data-bs-dismiss="modal" aria-label="Close">취소</button>
				<button type="button" class="btn btn-success" data-bs-target="#missionModal2" data-bs-toggle="modal" id="snsSubmit">전송</button> 
				</div>
			</form>
			</c:if>
		</div>
		</div>
	</div>
</div>
</div>

<div class="mStatus1">
<div data-bs-backdrop="static" class="modal fade" id="missionModal2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 600px">
			<div class="modal-header" style="background-color: #4AB34A; color: white; font-weight: bold">
				<h1 class="modal-title fs-5" id="exampleModalLabel">
					<b>미션수행카드</b>
				</h1>
			</div>
			<div class="modal-body p-3">
				<div class="d-flex justify-content-center my-2" style="text-align: center">
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 구매하기
						</div>
						<div>완료</div>
					</div>
					<div class="solid"></div>
					<div style="font-weight: bold;">
						<div class="mission_order">
							<i class="fa-solid fa-circle-check" style="color: green"></i> 리뷰
						</div>
						<div>미진행</div>
					</div>
					<div class="solid"></div>
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 포인트 수령
						</div>
						<div>미완료</div>
					</div>
				</div>
				<hr />
				
				<div class="pe-4" style="font-size: 15px">
				<div class="d-flex py-2">
					<div style="width: 30%; text-align: right;">
						<b>미션 가이드라인</b>
					</div>
					<div style="width: 80%; margin-left: 15px; ">
						<div style="color: red; font-weight: bold;">
						1) 텍스트 50자 이상<br>
						2) 실제 제품 사용 리뷰로 작성해 주세요.
						</div>
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="margin:auto 0; width: 30%; text-align: right;">
						<b>구매 URL</b>
					</div>
					<div style="width: 80%; margin-left: 15px">
						<a class="btn btn-success btn-sm py-0" href="${vo.url}" target="_blank">구매링크 바로가기</a>
					</div>
				</div>
				<div class="d-flex py-2">
					<div style="width: 30%; text-align: right;">
					</div>
					<div style="width: 80%; margin-left: 15px; ">
						[추가 안내 사항]<br>
						- 미션 마감일 이내 미션을 완료하지 않으시면 캠페인이 취소되어 포인트 지급이 불가합니다.<br>
						- 판매자의 요청에 따라 리뷰 수정 요청이 있을 수 있으며 수정 요청에 불응 시 추후 캠페인 이용에 제한이 있을 수 있는 점 양해 부탁드립니다.<br>
						- 체험 후 작성된 리뷰는 6개월 이상 업로드 상태를 유지해 주셔야 합니다. 등록한 컨텐츠의 유지 기간 (6개월) 미준수 시 제공 내역에 대한 비용이 청구될 수 있습니다.<br>
						- 자연스럽고 긍정적인 리뷰를 작성해 주세요
					</div>
				</div>
				<c:if test="${vo.shop eq '쿠팡' }">
				 <form id="reviewC" action="/review/getReview" method="POST" >
					<input name="itemNum" type="hidden" value="${vo.itemNum }">
					<input name="url" type="hidden" value="${vo.url }">
					<div class="d-flex pt-3">
						<div style="margin:auto 0; width: 30%; text-align: right;">
							<b><span style="color: red">*</span>쿠팡 닉네임</b>
						</div>
						<div style="width: 80%; margin-left: 25px">
							<input type="text" name="nickName" style="width: 300px" class="reNickName form-control p-1"/>	
						</div>
					</div>
					<div class="d-flex pt-2 pb-4">
						<div style="margin:auto 0; width: 30%; text-align: right;">
							<b><span style="color: red">*</span>작성일</b>
						</div>
						<div style="width: 80%; margin-left: 25px">
							<input class="reDate form-control" type="date" name="date" style="width: 300px">
						</div>
					</div>
					<div class="modal-footer d-flex justify-content-center pb-0">
					<button type="button" class="btn btn-outline-success" data-bs-dismiss="modal" aria-label="Close">취소</button>
					<button type="button" class="btn btn-success" data-bs-target="#missionModal3" data-bs-toggle="modal" id="reviewSubmit">전송</button> 
					</div>
				</form>
				</c:if>
				
				<c:if test="${vo.shop ne '쿠팡' }">
				<form id="reviewN" action="/review/getReviewNaver" method="POST" >
					<input name="itemNum" type="hidden" value="${vo.itemNum }">
					<input name="url" type="hidden" value="${vo.url }">
					<div class="d-flex pt-3">
						<div style="margin:auto 0; width: 30%; text-align: right;">
							<b><span style="color: red">*</span>네이버 아이디</b>
						</div>
						<div style="width: 80%; margin-left: 25px">
							<input type="text" name="nickName" style="width: 300px" class="reNickName form-control p-1"/>
						</div>
					</div>
					<div class="d-flex py-2">
						<div style="margin:auto 0; width: 30%; text-align: right;">
							<b><span style="color: red">*</span>작성일</b>
						</div>
						<div style="width: 80%; margin-left: 25px">
							<input class="reDate form-control" type="date" name="date" style="width: 300px">
						</div>
					</div>
					<div class="modal-footer d-flex justify-content-center pb-0">
					<button type="button" class="btn btn-outline-success" data-bs-dismiss="modal" aria-label="Close">취소</button>
					<button type="button" class="btn btn-success" data-bs-target="#missionModal3" data-bs-toggle="modal" id="reviewSubmit_N">전송</button> 
					</div>
				</form>
				</c:if>
				</div>
		</div>
		</div>
	</div>
</div>
</div>




<div class="mStatus2">
<div data-bs-backdrop="static" class="modal fade" id="missionModal3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 600px">
			<div class="modal-header" style="background-color: #4AB34A; color: white; font-weight: bold">
				<h1 class="modal-title fs-5" id="exampleModalLabel">
					<b>미션수행카드</b>
				</h1>
			</div>
			<div class="modal-body p-3">
			<c:if test="${vo.type ne 'SNS미션' }">
				<div class="d-flex justify-content-center my-2" style="text-align: center">
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 구매하기
						</div>
						<div>완료</div>
					</div>
					<div class="solid"></div>
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 리뷰
						</div>
						<div>완료</div>
					</div>
					<div class="solid"></div>
					<div style="font-weight: bold;">
						<div class="mission_order">
							<i class="fa-solid fa-circle-check" style="color: green"></i> 포인트 수령
						</div>
						<div>미완료</div>
					</div>
				</div>
			</c:if>
			<c:if test="${vo.type eq 'SNS미션' }">
				<div class="d-flex justify-content-center my-2" style="text-align: center">
						<div>
							<div class="mission_order">
								<i class="fa-regular fa-circle-check" style="color: green"></i> 참여하기
							</div>
							<div>완료</div>
						</div>
						<div class="solid"></div>
						<div style="font-weight: bold;">
							<div class="mission_order">
								<i class="fa-solid fa-circle-check" style="color: green"></i> 포인트 수령
							</div>
							<div>미완료</div>
						</div>
				</div>
			</c:if>
				<hr />
			<form id="getPoint" action="" method="post" >
				<div class="p-4" style="font-size: 15px; text-align: center;">
				<input type="hidden" id="itemNumResult" value="${vo.itemNum }">
					<img src="/images/santa.png" width="250px">
					<c:if test="${vo.type ne 'SNS미션' }">
						<div style="font-size: 30px; color: #44D62C"><b><fmt:formatNumber value="${vo.price }" pattern="###,###,###" />P</b></div>
						<input type="hidden" class="pointResult" value="${vo.price }">
					</c:if>
					<c:if test="${vo.type eq 'SNS미션' }">
						<div style="font-size: 30px; color: #44D62C"><b><fmt:formatNumber value="${vo.point }" pattern="###,###,###" />P</b></div>
						<input type="hidden" class="pointResult" value="${vo.point }">	
					</c:if>
					<button class="btn btn-success py-2 px-3 my-2" style="background-color: #44D62C; border-radius: 20px; border:none;" type="button" id="pointBtn"><i class="fa-solid fa-check"></i> <b>포인트받기</b></button>
				</div>
			</form>
		</div>
		</div>
	</div>
</div>
</div>

<script src="/js/item/mission.js"></script>
