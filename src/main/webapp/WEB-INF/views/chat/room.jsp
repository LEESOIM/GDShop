<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Room</title>
</head>
<c:import url="../template/library.jsp"></c:import>
   <link rel="stylesheet" href="/css/join.css" />
   <link rel="stylesheet" href="/css/index.css" />
   <link rel="stylesheet" href="/css/header.css" />
   <link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" type="text/css" href="/css/room.css" />
<script src="/js/chat/room.js"></script>
<body>
	<div class="container">
	<h1><i class="fa-solid fa-robot"></i></h1>
		<h2>채팅방</h2>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<div>
			<table class="inputTable">
				<tr>
					<th style="padding-right: 5px;">방 제목</th>
					<th style="padding-right: 0px;"><input type="text" name="roomName" id="roomName"></th>
					<th><button id="createRoom">개설하기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>