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
                    <th scope="row"><i class="bi bi-chevron-down"></i></th>
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
                <tr class="accordion-collapse collapse" id="num${mission.missionNum}">
                    <div class="accordion-body">
                        <td colspan="8">
                            <div class="ant-steps ant-steps-horizontal ant-steps-small ant-steps-label-horizontal">
                                <div class="ant-steps-item ant-steps-item-wait mission-step" style="padding: 0px;">
                                    <div class="ant-steps-item-container">
                                        <div class="ant-steps-item-tail"></div>
                                        <div class="ant-steps-item-icon buy"><span class="ant-steps-icon">1</span></div>
                                        <div class="ant-steps-item-content">
                                            <div class="ant-steps-item-title">구매 확인</div>
                                            <div class="ant-steps-item-description">미진행</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ant-steps-item ant-steps-item-wait mission-step" style="padding: 0px;">
                                    <div class="ant-steps-item-container">
                                        <div class="ant-steps-item-tail"></div>
                                        <div class="ant-steps-item-icon review"><span class="ant-steps-icon">2</span></div>
                                        <div class="ant-steps-item-content">
                                            <div class="ant-steps-item-title">포토 확인</div>
                                            <div class="ant-steps-item-description">미진행</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ant-steps-item ant-steps-item-wait mission-step" style="padding: 0px;">
                                    <div class="ant-steps-item-container">
                                        <div class="ant-steps-item-tail"></div>
                                        <div class="ant-steps-item-icon point"><span class="ant-steps-icon">3</span></div>
                                        <div class="ant-steps-item-content">
                                            <div class="ant-steps-item-title">포인트 수령</div>
                                            <div class="ant-steps-item-description">미완료</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </div>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div id="missionPage">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
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