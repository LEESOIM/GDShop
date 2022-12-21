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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/sellerList.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

</head>

<body id="page-top">
    <c:import url="../template/library.jsp"></c:import>
    <c:import url="../template/header.jsp"></c:import>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:import url="../admin/sidebar.jsp"></c:import>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                
                 	<div style="margin-top: 3em; padding-bottom: 70px">

			<div class="d-flex justify-content-center mt-4">
				<div style="width: 90%; margin-bottom: 50px">
					<h4>입점신청 현황</h4>

					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link" href="./wait">미승인</a></li>
						<li class="nav-item"><a class="nav-link active" href="./accept">승인</a></li>
						<li class="nav-item"><a class="nav-link" href="./pay">결제완료</a></li>

					</ul>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">아이디</th>
								<th scope="col">이름</th>
								<th scope="col">이메일</th>
								<th scope="col">전화번호</th>
								<th scope="col">기업명</th>
								<th scope="col">상태</th>
								<th scope="col"></th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.vo}" var="dto">
								<c:set var="i" value="${i+1}" />
								<tr>
									<th scope="row">${i}</th>
									<td>${dto.id}</td>
									<td>${dto.name}</td>
									<td>${dto.email}</td>
									<td>${dto.phone}</td>
									<td>${dto.company}</td>
									<td>${dto.status}</td>
									<td class="accept"><a href="#"></a></td>
									<td class="acceptNo"><button href="#" class="btn btn-dark btn-sm">거절</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
                        <div id="page">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                  <li class="page-item"  value="${pager.pre}" id="pre">
                                    <a class="page-link" href="./seller?page=${pager.page-1}" aria-label="Previous">
                                      <span aria-hidden="true">&laquo;</span>
                                    </a>
                                  </li>
                
                                  <c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
                                    <li class="page-item ${pager.page==i? 'active':''}">
                                      <a class="page-link" href="./accept?page=${i}">${i}</a>
                                    </li>
                                  </c:forEach>
                                  
                                  <li class="page-item ${pager.next?'':'disabled'}" id="next">
                                    <a class="page-link" href="./seller?page=${pager.page+1}" aria-label="Next">
                                      <span aria-hidden="true">&raquo;</span>
                                    </a>
                                  </li>
                                </ul>
                              </nav>
                        </div>

				</div>
			</div>

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
                  <input type="text" class="form-control" id="member-id" disabled>
                </div>
                <div class="mb-3">
                    <label for="member-roleName" class="col-form-label">등급:</label>
                    <select name="roleName" class="form-select" id="member-roleName">
                        <option class="roleName" value="1">Admin</option>
                        <option class="roleName" value="2">Seller</option>
                        <option class="roleName" value="3">Vip</option>
                        <option class="roleName" value="4">Member</option>
                    </select>
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
<script src="/js/seller/accept.js"></script>
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