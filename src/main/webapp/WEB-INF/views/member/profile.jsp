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
            <div class="info_top p-2 mt-4">
              프로필 수정
            </div>
            <div class="p-2" color: #2f4f4f;">구디샵 대표 프로필을 수정 하실 수 있습니다.</div>
            <form action="./profile" method="post" enctype="multipart/form-data">
              <div class="mt-4" style="text-align: center">
                <div class="mt-5" style="height: 150px; margin-bottom: 35px">
                	<div id="image_container"></div>
                  <img
                    src="/file/profile/${memberFileVO.fileName}"
                    style="
                      width: 150px;
                      height: 150px;
                      border-radius: 100px;
                      box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
                    "
                    id="profile_image"
                  />
                </div>
                <div class="d-flex justify-content-center mt-4">
                <sec:authentication property="Principal" var="user"/>
                	<label for="file" class="profile_btn me-2" id="profile_change">사진변경</label>
                	<input type="file" name="file" id="file" style="display: none" onchange="setThumbnail(event)"/>
                	<button type="button" class="profile_btn ms-1 me-2" id="profile_delete">삭제</button>
                	<input type="text" id="sessionId" name="id" value="${user.id}" style="display: none"/>
                	<button class="profile_btn ms-1" id="profile_save" onclick="location.href='/member/mypage'">완료</button>
                </div>
              </div>
             </form>
            <!-- 여기까지!! -->
          </div>
        </div>
      </div>
    </section>
      <c:import url="../template/footer.jsp"></c:import>

    <script src="/js/info.js"></script>
	 <script>
      function setThumbnail(event) {
        let reader = new FileReader();

        reader.onload = function(event) {
          let img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          img.setAttribute("style", "width: 150px;height: 150px;border-radius: 100px;box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;");
          document.querySelector("div#image_container").appendChild(img);
          document.querySelector("#profile_image").setAttribute("style","display:none");
          document.querySelector("#profile_change").setAttribute("style","background-color: #dcdcdc;cursor: not-allowed;"); 
          document.querySelector("#profile_change").setAttribute("style","display:none"); 
          document.querySelector("#profile_save").innerText = "적용"; 
          document.querySelector("#profile_delete").setAttribute("style","display:none");
        };
        reader.readAsDataURL(event.target.files[0]);

      }
    </script>
  </body>
</html>
