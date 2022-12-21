<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin - Dashboard</title>

    <link rel="stylesheet" href="../css/admin/member.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <script defer src="/js/admin/member.js"></script>

    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet"/>

</head>

<body id="page-top">
    <c:import url="../template/library.jsp"></c:import>
    <c:import url="../template/header.jsp"></c:import>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:import url="./sidebar.jsp"></c:import>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->

                    <!-- Content Row -->
                    
                    <div id="option" style="margin-top: 50px;">
                        <div class="row row-cols-lg-auto g-3 align-items-center" id="form">
                            <div class="btn-group">
                                <input class="btn-check" type="radio" id="radio_all" name="roleName" value="" checked>
                                <label class="btn btn-outline-dark radioLibel" for="radio_all">전체</label>

                                <input class="btn-check" type="radio" id="radio_admin" name="roleName" value="ROLE_ADMIN">
                                <label class="btn btn-outline-dark" for="radio_admin">관리자</label>

                                <input class="btn-check" type="radio" id="radio_seller" name="roleName" value="ROLE_SELLER">
                                <label class="btn btn-outline-dark" for="radio_seller">판매자</label>

                                <input class="btn-check" type="radio" id="radio_vip" name="roleName" value="ROLE_VIP">
                                <label class="btn btn-outline-dark" for="radio_vip">VIP</label>

                                <input class="btn-check" type="radio" id="radio_member" name="roleName" value="ROLE_MEMBER">
                                <label class="btn btn-outline-dark" for="radio_member">멤버</label>
                            </div>
                            
                            <div class="col-12" style="padding-bottom: 11px">
                                <div class="input-group">
                                    <select name="kind" class="form-select" id="kind">
                                        <option class="kinds" value="id">ID</option>
                                        <option class="kinds" value="name">이름</option>
                                        <option class="kinds" value="email">Email</option>
                                    </select>
                                  <input type="text" name="search" value="${param.search}" class="form-control" id="search" onKeypress="javascript:if(event.keyCode==13) {search_onclick_subm()}" >
                                  <button type="button" class="btn btn-dark" id="search_btn">검색</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" id="member_list" style=" width: 98%; height: 95%; text-align: center;">
                        <%-- <table class="table table-hover" id="table">
                            <tr>
                                <th>ID</th>
                                <th>이름</th>
                                <th>Email</th>
                                <th>포인트</th>
                                <th>등급</th>
                                <th>미션</th> 
                            </tr>
                            <c:forEach items="${list}" var="memberVO">
                            	<tr onclick=""  data-bs-toggle="modal" data-bs-target="#memberInfoModal">
                            		<td>${memberVO.id}</td>
                            		<td>${memberVO.name}</td>
                            		<td>${memberVO.email}</td>
                            		<td>${memberVO.point}</td>
                                    <td>
                                        <c:forEach items="${memberVO.roleVOs}" var="roleVO">
                                            ${fn:split(roleVO.roleName,'_')[1] }
                                        </c:forEach>  
                                    </td>
                                    <td><button data-bs-toggle="modal" data-bs-target="#missionModal">미션</button></td>
                            	</tr>
                            </c:forEach>
                        </table> --%>
                        
                        <div id="page">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination  justify-content-center">
                                    <li class="page-item"  value="${pager.pre}" id="pre">
                                        <a class="page-link"  aria-label="Previous">
                                            <span aria-hidden="true" data-dir="prev"  data-page="${pager.page}">previous</span>
                                        </a>
                                    </li>
              
                                    <c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
                                        <li class="page-item ${pager.page==i? 'active':''}">
                                            <a class="page-link">${i}</a>
                                        </li>
                                    </c:forEach>
                                
                                    <li class="page-item ${pager.next?'':'disabled'}" id="next">
                                        <a class="page-link" aria-label="Next">
                                            <span aria-hidden="true" data-dir="next"  data-page="${pager.page}">next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Member Info Modal-->
    <div class="modal fade" id="memberInfoModal" tabindex="-1" aria-labelledby="memberInfoModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <strong class="modal-title fs-5" id="memberInfoModalLabel" style="  font-size: 25px; font-weight: bold; color: rgb(52, 88, 52);">New message</strong>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="update" method="post" onsubmit="return confirm('수정하시겠습니까?')">
                <div class="mb-3">
                  <label for="member-id" class="col-form-label"> <strong style=" font-size: 20px; font-weight: bold; color: rgb(52, 88, 52);">ID :</strong> </label>
                  <input type="text" class="form-control" id="transfer-id" name="id" hidden>
                  <input type="text" class="form-control" id="member-id" disabled>
                </div>
                <div class="mb-3">
                    <label for="member-roleName" class="col-form-label"><strong style=" font-size: 20px; font-weight: bold; color: rgb(52, 88, 52);">등급:</strong></label>
                    <div id="roleNameDiv"></div>
                    
                </div>
                <div class="mb-3">
                  <label for="member-name" class="col-form-label"><strong style=" font-size: 20px; font-weight: bold; color: rgb(52, 88, 52);">이름:</strong> </label>
                  <input class="form-control" id="member-name" disabled></input>
                </div>
                <div class="mb-3">
                    <label for="member-phone" class="col-form-label"><strong style=" font-size: 20px; font-weight: bold; color: rgb(52, 88, 52);">전화번호:</strong></label>
                    <input class="form-control" id="member-phone" disabled></input>
                </div>
                <div class="mb-3">
                    <label for="member-email" class="col-form-label"><strong style=" font-size: 20px; font-weight: bold; color: rgb(52, 88, 52);">Email</strong>:</label>
                    <input class="form-control" id="member-email" disabled></input>
                </div>
                <div class="mb-3">
                    <label for="member-point" class="col-form-label"><strong style=" font-size: 20px; font-weight: bold; color: rgb(52, 88, 52);">포인트:</strong></label>
                    <input class="form-control" id="member-point" name="point"></input>
                </div>
                <div class="mb-3">
                    <label for="member-regDate" class="col-form-label"><strong style=" font-size: 20px; font-weight: bold; color: rgb(52, 88, 52);">가입일:</strong></label>
                    <input class="form-control" id="member-regDate" disabled></input>
                </div>
                
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-success">수정</button>
                </div>
              </div>
              </form>
            </div>
        </div>
      </div>

      <!-- Member Mission Modal-->
    <div class="modal fade" id="missionModal" tabindex="-1" aria-labelledby="missionModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
              <strong class="modal-title fs-5" id="missionModalLabel">Mission</strong>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div style=" text-align: center;">
                    <div style="width: 90%; margin-bottom: 50px; display: inline-block;">
                        <!-- <span class="input-group">
                            <input type="text" name="search" value="${param.search}" placeholder="캠페인명 입력" class="form-control" id="missionSearch" onKeypress="javascript:if(event.keyCode==13) {search_onclick_subm()}" >
                            <button type="button" class="btn btn-primary" id="missionSearch_btn">검색</button>
                        </span> -->
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" id="ongoing" data-kind="1"  onclick="onGoing(this)" href="#">진행중</a></li>
                            <li class="nav-item"><a class="nav-link" id="completed" data-kind="2" onclick="completed(this)" href="#">완료</a></li>
                            <li class="nav-item"><a class="nav-link" id="cancel" data-kind="3" onclick="cancel(this)" href="#">취소</a></li>
                            <li class="nav-item"><a class="nav-link" id="total" data-kind="total" onclick="totalHistory(this)" href="#">지원 내역</a></li>
                        </ul>
                        <input type="text" hidden id="totalmission">
                        <div id="missionList"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Member Role Modal-->
    <div class="modal fade" id="roleModal" tabindex="-1" aria-labelledby="roleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="roleModalLabel">회원 등급</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form>
                <div class="mb-3 mt-3" id="roleDiv">
                  <div class="memberRole" id="admin" data-rolenum="1" style="font-size: 25px">Admin</div>
                  <div class="memberRole" id="seller" data-rolenum="2" style="font-size: 25px">Seller</div>
                  <div class="memberRole" id="vip" data-rolenum="3" style="font-size: 25px">VIP</div>
                  <div  id="member" data-rolenum="4" style="font-size: 25px">Member</div>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
            </div>
          </div>
        </div>
      </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/bootstrap/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="/bootstrap/js/demo/chart-pie-demo.js"></script>

    <script>
        preCheck();
        // pagination previous 체크
        function preCheck(){
            if($('#pre').attr("value")=='true'){
                $('#pre').removeClass('disabled')
            }else if($('#pre').attr("value")=='false'){
                $('#pre').addClass('disabled')
            }
        }
    </script>

    
        
    
</body>

</html>