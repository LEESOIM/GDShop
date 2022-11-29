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
    <link rel="stylesheet" href="/css/join_end.css" />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
  </head>
  <body>
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 65%">
      <div>
        <div class="p-3 mt-3" style="color: rgb(34, 62, 33)">
          <h3><b>회원가입</b></h3>
        </div>
        <div
          class="d-flex mb-3"
          style="border-bottom: solid 1px rgba(201, 199, 199, 0.716)"
        >
          <div id="order1" class="orders">01 약관동의</div>
          <div id="order2" class="orders">02 개인정보입력</div>
          <div
            id="order3"
            class="orders"
            data-bs-toggle="modal"
            data-bs-target="#exampleModal_1"
          >
            03 가입완료
          </div>
        </div>
        <div
          class="d-flex justify-content-center mt-4"
          style="height: 100px"
        ></div>
      </div>
    </section>
      <c:import url="../template/footer.jsp"></c:import>

    <!-- 가입축하 모달창 -->
    <div
      class="modal fade"
      id="exampleModal_1"
      tabindex="-1"
      data-bs-backdrop="static"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
          <div class="modal-body">
            <div><img src="/images/가입축하.jpg" alt="" style="width: 100%" /></div>
          </div>
          <div class="d-flex justify-content-end pb-4 ps-4 pe-4">
            <button
              type="button"
              class="btn btn-success"
              style="border-radius: 18px; padding: 6px 18px"
              data-bs-dismiss="modal"
              onclick="location.href='/'"
            >
              확인
            </button>
          </div>
        </div>
      </div>
    </div>


    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://kit.fontawesome.com/6e23c67242.js"
      crossorigin="anonymous"
    ></script>
    <script>
      document.getElementById("order3").click();
    </script>
  </body>
</html>
