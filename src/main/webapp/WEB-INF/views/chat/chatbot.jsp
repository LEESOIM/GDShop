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
        .me{
            color:black;
            text-align: left;
            margin-right: 10px;
            font-size: 20px;
            margin-top: 10px;
            font-weight: bold;
            padding-top: 4px;
            padding-bottom: 4px;
        }
        p{
            margin-bottom: 0px;
        }
        .others{
            color: #000000;
            text-align: left;
            margin-left: 10px;
            font-size: 16px;
            padding-top: 4px;
            padding-bottom: 4px;
        }
        .chatMe{
            color:#000000;
            background-color: #ffea00;
            float: right;
            font-size: 16px;
            padding-top: 4px;
            padding-bottom: 4px;
            word-wrap: break-word;
            display: inline-flex;
            border-radius: 3px;
            padding: 3px;
            margin: 3px;
            clear: both;
        }
        .chatOthers{
            color:black;
            background-color: #6af07c;
            float: left;
            font-size: 16px;
            padding-top: 4px;
            padding-bottom: 4px;
            word-wrap: break-word;
            display: inline-flex;
            border-radius: 3px;
            padding: 3px;
            margin: 3px;
            clear: both;
        }
    </style>
</head>
<body>
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
                    </div>
                </form>
            </div>
        </div>
        <div class="pt-3 pb-4" style="background-color:white;">
            <div class="pb-3 d-flex" style="font-size: 25px; border-bottom-style: double; border-color: green"><img alt="" src="/images/mm.png" style="width: 60px; margin-left: 85px; margin-right: 10px"><div style="padding-top: 23px; color: green;"><b>구디샵 문의하기</b></div></div>
            <div class="col-md-12 mb-5">
                <table id="conversation" class="table">
                    <tbody id="communicate">
                        <tr>
                            <td><button id="connect" class="btn" type="submit"><span class="chat_list">상담목록📃</span></button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <form class="form-inline" id="sendForm">
                    <div class="form-group">
                        <label for="msg" style="font-weight: bold;" class="mb-3">문의사항</label>
                        <div class="d-flex" style="width: 400px;">
                            <input type="text" id="chatting" class="form-control"
                            style="width: 280px;" placeholder="내용을 입력하세요....">
                            <button class="btn btn-success ms-3"  onclick="send()" id="sendBtn">보내기</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>