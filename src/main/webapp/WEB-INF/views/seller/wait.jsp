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

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Seller</h1>
                    </div>

                    <!-- Content Row -->
                    <c:import url="../admin/contentrow.jsp"></c:import>
                    <!-- Content Row -->
                 	<div style="margin-top: 3em; padding-bottom: 70px">

			<div class="d-flex justify-content-center mt-4">
				<div style="width: 100%; margin-bottom: 50px">
					<h4>입점신청 현황</h4>

                                <ul class="nav nav-tabs">
                                    <li class="nav-item"><a class="nav-link active" href="./wait">미승인</a></li>
                                    <li class="nav-item"><a class="nav-link" href="./accept">승인</a></li>
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
									<td class="wait"><a href="#">O</a></td>
									<td class="waitNo"><a href="#">X</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div id="page">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item" value="${pager.pre}" id="pre"><a
									class="page-link" href="./seller?wait=${pager.page-1}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>

								<c:forEach var="i" begin="${pager.startNum}"
									end="${pager.lastNum}">
									<li class="page-item ${pager.page==i? 'active':''}"><a
										class="page-link" href="./seller?wait=${i}">${i}</a></li>
								</c:forEach>

								<li class="page-item ${pager.next?'':'disabled'}" id="next">
									<a class="page-link" href="./seller?Wait=${pager.page+1}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a>
								</li>
							</ul>
						</nav>
					</div>
					<!-- End of Page -->
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
<script src="/js/seller/wait.js"></script>
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