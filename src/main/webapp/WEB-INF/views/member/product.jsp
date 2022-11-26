<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MyPage</title>
    
    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel="stylesheet" href="/css/info.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <style>
      #my_product {
        background-color: rgba(216, 246, 181, 0.803);
        font-weight: 600;
        cursor: pointer;
        border-right: solid 3.5px green;
      }
    </style>
  </head>
  <body>
    <section class="container" style="width: 75%">
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
      <div class="container">
        <div class="content d-flex">
          <c:import url="../template/mypage_side.jsp"></c:import>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내정보 상세보기 -->
            <div class="info_top p-2 mt-3 mb-4 d-flex">
              <div><span style="color: rgb(10, 154, 10)">${memberVO.name}</span>님의 상품목록</div>
              <button id="product" data-bs-toggle="modal" data-bs-target="#exampleModal_withdraw" data-bs-whatever="@mdo" onclick="location.href='/item/add'" >상품등록</button>
            </div>
              <!-- 목록보기 -->
              <div class="d-flex justify-content-between mb-3">
                <div class="product_box">
                  <div class="mt-1 mb-2" style="font-size: 17px">
                    <b>상품</b>
                  </div>
                </div>
           	  </div>
            <!-- 여기까지!! -->
          </div>
        </div>
      </div>
      <c:import url="../template/footer.jsp"></c:import>
    </section>

	<!-- 툴팁 활성화 -->
	 <script>
	  $(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	  });
	</script>
    <script src="/js/info.js"></script>
  </body>
</html>
