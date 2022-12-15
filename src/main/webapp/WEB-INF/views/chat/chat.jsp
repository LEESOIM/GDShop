<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<c:import url="../template/library.jsp"></c:import>
<link rel="stylesheet" href="/css/join.css" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" type="text/css" href="/css/chat.css" />
</head>

<body>
	<div id="container" class="container">
		<h1>${room.roomName}<i class="fa-regular fa-comment-dots ps-2"></i></h1>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="roomNumber" value="${room.roomNumber}">
		
		<div id="chating" class="chating"></div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th></th>
					<th><input type="hidden" name="userName" id="userName" placeholder="채팅방에 입장" value=""></th>
					<th><button onclick="chatName()" id="startBtn">채팅 입장</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
<script defer src="/js/chat/chat.js"></script>
</html>