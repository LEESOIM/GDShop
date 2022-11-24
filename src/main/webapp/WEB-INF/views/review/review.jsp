<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	
		<meta charset="UTF-8" />
    	<meta http-equiv="X-UA-Compatible" content="IE=edge" />	
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Review</title>
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
      		
      			<form action="getReview" method="POST">
      			<h1>쿠팡 크롤링</h1>
	              <!-- url -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>url</label>
	                <input type="text" name="url" placeholder="url을 입력해주세요." class="join_form"/>
	              </div>
	              
	              <!-- 닉네임 -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>쿠팡 닉네임</label>
	                <input type="text" name="nickName" placeholder="쿠팡 닉네임을 입력해주세요." class="join_form"/>
	              </div>
	              
	              <button class="btn btn-success" type="submit">
	                <b>검색</b>
	              </button>	              	              
	            </form>
	            <!-- 쿠팡 끝 -->
	            
	            <!-- 네이버 시작 -->
      			<form action="getReviewNaver" method="POST">
      			<h1>네이버 크롤링</h1>
	              <!-- url -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>url</label>
	                <input type="text" name="url" placeholder="url을 입력해주세요." class="join_form"/>
	              </div>
	              
	              <!-- 닉네임 -->
	              <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>네이버 닉네임</label>
	                <input type="text" name="nickName" placeholder="네이버 닉네임을 입력해주세요." class="join_form"/>
	              </div>
	              
	              <button class="btn btn-success" type="submit">
	                <b>검색</b>
	              </button>	              	              
	            </form>
	            
<!-- 	            <form action="instaCraw" method="POST">
	            <h1>인스타 크롤링</h1>
	            
	            <div class="mt-4">
	                <label class="mt-2 mb-2" style="font-weight: bold">
	                <span style="color: red">＊</span>인스타 닉네임</label>
	                <input type="text" name="id" placeholder="인스타 닉네임을 입력해주세요." class="join_form"/>
				</div>
					<button class="btn btn-success" type="submit">
	                	<b>테스트</b>
					</button>	      
	            </form> -->
      		</div>
    	</section>
	</body>
</html>