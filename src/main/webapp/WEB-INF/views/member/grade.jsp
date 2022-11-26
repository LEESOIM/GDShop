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
  </head>
  <body>
    <section class="container" style="width: 75%">
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
      <div class="container">
        <div class="content d-flex">
          <c:import url="../template/mypage_side.jsp"></c:import>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내등급 상세보기 -->
            <div class="info_top p-2 mt-3 mb-3">
              <div>
                <span style="color: rgb(10, 154, 10)">${memberVO.name}</span
                >님의 등급
              </div>
            </div>
            
            <div id="grade_box">
              <c:forEach items="${sessionScope.member.roleVOs}" var="i">
                	<c:if test="${i.roleName ne 'ROLE_VIP'}">
                		<div
                    class="mb-5"
                    style="
                      text-align: center;
                      color: rgba(139, 139, 139, 0.737);
                      font-size: 14px;
                      padding-top: 13px;
                    "
                  >
                    <div class="mb-2 mt-5">해당 회원의 등급이 없습니다.</div>
                    <div>
                      등급에 따라 캠페인 당첨 확률에 영향을 주지는 않지만,
                      결정된 등급에 따라 참여할 수 있는 캠페인이 제한될 수
                      있습니다.
                    </div>
                    <div class="mt-2">
                      *멤버십 가입 시 VIP등급으로 올릴 수 있습니다. 등급제에
                      관한 자세한 내용은 아래 버튼을 클릭해 주세요.
                    </div>
                    <button
                      type="button"
                      class="btn btn-outline-success btn-sm mt-4"
                      data-bs-toggle="modal"
                      data-bs-target="#exampleModal_membership"
                      data-bs-whatever="@mdo"
                    >
                      멤버십가입 알아보기
                    </button>
                  </div>
                  </c:if>
              </c:forEach>
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
      <c:import url="../template/footer.jsp"></c:import>
    </section>

    <script src="/js/info.js"></script>
    <script type="text/javascript">
    getVIP();
      $("#membership_joinBtn").click(function () {
        alert("결제창으로 이동~~");
      });
    </script>
  </body>
</html>
