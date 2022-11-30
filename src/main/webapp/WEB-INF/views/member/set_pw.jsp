<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>

	<c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel="stylesheet" href="/css/info.css" />
    <link rel="stylesheet" href="/css/set_up.css" />
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
      .pw_change {
        border-bottom: solid 3px rgb(133, 195, 18);
        color: rgb(136, 198, 20);
        font-weight: bold;
      }
      .pw_change:hover {
        border-bottom: solid 3px rgb(167, 224, 61);
        color: rgb(179, 229, 85);
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
            <sec:authentication property="Principal" var="user"/>
            <div class="info_top p-2 mt-4 mb-2">
              <span style="color: rgb(10, 154, 10)">${user.name}</span>님의 설정
            </div>
            <div
              class="setUp_menu d-flex justify-content-started"
              style="border-bottom: solid 1px lightgray"
            >
              <a href="/member/set_up"><div class="p-3 info_change">개인정보 변경</div></a>
              <a href="/member/set_pw"><div class="p-3 pw_change">비밀번호 변경</div></a>
              <a href="/member/withdrawal"><div class="p-3 withdrawal_page">회원 탈퇴</div></a>
            </div>
            <div class="mt-4" style="margin-bottom: 100px">
              <div class="flex-column">
              <div style="height: 92px">
                <div class="pb-2" style="font-size: 14.5px">
                  <span style="color: red">＊</span>현재 비밀번호
                </div>
                <input
                  id="cur_pw"
                  class="setPw_form"
                  type="password"
                  placeholder="현재 비밀번호를 입력"
                />
                <div style="display: none" id="pwText_1"></div>
                </div>
                <div style="height: 92px">
                <div class="pb-2 mt-2" style="font-size: 14.5px">
                  <span style="color: red">＊</span>새 비밀번호
                </div>
                <input
                  id="new_pw"
                  class="setPw_form"
                  type="password"
                  placeholder="8~20자리의 비밀번호"
                />
                <div style="display: none" id="pwText_2"></div>
                </div>
                
                <div class="pb-2 mt-2" style="font-size: 14.5px">
                  <span style="color: red">＊</span>새 비밀번호 확인
                </div>
                <div class="d-flex">
                  <input
                    id="new_pwCheck"
                    class="setPw_form"
                    type="password"
                    placeholder="새 비밀번호와 동일하게 입력"
                  />
                  <button class="btnPw_change">비밀번호 변경</button>
                </div>
                <div style="display: none" id="pwText_3">비밀번호 틀렸어요</div>
              </div>
            </div>
            
            <button id="setPw_modal" data-bs-toggle="modal" data-bs-target="#exampleModal_setPw_input2" style="display: none"></button>
            <!-- 비밀번호 재입력안내 -->
		    <div
		      class="modal fade"
		      id="exampleModal_setPw_input2"
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
		                <b id="pwCheck_setText2">비밀번호가 일치하지 않습니다.</b>
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
		    
		    <button id="setPw_change" data-bs-toggle="modal" data-bs-target="#exampleModal_setPw_input3" style="display: none"></button>
            <!-- 비밀번호 변경 실패 및 성공 확인 -->
		    <div
		      class="modal fade"
		      id="exampleModal_setPw_input3"
		      tabindex="-1"
		      aria-labelledby="exampleModalLabel"
		      data-bs-backdrop="static"
		      aria-hidden="true"
		    >
		      <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content">
		          <div class="modal-body">
		            <div class="d-flex pt-4">
		              <div class="ps-4 pe-3" style="font-size: 28px;">
		                <i id="pwCheck_icon" class="fa-solid fa-triangle-exclamation"></i>
		              </div>
		              <div
		                class="pt-2"
		                style="font-size: 17px; line-height: 28px"
		              >
		                <b id="pwCheck_setText3">비밀번호가 일치하지 않습니다.</b>
		              </div>
		            </div>
		          </div>
		          <div class="d-flex justify-content-end pb-4 ps-4 pe-4">
		            <button
		              type="button"
		              class="btn btn-success"
		              style="border-radius: 18px; padding: 6px 18px"
		              data-bs-dismiss="modal"
		              onclick="location.href='/member/set_up'"
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
