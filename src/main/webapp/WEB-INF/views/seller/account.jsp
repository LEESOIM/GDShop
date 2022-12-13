<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
     <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script defer src="/js/account.js"></script>
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
          <div style="width: 100%; text-align: center; margin-top: 60px">
          <img alt="" src="/images/tt.png" style="width: 180px; position:relative; top: 55px">
          <div>
           <button id="seller_joinBtn" style="font-size:30px; font-family:monospace; width: 300px; height: 100px; border:none; border-radius:15px; background-color: transparent; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;"><b>판매자 결제</b></button>
		  </div>
          </div>
        </div>
      </div>
    </section>
    <c:import url="../template/footer.jsp"></c:import>
	<script src="/js/seller/account.js"></script>
  </body>
</html>
