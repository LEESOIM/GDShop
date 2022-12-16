<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin - Dashboard</title>

<link rel="stylesheet" href="../css/index.css" />
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/login.css" />
<link rel="stylesheet" type="text/css" href="/css/chat.css" />
<script defer src="/js/chat/chat.js"></script>
<!-- Custom fonts for this template-->
<link href="/bootstrap/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- Custom styles for this template-->
<link href="/bootstrap/css/sb-admin-2.min.css" rel="stylesheet" />

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

				<!-- Topbar -->

				<c:import url="../template/library.jsp"></c:import>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<div class="row">

						<div id="container" class="container">
							<h1>${room.roomName}<i class="fa-regular fa-comment-dots ps-2"></i></h1>
							<input type="hidden" id="sessionId" value="">
							<input type="hidden" id="roomNumber" value="${room.roomNumber}">
							<input type="hidden" id="MName" value="${memberVO.name}">
							<div id="chating" class="chating" style="border: solid 2px green; border-radius: 10px;margin-bottom: 30px;">
							</div>
							<div id="yourName">
								<table class="inputTable">
									<tr>
										<th></th>
										<th><input type="hidden" name="userName" id="userName" placeholder="채팅방에 입장" value=""></th>
										<th><button onclick="chatName()" id="startBtn">채팅 입장</button></th>
									</tr>
								</table>
							</div>
							<div id="yourMsg">
								<table class="inputTable">
									<tr>
										<th>메시지</th>
										<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
										<th><button onclick="send()" id="sendBtn">보내기</button></th>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->
			
			<c:import url="../template/footer.jsp"></c:import>
		</div>
		<!-- End of Main Content -->
		
		<!-- Footer -->
		<!-- End of Footer -->
		
	</div>
	<!-- End of Content Wrapper -->



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