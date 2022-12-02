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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Member</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Earnings (Monthly)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Earnings (Annual)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Pending Requests</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Content Row -->
                    
                    <div id="option">
                        <div class="row row-cols-lg-auto g-3 align-items-center" id="form">
                            <div>
                                <label><input type="radio" name="roleName" value="" checked>전체</label>
                                <label><input type="radio" name="roleName" value="ROLE_ADMIN">관리자</label>
                                <label><input type="radio" name="roleName" value="ROLE_SELLER">판매자</label>
                                <label><input type="radio" name="roleName" value="ROLE_VIP">VIP</label>
                                <label><input type="radio" name="roleName" value="ROLE_MEMBER">멤버</label>
                            </div>
                            
                            <div class="col-12">
                                <div class="input-group">
                                    <select name="kind" class="form-select" id="kind">
                                        <option class="kinds" value="id">ID</option>
                                        <option class="kinds" value="name">이름</option>
                                        <option class="kinds" value="email">Email</option>
                                    </select>
                                  <input type="text" name="search" value="${param.search}" class="form-control" id="search" onKeypress="javascript:if(event.keyCode==13) {search_onclick_subm()}" >
                                  <button type="button" class="btn btn-primary" id="search_btn">검색</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" id="member_list">
                        <table class="table table-hover" id="table">
                            <tr>
                                <th>ID</th>
                                <th>이름</th>
                                <th>Email</th>
                                <th>포인트</th>
                                <th>등급</th>
                                <th>미션</th> 
                                <th>가입승인</th>
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
                            		<td>${memberVO.status}</td>
                            	</tr>
                            </c:forEach>
                        </table>
                        
                        <div id="page">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
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
              <h1 class="modal-title fs-5" id="memberInfoModalLabel">New message</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="update" method="post" onsubmit="return confirm('수정하시겠습니까?')">
                <div class="mb-3">
                  <label for="member-id" class="col-form-label">ID:</label>
                  <input type="text" class="form-control" id="transfer-id" name="id" hidden>
                  <input type="text" class="form-control" id="member-id" disabled>
                </div>
                <div class="mb-3">
                    <label for="member-roleName" class="col-form-label">등급:</label>
                    <div id="roleNameDiv"></div>
                    
                </div>
                <div class="mb-3">
                  <label for="member-name" class="col-form-label">이름:</label>
                  <input class="form-control" id="member-name" disabled></input>
                </div>
                <div class="mb-3">
                    <label for="member-phone" class="col-form-label">전화번호:</label>
                    <input class="form-control" id="member-phone" disabled></input>
                </div>
                <div class="mb-3">
                    <label for="member-email" class="col-form-label">Email:</label>
                    <input class="form-control" id="member-email" disabled></input>
                </div>
                <div class="mb-3">
                    <label for="member-point" class="col-form-label">포인트:</label>
                    <input class="form-control" id="member-point" name="point"></input>
                </div>
                <div class="mb-3">
                    <label for="member-regDate" class="col-form-label">가입일:</label>
                    <input class="form-control" id="member-regDate" disabled></input>
                </div>
                
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary">수정</button>
                </div>
              </div>
              </form>
            </div>
        </div>
      </div>

      <!-- Member Mission Modal-->
    <div class="modal fade" id="missionModal" tabindex="-1" aria-labelledby="missionModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="missionModalLabel">Mission</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form>
                <div class="mb-3">
                  <label for="member-id" class="col-form-label">진행중인 미션:</label>
                  <input type="text" class="form-control" id="member-id">
                </div>
                <div class="mb-3">
                    <label for="member-roleName" class="col-form-label">완료 미션:</label>
                    <input class="form-control" id="member-roleName"></input>
                </div>
              
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Send message</button>
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
                  <label for="member-id" class="col-form-label">현재 등급:</label>
                <div class="mb-3" id="roleDiv">
                  <div class="memberRole" id="admin" data-rolenum="1">Admin</div>
                  <div class="memberRole" id="seller" data-rolenum="2">Seller</div>
                  <div class="memberRole" id="vip" data-rolenum="3">VIP</div>
                  <div  id="member" data-rolenum="4">Member</div>
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