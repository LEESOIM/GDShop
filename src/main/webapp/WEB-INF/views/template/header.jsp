<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <body>
    <nav class="navbar navbar-expand-lg header">
      <div class="container-fluid" style="padding: 0px">
        <a class="navbar-brand" href="#" style="margin-right: 1.2em"
          ><img
            src="/images/h.png"
            alt="Logo"
            width="169"
            height="62"
            class="d-inline-block align-text-top"
        /></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item ps-3 pe-3"><a href="/">홈</a></li>
            <li class="nav-item ps-3 pe-3"><a href="#">추첨형</a></li>
            <li class="nav-item ps-3 pe-3"><a href="#">즉석추첨형</a></li>
            <li class="nav-item ps-3 pe-3"><a href="#">초간단미션</a></li>
          </ul>
          <div class="d-flex">
            <a
              href="#"
              class="btn btn-outline-success"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
              data-bs-whatever="@mdo"
              style="
                --bs-btn-padding-y: 0.35rem;
                --bs-btn-padding-x: 0.9rem;
                --bs-btn-font-size: 0.86rem;
              "
            >
              <b>로그인</b>
            </a>
            <a
              class="btn btn-dark ms-3 me-3"
              style="
                font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman',
                  serif, Geneva, Tahoma, sans-serif;
                color: #d2bf5e;
                font-weight: bold;
              "
              >Premium</a
            >
            <!-- 로그인후 해당 블록 보이기 -->
            <div class="me-3" style="display: none">
              <b style="font-size: 17.5px; color: rgb(9, 118, 31)">설희</b>님
              환영합니다!💚
            </div>
            <div class="me-3 log" style="display: none">
              <a href="#"><b>내캠페인</b></a>
            </div>
            <div class="me-3 log" style="display: none">
              <a href="#"><b>마이페이지</b></a>
            </div>
          </div>
        </div>
      </div>
    </nav>

    <!--modal-->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <div class="d-flex justify-content-end">
              <div>
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                  style="font-size: 10px; border: none"
                ></button>
              </div>
            </div>
            <div
              id="log_box"
              class="d-flex flex-column mb-3"
              style="width: 380px; height: 480px; margin: 0px auto"
            >
              <div style="height: 90px; text-align: center">
                <img src="/images/log.png" style="width: 83px; height: 70px" />
              </div>
              <div style="height: 68px">
                <div id="email_icon"><i class="fa-regular fa-user"></i></div>
                <input type="text" placeholder="아이디" id="id" />
                <div class="inp">아이디를 입력해주세요.</div>
              </div>
              <div style="height: 68px">
                <div id="pw_icon">
                  <i class="fa-solid fa-lock"></i>
                </div>
                <input type="password" placeholder="비밀번호" id="pw" />
                <div class="inp">비밀번호를 입력해주세요.</div>
              </div>
              <div
                class="d-flex justify-content-between pt-1"
                style="height: 45px; font-size: 14.5px"
              >
                <div class="form-check2">
                  <input
                    class="form-check-input2"
                    type="checkbox"
                    value=""
                    id="flexCheckChecked2"
                    checked
                  />
                  <label class="form-check-label2" for="flexCheckChecked2">
                    로그인 상태 유지
                  </label>
                </div>
                <div><a href="#" id="id_search">아이디/비밀번호 찾기</a></div>
              </div>
              <div style="height: 10%">
                <div class="d-grid gap-2">
                  <button class="btn btn-success" id="log_btn" type="button">
                    로그인
                  </button>
                </div>
              </div>
              <div
                class="pt-1"
                style="
                  height: 40px;
                  font-size: 14.5px;
                  text-align: center;
                  color: gray;
                "
              >
                아직 회원이 아니신가요?
                <span><a href="/member/agree" id="join_btn">회원가입</a></span>
              </div>
              <hr style="margin: 5px" />
              <div class="pt-4" style="height: 100px; text-align: center">
                <span style="font-size: 14px; color: rgb(121, 117, 117)"
                  >SNS계정으로 로그인 하기</span
                >
                <div class="d-flex justify-content-center pt-3">
                  <div class="pe-3">
                    <img
                      src="/images/kakaotalk_logo_icon_147272.png"
                      style="width: 38px; height: 38px"
                    />
                  </div>
                  <div class="pe-3">
                    <img src="/images/naver.png" style="width: 38px; height: 38px" />
                  </div>
                  <div>
                    <img
                      src="/images/facebook_logo_icon_147291.png"
                      style="width: 38px; height: 38px"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
