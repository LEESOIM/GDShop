<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Find_id</title>

    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <style type="text/css">
      #find_id span:hover {
        color: yellow;
        font-weight: bold;
      }

      #find_pw span:hover {
        color: rgb(255, 255, 156);
      }
    </style>
  </head>
  <body>
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 65%">
      <form:form action="./find" modelAttribute="memberVO" method="post">
        <div class="d-flex justify-content-center">
          <div>
            <div class="p-3 mt-4" style="color: rgb(34, 62, 33)">
              <h4><b>아이디/비밀번호 찾기</b></h4>
            </div>
            <div
              class="d-flex p-1"
              style="
                background-color: rgb(143, 204, 45);
                font-size: 16px;
                font-weight: bold;
                width: 500px;
                border-radius: 8px;
              "
            >
              <div
                class="btn pe-2 ps-3"
                style="color: white; border: none"
                id="find_id"
                onclick="location.href='/member/find_id'"
              >
                <span
                  ><i class="fa-regular fa-id-card pe-1"></i>아이디찾기</span
                >
              </div>
              <div
                class="pe-2 ps-2"
                style="
                  font-size: 13px;
                  line-height: 34px;
                  color: rgba(229, 237, 222, 0.879);
                "
              >
                |
              </div>
              <div
                class="btn"
                id="find_pw"
                style="border: none; color: yellow; font-weight: bold"
              >
                <span><i class="fa-solid fa-key pe-2"></i>비밀번호찾기</span>
              </div>
            </div>

            <div class="pt-2">
              <b
                >회원정보에 등록한 이메일 주소로 임시 비밀번호를 발급해
                드립니다.</b
              >
            </div>
            <div
              class="d-flex justify-content-end pt-3 pb-2"
              style="font-size: 13.5px; width: 500px"
            >
              <span style="color: red">*</span> <b>필수입력항목</b>
            </div>
            <div
              style="
                border-top: solid 3px;
                border-bottom: solid 3px;
                width: 500px;
              "
            >
              <div class="d-flex justify-content-between">
                <label class="me-4" style="font-weight: bold; margin-top: 21px"
                  ><span style="color: red">＊</span>아이디</label
                >
                <input
                  class="mt-3 p-1 ps-2"
                  type="text"
                  placeholder="아이디를 입력해주세요."
                  id="findPw_id"
                  style="width: 380px"
                />
              </div>
              <hr class="mt-3 mb-1" />
              <div class="d-flex justify-content-between mb-3">
                <label class="me-4" style="font-weight: bold; margin-top: 21px"
                  ><span style="color: red">＊</span>생년월일</label
                >
                <input
                  class="mt-3 p-1 ps-2"
                  type="date"
                  id="findPw_birth"
                  style="width: 380px"
                />
              </div>
              <hr class="mt-3 mb-1" />
              <div class="d-flex justify-content-between mb-4">
                <label class="me-4" style="font-weight: bold; margin-top: 21px"
                  ><span style="color: red">＊</span>휴대폰번호</label
                >
                <input
                  class="mt-3 p-1 ps-2"
                  type="text"
                  id="findPw_phone"
                  placeholder="-제외 휴대폰 번호를 입력해주세요."
                  style="width: 380px"
                />
              </div>
            </div>
            <div
              class="d-flex justify-content-center mt-4 pt-1 mb-5"
              style="width: 500px"
            >
              <button
                type="button"
                id="findPw_btn"
                class="btn btn-success me-1 ps-5 pe-5"
              >
                메일로 임시 비밀번호 받기
              </button>
            </div>
          </div>
        </div>
      </form:form>
    </section>
      <c:import url="../template/footer.jsp"></c:import>

    <a
      data-bs-toggle="modal"
      data-bs-target="#exampleModal_findPw"
      style="display: none"
      id="pwFind_modal"
      >비밀번호 찾기 모달창</a
    >
    <!-- 비밀번호 찾기 모달창 -->
    <div
      class="modal fade"
      id="exampleModal_findPw"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-body">
            <div class="d-flex pt-4">
              <div
                class="ps-4 pe-3"
                style="font-size: 28px; color: rgb(120, 189, 16)"
              >
                <i id="findPw_icon" class="fa-solid fa-circle-exclamation"></i>
              </div>
              <div
                class="pt-2"
                style="
                  color: rgba(113, 109, 109, 0.838);
                  font-size: 17px;
                  line-height: 28px;
                "
              >
                <b id="findPw_text"></b>
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end pb-4 ps-4 pe-4">
            <button
              type="button"
              class="btn btn-success"
              style="border-radius: 18px; padding: 6px 18px"
              data-bs-dismiss="modal"
              id="find_pwBTN"
            >
              확인
            </button>
          </div>
        </div>
      </div>
    </div>
    <script src="/js/find.js"></script>
  </body>
</html>