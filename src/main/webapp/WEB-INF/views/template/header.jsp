<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <nav class="navbar navbar-expand-lg header">
      <div class="container-fluid" style="padding: 0px; width: 68%">
        <a class="navbar-brand" href="/" style="margin-right: 1.2em"
          ><img
            src="/images/hh.png"
            alt="Logo"
            width="169"
            height="70"
            class="d-inline-block align-text-top pb-2"/></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item tab0  ps-3 pe-3"><a href="/">홈</a></li>
            <li class="nav-item tab1 ps-3 pe-3"><a href="/tab/tab1">추첨형</a></li>
            <li class="nav-item tab2 ps-3 pe-3"><a href="/tab/tab2">즉석추첨형</a></li>
            <li class="nav-item tab3 ps-3 pe-3"><a href="/tab/tab3">SNS미션</a></li>
            <li class="nav-item tab4 ps-3 pe-3"><a href="/tab/tab4">프리미엄</a></li>
          </ul>
          <div class="d-flex">
          
          <sec:authorize access="!isAuthenticated()">
            <a
              href="#"
              class="btn btn-outline-success"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
              data-bs-whatever="@mdo"
              style="
                --bs-btn-padding-y: 0.5rem;
                --bs-btn-padding-x: 0.9rem;
                --bs-btn-font-size: 0.86rem;
              "
              id="member_log">
              <b>로그인</b>
            </a>
            <a
              class="btn btn-dark ms-3 me-3"
              style="
                font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman',
                  serif, Geneva, Tahoma, sans-serif;
                color: #d4af37;
                font-weight: bold;
              "
              href="/membership/membership"
              >Premium</a
            ></sec:authorize>
            <!-- 로그인후 해당 블록 보이기 -->
            <sec:authorize access="isAuthenticated()">
              <div class="me-3">
                <b style="font-size: 17.5px; color: rgb(9, 118, 31)"><sec:authentication property="Principal" var="user"/>
                  <c:if test="${empty user.name}">${user.id}</c:if>
                  <c:if test="${not empty user.name}">${user.name}</c:if>
                </b>님
                환영합니다!💚
                <h4 id="memberName" hidden>${user.name}</h4>
                <h4 id="memberId" hidden>${user.id}</h4>
            </div>
            
            <div class="top-dropdown">
            <div class="log">
              <a href="/member/mypage"><b>마이페이지</b></a>
                </div>
            <div class="dropdown-content">
            <sec:authorize access="hasRole('SELLER')">
                  <a href="/member/product">내 상품</a>
             </sec:authorize>
               <a href="/myCampaign/apply">내 캠페인</a>
            </div>
          </div>
            
            </sec:authorize>
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
                <input type="text" placeholder="아이디" id="id" name="id" value="${cookie.userId.value}" />
                <div class="inp" id="inp_id" style="display: none">아이디를 입력해주세요.</div>
              </div>
              <div style="height: 68px">
                <div id="pw_icon">
                  <i class="fa-solid fa-lock"></i>
                </div>
                <input type="password" placeholder="비밀번호" id="pw" name="pw"/>
                <div class="inp" id="inp_pw" style="display: none">비밀번호를 입력해주세요.</div>
              </div>
              <div
                class="d-flex justify-content-between pt-1"
                style="height: 45px; font-size: 14.5px"
              >
                <div class="form-check2">
                  <input
                    class="rememberId form-check-input2"
                    type="checkbox"
                    id="flexCheckChecked2"
                    checked
                    name="rememberId"
                  />
                  <label class="form-check-label2" for="flexCheckChecked2">
                    아이디 기억하기
                  </label>
                </div>
                <div><a href="/member/find_id" id="id_search">아이디/비밀번호 찾기</a></div>
              </div>
              <div style="height: 10%">
                <div class="d-grid gap-2">
                  <button class="btn btn-success" id="log_btn">
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
                     <a href="/oauth2/authorization/kakao">
                    <img
                      src="/images/kakaotalk_logo_icon_147272.png"
                      style="width: 38px; height: 38px"
                    /></a>
                  </div>
                  <div class="pe-3">
                     <a href="/oauth2/authorization/naver">
                    <img src="/images/naver.png" style="width: 38px; height: 38px" />
                     </a>
                  </div>
                  <div>
                     <a href="/oauth2/authorization/google">
                    <img
                      src="/images/google.png"
                      style="width: 38px; height: 38px"
                    />
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 10;">
      <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
        <div class="toast-header">
          <i class="bi bi-alarm"></i>
          <strong class="me-auto" id="type" style="margin-left: 11px;"></strong>
          <small id="time"></small>
          <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body" id="toastMsg"></div>
      </div>
    </div>
<script>
      const toastLiveExample = document.getElementById('liveToast')
      let today = new Date();   
      if($("#memberId").text()!=""){
        
        $(document).ready(function(){
          console.log("sse 저장")
          const id = $("#memberId").text();
          const eventSource = new EventSource('/sub/'+id);
          console.log(eventSource)
          eventSource.addEventListener("connect",function(event){
            let message = event.data;
            alert(message)
          })
          eventSource.addEventListener("addApply",function(event){
            let message = event.data;
            $("#type").text("  입점 신청")
            $("#time").text(today.toLocaleTimeString())
            $("#toastMsg").text(message)
            const toast = new bootstrap.Toast(toastLiveExample)
            toast.show()
            // alert(message)
          })
          eventSource.addEventListener("pdAddRequest",function(event){
            console.log("상품등록요청")
            let message = event.data;
            $("#type").text("  상품등록 요청")
            $("#time").text(today.toLocaleTimeString())
            $("#toastMsg").text(message)
            const toast = new bootstrap.Toast(toastLiveExample)
            toast.show()
            //alert(message)
          })
          eventSource.addEventListener("error", function(event) {
                  eventSource.close()
              })
        })
      }
  
</script>