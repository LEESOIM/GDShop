<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>

	<c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel="stylesheet" href="/css/info.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <style>
      #my_setUp {
        background-color: rgba(216, 246, 181, 0.803);
        font-weight: 600;
        cursor: pointer;
        border-right: solid 3.5px green;
      }
    </style>
  </head>
  <body>
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 75%">
      <div class="container">
        <div class="content d-flex">
          <c:import url="../template/mypage_side.jsp"></c:import>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내정보 상세보기 -->
            <div class="info_top p-2 mt-4 mb-3">
              <span style="color: rgb(10, 154, 10)">${memberVO.name}</span>님의 설정
            </div>
            <div
              class="mt-4 pt-3"
              style="
                height: 280px;
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
                text-align: center;
              "
            >
              <div class="pt-4" style="font-size: 20px"><b>본인확인</b></div>
              <div class="pt-3">
                고객님의 소중한 개인정보보호를 위해서 본인확인을 진행합니다.
              </div>
              <div class="auth_box">
                <div
                  class="d-flex justify-content-center"
                  style="margin: 0 auto; padding-top: 46px"
                >
                  <div class="pe-4" style="font-size: 18px">
                    <b>구디샵 비밀번호</b>
                  </div>
                  
                  <div class="pe-2">
                    <input
                      type="password"
                      style="width: 250px"
                      class="ps-2"
                      id="pwCheck_setInput"
                      placeholder="비밀번호를 입력하세요."
                      name="pw"
                    />
                  </div>
                  <button class="pe-3 ps-3 btn btn-dark btn-sm" id="set_pwCheck" >확 인</button>
                  
                  
                </div>
              </div>
            </div>
            
            <button id="pwCheck_modal" data-bs-toggle="modal" data-bs-target="#exampleModal_setPw_input" style="display: none"></button>
            <!-- 비밀번호 재입력안내 -->
		    <div
		      class="modal fade"
		      id="exampleModal_setPw_input"
		      tabindex="-1"
		      aria-labelledby="exampleModalLabel"
		      aria-hidden="true"
		    >
		      <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content">
		          <div class="modal-body">
		            <div class="d-flex pt-4">
		              <div class="ps-4 pe-3" style="font-size: 28px; color: red">
		                <i class="fa-solid fa-triangle-exclamation"></i>
		              </div>
		              <div
		                class="pt-2"
		                style="color: red; font-size: 17px; line-height: 28px"
		              >
		                <b id="pwCheck_setText">비밀번호가 일치하지 않습니다.</b>
		              </div>
		            </div>
		          </div>
		          <div class="d-flex justify-content-end pb-4 ps-4 pe-4">
		            <button
		              type="button"
		              class="btn btn-success"
		              style="border-radius: 18px; padding: 6px 18px"
		              data-bs-dismiss="modal"
		            >
		              확인
		            </button>
		          </div>
		        </div>
		      </div>
		    </div>
            <!-- 여기까지!! -->
          </div>
        </div>
      </div>
    </section>
      <c:import url="../template/footer.jsp"></c:import>

    <script src="/js/info.js"></script>
  </body>
</html>
