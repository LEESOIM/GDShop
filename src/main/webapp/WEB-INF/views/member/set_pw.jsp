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
    <section class="container" style="width: 75%">
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
      <div class="container">
        <div class="content d-flex">
          <c:import url="../template/mypage_side.jsp"></c:import>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내정보 상세보기 -->
            <div class="info_top p-2 mt-3 mb-2">
              <span style="color: rgb(10, 154, 10)">김설희</span>님의 설정
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
                <div class="pb-2" style="font-size: 14.5px">
                  <span style="color: red">＊</span>현재 비밀번호
                </div>
                <input
                  class="setPw_form"
                  type="password"
                  placeholder="현재 비밀번호를 입력"
                />
                <div class="pb-2 mt-4" style="font-size: 14.5px">
                  <span style="color: red">＊</span>새 비밀번호
                </div>
                <input
                  class="setPw_form"
                  type="password"
                  placeholder="8~20자리의 비밀번호"
                />
                <div class="pb-2 mt-4" style="font-size: 14.5px">
                  <span style="color: red">＊</span>새 비밀번호 확인
                </div>
                <div class="d-flex">
                  <input
                    class="setPw_form"
                    type="password"
                    placeholder="새 비밀번호와 동일하게 입력"
                  />
                  <button class="btnPw_change">비밀번호 변경</button>
                </div>
              </div>
            </div>
            <!-- 여기까지!! -->
          </div>
        </div>
      </div>
      <c:import url="../template/footer.jsp"></c:import>
    </section>

    <script src="/js/info.js"></script>
  </body>
</html>
