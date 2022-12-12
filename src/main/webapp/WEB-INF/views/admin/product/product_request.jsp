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

    <!-- Custom fonts for this template-->
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/css/header.css" />
    <script defer src="/js/admin/product_request.js"></script>

</head>

<body id="page-top">
    <c:import url="../../template/library.jsp"></c:import>
    <c:import url="../../template/header.jsp"></c:import>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:import url="../sidebar.jsp"></c:import>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column" >

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">상품 요청</h1>
                    </div>

                    <!-- Content Row -->
                    <c:import url="../contentrow.jsp"></c:import>
                    <!-- Content Row -->

                    <div class="d-flex justify-content-center mt-4">
                      <div style="width: 98%; margin-bottom: 50px">
                        <span class="input-group">
                          <select name="kind" class="form-select" id="kind">
                              <option class="kinds" value="id">ID</option>
                              <option class="kinds" value="company">기업명</option>
                          </select>
                        <input type="text" name="search" value="${param.search}" class="form-control" id="search" onKeypress="javascript:if(event.keyCode==13) {search_onclick_subm()}" >
                        <button type="button" class="btn btn-primary" id="search_btn">검색</button>
                       </span>
                          <ul class="nav nav-tabs">
                              <li class="nav-item"><a class="nav-link active" id="add" data-kind="add"  onclick="getAdd(this)" href="#">상품 등록 요청</a></li>
                              <li class="nav-item"><a class="nav-link" id="update" data-kind="update" onclick="getUpdate(this)" href="#">상품 수정 요청</a></li>
                              <li class="nav-item"><a class="nav-link" id="delete" data-kind="delete" onclick="getDelete(this)" href="#">상품 삭제 요청</a></li>
                              <li class="nav-item"><a class="nav-link" id="reject" data-kind="reject" onclick="getReject(this)" href="#">상품 반려 목록</a></li>
                          </ul>
                          <div id="pdList">   
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

  
    
        
    
</body>

</html>