<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="sidebar">
<div style="height: 260px; width: 250px">
  <div class="list_top p-3 mt-4 d-flex">
    <img
      src="/file/profile/${memberVO.memberFileVO.fileName}"
      style="
        width: 40px;
        height: 40px;
        border-radius: 25px;
        margin-top: 1.9px;
      "
    />
    <div class="ms-2">
      <div><span style="color: green"><sec:authentication property="Principal.name"/></span> 회원님,</div>
      <div>커피 한 잔과 구디샵!</div>
    </div>
  </div>
  <ol class="list-group list-group-flush">
    <form action="mypage" method="get">
      <a href="./mypage" style="text-decoration: none">
        <li class="list-group-item" id="myinfo">
          <i class="fa-regular fa-circle-user ps-2 pe-3"></i>내 정보
        </li>
      </a>
    </form>
    <form action="point" method="get">
      <a href="./point" style="text-decoration: none">
        <li class="list-group-item" id="mypoint">
          <i class="fa-brands fa-product-hunt ps-2 pe-3"></i>내
          포인트
        </li>
      </a>
    </form>
    <form action="grade" method="get">
      <a href="./grade" style="text-decoration: none">
          <li class="list-group-item" id="mygrade">
            <i class="fa-solid fa-trophy ps-2 pe-3"></i>내 등급
          </li>
        </a>
      </form>
      <form action="set" method="get">
      <a href="./set" style="text-decoration: none">
      <li class="list-group-item"  id="my_setUp">
        <i class="fa-solid fa-gears ps-2 pe-3"></i>내 설정
      </li>
      </a>
      </form>
      <li class="list-group-item">
        <i class="fa-solid fa-arrow-pointer ps-2 pe-3"></i>내 캠페인
      </li>
      <sec:authorize access="hasRole('SELLER')">
             <form action="product" method="get">
      			<a href="./product" style="text-decoration: none">
			      <li class="list-group-item" id="my_product">
			        <i class="fa-brands fa-shopify ps-2 pe-3"></i>내 상품
			      </li>
			    </a>
     		 </form>
      </sec:authorize>
    </ol>
  </div>
</div>