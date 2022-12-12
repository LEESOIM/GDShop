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
    <title>Home</title>

    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/login.css" />
    <link rel="stylesheet" href="../css/board.css" />
    <script defer src="/js/notice/notice.js"></script>
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
                <li class="list-group-item">
                  <i class="fa-solid fa-headphones ps-2 pe-3"></i>공지사항
                </li>
                <li class="list-group-item">
                  <i class="fa-solid fa-circle-question ps-2 pe-3"></i
                  >자주묻는질문
                </li>
                <li class="list-group-item">
                  <i class="fa-solid fa-circle-info ps-2 pe-3"></i>1대 1문의
                </li>
              </ol>
            </div>
          </div>
          <div style="width: 100%;">
            <div class="board_top p-3 mt-3 mb-3">공지사항</div>

            <div style="width: 100%;">
              <div class="board_list ">
                <table class="table table-hover" id="list">
                  <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>조회수</th>
                  </tr>
                  <c:forEach items="${list}" var="noticeVO">
                    <tr>
                      <td>${noticeVO.noticeNum}</td>
                      <td><a href="./detail?noticeNum=${noticeVO.noticeNum}">${noticeVO.title}</a></td>
                      <td>${noticeVO.id}</td>
                      <td>${noticeVO.regDate}</td>
                      <td>${noticeVO.hit}</td>							
                    </tr>	            	
                  </c:forEach>
                </table>
              </div>

              <div style="display: flex; justify-content: space-evenly">
          
                <div>
                  <nav aria-label="Page navigation example">
                    <ul class="pagination ">
                      <li class="page-item"  value="${pager.pre}" id="pre">
                        <a class="page-link" href="./notice?page=${pager.page-1}" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
    
                      <c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
                        <li class="page-item ${pager.page==i? 'active':''}">
                          <a class="page-link" href="./notice?page=${i}">${i}</a>
                        </li>
                      </c:forEach>
                      
                      <li class="page-item ${pager.next?'':'disabled'}" id="next">
                        <a class="page-link" href="./notice?page=${pager.page+1}" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>

                <sec:authorize access="hasRole('ADMIN')">
                    <button class="btn btn-success" onclick="location.href='./write'" style="height: 35px;">글작성</button>
                </sec:authorize>
              </div>

            </div>

          </div>
        </div>
      </div>
    </section>
    <c:import url="../template/footer.jsp"></c:import>

  </body>
</html>
