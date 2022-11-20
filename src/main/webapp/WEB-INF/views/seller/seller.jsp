<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	
		<meta charset="UTF-8" />
    	<meta http-equiv="X-UA-Compatible" content="IE=edge" />	
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Sell</title>
	 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/index.css" />
	</head>
	
	<body>
		<section class="container" style="width: 75%">
		    <c:import url="../template/top_part.jsp"></c:import>
      		<c:import url="../template/header.jsp"></c:import>
      		<div style="margin-top: 3em; padding-bottom: 70px">
      			
      			<div class="d-flex justify-content-center mt-4">
				<div style="width: 60%; margin-bottom: 50px">
      			
      			<form action="POST" method="">
      			<h1>판매자 입점 신청</h1>
	            <!-- 기업명 -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>기업명</label>
	                <input type="text" placeholder="기업명을 입력해주세요." class="join_form" />
	              </div>
	              
	            <!-- 상품 카테고리 -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>상품 카테고리</label>
	                <input type="text" placeholder="상품 카테고리를 선택해주세요." class="join_form" />
	              </div>
	              
	            <!-- 카드사 -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>카드사</label>
	                <input type="text" placeholder="카드사를 선택해주세요." class="join_form" />
	              </div>
	              
	            <!-- 카드번호 -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>카드번호</label>
	                <input type="text" placeholder="카드번호를 입력해주세요." class="join_form" />
	              </div>
	              
	              <button
	                class="btn btn-success" type="button" style="padding-top: 13px; padding-bottom: 13px; width: 20%">
	                <b>입점 신청</b>
	              </button>	              	              
            </form><br>
            </div>
            </div>
            
            
      		</div>
      		<c:import url="../template/footer.jsp"></c:import>
    	</section>
	</body>
</html>