<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ItemAdd</title>

<c:import url="../template/library.jsp"></c:import>
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/detail.css" />
</head>
<body>
	<section class="container" style="width: 75%">
		<c:import url="../template/top_part.jsp"></c:import>
		<c:import url="../template/header.jsp"></c:import>
		<div class="row justify-content-center">
			<div class="row justify-content-center col-9">
			
			<form action="./add" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="seller">
				
				<div class="py-5">
				<div style="border-bottom: solid;">
					<div class="d-flex justify-content-between">
						<h4><b>상품정보</b></h4><div><b style="color: limegreen;">*필수항목</b>은 꼭 입력해주세요</div>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>상품명<span style="color: limegreen;">*</span></b>
					</div>
					<div style="width: 79%;">
						<input class="form-control" type="text" name="itemName">
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>상품가격<span style="color: limegreen;">*</span></b>
					</div>
					<div class="d-flex" style="width: 79%;">
						<input class="form-control" style="width: 35%;" type="text" name="price" id="price" placeholder="숫자만 입력"><p style="margin:auto 0;">&nbsp;원</p>
					</div>
				</div>
				</div>
				
				<div class="pt-4">
				<div style="border-bottom: solid;">
					<div class="d-flex justify-content-between">
						<h4><b>캠페인정보</b></h4><div><b style="color: limegreen;">*필수항목</b>은 꼭 입력해주세요</div>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>상품이미지<span style="color: limegreen;">*</span></b>
						<div style="font-size: 15px; color: gray;">(<span id="count">0</span>/3)</div>
					</div>
					<div style="width: 79%">
					<div class="d-flex" >
						<div class="d-flex" id="fileBox"></div>
						<label id="fileAdd" class="border border-success rounded-3" style="width: 130px; height: 130px; color: green; text-align: center;">
						<i class="fa-solid fa-camera" style="font-size: 30px; margin-top: 35px"></i><p style="font-size: 13px; text-align: center;">이미지등록</p></label>
					</div>	
						<p style="color: #1ec800; font-size:13px; margin-top:5px; margin-bottom: 0px;">첫번째 이미지가 대표이미지 입니다</p>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>캠페인제목<span style="color: limegreen;">*</span></b>
					</div>
					<div style="width: 79%;">
						<input class="form-control" type="text" name="title">
						<p style="color: #1ec800; font-size:13px; margin-bottom: 0px;">판매 상품과 직접 관련이 없는 다른 상품명, 스팸성 키워드 입력 시 상품 게시가 어려울 수 있습니다.</p>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>캠페인유형<span style="color: limegreen;">*</span></b>
					</div>
					<div style="width: 79%;">
						<div class="btn-group">
						  <input type="radio" class="btn-check" name="type" id="type1" value="추첨형">
						  <label class="btn btn-outline-success" for="type1">추첨형</label>
						
						  <input type="radio" class="btn-check" name="type" id="type2" value="즉석추첨형">
						  <label class="btn btn-outline-success" for="type2">즉석추첨형</label>
						  
						  <input type="radio" class="btn-check" name="type" id="type3" value="초간단미션">
						  <label class="btn btn-outline-success" for="type3">초간단미션</label>
						</div>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>고객부담금<span style="color: limegreen;">*</span></b>
					</div>
					<div style="width: 79%;">
						<div class="btn-group">
						  <input type="radio" class="btn-check" name="pointOnOff" id="point1">
						  <label class="btn btn-outline-success" for="point1">설정함</label>
						
						  <input type="radio" class="btn-check" name="pointOnOff" id="point2">
						  <label class="btn btn-outline-success" for="point2">설정안함</label>
						</div>
						
						<div id="pointOn" style="display: none;">
							<div class="mt-3">
								<div class="mb-3"><span class="me-4">판매금액</span><input type="text" id="point1_1" disabled="disabled"><span>&nbsp;원</span></div>
								<div class="mb-3"><span class="me-2">고객부담금</span><input type="text" id="point1_2"><span>&nbsp;원</span></div>
								<div><span class="me-4">환급금액</span><input type="hidden" id="point1_3" readonly="readonly">
								<span id="point1Text" style="font-size: 20px; font-weight: bold;"></span><span>&nbsp;원</span></div>
							</div>
						</div>
						
						<div id="pointOff" style="display: none;">
							<div class="mt-3">
								<div class="mb-3"><span class="me-4">판매금액</span><input type="text" id="point2_1" disabled="disabled"><span>&nbsp;원</span></div>
								<div class="mb-3"><span class="me-2">고객부담금</span><input type="text" id="point2_2" value="0" disabled="disabled"><span>&nbsp;원</span></div>
								<div><span class="me-4">환급금액</span><input type="hidden" id="point2_3" readonly="readonly">
								<span id="point2Text" style="font-size: 20px; font-weight: bold;"></span><span>&nbsp;원</span></div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b style="line-height: 50px">제공내역<span style="color: limegreen;">*</span></b>
					</div>
					<div style="width: 79%;">
						<textarea class="form-control" rows="3" cols="79%" name="itemDetail" placeholder="상품 옵션 내역을 상세히 써주세요"></textarea>
						<p style="color: #1ec800; font-size:13px; margin-bottom: 0px;">ex) OOO프로바이오틱스, 30캡슐, 1개 / OOO트리트먼트 화이트머스크향, 1000ml, 1개</p>
					</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>총 제공수량<span style="color: limegreen;">*</span></b>
					</div>
					<div style="width: 79%;">
						<input class="form-control" style="width: 35%;" type="text" name="stock">
					</div>
				</div>
				
				<div id="camCount">
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>총 캠페인회차<span style="color: limegreen;">*</span></b>
					</div>
					<div style="width: 79%;">
					<div class="d-flex">
						<input class="form-control" style="width: 35%;" type="text" name="count"><p style="margin:auto 0;">&nbsp;회</p></div>
						<p style="color: #1ec800; font-size:13px; margin-bottom: 0px;">캠페인당 추첨 수량 = 총 제공수량/총 캠페인 회차 ex) 10개=50개/5회</p>
					</div>
				</div>
				</div>
				
				<div class="d-flex py-4" style="border-bottom: solid 0.5px gainsboro;">
					<div style="margin:auto 0; width: 20%;">
						<b>구매링크<span style="color: limegreen;">*</span></b>
					</div>
					<div class="d-flex" style="width: 79%;">
						<select class="form-select me-3" style="width: 110px;" name="shop">
							<option hidden value="">쇼핑몰</option>
							<option value="쿠팡">쿠팡</option>
							<option value="인스타그램">인스타그램</option>
						</select>
						<input class="form-control" type="url" name="url">
					</div>
				</div>
				</div>
				
				<div class="d-flex my-5 justify-content-center">
					<a href=""><button type="button" class="btn me-2" style="width:250px; height:50px; color:white; background-color: #adb5bd; font-weight: bold;">취소</button></a>
					<button type="submit" class="btn" style="width:250px; color:white; background-color: #75c30b; font-weight: bold;">상품 등록 완료</button>
				</div>
			</form>
			</div>
		</div>
		<c:import url="../template/footer.jsp"></c:import>
	</section>
	<script src="/js/itemAdd.js"></script>
</body>
</html>