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
      			
      			<form action="POST" method="">
      			<h1>판매자 입점 문의</h1>
	            <!-- 상품명 -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>상품명</label>
	                <input
	                  type="text"
	                  placeholder="상품명을 입력해주세요."
	                  class="join_form"
	                />
	              </div>
	              
	              <!-- 상품명 -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>상품내용</label>
	                <input
	                  type="text"
	                  placeholder="상품설명을 입력해주세요."
	                  class="join_form"
	                />
	              </div>
	              
	              <!-- 상품명 -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>상품금액</label>
	                <input
	                  type="text"
	                  placeholder="상품금액을 입력해주세요."
	                  class="join_form"
	                />
	              </div>
	              <button
	                class="btn btn-success"
	                type="button"
	                style="padding-top: 13px; padding-bottom: 13px; width: 20%"
	                onclick="location.href='/member/join_end'"
	              >
	                <b>등록</b>
	              </button>	              	              
            </form>
            <br>
            <h2><a href="/craw/craw">크롤링 테스트</a></h2>
            <h2><a href="/ocr/ocr">OCR 테스트</a></h2>
      		</div>
      		<c:import url="../template/footer.jsp"></c:import>
    	</section>
	</body>
</html>