<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/login.css" />
    <link rel="stylesheet" href="../css/board.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="/js/notice/update.js"></script>
     <!-- include summernote css/js-->
	 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  </head>
  <body>
    <section class="container" style="width: 75%">
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
      
      <div class="container">
        <div class="content d-flex">
          <div class="sidebar">
            <div style="height: 260px; width: 220px">
              <div class="list_top p-3 mt-4">고객센터</div>
              <ol class="list-group list-group-flush">
                <li class="list-group-item">
                  <i class="fa-solid fa-headphones ps-2 pe-3"></i>공지사항
                </li>
                <li class="list-group-item">
                  <i class="fa-solid fa-circle-question ps-2 pe-3"></i
                  >자주묻는질문
                </li>
                <li class="list-group-item">
                  <i class="fa-solid fa-circle-info ps-2 pe-3"></i>1대 1문의
                </li>
              </ol>
            </div>
          </div>
          <div style="width: 100%;">
            <div class="board_top p-3 mt-3 mb-3">게시글 수정</div>

            <form action="update" method="post" enctype="multipart/form-data" id="form">
              <sec:authentication property="Principal" var="user"/>
              <div style="width: 100%;">
                    <input type="text" name="noticeNum" id="noticeNum" value="${noticeVO.noticeNum}" hidden>
                    <input type="text" style="width: 100%; margin-bottom: 8px;" value="${noticeVO.title}" id="title" name="title" placeholder="제목을 입력하세요">
                    <input type="text" style="width: 100%;" value="${user.id}" id="id" name="id" hidden>
                </div>
                <div>
                    <input  type="file" name="files" id="files" class="files form-control form-control-sm" multiple>
                </div> 

                <!-- <div class="file_drag" id="file_drag" ondrop="drop(event)" ondragover="allowDrop(event)"> -->
                <div class="file_drag" id="file_drag">
               
	                  <div id="plz_drag"><i class="bi bi-plus-circle-dotted"></i> 파일을 마우스로 끌어 오세요</div>
                 
	                  <div class="file_list_header">
	                    <div class="file_list_header_task">
	                      <button class="btn" type="button" id="removeAll_button"><span class="blind"><i class="bi bi-x-circle"></i></span></button>
	                    </div>
	                    <div class="file_list_header_title"><strong class="text">파일명</strong></div>
	                    <!-- <div class="file_list_header_status"><span class="text">업로드 상태</span></div> -->
	                    <div class="file_list_header_volume"><strong class="text">총용량 </strong><strong id="fileSize">0</strong></div>
	                  </div>
	
	                  <ul id="fileList">
	        
	                  </ul>
                  
                </div>
            
                
                <textarea name="contents" id="summernote" value="${noticeVO.contents}">${noticeVO.contents}</textarea>

                <button type="submit" class="btn btn-success" style="margin-top: 10px;">수정</button>
            </form>

          </div>
        </div>
      </div>
      <c:import url="../template/footer.jsp"></c:import>
    </section>

    <script type="text/javascript">
        $('#summernote').summernote({
            tabsize:4,
            height:250
        })



    </script>

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
