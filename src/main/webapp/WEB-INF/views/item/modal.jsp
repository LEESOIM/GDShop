<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 모달창 -->

<div class="modal fade" id="exampleModal_item" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1" >
  <div class="modal-dialog" >
    <div class="modal-content" style="width: 560px">
      
      <!-- 추첨형 -->
      <div id="applyType" style="display: none">
      <div class="modal-header p-3" id="exampleModalToggleLabel" style="background-color: #4AB34A; color: white; font-weight: bold">
			<h1 class="modal-title fs-5" id="exampleModalLabel"><b>추첨형 캠페인 지원</b></h1>
		</div>
      <div class="modal-body py-3 px-4 my-3" >
     	<b>추첨형 캠페인에 지원하기 전에 아래 사항을 확인해주세요.</b><br><br>
		<b style="color: #eb2f96">아직 구매하지 마세요! 당첨된 것이 아닙니다.</b><br>
		추첨형 캠페인은 모집 기간 동안 지원자를 모집한 후 랜덤으로 당첨자를 선정합니다.<br>당첨자에게는 별도로 당첨 알림 톡이 발송됩니다.
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
			<h1 class="modal-title fs-5" id="exampleModalLabel"><b>즉석 추첨형 캠페인 지원</b></h1>
		</div>
      <div class="modal-body py-3 px-4 my-3" >
     	<b>즉석 추첨형 캠페인에 지원하기 전에 아래 사항을 확인해주세요.</b><br><br>
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
		<div class="mt-3">추첨형 캠페인에 지원 완료되었습니다.<br>모집 기간 동안 지원자를 모집한 후 랜덤으로 당첨자가 선정되며, 당첨자에게는 별도로 당첨 알림톡이 발송됩니다.</div>
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
    <div class="modal-content">
      <div class="modal-header p-3" style="background-color: #4AB34A; color: white; font-weight: bold">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2"><b>즉석추첨</b></h1>
      </div>
      <div class="modal-body">
        <img style="margin-left:100px; padding-top:10px; padding-bottom:20px; width:55%" src="/images/roulette.gif">
		<div id="roulette" style="text-align : center; margin-bottom: 10px; display: none; "><b style="color: #eb2f96">축하해요!<br>캠페인에 선정되셨습니다!</b>
		<div style="font-size: 14px">2시간 내에 미션수행카드에서 구매하기 미션까지 인증을 완료해 주세요.<br>미완료 시 캠페인이 자동 취소되어 포인트를 받을 수 없으며, <br>동일 캠페인 재지원이 불가합니다.</div></div>
      </div>
      <div class="modal-footer" id="rouletteF" style=" display: none;">
        <button class="btn btn-success" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" class="okBtn" 
        onclick="window.location.href=window.location.href">확인</button>
      </div>
    </div>
  </div>
</div>




<!-- 미션 -->
<div class="modal fade" id="exampleModal_item" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="background-color: #4AB34A; color: white; font-weight: bold">
				<h1 class="modal-title fs-5" id="exampleModalLabel">
					<b>미션수행카드</b>
				</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body p-3 mb-2 mt-2">
				<div class="d-flex justify-content-center" style="text-align: center">
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 구매하기
						</div>
						<div style="font-size: 13px">미진행</div>
					</div>
					<div class="solid"></div>
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 리뷰
						</div>
						<div style="font-size: 13px">미진행</div>
					</div>
					<div class="solid"></div>
					<div>
						<div class="mission_order">
							<i class="fa-regular fa-circle-check" style="color: green"></i> 포인트 수령
						</div>
						<div style="font-size: 13px">미완료</div>
					</div>
				</div>
				<hr />

				<div class="d-flex justify-content-center">
					<button class="btn btn-outline-success" id="withdraw_btn">다음</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="/js/item/modal.js"></script>
