<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 75%">
      <div class="container">
        <div class="content d-flex">
          <c:import url="../template/mypage_side.jsp"></c:import>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내포인트 상세보기 -->
            <div class="info_top d-flex p-2 mt-4 mb-3">
              <div>
                <span style="color: rgb(10, 154, 10)">${memberVO.name}</span>님의 포인트
              </div>
              <button class="ms-3" id="withdraw" data-bs-toggle="modal" data-bs-target="#exampleModal_withdraw" data-bs-whatever="@mdo">출금요청</button>
            </div>
            <div class="d-flex point_all" style="height: 118px">
              <div
                class="point_box p-4"
                style="border-right: solid 1px lightgray"
              >
                <div class="mb-2">
                  내 포인트 <i class="fa-solid fa-circle-info" data-custom-class="custom-tooltip" data-toggle="tooltip" data-bs-placement="top" data-bs-title="포인트 지급 후 3일이 지나 출금 가능한 포인트"></i>
                </div>
                <div style="color: green">
                <span style="font-size: 26px" id="myPoint">
                <sec:authentication property="Principal" var="user"/>
                <fmt:formatNumber type="number" maxFractionDigits="3" value="${memberVO.point_3}" />
                </span>
                  <i
                    class="fa-brands fa-product-hunt"
                    style="font-size: 21px"
                  ></i>
                </div>
              </div>
              <div
                class="point_box p-4"
                style="border-right: solid 1px lightgray"
              >
                <div class="mb-2">
                  적립 예정 포인트 <i class="fa-solid fa-circle-info" data-toggle="tooltip" data-bs-placement="top" data-custom-class="custom-tooltip" data-bs-title="캠페인 완료 후 포인트가 지급되었으나 3일이 지나지 않은 포인트 (3일 후 출금 가능)"></i>
                </div>
                <div style="color: green">
                  <span style="font-size: 26px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${memberVO.point}" /></span
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
                  출금 예정 포인트 <i class="fa-solid fa-circle-info" data-toggle="tooltip" data-bs-placement="top" data-custom-class="custom-tooltip" data-bs-title="출금 요청한 포인트로 매월 1~14일 요청건은 당월 15일 출금, 15~말일 요청건은 익월 1일에 출금"></i>
                </div>
                <div style="color: green">
                  <span style="font-size: 26px" id="withdraw_sum">${memberVO.point_result}</span
                  ><i
                    class="fa-brands fa-product-hunt ps-1"
                    style="font-size: 21px"
                  ></i>
                </div>
              </div>
              <div class="point_box p-4">
                <div class="mb-2">
                  출금 완료 포인트 <i class="fa-solid fa-circle-info" data-toggle="tooltip" data-bs-placement="top" data-custom-class="custom-tooltip" data-bs-title="출금완료일 기준으로 계산"></i>
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
            <form action="./point" method="get">
            <div class="d-flex justify-content-end">
              <select
                class="order mt-4 form-select"
                aria-label=".form-select-lg example"
                style="width: 120px; font-size: 15px"
                name="order"
              >
                <option class="orders" value="all">전체년도</option>
                <option class="orders" value="2020">2020</option>
                <option class="orders" value="2021">2021</option>
                <option class="orders" value="2022">2022</option>
              </select>
            </div>
            <button id="order_btn" style="display: none">정렬 버튼</button>
            </form>
            <hr />
            <table class="table mb-4" style="text-align: center">
              <thead class="table-light">
                <tr>
                  <th scope="col" style="width: 20%">날짜</th>
                  <th scope="col" style="width: 30%">내용</th>
                  <th scope="col" style="width: 20%">포인트 변화</th>
                  <th scope="col" style="width: 20%">출금(가능)일</th>
                </tr>
              </thead>
              <tbody>
              <!-- 캠페인 번호가 있으면 보이기 ${not empty missionVO.missionNum}-->
              <c:if test="${count ne 0}">
              <c:forEach items="${pointList}" var="list">
                 <tr>
                  <td>${list.finish}</td>
                  <td>${list.title}</td>
                  <c:choose>
                  	<c:when test="${list.status eq 0}">
                  		<td><b style="color:blue">-${list.point}</b></td>
                  	</c:when>
                  	<c:otherwise>                  		
	                  <td><b style="color:green">+${list.point}</b></td>
                  	</c:otherwise>
                  </c:choose>
                  <td>${list.finish_3}</td>
                </tr> 
           	 </c:forEach>
              </c:if>
              </tbody>
            </table>
            <!-- 캠페인 번호가 없으면 보이기 ${empty missionVO.missionNum}-->
            <c:if test="${count eq 0}">
            <div
              class="mb-5"
              style="
                text-align: center;
                color: rgba(139, 139, 139, 0.737);
                font-size: 14px;
                padding-top: 13px;
              "
            >
              <div class="mb-2">포인트 내역이 없습니다.</div>
            </div>
            </c:if>
            
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
            <button type="button" style="display: none" id="point_check"></button>
            
            <!-- 모달창 -->
      <div
        class="modal fade"
        id="exampleModal_withdraw"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div
              class="modal-header"
              style="background-color: #4AB34A; color: white; font-weight: bold"
            >
              <h1 class="modal-title fs-5" id="exampleModalLabel">
                <b>포인트 출금 요청</b>
              </h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body p-3 mb-2 mt-2">
              <div class="d-flex mb-3">
                 <div style="width: 180px; padding-top: 9px"><span style="color: red;">＊</span>출금할 포인트</div>
                   <input id="withdraw_point" type="number" placeholder="출금할 포인트를 입력" class="join_form ps-2"/>
             </div>
             <div class="d-flex mb-4 justify-content-end">
                 <input type="checkbox" class="me-2" id="withdraw_limit" name="limit">최대 금액 입력
             </div>
             <div class="d-flex mb-4">
                 <div style="width: 180px; padding-top: 9px"><span style="color: red;">＊</span>은행 선택</div>
                   <select name="bank" class="join_form ps-2 form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                 <option hidden="hidden" value="은행 선택">은행 선택</option>
                 <option value="기업은행">기업은행</option>
                 <option value="우리은행">우리은행</option>
                 <option value="농협은행">농협은행</option>
                 <option value="국민은행">국민은행</option>
                 <option value="하나은행">하나은행</option>
                 <option value="카카오뱅크">카카오뱅크</option>
                 <option value="토스뱅크">토스뱅크</option>
               </select>   
             </div>
             <div class="d-flex mb-4">
                 <div style="width: 180px; padding-top: 9px"><span style="color: red;">＊</span>예금주 명</div>
                   <input id="bank_name" type="text" placeholder="예금주명 입력" class="join_form ps-2"/>
             </div>
             <div class="d-flex mb-4">
                 <div style="width: 180px; padding-top: 9px"><span style="color: red;">＊</span>계좌번호</div>
                   <input id="account" type="number" placeholder="계좌번호 숫자만 입력" class="join_form ps-2"/>
             </div>
             <div class="d-flex mb-4">
                 <div style="width: 130px; padding-top: 9px"><span style="color: red;">＊</span>외국인여부</div>
                    <div class="select">
                    <input type="radio" id="select" name="nat"><label for="select">내국인</label>
                    <input type="radio" id="select2" name="nat"><label for="select2">외국인</label>
               </div>
             </div>
             
              <div class="mb-3 mt-4">
                <div class="pt-2" style="font-size: 15px; color: #006400">
                  <b>반드시 입력하신 계좌의 예금주와 일치하는 주민등록번호를 입력해 주세요.</b>
                </div>
              </div>
              <div class="mb-4 p-3" style="height: 85px; background-color: #FDF5E6; border-radius: 8px; border: solid 1px #FAC87D;"><span id="withdraw_text">출금 요청한 포인트는 매월 1~14일 요청건은 당월 15일 출금, 15~말일 요청건은 익월 1일에 출금</span></div>
              <div class="d-flex justify-content-center">
                <button class="btn btn-outline-success" id="withdraw_btn">
                  출금요청
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
    
    <!-- 툴팁 활성화 -->
    <script>
     $(document).ready(function(){
       $('[data-toggle="tooltip"]').tooltip();   
     });
   </script>
   <script type="text/javascript">
   const orders = document.getElementsByClassName('orders');
   let o = '${param.order}';

     for(let i =0;i < orders.length;i++){
         if(o == orders[i].value){
           orders[i].selected = true;
           break;
         }  
   }
   </script>
    <script src="/js/info.js"></script>
  </body>
</html>