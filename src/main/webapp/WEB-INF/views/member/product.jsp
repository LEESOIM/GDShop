<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MyPage</title>
    
    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel="stylesheet" href="/css/info.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <style>
      #my_product {
        background-color: rgba(216, 246, 181, 0.803);
        font-weight: 600;
        cursor: pointer;
        border-right: solid 3.5px green;
      }
    </style>
  </head>
  <body>
    <section class="container" style="width: 75%">
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
      <div class="container">
        <div class="content d-flex">
          <c:import url="../template/mypage_side.jsp"></c:import>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내정보 상세보기 -->
            <sec:authentication property="Principal" var="user"/>
            <div class="info_top p-2 mt-3 mb-3 d-flex">
              <div><span style="color: rgb(10, 154, 10)">${user.name}</span>님의 상품목록</div>
              <button id="product" data-bs-toggle="modal" data-bs-target="#exampleModal_withdraw" data-bs-whatever="@mdo" onclick="location.href='/item/add'" >상품등록</button>
            </div>
              <!-- 목록보기 -->
              <div class="row">
                <div class="d-flex product_box col-6 m-2">
                  <div><img src="/images/5c344a55e5613.jpg" style="width: 100%; height: 100%; border-radius: 5px"/></div>
                  <div class="ps-4">
                  	<div class="pb-1 pt-1" style="font-size: 22px; color: green;"><b>승인요청</b></div>
                  	<div class="pb-1" style="font-size: 18px;"><b>단백질 프리미엄 두부리또 130g X 3팩</b></div>
                  	<div class="pb-1"><b>즉석추첨형</b> <span class="me-2" style="background-color: #90ee90; padding: 2px; font-size: 13px">1회차</span><span style="background-color: #87ceeb; padding: 2px; font-size: 13px;">쿠팡</span></div>
                  	<div class="d-flex justify-content-between">
                  	<div><span style="font-size: 19px"><b>2000원</b></span></div>
                  	<div>
                  	<button class="product_request me-1" type="button"><b>수정</b></button>
                  	<button class="product_request" type="button"><b>삭제</b></button>
                  	</div>
                  	</div>
                  </div>
                </div>
               
           	  </div>
            <!-- 여기까지!! -->
          </div>
        </div>
      </div>
      <c:import url="../template/footer.jsp"></c:import>
    </section>

	<!-- 툴팁 활성화 -->
	 <script>
	  $(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	  });
	</script>
    <script src="/js/info.js"></script>
  </body>
</html>