<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>myCampaign</title>

<c:import url="../template/library.jsp"></c:import>

<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/list.css" />

</head>
<body>
	<c:import url="../template/top_part.jsp"></c:import>
	<c:import url="../template/header.jsp"></c:import>
	<section class="container" style="width: 65%">

		<div style="margin-top: 3em; padding-bottom: 70px">

			<h2>내 캠페인</h1>
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" href="#" id="apply">지원</a></li>
				<li class="nav-item"><a class="nav-link" href="#" id="choice">선정/미션중</a></li>
				<li class="nav-item"><a class="nav-link" href="#" id="complete">미션완료</a></li>
				<li class="nav-item"><a class="nav-link" href="#" id="cancel">취소</a></li>
			</ul>



		</div>



		<!-- 챗봇 -->
		<div>
			<div id="chat_ev" style="display: none">궁금한 부분 질문주세요!</div>
			<a class="btn" id="chat_bot"> <img id="chat_img"
				src="/images/16208041651620804165203.png" />
				<div class="pt-2">
					<b>구디 챗봇</b>
				</div> <span
				class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
				style="font-size: 13px;">+0 <span class="visually-hidden">unread
						messages</span></span></a>
		</div>
	</section>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/js/index.js"></script>
	<script src="/js/timer.js"></script>
	<script src="/js/myCampaign.js"></script>
</body>
</html>

