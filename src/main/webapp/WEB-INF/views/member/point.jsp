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
    <style>
      #mypoint {
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
                  <a href="./grade" style="text-decoration: none">
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
            <!-- 여기부터 내포인트 상세보기 -->
            <div class="info_top d-flex p-2 mt-3 mb-3">
              <div>
                <span style="color: rgb(10, 154, 10)">김설희</span>님의 포인트
              </div>
              <button class="ms-3" id="withdraw">출금요청</button>
            </div>
            <div class="d-flex point_all" style="height: 118px">
              <div
                class="point_box p-4"
                style="border-right: solid 1px lightgray"
              >
                <div class="mb-2">
                  내 포인트 <i class="fa-solid fa-circle-info"></i>
                </div>
                <div style="color: green">
                  <span style="font-size: 26px">0</span
                  ><i
                    class="fa-brands fa-product-hunt ps-1"
                    style="font-size: 21px"
                  ></i>
                </div>
              </div>
              <div
                class="point_box p-4"
                style="border-right: solid 1px lightgray"
              >
                <div class="mb-2">
                  적립 예정 포인트 <i class="fa-solid fa-circle-info"></i>
                </div>
                <div style="color: green">
                  <span style="font-size: 26px">0</span
                  ><i
                    class="fa-brands fa-product-hunt ps-1"
                    style="font-size: 21px"
                  ></i>
                </div>
              </div>
              <div
                class="point_box p-4"
                style="border-right: solid 1px lightgray"
              >
                <div class="mb-2">
                  출금 예정 포인트 <i class="fa-solid fa-circle-info"></i>
                </div>
                <div style="color: green">
                  <span style="font-size: 26px">0</span
                  ><i
                    class="fa-brands fa-product-hunt ps-1"
                    style="font-size: 21px"
                  ></i>
                </div>
              </div>
              <div class="point_box p-4">
                <div class="mb-2">
                  출금 완료 포인트 <i class="fa-solid fa-circle-info"></i>
                </div>
                <div style="color: green">
                  <span style="font-size: 26px">0</span
                  ><i
                    class="fa-brands fa-product-hunt ps-1"
                    style="font-size: 21px"
                  ></i>
                </div>
              </div>
            </div>
            <div class="d-flex justify-content-end">
              <select
                class="mt-4 form-select"
                aria-label=".form-select-lg example"
                style="width: 120px; font-size: 15px"
              >
                <option selected>전체년도</option>
                <option value="1">2020</option>
                <option value="2">2021</option>
                <option value="3">2022</option>
              </select>
            </div>
            <hr />
            <table class="table">
              <thead class="table-light">
                <tr>
                  <th scope="col">날짜</th>
                  <th scope="col">내용</th>
                  <th scope="col">포인트 변화</th>
                  <th scope="col">출금 (가능)일</th>
                  <th scope="col">잔액 포인트</th>
                </tr>
              </thead>
              <tbody style="display: none">
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>@mdo</td>
                </tr>
              </tbody>
            </table>
            <div
              class="mb-5"
              style="
                text-align: center;
                color: rgba(139, 139, 139, 0.737);
                font-size: 14px;
                padding-top: 13px;
              "
            >
              <div class="mb-2">해당 연도의 포인트 내역이 없습니다.</div>
              <div>
                화면 상단의 출금 완료 포인트 옆에 화살표를 클릭해 연도 설정이
                가능합니다.
              </div>
            </div>
            <!-- 포인트 안내 -->
            <div class="mb-3">
              <div
                class="p-2"
                style="
                  border-radius: 1px;
                  box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px,
                    rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
                "
              >
                <div class="d-flex">
                  <div class="pt-1 pb-1">
                    <button
                      class="t_btn"
                      style="
                        border: none;
                        background-color: transparent;
                        width: 2em;
                      "
                    >
                      <i
                        class="minus fa-solid fa-minus"
                        style="display: none; color: green"
                      ></i
                      ><i
                        class="plus fa-solid fa-plus"
                        style="color: green"
                      ></i>
                    </button>
                  </div>
                  <div
                    class="flex-fill pt-1 pb-1"
                    style="background-color: white"
                  >
                    포인트안내
                  </div>
                </div>
                <hr class="line_box" style="display: none" />
                <ul
                  class="pt-2 toggle_box"
                  style="
                    padding-right: 20px;
                    display: none;
                    background-color: white;
                    font-size: 14px;
                    color: gray;
                  "
                >
                  <span>내 포인트</span>
                  포인트 지급 후 3일이 지나 출금이 가능한 포인트입니다.
                  <span style="padding-top: 5px">적립 예정 포인트</span>
                  캠페인 완료 후 포인트가 지급되었으나 3일이 지나지 않은
                  포인트입니다.
                  <div>적립 예정 포인트는 3일 후 출금할 수 있습니다.</div>
                  <span style="padding-top: 5px">출금 예정 포인트</span>
                  회원님이 출금을 요청한 포인트입니다.
                  <span style="padding-top: 5px">출금 완료 포인트</span>
                  년도별 출금을 신청한 포인트 입니다.
                </ul>
              </div>
              <div
                class="p-2"
                style="
                  border-radius: 1px;
                  box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px,
                    rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
                "
              >
                <div class="d-flex">
                  <div class="pt-1 pb-1">
                    <button
                      class="t_btn"
                      style="
                        border: none;
                        background-color: transparent;
                        width: 2em;
                      "
                    >
                      <i
                        class="minus fa-solid fa-minus"
                        style="display: none; color: green"
                      ></i
                      ><i
                        class="plus fa-solid fa-plus"
                        style="color: green"
                      ></i>
                    </button>
                  </div>
                  <div
                    class="flex-fill pt-1 pb-1"
                    style="background-color: white"
                  >
                    출금안내
                  </div>
                </div>
                <hr class="line_box" style="display: none" />
                <ul
                  class="pt-2 toggle_box"
                  style="
                    padding-right: 20px;
                    display: none;
                    background-color: white;
                    font-size: 14px;
                    color: gray;
                  "
                >
                  매월 1일~14일에 요청하신 출금은 당월 14일 이후 첫 영업일에
                  출금되며, 15일~말일에 요청하신 출금은 익월 첫 영업일에
                  출금됩니다.
                </ul>
              </div>
              <div
                class="p-2"
                style="
                  border-radius: 1px;
                  box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px,
                    rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
                "
              >
                <div class="d-flex">
                  <div class="pt-1 pb-1">
                    <button
                      class="t_btn"
                      style="
                        border: none;
                        background-color: transparent;
                        width: 2em;
                      "
                    >
                      <i
                        class="minus fa-solid fa-minus"
                        style="display: none; color: green"
                      ></i
                      ><i
                        class="plus fa-solid fa-plus"
                        style="color: green"
                      ></i>
                    </button>
                  </div>
                  <div
                    class="flex-fill pt-1 pb-1"
                    style="background-color: white"
                  >
                    유효기간안내
                  </div>
                </div>
                <hr class="line_box" style="display: none" />
                <ul
                  class="pt-2 toggle_box"
                  style="
                    padding-right: 20px;
                    display: none;
                    background-color: white;
                    font-size: 14px;
                    color: gray;
                  "
                >
                  포인트의 유효기간은 적립일로부터 5년이며, 유효기간이 경과된
                  포인트는 소멸됩니다.
                </ul>
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
    <script src="/js/info.js"></script>
  </body>
</html>
