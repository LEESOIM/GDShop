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
          <c:import url="../template/mypage_side.jsp"></c:import>
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

    <script src="/js/info.js"></script>
  </body>
</html>
