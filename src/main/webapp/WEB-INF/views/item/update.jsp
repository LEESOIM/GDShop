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
<title>ItemUpdate</title>

<c:import url="../template/library.jsp"></c:import>
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/detail.css" />
</head>
<body>
		<c:import url="../template/top_part.jsp"></c:import>
		<c:import url="../template/header.jsp"></c:import>
	<section class="container" style="width: 75%">
		<div class="row justify-content-center">
			<div class="row justify-content-center col-9">
			
			<form action="./update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="itemNum" value="${vo.itemNum }">
				<div class="d-flex pt-5">
					<div>
                  		<div class="btn-group">
				 		  <input type="radio" class="btn-check" name="type" id="type1" value="추첨형" <c:if test="${vo.type eq '추첨형'}">checked</c:if>>
						  <label class="btn btn-outline-success" for="type1"><b>추첨형</b></label>
						  <input type="radio" class="btn-check" name="type" id="type2" value="즉석추첨형" <c:if test="${vo.type eq '즉석추첨형'}">checked</c:if>>
						  <label class="btn btn-outline-success" for="type2"><b>즉석추첨형</b></label>
						  <input type="radio" class="btn-check" name="type" id="type3" value="SNS미션" <c:if test="${vo.type eq 'SNS미션'}">checked</c:if>>
						  <label class="btn btn-outline-success" for="type3"><b>SNS미션</b></label>
						</div>
					</div>
				</div>
				
				
				<div class="mission1 pt-5">
				<div style="border-bottom: solid;">
					<div class="d-flex justify-content-between">
						<h4><b>상품정보</b></h4><div><b style="color: red;">*항목</b>만 변경 가능합니다</div>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>상품명<span style="color: red;">*</span></b>
					</div>
					<div style="width: 79%;">
						<input class="form-control" type="text" name="itemName" value="${vo.itemName }">
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>상품가격</b>
					</div>
					<div class="d-flex" style="width: 79%;">
						<input class="form-control" style="width: 35%;" type="text" name="price" id="price" value="${vo.price }" readonly="readonly"><p style="margin:auto 0;">&nbsp;원</p>
					</div>
				</div>
				</div>
				
				<div class="mission2 pt-5">
				<div style="border-bottom: solid;">
					<div class="d-flex justify-content-between">
						<h4><b>계정정보</b></h4><div><b style="color: red;">*항목</b>만 변경 가능합니다</div>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>SNS 계정<span style="color: red;">*</span></b>
					</div>
					<div style="width: 79%;">
						<input class="form-control" type="text" name="sellerSNS" value="${vo.sellerSNS }">
					</div>
				</div>
				</div>
				
				
				<div class="pt-5">
				<div style="border-bottom: solid;">
					<div class="d-flex justify-content-between">
						<h4><b>캠페인정보</b></h4><div><b style="color: red;">*항목</b>만 변경 가능합니다</div>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>상품이미지<span style="color: red;">*</span></b>
						<div style="font-size: 15px; color: gray;">(<span id="num">${vo.itemFileVOs.size()}</span>/3)</div>
					</div>
					<div style="width: 79%">
					<div class="d-flex" >
						<div class="d-flex" id="fileBox" data-file-size="${vo.itemFileVOs.size()}">
						<c:forEach items="${vo.itemFileVOs }" var="fileVO">
							<div class="me-3" style=" position : relative; color: limegreen;">
							<img src="/file/item/${fileVO.fileName}" style="width:135px; height:135px; border-radius: 15px;">
							<i class="deleteFile fa-solid fa-xmark" style="position: absolute; right:0" data-file-num=${fileVO.fileNum }></i>
							</div>
						</c:forEach>
						</div>
						<label id="fileAdd" class="border border-success rounded-3" style="width: 130px; height: 130px; color: green; text-align: center;">
						<i class="fa-solid fa-camera" style="font-size: 30px; margin-top: 35px"></i><p style="font-size: 13px; text-align: center;">이미지등록</p></label>
					</div>	
						<p style="color: #1ec800; font-size:13px; margin-top:10px; margin-bottom: 0px;">첫번째 이미지가 대표이미지로 적용됩니다.</p>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>캠페인제목<span style="color: red;">*</span></b>
					</div>
					<div style="width: 79%;">
						<input class="form-control" type="text" name="title" value="${vo.title }">
						<p style="color: #1ec800; font-size:13px; margin-top:3px; margin-bottom: 0px;">판매 상품과 관련이 없는 다른 상품명, 스팸성 키워드 입력 시 상품 게시가 어려울 수 있습니다.</p>
					</div>
				</div>
				
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>캠페인등급<span style="color: red;">*</span></b>
					</div>
						<div style="width: 79%;">
							<div class="btn-group">
							<input type="radio" class="btn-check" name="role" id="camType1" value="VIP" <c:if test="${vo.role eq 'VIP'}">checked</c:if>>
						 	<label class="btn btn-outline-success" for="camType1">VIP상품</label>
						 
						 	<input type="radio" class="btn-check" name="role" id="camType2" value="모두" <c:if test="${vo.role eq '모두'}">checked</c:if>>
						 	<label class="btn btn-outline-success" for="camType2">모두</label>
							</div>
						</div>
				</div>				
				
				<div class="mission1">
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>고객부담금</b>
					</div>
					<div style="width: 79%;">
						<c:if test="${vo.price ne vo.point }">
						<div class="btn-group">
						  <input type="radio" class="btn-check" name="pointOnOff" id="point1" checked>
						  <label class="btn btn-outline-success" for="point1">설정함</label>
						  <input type="radio" class="btn-check" name="pointOnOff" id="point2" disabled>
						  <label class="btn btn-outline-success" for="point2">설정안함</label>
						  </div>
						<div id="pointOn">
							<div class="mt-3">
								<div class="d-flex mb-2"><span class="me-4" style="margin:auto 0;">판매금액</span>
									<input type="text" class="form-control w-25" id="point1_1" readonly="readonly" value="${vo.price }"><span style="margin:auto 0;">&nbsp;원</span>
								</div>
								<div class="d-flex mb-2"><span class="me-2" style="margin:auto 0;">고객부담금</span>
									<input type="text" class="form-control w-25" id="point1_2" ><span style="margin:auto 0;">&nbsp;원</span>
								</div>
								<div><span class="me-4">보상금액</span>
									<input type="hidden" id="point1_3" value="${vo.point }">
									<label id="point1Text" style="font-size: 22px; font-weight: bold;">
									<fmt:formatNumber value="${vo.point }" pattern="###,###,###" /></label> 원</div>
							</div>
						</div>
						</c:if>
						
						<c:if test="${vo.price eq vo.point }">
						<div class="btn-group">
						  <input type="radio" class="btn-check" name="pointOnOff" id="point1" disabled>
						  <label class="btn btn-outline-success" for="point1">설정함</label>
						  <input type="radio" class="btn-check" name="pointOnOff" id="point2" checked>
						  <label class="btn btn-outline-success" for="point2">설정안함</label>
						  </div>
						<div id="pointOff">
							<div class="mt-3">
								<div class="d-flex mb-2"><span class="me-4" style="margin:auto 0;">판매금액</span>
									<input type="text" class="form-control w-25" id="point2_1" readonly="readonly" value="${vo.price }"><span style="margin:auto 0;">&nbsp;원</span>
								</div>
								<div class="d-flex mb-2"><span class="me-2" style="margin:auto 0;">고객부담금</span>
									<input type="text" class="form-control w-25" id="point2_2" readonly="readonly" value="0"><span style="margin:auto 0;">&nbsp;원</span>
								</div>
								<div><span class="me-4">보상금액</span>
									<input type="hidden" id="point2_3" value="${vo.point }">
									<label id="point2Text" style="font-size: 22px; font-weight: bold;">
									<fmt:formatNumber value="${vo.point }" pattern="###,###,###" /></label> 원</div>
							</div>
						</div>
						</c:if>

					</div>
				</div>
				</div>
				
				<div class="mission2">
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>보상금액<span style="color: red;">*</span></b>
					</div>
					<div class="d-flex" style="width: 79%;">
						<input class="form-control" style="width: 35%;" id="point" type="text" value="${vo.point }"><p style="margin:auto 0;">&nbsp;원</p>
					</div>
				</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b style="line-height: 50px">제공내역<span style="color: red;">*</span></b>
					</div>
					<div style="width: 79%;">
						<textarea class="form-control" rows="3" cols="79%" name="detail">${vo.detail }</textarea>
						<p style="color: #1ec800; font-size:13px; margin-top:3px; margin-bottom: 0px;">ex) OOO프로바이오틱스, 30캡슐, 1개 / OOO트리트먼트 화이트머스크향, 1000ml, 1개</p>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>총 제공수량</b>
					</div>
					<div style="width: 79%;">
						<input class="form-control" id="stock" style="width: 35%;" type="text" name="stock"  value="${vo.stock }" readonly="readonly">
					</div>
				</div>
				
				<div id="camCount">
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>총 캠페인회차</b>
					</div>
					<div style="width: 79%;">
						<div class="d-flex"><input class="form-control" id="count" style="width: 35%;" type="text" name="count" value="${vo.count }" readonly="readonly"><p style="margin:auto 0;">&nbsp;회</p></div>
						<p style="color: #1ec800; font-size:13px; margin-top:3px; margin-bottom: 0px;">캠페인당 모집인원 = 총 제공수량/총 캠페인 회차</p>
					</div>
				</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>구매링크<span style="color: red;">*</span></b>
					</div>
					<div class="d-flex" style="width: 79%;">
						<select class="form-select me-3" style="width: 110px;" name="shop">
							<option value="" hidden disabled="disabled">쇼핑몰</option>
							<option value="쿠팡" <c:if test="${vo.shop eq '쿠팡'}">selected</c:if>>쿠팡</option>
							<option value="네이버" <c:if test="${vo.shop eq '네이버'}">selected</c:if>>네이버</option>
							<option value="인스타그램" <c:if test="${vo.shop eq '인스타그램'}">selected</c:if>>인스타그램</option>
						</select>
						<input class="form-control" type="url" name="url" value="${vo.url }">
					</div>
				</div>
				</div>
				<div class="d-flex mt-5 justify-content-center">
					<a href="../member/product"><button type="button" class="btn me-2" style="width:250px; height:50px; color:white; background-color: #adb5bd; font-weight: bold;">취소</button></a>
					<button type="submit" class="btn upBtn" style="width:250px; color:white; background-color: #75c30b; font-weight: bold;">수정 등록 요청</button>
				</div>
			</form>
			</div>
		</div>
	</section>
		<c:import url="../template/footer.jsp"></c:import>
		<script src="/js/itemUpdate.js"></script>
		<script src="/js/itemFile.js"></script>
</body>
</html>
