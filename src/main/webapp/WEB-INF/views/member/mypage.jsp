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
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 75%">
      <div class="container">
        <div class="content d-flex">
          <c:import url="../template/mypage_side.jsp"></c:import>
          <div class="ms-3 mb-2" id="info" style="width: 100%">
            <!-- 여기부터 내정보 상세보기 -->
            <div class="info_top p-2 mt-4 mb-3">
              <span style="color: rgb(10, 154, 10)"><sec:authentication property="Principal.name"/></span>님의 정보
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
                  <h4><b><sec:authentication property="Principal.id"/></b></h4>
                </div>
                <div style="color: gray; margin-top: -5px">
                  <sec:authentication property="Principal.email"/>
                </div>
              </div>
              <!-- 정보상자1 -->
              <div class="d-flex justify-content-between mt-5">
                <div class="board_box">
                  <div class="mt-1 mb-2" style="font-size: 17px">
                    <b>기본정보</b>
                  </div>
                  <div>이름 : <sec:authentication property="Principal.name"/></div>
                  <div>
                    <i class="fa-solid fa-calendar-days pe-1"></i> <sec:authentication property="Principal.birth"/>
                  </div>
                  <div>
                    <i class="fa-solid fa-mobile-screen-button pe-2"></i>
                    <sec:authentication property="Principal.phone"/>
                  </div>
                  <div>
                    <i class="fa-regular fa-envelope pe-1"></i> <sec:authentication property="Principal.email"/>
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
                    <b>내 계정정보</b>
                    <div class="d-flex justify-content-center" style="margin-top: 8px">
                    	<sec:authentication property="Principal" var="user"/>
                    	<div class="nickname_box me-2" style="text-align: center; padding: 12px">
                    		<h6><b>COUPANG</b></h6>
                    		<c:choose>
                    			<c:when test="${empty memberVO.nickName}">
		                    		<div id="f_nickName">
			                    		<div style="font-size: 12.5px; background-color: lightgray; width: 35%; margin: 0 auto">미등록</div>
			                    		<div class="mt-1" style="font-size: 12px; color: grey">등록된 계정이 없습니다.</div>
			                    		<div class="d-flex">
			                    		<input type="text" placeholder="닉네임 입력" id="nick_text" name="nickName" style="width: 120px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px; border: none"/><button type="button" id="nick_btn" style="width: 50px; font-size: 12px; border: none; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px; border: none; background-color: #78E150;">요청</button>
			                    		</div>
		                    		</div>
                    			</c:when>
                    			<c:otherwise>
		                    		<div id="t_nickName">
		                    			<div style="padding: 15px"><h5>${memberVO.nickName}</h5></div>
		                    		</div>
                    			</c:otherwise>
                    		</c:choose>
                    	</div>
                    	<div class="nickname_box me-2" style="text-align: center; padding: 12px">
                    		<h6><b>NAVER</b></h6>
                    		<div>
	                    		<div style="font-size: 12.5px; background-color: lightgray; width: 35%; margin: 0 auto">미등록</div>
	                    		<div class="mt-1" style="font-size: 12px; color: grey">등록된 계정이 없습니다.</div>
	                    		<div class="d-flex">
	                    		<input type="text" placeholder="닉네임 입력" style="width: 120px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px; border: none;"/><button type="button" style="width: 50px; font-size: 12px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px; border: none; background-color: #78E150;">요청</button>
	                    		</div>
                    		</div>
                    	</div>
                    </div>
                  </div>
                </div>
                
                <div class="board_box">
                  <div class="mt-1 mb-2" style="font-size: 17px">
                    <b>퀵메뉴</b>
                    <div class="row" style="margin-top: 8px">
                    	<button class="qick col-4" onclick="location.href='/member/point'"><i class="fa-brands fa-product-hunt" style="font-size: 26px;padding: 6px 0px 2px 0px; color: blue"></i><div style="font-size: 10px;">포인트</div></button>
                    	<button class="qick col-4" onclick="location.href='#'"><i class="fa-solid fa-users"  style="font-size: 25px;padding: 6px 0px 2px 0px; color: green"></i><div style="font-size: 10px;">캠페인</div></button>
                    	<button class="qick col-4" onclick="location.href='/member/set'"><i class="fa-solid fa-gear" style="font-size: 25px;padding: 6px 0px 2px 0px; color: grey"></i><div style="font-size: 10px;">설정</div></button>
                    	<button class="qick col-4" onclick="location.href='/member/grade'"><i class="fa-regular fa-credit-card" style="font-size: 25px;padding: 6px 0px 2px 0px; color: #f4c430"></i><div style="font-size: 10px;">멤버십</div></button>
                    	<button class="qick col-4" onclick="location.href='#'"><i class="fa-solid fa-headset" style="font-size: 25px;padding: 6px 0px 2px 0px; color: #323232"></i><div style="font-size: 10px;">1대1문의</div></button>
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
    <script src="/js/info.js"></script>
  </body>
</html>
