<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
      .info_change {
        border-bottom: solid 3px rgb(133, 195, 18);
        color: rgb(136, 198, 20);
        font-weight: bold;
      }
      .info_change:hover {
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
                <div class="pb-2" style="font-size: 14.5px">아이디</div>
                <input class="setUp_form" type="text" value="${user.id}" disabled />
                <div class="pb-2 mt-4" style="font-size: 14.5px">이름</div>
                <input class="setUp_form" type="text" value="${user.name}" disabled />
                <div style="position: relative">
                  <div class="pb-2 mt-4" style="font-size: 14.5px">
                    휴대폰번호
                  </div>
                  <input
                    class="setUp_form"
                    type="text"
                    value="${memberVO.phone}"
                    disabled
                  />
                  <button
                    class="phoneSet_btn"
                    type="button"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal_setPhone"
                  >
                    전화번호 변경
                  </button>
                </div>
                <div class="pb-2 mt-4" style="font-size: 14.5px">이메일</div>
                <div style="position: relative">
                  <input
                    class="setUp_form"
                    type="text"
                    value="${memberVO.email}"
                    disabled
                  />
                  <button
                    class="emailSet_btn"
                    type="button"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal_setEmail"
                  >
                    이메일 변경
                  </button>
                </div>
                <div style="position: relative">
                  <div class="pb-2 mt-4" style="font-size: 14.5px">
                    생년월일
                  </div>
                  <input
                    class="setUp_form"
                    type="text"
                    value="${user.birth}"
                    disabled
                  />
                </div>
              </div>
            </div>

            <!-- 이메일 변경 Modal -->
            <div
              class="modal fade"
              id="exampleModal_setEmail"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div
                    class="modal-header"
                    style="
                      background-color: rgb(167, 224, 61);
                      color: white;
                      padding: 8px 20px;
                    "
                  >
                    <h3 class="modal-title fs-5" id="exampleModalLabel">
                      이메일 변경
                    </h3>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body">
                    <!-- 이메일 입력 -->
                    <div class="me-2 ms-2">
                      <label class="mt-2 mb-3" style="font-size: 14px"
                        ><span style="color: red">＊</span
                        ><b>변경할 이메일 주소</b></label
                      >
                      <div class="d-flex mb-3">
                        <input
                          path="e"
                          placeholder="이메일을 입력해주세요."
                          class="setUp_modal"
                          id="email_e"
                        />
                        <span
                          class="ps-1 pe-1"
                          style="line-height: 40px; font-size: 17px"
                          >@</span
                        >
                        <select
                          path="mailOption"
                          class="form-select setUp_modal"
                          id="email_option"
                        >
                          <option selected hidden>선택</option>
                          <option value="naver.com">naver.com</option>
                          <option value="hanmail.net">hanmail.net</option>
                          <option value="nate.com">nate.com</option>
                          <option value="gmail.com">gmail.com</option>
                        </select>
                      </div>
                      <div id="emailUpdate_Check" style="display:none">
                          <i class="fa-solid fa-circle-exclamation"></i> <b id="emailUpdate_b">정확한
                          정보를 입력해주세요.</b>
                       </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button pe-4 ps-4"
                      class="btn btn-outline-secondary"
                      data-bs-dismiss="modal"
                      style="border-radius: 24px"
                    >
                      취소
                    </button>
                    <button
                      type="button"
                      class="btn btn-outline-success pe-3 ps-3"
                      style="border-radius: 24px"
                      id="emailUpdate_btn"
                    >
                      이메일 변경
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <!-- 번호변경 Modal -->
            <div
              class="modal fade"
              id="exampleModal_setPhone"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div
                    class="modal-header"
                    style="
                      background-color: rgb(167, 224, 61);
                      color: white;
                      padding: 8px 20px;
                    "
                  >
                    <h3 class="modal-title fs-5" id="exampleModalLabel">
                      전화번호 변경
                    </h3>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body mb-1">
                    <!-- 이메일 입력 -->
                    <div class="me-2 ms-2">
                      <label class="mt-2 mb-3" style="font-size: 14px"
                        ><span style="color: red">＊</span
                        ><b>변경할 번호</b></label
                      >
                      <div>
                        <input
                          path="phone"
                          placeholder="-제외 휴대폰 번호를 입력해주세요."
                          class="setUp_modal mb-2"
                          id="phoneUpdate_input"
                        />
                        <div style="display: none" id="phoneUpdate_Check">
                          <i class="fa-solid fa-circle-exclamation"></i> <b id="phoneUpdate_b">정확한
                          정보를 입력해주세요.</b>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button pe-4 ps-4"
                      class="btn btn-outline-secondary"
                      data-bs-dismiss="modal"
                      style="border-radius: 24px"
                    >
                      취소
                    </button>
                    <button
                      id="phoneUpdate_btn"
                      type="button"
                      class="btn btn-outline-success pe-3 ps-3"
                      style="border-radius: 24px"
                    >
                      번호 변경
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <!-- 생년월일변경 Modal -->
            <div
              class="modal fade"
              id="exampleModal_setBirth"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div
                    class="modal-header"
                    style="
                      background-color: rgb(167, 224, 61);
                      color: white;
                      padding: 8px 20px;
                    "
                  >
                    <h3 class="modal-title fs-5" id="exampleModalLabel">
                      생년월일 변경
                    </h3>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body mb-1">
                    <!-- 생년월일 입력 -->
                    <div class="me-2 ms-2">
                      <label class="mb-3" style="font-size: 14px"
                        ><span style="color: red">＊</span
                        ><b>생년월일</b></label
                      >
                      <div>
                        <input
                          class="p-1 ps-2 mb-3 setUp_modal"
                          type="date"
                          style="width: 380px"
                        />
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button pe-4 ps-4"
                      class="btn btn-outline-secondary"
                      data-bs-dismiss="modal"
                      style="border-radius: 24px"
                    >
                      취소
                    </button>
                    <button
                      type="button"
                      class="btn btn-outline-success pe-3 ps-3"
                      style="border-radius: 24px"
                    >
                      일자 변경
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
