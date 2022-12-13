<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<div
  class="p-4"
  style="
    margin: 30px auto 10px auto;
    width: 90%;
    height: 315px;
    border-radius: 10px;
    box-shadow: rgba(0, 0, 0, 0.18) 0px 2px 4px;
  "
>
  <div class="grade_top mt-2">
  <sec:authentication property="Principal" var="user"/>
  <c:if test="${empty user.name}">
    ${user.id}</c:if>
    <c:if test="${not empty user.name}">
    ${user.name}</c:if>님은 <span>VIP등급</span>입니다.
  </div>
  <hr />
  <div>
    <div>
      <div style="font-size: 14px">
        이용기간 : <b><span class="start"></span> ~ <span class="end"></span></b>
      </div>
      <div class="pt-1" style="font-size: 14px">
        해지일 :
        <span style="color: red"><span class="end"></span> 해지예정</span>
      </div>
    </div>
    <hr />
    <div style="font-size: 16px; padding-bottom: 10px">
      🎁 등급 혜택
    </div>
    <div class="pb-1" style="font-size: 14px">
      ✨ VIP회원은 등급제한 캠페인에 참여할 수 있어 남들보다
      더 많은 캠페인에 참여 가능!
    </div>
    <div style="font-size: 14px">
      ✨ 등급제한 캠페인은 실제 구매가가 0원
    </div>
  </div>
</div>