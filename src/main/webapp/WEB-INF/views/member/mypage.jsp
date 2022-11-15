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
    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel="stylesheet" href="/css/info.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
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
                <li class="list-group-item">
                  <i class="fa-regular fa-circle-user ps-2 pe-3"></i>내 정보
                </li>
                <li class="list-group-item">
                  <i class="fa-brands fa-product-hunt ps-2 pe-3"></i>내 포인트
                </li>
                <li class="list-group-item">
                  <i class="fa-solid fa-trophy ps-2 pe-3"></i>내 등급
                </li>
                <li class="list-group-item">
                  <i class="fa-solid fa-gears ps-2 pe-3"></i>내 설정
                </li>
                <li class="list-group-item">
                  <i class="fa-brands fa-shopify ps-2 pe-3"></i>내 상품
                </li>
              </ol>
            </div>
          </div>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내정보 상세보기 -->
            <div class="info_top p-2 mt-3 mb-3">
              <span style="color: rgb(10, 154, 10)">김OO</span>님의 정보
            </div>
            <div>
              <div style="text-align: center">
                <div class="mt-3" style="height: 150px;">
                  <img
                    src="/images/user.webp"
                    style="
                      width: 135px;
                      height: 135px;
                      border-radius: 100px;
                      box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
                    "
                  />
                <div class="file_box">
	              <label for="file" class="file"
	                ><i class="fa-solid fa-square-pen" style="font-size: 30px;"></i></label
	              >
	              <input type="file" name="file" id="file" style="display: none" />
	            </div>
                </div>
                <div>
                  <h4><b>tjfl</b></h4>
                </div>
                <div style="color: gray; margin-top: -5px">
                  tjfgml64@nate.com
                </div>
              </div>
              <!-- 정보상자1 -->
              <div class="d-flex justify-content-between mt-5">
                <div class="board_box">
                  <div class="mt-1 mb-2" style="font-size: 17px">
                    <b>기본정보</b>
                  </div>
                  <div>이름 : 김설희</div>
                  <div>
                    <i class="fa-solid fa-calendar-days pe-1"></i> 1996-02-02
                  </div>
                  <div>
                    <i class="fa-solid fa-mobile-screen-button pe-2"></i>
                    010-2616-0000
                  </div>
                  <div>
                    <i class="fa-regular fa-envelope pe-1"></i> tjfl@nate.com
                  </div>
                </div>
                <div class="board_box">
                  <div class="mt-1 mb-2" style="font-size: 17px">
                    <b>내 활동</b>
                  </div>
                  <div class="d-flex">
                    <div class="me-4">
                      <div class="mb-2">캠페인 진행수</div>
                      <div
                        style="
                          text-align: center;
                          font-size: 2.5em;
                          padding: 11px 10px 15px 10px;
                          background-color: rgba(220, 220, 220, 0.37);
                          border-radius: 5px;
                        "
                      >
                        10
                      </div>
                    </div>
                    <div>
                      <div><i class="fa-solid fa-chart-pie pe-2"></i>통계</div>
                      <div
                        style="
                          text-align: center;
                          width: 100%;
                          font-size: 2.5em;
                          padding: 11px 10px 15px 10px;
                          background-color: rgba(220, 220, 220, 0.37);
                          border-radius: 5px;
                        "
                      ></div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 정보상자2 -->
              <div class="d-flex justify-content-between mt-5">
                <div class="board_box">
                  <div class="mt-1 mb-2" style="font-size: 17px">
                    <b>진행중인 미션</b>
                  </div>
                </div>
                <div class="board_box">
                  <div class="mt-1 mb-2" style="font-size: 17px">
                    <b>종료 된 미션</b>
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

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://kit.fontawesome.com/6e23c67242.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
