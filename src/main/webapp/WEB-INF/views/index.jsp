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
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <link rel="stylesheet" href="/css/header.css" />
  </head>
  <body>
    <section class="container" style="width: 75%">
      <c:import url="./template/top_part.jsp"></c:import>
      <c:import url="./template/header.jsp"></c:import>
      
      <div style="margin-top: 3em; padding-bottom: 70px">
        <div
          style="
            height: 40px;
            font-size: 22px;
            font-weight: 600;
            letter-spacing: -0.03em;
          "
        >
          우리 집 오늘부터 외식없다✋온가족 먹거리🥪
        </div>
        <div class="d-flex justify-content-between" style="height: 380px">
          <!-- 상품1 -->
          <div>
            <div class="d-flex flex-column" style="width: 250px; height: 380px">
              <div
                style="
                  width: 250px;
                  height: 250px;
                  background-image: url(https://cdn.imweb.me/upload/S2017032758d89cbde9730/5c344a55e5613.jpg);
                  background-size: cover;
                  background-repeat: no-repeat;
                  background-position: center;
                "
              ></div>
              <div
                class="d-flex flex-column"
                style="width: 250px; height: 130px"
              >
                <div
                  class="d-flex justify-content-start pt-1"
                  style="font-size: 13.5px"
                >
                  <div style="color: red"><b>쿠팡</b></div>
                  <div class="ps-1 pe-1" style="color: rgb(147, 143, 143)">
                    |
                  </div>
                  <div style="color: rgb(147, 143, 143)">[딜]풀무원</div>
                </div>
                <div class="pb-1 pt-1" style="font-size: 17.5px; height: 50px">
                  <b>[로켓와우 회원만] 떡국(맛집 떡국)</b>
                </div>
                <div
                  class="d-flex justify-content-start pb-1"
                  style="padding-top: 2px"
                >
                  <div
                    style="
                      text-decoration: line-through;
                      color: grey;
                      font-size: 16px;
                    "
                    class="pe-2"
                  >
                    8800
                  </div>
                  <div class="pe-1" style="font-size: 13px; line-height: 23px">
                    실제구매가
                  </div>
                  <div
                    style="font-size: 17.5px; line-height: 22px; color: blue"
                  >
                    <b>100원</b>
                  </div>
                </div>
                <div class="d-flex justify-content-between">
                  <div style="font-size: 18px; color: blue">
                    <i class="fa-regular fa-clock"></i> <b>3:39:52</b>
                  </div>
                  <div style="font-size: 13px; line-height: 28px; color: gray">
                    마감임박
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 상품2 -->
          <div>
            <div class="d-flex flex-column" style="width: 250px; height: 380px">
              <div
                style="
                  width: 250px;
                  height: 250px;
                  background-image: url(https://cdn.imweb.me/upload/S2017032758d89cbde9730/5c344a55e5613.jpg);
                  background-size: cover;
                  background-repeat: no-repeat;
                  background-position: center;
                "
              ></div>
              <div
                class="d-flex flex-column"
                style="width: 250px; height: 130px"
              >
                <div
                  class="d-flex justify-content-start pt-1"
                  style="font-size: 13.5px"
                >
                  <div style="color: red"><b>쿠팡</b></div>
                  <div class="ps-1 pe-1" style="color: rgb(147, 143, 143)">
                    |
                  </div>
                  <div style="color: rgb(147, 143, 143)">[딜]풀무원</div>
                </div>
                <div class="pb-1 pt-1" style="font-size: 17.5px; height: 50px">
                  <b>[로켓와우 회원만] 떡국dsfdsfdsfdsfdsfsdf</b>
                </div>
                <div
                  class="d-flex justify-content-start pb-1"
                  style="padding-top: 2px"
                >
                  <div
                    style="
                      text-decoration: line-through;
                      color: grey;
                      font-size: 16px;
                    "
                    class="pe-2"
                  >
                    8800
                  </div>
                  <div class="pe-1" style="font-size: 13px; line-height: 23px">
                    실제구매가
                  </div>
                  <div
                    style="font-size: 17.5px; line-height: 22px; color: blue"
                  >
                    <b>100원</b>
                  </div>
                </div>
                <div class="d-flex justify-content-between">
                  <div style="font-size: 18px; color: blue">
                    <i class="fa-regular fa-clock"></i> <b>3:39:52</b>
                  </div>
                  <div style="font-size: 13px; line-height: 28px; color: gray">
                    마감임박
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div>
            <div style="width: 250px; border: solid 2px; height: 380px"></div>
          </div>
          <div>
            <div style="width: 250px; border: solid 2px; height: 380px"></div>
          </div>
        </div>
      </div>

      <div class="home-sub-banner-container">
        <img src="https://cdn.pugshop.co.kr/bannerImages/1666257682407" />
      </div>

      <div style="margin-top: 3em; padding-bottom: 70px">
        <div class="d-flex justify-content-between">
          <div
            style="
              height: 40px;
              font-size: 22px;
              font-weight: 600;
              letter-spacing: -0.03em;
            "
          >
            MD PICK! 추천 캠페인
          </div>
          <div class="more">
            더보기
            <i
              class="fa-solid fa-circle-chevron-right"
              style="color: rgb(130, 203, 41)"
            ></i>
          </div>
        </div>
        <div style="height: 380px; border: solid 1px">물건넣기</div>
      </div>

      <div style="margin-top: 3em; padding-bottom: 70px">
        <div class="d-flex justify-content-between">
          <div
            style="
              height: 40px;
              font-size: 22px;
              font-weight: 600;
              letter-spacing: -0.03em;
            "
          >
            실시간 인기 캠페인!
          </div>
          <div class="more">
            더보기
            <i
              class="fa-solid fa-circle-chevron-right"
              style="color: rgb(130, 203, 41)"
            ></i>
          </div>
        </div>
        <div style="height: 380px; border: solid 1px">물건넣기</div>
      </div>

      <div style="margin-top: 3em; padding-bottom: 70px">
        <div class="d-flex justify-content-between">
          <div
            style="
              height: 40px;
              font-size: 22px;
              font-weight: 600;
              letter-spacing: -0.03em;
            "
          >
            마감 임박 캠페인, 놓치지 마세요!
          </div>
          <div class="more">
            더보기
            <i
              class="fa-solid fa-circle-chevron-right"
              style="color: rgb(130, 203, 41)"
            ></i>
          </div>
        </div>
        <div style="height: 380px; border: solid 1px">물건넣기</div>
      </div>

      <div style="margin-top: 3em; padding-bottom: 70px">
        <div class="d-flex justify-content-between">
          <div
            style="
              height: 40px;
              font-size: 22px;
              font-weight: 600;
              letter-spacing: -0.03em;
            "
          >
            지금 당첨 확률 높은 캠페인
          </div>
          <div class="more">
            더보기
            <i
              class="fa-solid fa-circle-chevron-right"
              style="color: rgb(130, 203, 41)"
            ></i>
          </div>
        </div>
        <div style="height: 380px; border: solid 1px">물건넣기</div>
      </div>

    <!-- 챗봇 -->
    <div>
      <div id="chat_ev" style="display: none">궁금한 부분 질문주세요!</div>
      <a class="btn" id="chat_bot">
        <img id="chat_img" src="/images/16208041651620804165203.png" />
        <div class="pt-2"><b>구디 챗봇</b></div>
        <span
          class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 13px;"
          >+0 <span class="visually-hidden">unread messages</span></span
        ></a
      >
    </div>

      <c:import url="./template/footer.jsp"></c:import>
    </section>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://kit.fontawesome.com/6e23c67242.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/index.js"></script>
  </body>
</html>
