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
    <link rel="stylesheet" href="/css/detail.css" />
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
            <div style="height: 260px; width: 260px">
              <img
                src="https://www.smlounge.co.kr/upload/woman/article/202003/thumb/44510-407857-sampleM.jpg"
                alt=""
                style="height: 260px; width: 260px"
              />
            </div>
            <div style="height: 260px; width: 260px; border: solid 2px blue">
              <div class="d-flex">
                <div>네이버쇼핑</div>
                <div>|</div>
                <div>가또블랑코</div>
              </div>
              <div>고양이 모래삽 감자스쿱 촘촘삽</div>
              <div style="text-align: right">캠페인번호 : 31955</div>
              <hr style="margin: 0" />
              <div class="mt-4 mb-4">
                <div class="d-flex">
                  <div>결제금액</div>
                  <div>10,900원</div>
                </div>
                <div class="d-flex">
                  <div>결제금액</div>
                  <div>10,900원</div>
                </div>
              </div>
              <hr style="margin: 0" />
              <button class="btn btn-success w-100 mt-3">지원하기</button>
            </div>
          </div>
          <div
            class="d-flex"
            style="
              height: 2000px;
              width: 100%;
              border: solid 2px blue;
              font-size: 20px;
            "
          >
            hhh
            <br />
            <br />
            dfff hhh
            <br />
            <br />
            dfff hhh
            <br />
            <br />
            dfff hhh
            <br />
            <br />
            dfff hhh
            <br />
            <br />
            dfffhhh
            <br />
            <br />
            dfff hhh
            <br />
            <br />
            dfff hhh
            <br />
            <br />
            dfff
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
