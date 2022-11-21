<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MyPage</title>
    
    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel="stylesheet" href="/css/info.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <style>
      #myinfo {
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
            <!-- 여기부터 내정보 상세보기 -->
            <div class="info_top p-2 mt-3 mb-3">
              <span style="color: rgb(10, 154, 10)">${memberVO.name}</span>님의 정보
            </div>
            <div>
              <div style="text-align: center">
                <div class="mt-3" style="height: 150px">
                  <img
                    src="/file/profile/${memberVO.memberFileVO.fileName}"
                    style="
                      width: 135px;
                      height: 135px;
                      border-radius: 100px;
                      box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
                    "
                  />
                  <div class="file_box" onclick="location.href='/member/profile'">
                    <label for="file" class="file" data-bs-custom-class="custom-tooltip" data-toggle="tooltip" data-bs-placement="right" data-bs-title="프로필 사진 변경"
                      ><i
                        class="fa-solid fa-square-pen"
                        style="font-size: 30px"
                      ></i
                    ></label>
                  </div>
                </div>
                <div>
                  <h4><b>${memberVO.id}</b></h4>
                </div>
                <div style="color: gray; margin-top: -5px">
                  ${memberVO.email}
                </div>
              </div>
              <!-- 정보상자1 -->
              <div class="d-flex justify-content-between mt-5">
                <div class="board_box">
                  <div class="mt-1 mb-2" style="font-size: 17px">
                    <b>기본정보</b>
                  </div>
                  <div>이름 : ${memberVO.name}</div>
                  <div>
                    <i class="fa-solid fa-calendar-days pe-1"></i> ${memberVO.birth}
                  </div>
                  <div>
                    <i class="fa-solid fa-mobile-screen-button pe-2"></i>
                    ${memberVO.phone}
                  </div>
                  <div>
                    <i class="fa-regular fa-envelope pe-1"></i> ${memberVO.email}
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
              <div class="d-flex justify-content-between mt-5 mb-3">
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

	<!-- 툴팁 활성화 -->
	 <script>
	  $(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	  });
	</script>
    <script src="/js/info.js"></script>
  </body>
</html>
