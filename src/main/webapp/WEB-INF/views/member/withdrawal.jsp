<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>withdrawal</title>

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
      .withdrawal_page {
        border-bottom: solid 3px rgb(133, 195, 18);
        color: rgb(136, 198, 20);
        font-weight: bold;
      }
      .withdrawal_page:hover {
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
            <div class="info_top p-2 mt-4 mb-2">
              <span style="color: rgb(10, 154, 10)">${memberVO.name}</span>님의 설정
            </div>
            <div
              class="setUp_menu d-flex justify-content-started"
              style="border-bottom: solid 1px lightgray"
            >
              <a href="/member/set_up"><div class="p-3 info_change">개인정보 변경</div></a>
              <a href="/member/set_pw"><div class="p-3 pw_change">비밀번호 변경</div></a>
              <a href="/member/withdrawal"><div class="p-3 withdrawal_page">회원 탈퇴</div></a>
            </div>
            <div
              class="mt-4 mb-5 p-4"
              style="
                box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px -1px,
                  rgba(0, 0, 0, 0.06) 0px 2px 4px -1px;
              "
            >
              <h4 style="color: rgb(9, 107, 9)"><b>회원탈퇴</b></h4>
              <div
                style="
                  margin-top: 40px;
                  margin-bottom: 40px;
                  color: rgb(77, 76, 76);
                "
              >
                <b>회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</b>
              </div>
              <h3 style="color: rgb(8, 63, 8)"><b>안내 사항</b></h3>
              <div style="margin-top: 20px; color: rgb(77, 76, 76)">
                <b
                  >본인의 의사로 회원 탈퇴 시, 회원님께서 보유하셨던
                  <span style="color: red"
                    >포인트는 모두 소멸되며 환불 및 복구되지 않습니다.</span
                  ></b
                >
              </div>
              <div style="margin-top: 20px; color: rgb(77, 76, 76)">
                <b
                  >회원 탈퇴 시 구디샵 회원 전용 서비스는 이용할 수 없게 됩니다.
                  서비스 이용 기록은 개인정보처리방침에 의해 3개월 간 보관되며,
                  <span style="color: red"
                    >탈퇴 후 3개월 간 재가입이 불가능합니다.</span
                  ></b
                >
              </div>
              <div style="margin-top: 20px; color: rgb(77, 76, 76)">
                <b
                  >탈퇴 후에도 구디샵 1:1 고객센터에 입력하신 문의사항은
                  삭제되지 않으며, 삭제를 원하시는 경우 반드시 탈퇴 전 삭제
                  요청하시기 바랍니다. 탈퇴 후에는 회원정보가 삭제되어 본인
                  여부를 확인할 수 있는 방법이 없어 상담내역을 임의로 삭제해드릴
                  수 없습니다.</b
                >
              </div>
              <div class="mt-3 mb-3">
                <input
                  class="form-check-input me-1"
                  type="checkbox"
                  id="flexCheckChecked"
                  style="font-size: 22px"
                />
                <label class="form-check-label pt-1" for="flexCheckChecked">
                  안내 사항을 모두 확인하였으며, 이에 동의합니다.
                </label>
              </div>
              <div>
                <button
                  class="btn btn-danger mb-3"
                  id="withdrawal_btn"
                >
                  탈퇴하기
                </button>
              </div>
              <div><img src="/images/with.jpg" alt="" width="100%" /></div>
            </div>
			<button id="withdrawal_modal" data-bs-toggle="modal" data-bs-target="#exampleModal_withdrawal" style="display: none"></button>
            <!-- 회원탈퇴 Modal -->
            <div
              class="modal fade"
              id="exampleModal_withdrawal"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div
                    class="modal-header"
                    style="
                      background-color: black;
                      color: white;
                      padding: 8px 20px;
                    "
                  >
                    <h3 class="modal-title fs-5" id="exampleModalLabel">
                      회원 탈퇴
                    </h3>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body mb-1">
                    <!-- 비밀번호 입력 -->
                    <div class="me-2 ms-2">
                      <label class="mt-3 mb-3" style="font-size: 14px"
                        ><span style="color: red">＊</span
                        ><b>비밀번호 입력</b></label
                      >
                      <div>
                        <input
                          type="password"
                          placeholder="비밀번호를 입력해주세요."
                          class="setUp_modal mb-2"
                          id="withdrawal_pw"
                        />
                        <div class="pt-1" id="withdrawal_pwCheck"></div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer mt-3">
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
                      class="btn btn-outline-danger pe-3 ps-3"
                      style="border-radius: 24px"
                      id="withdrawal_updateBtn"
                    >
                      회원 탈퇴
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
