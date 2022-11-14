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
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/join.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
  </head>
  <body>
    <section class="container" style="width: 75%">
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
      <div>
        <div class="p-3 mt-3" style="color: rgb(34, 62, 33)">
          <h3><b>회원가입</b></h3>
        </div>
        <div
          class="d-flex mb-3"
          style="border-bottom: solid 1px rgba(201, 199, 199, 0.716)"
        >
          <div
            id="order1"
            class="orders"
            data-bs-toggle="modal"
            data-bs-target="#exampleModal_pre"
          >
            01 약관동의
          </div>
          <div id="order2" class="orders">02 개인정보입력</div>
          <div
            id="order3"
            class="orders"
            data-bs-toggle="modal"
            data-bs-target="#exampleModal_order"
          >
            03 가입완료
          </div>
        </div>
        <div
          class="d-flex justify-content-center mt-4"
          style="margin-bottom: 90px"
        >
          <div style="width: 410px">
            <form action="POST" method="">
              <!-- 아이디 입력 -->
              <div class="mt-4">
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>아이디</label
                >
                <input
                  type="text"
                  placeholder="아이디를 입력해주세요."
                  class="join_form"
                />
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <span style="display: none"
                  >아이디를 입력해주세요. 멋진아이디네요!,등</span
                >
              </div>
              <!-- 비밀번호 입력 -->
              <div>
                <label class="mt-1 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>비밀번호</label
                >
                <input
                  type="password"
                  placeholder="8~20자리 비밀번호를 입력해주세요."
                  class="join_form"
                />
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <span style="display: none"
                  >8~20자리 비밀번호를 입력해주세요.</span
                >
              </div>
              <!-- 비밀번호 재입력 -->
              <div>
                <label class="mt-1 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>비밀번호 확인</label
                >
                <input
                  type="password"
                  placeholder="비밀번호를 재입력해주세요."
                  class="join_form"
                />
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <span style="display: none">비밀번호가 틀립니다.</span>
              </div>
              <!-- 이름 입력 -->
              <div>
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>이름</label
                >
                <input
                  type="text"
                  placeholder="이름을 입력해주세요."
                  class="join_form"
                />
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <span style="display: none"
                  >아이디를 입력해주세요. 멋진아이디네요!,등</span
                >
              </div>
              <!-- 이메일 입력 -->
              <div>
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>이메일</label
                >
                <div class="d-flex">
                  <input
                    type="text"
                    placeholder="이메일을 입력해주세요."
                    class="join_form"
                  />
                  <span
                    class="ps-1 pe-1"
                    style="line-height: 40px; font-size: 17px"
                    >@</span
                  >
                  <input
                    type="text"
                    class="join_form"
                    style="display: none"
                    id="email_input"
                  />
                  <select class="form-select join_form" id="inputGroupSelect01">
                    <option selected>선택</option>
                    <option value="1">naver.com</option>
                    <option value="2">hanmail.net</option>
                    <option value="3">nate.com</option>
                    <option value="4">gmail.com</option>
                    <option value="5" id="direct">직접입력</option>
                  </select>
                </div>
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <span style="display: none"
                  >아이디를 입력해주세요. 멋진아이디네요!,등</span
                >
              </div>
              <!-- 생년월일 입력 -->
              <div>
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>생년월일</label
                >
                <div class="d-flex justify-content-between">
                  <input
                    type="text"
                    placeholder="년(4자)"
                    class="join_form"
                    style="width: 32%"
                  />
                  <select class="form-select join_form" style="width: 32%">
                    <option selected>월</option>
                    <option value="1">1</option>
                  </select>
                  <input
                    type="text"
                    class="join_form"
                    style="width: 32%"
                    placeholder="일"
                  />
                </div>
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <span style="display: none"
                  >태어난 년도 4자리를 정확하게 입력하세요.</span
                >
              </div>
              <!-- 휴대번호 입력 -->
              <div>
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>휴대전화</label
                >
                <input
                  type="text"
                  placeholder="전화번호를 입력해주세요."
                  class="join_form"
                />
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <span style="display: none">형식에 맞지 않는 번호입니다.</span>
              </div>
            </form>

            <!-- 회원가입 버튼 -->
            <div
              class="d-grid gap-2 d-flex justify-content-center"
              style="margin-top: 60px"
            >
              <button
                class="btn btn-success"
                type="button"
                style="padding-top: 13px; padding-bottom: 13px; width: 80%"
                onclick="location.href='/member/join_end'"
              >
                <b>회원가입</b>
              </button>
            </div>
          </div>
        </div>
      </div>
      <c:import url="../template/footer.jsp"></c:import>
    </section>

    <!-- 순서모달창 -->
    <div
      class="modal fade"
      id="exampleModal_order"
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
                style="font-size: 28px; color: rgba(255, 166, 0, 0.827)"
              >
                <i class="fa-solid fa-circle-exclamation"></i>
              </div>
              <div
                class="pt-2"
                style="
                  color: rgba(113, 109, 109, 0.838);
                  font-size: 17px;
                  line-height: 28px;
                "
              >
                <b>순서에 따라 진행해주세요.</b>
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

    <!-- 01약관동의모달 -->
    <div
      class="modal fade"
      id="exampleModal_pre"
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
                style="font-size: 28px; color: deepskyblue"
              >
                <i class="fa-regular fa-circle-question"></i>
              </div>
              <div
                class="pt-2"
                style="
                  color: rgba(113, 109, 109, 0.838);
                  font-size: 17px;
                  line-height: 28px;
                "
              >
                <b>인증/약관 동의 탭으로 돌아가시겠습니까?</b>
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end mt-2 pb-4 ps-4 pe-4">
            <button
              type="button"
              class="btn btn-outline-secondary me-2"
              style="border-radius: 18px; padding: 6px 18px"
              data-bs-dismiss="modal"
            >
              취소
            </button>
            <button
              type="button"
              class="btn btn-success ms-1"
              style="border-radius: 18px; padding: 6px 18px"
              onclick="location.href='/member/agree'"
            >
              예
            </button>
          </div>
        </div>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://kit.fontawesome.com/6e23c67242.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/join.js"></script>
  </body>
</html>
