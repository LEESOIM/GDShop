<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	<style>
      #notice_tab {
        background-color: rgba(216, 246, 181, 0.803);
        font-weight: 600;
        cursor: pointer;
        border-right: solid 3.5px green;
      }
    </style>

  </head>
  <body>
    <c:import url="../template/top_part.jsp"></c:import>
    <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 75%">
      <c:import url="../template/library.jsp"></c:import>
      
      <div class="container">
        <div class="content d-flex">
          <div class="sidebar">
            <div style="height: 260px; width: 220px">
              <div class="list_top p-3 mt-4">고객센터</div>
              <ol class="list-group list-group-flush">
                <li class="list-group-item" id="notice_tab" onclick="location.href='/board/notice'">
                  <i class="fa-solid fa-headphones ps-2 pe-3"></i>공지사항
                </li>
                <li class="list-group-item" onclick="new_window();">
                  <i class="fa-solid fa-circle-info ps-2 pe-3"></i>1대 1문의
                </li>
              </ol>
            </div>
          </div>

          <div style="width: 100%;">
            <div class="board_top p-3 mt-3 mb-3">공지사항</div>

              <!-- <div id="title">
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
              </div> -->

              <table class="table " >
                <colgroup>
                  <col width="15%"/>
                  <col width="35%"/>
                  <col width="15%"/>
                  <col width="35%"/>
                </colgroup>
                <tbody>
                  <tr>
                    <th scope="row" style="background-color: #f1f3f5;">글 번호</th>
                    <td>
                      ${noticeVO.noticeNum }
                    </td>
                    <th scope="row" style="background-color: #f1f3f5;">조회수</th>
                    <td>${noticeVO.hit}</td>
                  </tr>
                  <tr>
                    <th scope="row" style="background-color: #f1f3f5;">작성자</th>
                    <td>${noticeVO.id}</td>
                    <th scope="row" style="background-color: #f1f3f5;">작성일</th>
                    <td>${noticeVO.regDate}</td>
                  </tr>
                  <tr>
                    <th scope="row" style="background-color: #f1f3f5;">제목</th>
                    <td colspan="3">
                      ${noticeVO.title}
                    </td>
                  </tr>
                  <tr>
                    <td colspan="4" class="view_text">
                      ${noticeVO.contents}
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" style="background-color: #f1f3f5;">첨부파일</th>
                    <td colspan="3">
                      <div id="files" style="border: none;">
                        <c:forEach items="${noticeVO.fileVOs}" var="fileVOs">
                           <a href="/fileDown/notice?fileNum=${fileVOs.fileNum}">${fileVOs.oriName}</a> 
                        </c:forEach>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <a href="javascript:history.back();" class="btn btn-success" id="list">목록으로</a>
              <sec:authorize access="hasRole('ADMIN')">
                <a href="./update?noticeNum=${noticeVO.noticeNum}" class="btn btn-success" id="update">수정</a>
                <a href="./delete?noticeNum=${noticeVO.noticeNum}" class="btn btn-success" id="delete"  onclick="return confirm('삭제하시겠습니까?');")>삭제</a>
              </sec:authorize>

        </div>
      </div>
      <c:import url="../template/footer.jsp"></c:import>
    </section>
<script>
      function new_window() {
        window.open(
          "/chat/chatbot",
          "Child",
          "width=450, height=550, top=100, left=1000"
        );
      }
    </script>
  </body>
</html>
