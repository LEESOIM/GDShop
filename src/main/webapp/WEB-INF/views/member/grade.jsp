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
    <title>Grade</title>

    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel="stylesheet" href="/css/info.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <style>
      #mygrade {
        background-color: rgba(216, 246, 181, 0.803);
        font-weight: 600;
        cursor: pointer;
        border-right: solid 3.5px green;
      }
    </style>
    <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  </head>
  <body>
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 75%">
      <div class="container">
        <div class="content d-flex">
          <c:import url="../template/mypage_side.jsp"></c:import>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내등급 상세보기 -->
            <div class="info_top p-2 mt-4 mb-3">
              <div>
                <span style="color: rgb(10, 154, 10)">${memberVO.name}</span
                >님의 등급
              </div>
            </div>
            
            <div id="grade_box">
            </div>
              
            <!-- 멤버십 가입 모달창 -->
            <div
              class="modal fade"
              id="exampleModal_membership"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog">
                <div class="modal-content">
                  <div
                    class="modal-header"
                    style="
                      background-color: black;
                      color: #d4af37;
                      font-weight: bold;
                    "
                  >
                    <h1 class="modal-title fs-5" id="exampleModalLabel">
                      <b>멤버십 가입 안내</b>
                    </h1>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body p-4 mb-2">
                    <div class="mb-3">
                      <h5 style="color: #d4af37" class="mb-3">
                        <b>가입내용</b>
                      </h5>
                      <div>
                        구디샵에서 제공하는 다양한 혜택과 좋은 캠페인에 참여할
                        수 있는 기회를 드립니다!
                      </div>
                    </div>
                    <div style="margin-bottom: 150px">
                      <h5 style="color: #d4af37" class="mb-3">
                        <b>가입혜택</b>
                      </h5>
                      <div class="pb-1" style="font-size: 14px">
                        ✨ VIP회원은 등급제한 캠페인에 참여할 수 있어 남들보다
                        더 많은 캠페인에 참여 가능!
                      </div>
                      <div style="font-size: 14px" class="pb-2 pt-1">
                        ✨ 포인트 적립 시 0.5% 추가적립 팡팡팡!
                      </div>
                      <div class="mb-5" style="font-size: 14px">
                        ✨ 등급제한 캠페인은 실제 구매가가 0원
                      </div>
                    </div>
                    <div class="d-flex justify-content-center">
                      <button
                        class="btn btn-outline-dark"
                        id="membership_joinBtn"
                      >
                        가입하기
                      </button>
                    </div>
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
    <script src="/js/membership.js"></script>
    <script type="text/javascript">
    getVIP();
    </script>
  </body>
</html>