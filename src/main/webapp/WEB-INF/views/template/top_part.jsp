<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<div class="d-flex justify-content-end mt-3">
  <div id="top-menu">
  <a href="/admin/index">관리자</a>
  <c:if test="${empty member}">
    <a
      href="#"
      data-bs-toggle="modal"
      data-bs-target="#exampleModal"
      data-bs-whatever="@mdo"
      >로그인</a
    ><span style="padding: 0px 9px 0px 14px">|</span>
    <a href="/member/agree">회원가입</a
    ><span style="padding: 0px 9px 0px 14px">|</span>
    </c:if>
    <c:if test="${not empty member}">
    <a href="/member/logout">로그아웃</a><span style="padding: 0px 9px 0px 14px">|</span>
    </c:if>
    <a href="/membership/membership">멤버십</a><span style="padding: 0px 9px 0px 14px">|</span>
    <div class="top-dropdown">
      <a href="#" type="button">고객센터</a>
      <div class="dropdown-content">
        <a href="/board/board">공지사항</a>
        <a href="#">1대 1문의</a>
      </div>
    </div>
  </div>
</div>