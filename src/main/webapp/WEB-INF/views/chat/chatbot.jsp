<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/join.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="/js/chat/app.js"></script><script src="/js/chat/consl.js"></script>
    <script src="/js/chat/qeustion.js"></script>
    <style type="text/css">
   		.chat_list{
    		color: black;
    		font-size: 20px;
    		font-weight: bold;
    	}
    	.chat_list:hover{
    		color: grey;
    	}
    </style>
</head>
<body>
	  <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <noscript>
        <h2 style="color: #ff0000">Seems your browser doesn't support Javascript! Websocket relies on
            Javascript being
            enabled. Please enable
            Javascript and reload this page!</h2>
    </noscript>
    <input type="hidden" id="sessionId" value="">
    <input type="hidden" id="roomNumber" value="">
    <div id="main-content" class="container">
        <div class="row">
            <div class="col-md-6">
                <form class="form-inline">
                    <div class="form-group">
                        <!-- <label for="connect">웹소켓 연결:</label>
                                    <button id="connect" class="btn btn-default" type="submit">연결</button>
                                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">해제
                                    </button> -->
                    </div>
                </form>
            </div>
            <!-- <div class="col-md-6">
                            <form class="form-inline">
                                <div class="form-group">
                                    <label for="msg">문의사항</label>
                                    <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요....">
                                </div>
                                <button id="send" class="btn btn-default" type="submit">보내기</button>
                            </form>
                        </div> -->
        </div>
        <div class="row pt-3 pb-4 px-5" style="background-color:white; width:700px; margin:40px auto 0 auto; border-radius:20px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
            <div class="pb-3 d-flex" style="font-size: 32px;"><img alt="" src="/images/mm.png" style="width: 80px; margin-right: 15px; margin-left: 108px"><div style="padding-top: 23px; color: green;"><b>구디샵 문의하기</b></div></div>
            <div class="col-md-12 mb-5">
                <table id="conversation" class="table">
                    <tbody id="communicate">
                        <tr>
                            <td><button id="connect" class="btn btn-default" type="submit"><span class="chat_list">상담목록📃</span></button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
                <button type="button" class="btn btn-default con" id="chatConnect"><span class="chat_list">상담시작💻</span></button>
            <div class="col-md-6">
                <form class="form-inline" id="sendForm">
                    <div class="form-group">
                        <label for="msg">문의사항</label>
                        <input type="text" id="chatting" class="form-control" placeholder="내용을 입력하세요....">
                        <button onclick="send()" id="sendBtn">보내기</button>
                    </div>
                </form>
            </div>
        </div>
    <button class="btn btn-success" onclick="window.open('./room')">챗</button>
    </div>
    <c:import url="../template/footer.jsp"></c:import>
</body>

</html>