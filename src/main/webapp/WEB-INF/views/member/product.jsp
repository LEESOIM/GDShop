<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 75%">
      <div class="container">
        <div class="content d-flex">
          <c:import url="../template/mypage_side.jsp"></c:import>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내정보 상세보기 -->
            <div class="info_top p-2 mt-4 mb-3 d-flex">
              <div><span style="color: rgb(10, 154, 10)">${memberVO.name}</span>님의 상품목록</div>
              <button id="product" onclick="location.href='/item/add'" style="font-size: 18px"><b>상품등록</b></button>
            </div>
              <!-- 목록보기 -->
              <div class="row mb-5">
              <c:forEach items="${ar}" var="item">
                 <div class="d-flex product_box col-6 m-2">
                  <div><a href="/item/detail?itemNum=${item.items[0].itemNum }">
                  <img src="/file/item/${item.itemFileVOs[0].fileName}" style="width: 170px; height: 100%; border-radius: 5px"/></a></div>
                  <div class="ps-4" style="width:60%">
                  	<div class="pb-2 pt-1" style="font-size: 22px; color: green;"><b>
                  	<c:choose>
                  		<c:when test="${item.items[0].status eq 1}">승인완료</c:when>
                  		<c:when test="${item.items[0].status eq 2}"><div style="color: blue">수정요청</div></c:when>
                  		<c:when test="${item.items[0].status eq 3}"><div style="color: blue">삭제요청</div></c:when>
                  		<c:when test="${item.items[0].status eq 4}"><div style="color: red">수정반려</div></c:when>
                  		<c:when test="${item.items[0].status eq 5}"><div style="color: black">캠페인 종료</div></c:when>
                  		<c:otherwise><div style="color: blue">승인요청</div></c:otherwise>
                  	</c:choose>
                  	</b></div>
                  	<div class="pb-1" style="font-size: 18px;overflow-wrap: anywhere;"><b>
                  	<c:choose>
			           <c:when test="${fn:length(item.items[0].title) > 40}">
			            <c:out value="${fn:substring(item.items[0].title,0,29)}"/>....
			           </c:when>
			           <c:otherwise>
			            <c:out value="${item.items[0].title}"/>
			           </c:otherwise> 
			        </c:choose>
                  	</b></div>
                  	<div class="pb-1"><b>${item.items[0].type}</b> <span class="me-2" style="background-color: #90ee90; padding: 2px; font-size: 13px">${item.items[0].count}회차</span><span style="background-color: #87ceeb; padding: 2px; font-size: 13px;">${item.items[0].shop}</span></div>
                  	<div class="d-flex justify-content-between">
                  	<div class="d-flex">
                  		<div class="pe-1"><span style="font-size: 19px"><b><fmt:formatNumber value="${item.items[0].price}" pattern="###,###,###" /></b></span></div>
                  		<div style="line-height: 32px"><i class="fa-brands fa-product-hunt mx-1" style="color: blue"></i><fmt:formatNumber value="${item.items[0].point}" pattern="###,###,###" /></div>
                  	</div>
                  	<div>
                  		<c:if test="${item.items[0].status eq 1 or item.items[0].status eq 4}">
                  		<button class="upBtn product_request me-1 mt-2 me-1" data-itemNum-num="${item.items[0].itemNum}" type="button"><b>수정</b></button>
                  		<button class="delBtn product_request mt-2" data-itemNum-num="${item.items[0].itemNum}" type="button"><b>삭제</b></button>
                  		</c:if>
                  	</div>
                  	</div>
                  </div>
                </div>
               </c:forEach>
           	  </div>
            <!-- 여기까지!! -->
          </div>
        </div>
      </div>
    </section>
      <c:import url="../template/footer.jsp"></c:import>
      <script src="/js/item/product.js"></script>
  </body>
</html>