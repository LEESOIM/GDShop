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
          <div class="sidebar">
            <div style="height: 260px; width: 250px">
              <div class="list_top p-3 mt-4 d-flex">
                <img
                  src="/images/user.webp"
                  style="
                    width: 40px;
                    height: 40px;
                    border-radius: 25px;
                    margin-top: 1.9px;
                  "
                />
                <div class="ms-2">
                  <div><span style="color: green">김OO</span> 회원님,</div>
                  <div>커피 한 잔과 구디샵!</div>
                </div>
              </div>
              <ol class="list-group list-group-flush">
                <form action="mypage" method="get">
                  <a href="./mypage" style="text-decoration: none">
                    <li class="list-group-item" id="myinfo">
                      <i class="fa-regular fa-circle-user ps-2 pe-3"></i>내 정보
                    </li>
                  </a>
                </form>
                <form action="point" method="get">
                  <a href="./point" style="text-decoration: none">
                    <li class="list-group-item" id="mypoint">
                      <i class="fa-brands fa-product-hunt ps-2 pe-3"></i>내
                      포인트
                    </li>
                  </a>
                </form>
                <form action="grade" method="get">
                  <a href="./point" style="text-decoration: none">
                    <li class="list-group-item" id="mygrade">
                      <i class="fa-solid fa-trophy ps-2 pe-3"></i>내 등급
                    </li>
                  </a>
                </form>
                <li class="list-group-item">
                  <i class="fa-solid fa-gears ps-2 pe-3"></i>내 설정
                </li>
                <li class="list-group-item">
                  <i class="fa-solid fa-triangle-exclamation ps-2 pe-3"></i>내
                  경고상태
                </li>
                <li class="list-group-item">
                  <i class="fa-brands fa-shopify ps-2 pe-3"></i>내 상품
                </li>
              </ol>
            </div>
          </div>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내등급 상세보기 -->
            <div class="info_top p-2 mt-3 mb-3">
              <div>
                <span style="color: rgb(10, 154, 10)">김설희</span>님의 등급
              </div>
            </div>
            <!-- 등급이 없는 회원의 경우 -->
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
                등급에 따라 캠페인 당첨 확률에 영향을 주지는 않지만, 결정된
                등급에 따라 참여할 수 있는 캠페인이 제한될 수 있습니다.
              </div>
              <div class="mt-2">
                *멤버십 가입 시 VIP등급으로 올릴 수 있습니다. 등급제에 관한
                자세한 내용은 아래 버튼을 클릭해 주세요.
              </div>
              <button type="button" class="btn btn-outline-success btn-sm mt-4">
                멤버십가입 알아보기
              </button>
            </div>
            <!-- VIP등급 회원일 경우 -->
            <div style="display: none">
              <div class="grade_top mt-3">
                OOO님은 <span>VIP등급</span>입니다.
              </div>
              <hr />
              <div>
                <div>
                  <div style="font-size: 14px">
                    이용기간 : <b>2020-05-22 ~ 2022-06-01</b>
                  </div>
                  <div class="pt-1" style="font-size: 14px">
                    해지일 : <span style="color: red">2022-06-01 해지예정</span>
                  </div>
                </div>
                <hr />
                <div class="pb-2" style="font-size: 16px">🎁 등급 혜택</div>
                <div class="pb-1" style="font-size: 14px">
                  ✅ VIP회원은 등급제한 캠페인에 참여할 수 있어 남들보다 더 많은
                  캠페인에 참여 가능!
                </div>
                <div style="font-size: 14px">
                  ✅ 등급제한 캠페인은 실제 구매가가 0원
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
