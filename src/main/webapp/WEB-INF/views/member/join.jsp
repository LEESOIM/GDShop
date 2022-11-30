<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Join</title>
    
    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/join.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
  </head>
  <body>
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 65%">
      <form:form action="./join" modelAttribute="memberVO" method="post">
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
              <!-- 아이디 입력 -->
              <div class="mt-4">
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>아이디</label
                >
                <form:input path="id" placeholder="아이디를 입력해주세요." class="join_form" style="padding-left: 10px;"/>
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <form:errors path="id"></form:errors>
              </div>
              <!-- 비밀번호 입력 -->
              <div>
                <label class="mt-1 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>비밀번호</label
                >
                <form:password path="pw" placeholder="8~20자리 비밀번호를 입력해주세요." id="join_pw" class="join_form" style="padding-left: 10px;"/>
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px" id="pw_resultText"
              >
                <form:errors path="pw"></form:errors>
              </div>
              <!-- 비밀번호 재입력 -->
              <div>
                <label class="mt-1 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>비밀번호 확인</label
                >
                <form:password path="pwCheck" placeholder="비밀번호를 재입력해주세요." class="join_form"/>
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <form:errors path="pwCheck"></form:errors>
              </div>
              <!-- 이름 입력 -->
              <div>
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>이름</label
                >
                <form:input path="name" placeholder="이름을 입력해주세요." class="join_form"/>
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <form:errors path="name"></form:errors>
              </div>
              <!-- 이메일 입력 -->
              <div>
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>이메일</label
                >
                <div class="d-flex">
                <form:input path="e" id="join_e" placeholder="이메일을 입력해주세요." class="join_form"/>
                  <span
                    class="ps-1 pe-1"
                    style="line-height: 40px; font-size: 17px"
                    >@</span
                  >
                  <form:select path="mailOption" class="form-select join_form" id="inputGroupSelect01">
                  	<option selected hidden>선택</option>
                    <option value="naver.com">naver.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="nate.com">nate.com</option>
                    <option value="gmail.com">gmail.com</option>
                  </form:select>
                    
                </div>
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
                id="join_eText"
              >
                <form:errors path="e"></form:errors>
                <form:errors path="mailOption"></form:errors>
                <form:errors path="mailText"></form:errors>
              </div>
              <!-- 생년월일 입력 -->
              <div>
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>생년월일</label
                >
                <div class="d-flex justify-content-between">
                <form:input path="yy" placeholder="년(4자)" class="join_form" style="width: 32%"/>
                  <select class="form-select join_form" name = "mm" style="width: 32%">
                    <option value="">월</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
                  </select>
                  <form:input path="dd" class="join_form" style="width: 32%" placeholder="일"/>
                </div>
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
              >
                <form:errors path="yy"></form:errors>
                <form:errors path="mm"></form:errors>
                <form:errors path="dd"></form:errors>
              </div>
              <!-- 휴대번호 입력 -->
              <div>
                <label class="mt-2 mb-2" style="font-weight: bold"
                  ><span style="color: red">＊</span>휴대전화</label
                >
                <form:input path="phone" id="join_phone" placeholder="전화번호를 입력해주세요.(숫자만 입력)" class="join_form"/>
              </div>
              <div
                class="pt-1"
                style="color: red; font-size: 13px; height: 23px"
                id="join_phoneText"
              >
                <form:errors path="phone"></form:errors>
              </div>

            <!-- 회원가입 버튼 -->
            <div
              class="d-grid gap-2 d-flex justify-content-center"
              style="margin-top: 40px"
            >
              <button
              	id="join_result"
                class="btn btn-success"
                style="padding-top: 13px; padding-bottom: 13px; width: 80%"
              >
                <b>회원가입</b>
              </button>
            </div>
          </div>
        </div>
      </div>
      </form:form>
    </section>
      <c:import url="../template/footer.jsp"></c:import>

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

    <script src="/js/join.js"></script>
  </body>
</html>
