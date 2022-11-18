<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<input type="hidden" name="id" value="user">
				<div class="mt-5" style="border-bottom: solid;">
					<div class="d-flex justify-content-between">
						<h4>
							<b>상품등록</b>
						</h4>
						<div>
							<b style="color: limegreen;">*필수항목</b>은 꼭 입력해주세요
						</div>
					</div>
				</div>

				<div class="py-5" style="border-bottom: solid 0.5px gainsboro;">
					<div style="display: inline-block; width: 20%;">
						<b>상품이미지<span style="color: limegreen;">*</span></b>
					</div>
					<div style="display: inline-block; width: 79%;"></div>
				</div>

				<div class="py-5" style="border-bottom: solid 0.5px gainsboro;">
					<div style="display: inline-block; width: 20%;">
						<b>상품URL<span style="color: limegreen;">*</span></b>
					</div>
					<div style="display: inline-block; width: 79%;">
						<input class="form-control" type="url" name="url">
					</div>
				</div>

				<div class="py-5" style="border-bottom: solid 0.5px gainsboro;">
					<div style="display: inline-block; width: 20%;">
						<b>상품제목<span style="color: limegreen;">*</span></b>
					</div>
					<div style="display: inline-block; width: 79%;">
						<input class="form-control" type="text" name="title">
					</div>
				</div>

				<div class="d-flex py-5"
					style="border-bottom: solid 0.5px gainsboro;">
					<div style="padding: 50px 0; width: 20%;">
						<b style="line-height: 50px">상품설명</b>
					</div>
					<div style="width: 79%;">
						<textarea class="form-control" rows="6" cols="79%" name="content"></textarea>
					</div>
				</div>

				<div class="py-5" style="border-bottom: solid 0.5px gainsboro;">
					<div style="display: inline-block; width: 20%;">
						<b>가격<span style="color: limegreen;">*</span></b>
					</div>
					<div style="display: inline-block; width: 79%;">
						<input class="form-control" type="text" name="price">
					</div>
				</div>

				<div class="py-5" style="border-bottom: solid 0.5px gainsboro;">
					<div style="display: inline-block; width: 20%;">
						<b>재고<span style="color: limegreen;">*</span></b>
					</div>
					<div style="display: inline-block; width: 79%;">
						<input class="form-control" type="text" name="stock">
					</div>
				</div>

				<div class="py-5" style="border-bottom: solid gainsboro;">
					<div style="display: inline-block; width: 20%;">
						<b>캠페인 회차<span style="color: limegreen;">*</span></b>
					</div>
					<div style="display: inline-block; width: 79%;">
						<input class="form-control" type="text" name="count">
					</div>
				</div>
			</div>
		</div>
		<c:import url="../template/footer.jsp"></c:import>
	</section>
</body>
</html>
