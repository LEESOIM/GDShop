<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div
  class="p-3"
  style="
    margin: 40px auto 10px auto;
    width: 75%;
    height: 315px;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
  "
>
  <div class="grade_top mt-3">
    <sec:authentication property="Principal.name"/>님은 <span>VIP등급</span>입니다.
  </div>
  <hr />
  <div>
    <div>
      <div style="font-size: 14px">
        이용기간 : <b>2020-05-22 ~ 2022-06-01</b>
      </div>
      <div class="pt-1" style="font-size: 14px">
        해지일 :
        <span style="color: red">2022-06-01 해지예정</span>
      </div>
    </div>
    <hr />
    <div class="pb-2" style="font-size: 16px">
      🎁 등급 혜택
    </div>
    <div class="pb-1" style="font-size: 14px">
      ✅ VIP회원은 등급제한 캠페인에 참여할 수 있어 남들보다
      더 많은 캠페인에 참여 가능!
    </div>
    <div style="font-size: 14px">
      ✅ 등급제한 캠페인은 실제 구매가가 0원
    </div>
  </div>
</div>