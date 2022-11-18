<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Board</title>
    
    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/login.css" />
    <link rel="stylesheet" href="../css/board.css" />

    <script defer src="/js/notice.js"></script>
  </head>
  <body>
    <section class="container" style="width: 75%">
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
      <c:import url="../template/library.jsp"></c:import>
      
      <div class="container">
        <div class="content d-flex">
          <div class="sidebar">
            <div style="height: 260px; width: 220px">
              <div class="list_top p-3 mt-4">고객센터</div>
              <ol class="list-group list-group-flush">
                <li class="list-group-item">
                  <i class="fa-solid fa-headphones ps-2 pe-3"></i>공지사항
                </li>
                <li class="list-group-item">
                  <i class="fa-solid fa-triangle-exclamation ps-2 pe-3"></i>신고하기
                </li>
                <li class="list-group-item">
                  <i class="fa-solid fa-circle-info ps-2 pe-3"></i>1대 1문의
                </li>
              </ol>
            </div>
          </div>

          <div style="width: 100%;">
            <div class="board_top p-3 mt-3 mb-3">Detail Page</div>

              <div id="title">
                <h1>${noticeVO.title}</h3>
                <h1>${noticeVO.id}</h3>
                <h1>${noticeVO.regDate}</h3>
              </div>
              <div id="files">
              	<c:forEach items="${noticeVO.fileVOs}" var="fileVOs">
               		<a href="/fileDown/notice?fileNum=${fileVOs.fileNum}">${fileVOs.oriName}</a> 
              	</c:forEach>
              
              </div>
              <div id="contents" style="height: 100%;">
                ${noticeVO.contents}
              </div>
          </div>
        </div>
      </div>
      <c:import url="../template/footer.jsp"></c:import>
    </section>

  </body>
</html>
