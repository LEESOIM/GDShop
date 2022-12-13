<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>

    <table class="table table-striped accordion" id="missionTable">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">미션번호</th>
                <th scope="col">캠페인명</th>
                <th scope="col">캠페인유형</th>
                <th scope="col">포인트</th>
                <th scope="col">지원일</th>
                <th scope="col">마감일</th>
                <th scope="col">단계</th>
                <th scope="col">진행상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="mission">
                <tr data-bs-toggle="collapse" data-bs-target="#num${mission.missionNum}" onclick="setStatus(this)">
                    <c:if test="${mission.myCam==1}">
                        <th scope="row"><i class="bi bi-chevron-down"></i></th>
                    </c:if>
                    <c:if test="${mission.myCam==0 || mission.myCam==2 || mission.myCam==3 }">
                        <th scope="row"></th>
                    </c:if>
                    <td>${mission.missionNum}</td>
                    <td>${mission.itemVO.title}</td>
                    <td>${mission.itemVO.type}</td>
                    <td>${mission.itemVO.point}</td>
                    <td>${mission.applyDate}</td>
                    <td>${mission.finish}</td>
                    <td class="status">${mission.status}</td>
                    <c:if test="${mission.myCam==0}">
                        <td>지원</td>
                    </c:if>
                    <c:if test="${mission.myCam==1}">
                        <td>진행중</td>
                    </c:if>
                    <c:if test="${mission.myCam==2}">
                        <td>완료</td>
                    </c:if>
                    <c:if test="${mission.myCam==3}">
                        <td>취소</td>
                    </c:if>
                </tr>
                <c:if test="${mission.myCam==1}">

                    <tr class="accordion-collapse collapse" id="num${mission.missionNum}">
                        <div class="accordion-body">
                            <td colspan="8">
                                <div class="ant-steps" style="text-align: center; width: 100%;" >
                                    <div>
                                       <div class="mission_order">
                                          <i class="fa-regular fa-circle-check buy default" ></i> <span class="buyText">구매하기</span>
                                       </div>
                                       <div class="buyState">미진행</div>
                                    </div>
                                    <hr width="15%" color="rgba(0,0,0,.25);" size="2">
                                    <div>
                                       <div class="mission_order">
                                          <i class="fa-regular fa-circle-check review default"></i> <span class="reviewText">리뷰</span>
                                       </div>
                                       <div class="reviewState">미진행</div>
                                    </div>
                                    <hr width="15%" color="rgba(0,0,0,.25);" size="2">
                                    <div>
                                       <div class="mission_order">
                                          <i class="fa-regular fa-circle-check point default"></i> <span class="pointText">포인트 수령</span>
                                       </div>
                                       <div class="pointState">미완료</div>
                                    </div>
                                 </div>
    
                            </td>
                        </div>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
    
    <div id="missionPage">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item ${request} pre"  value="${pager.pre}" id="missionPre">
                <a class="page-link" aria-label="Previous">
                  <span aria-hidden="true"  data-dir="prev"  data-page="${pager.page}">previous</span>
                </a>
              </li>

              <c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
                <li class="page-item ${request} ${pager.page==i? 'active':''}">
                  <a class="page-link">${i}</a>
                </li>
              </c:forEach>
              
              <li class="page-item ${request} ${pager.next?'':'disabled'} next">
                <a class="page-link" aria-label="Next">
                  <span aria-hidden="true" data-dir="next"  data-page="${pager.page}">next</span>
                </a>
              </li>
            </ul>
          </nav>
    </div>


<script>
    preCheck();
    // pagination previous 체크
    function preCheck(){
        if($('#missionPre').attr("value")=='true'){
            $('#missionPre').removeClass('disabled')
        }else if($('#missionPre').attr("value")=='false'){
            $('#missionPre').addClass('disabled')
        }
    }
</script>

</body>