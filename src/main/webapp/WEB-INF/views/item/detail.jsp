<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ItemDetail</title>
    
    <c:import url="../template/library.jsp"></c:import>
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <link rel="stylesheet" href="/css/detail.css" />
  </head>
  <body>
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>
    <section class="container" style="width: 75%">
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
              <button class="btn btn-success w-100 mt-3"  data-bs-toggle="modal" data-bs-target="#exampleModal_item" data-bs-whatever="@mdo">지원하기</button>
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
      
      <!-- 모달창 -->
      <div
        class="modal fade"
        id="exampleModal_item"
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
                <b>미션수행카드</b>
              </h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body p-3 mb-2 mt-2">
            	<div class="d-flex justify-content-center" style="text-align: center">
            		<div><div class="mission_order"><span style="color:green">①</span> 구매하기</div><div style="font-size: 13px">미진행</div></div>
            		<div class="solid"></div>
            		<div><div class="mission_order"><span style="color:green">②</span> 리뷰</div><div style="font-size: 13px">미진행</div></div>
            		<div class="solid"></div>
            		<div><div class="mission_order"><span style="color:green">③</span> 포인트수령</div><div style="font-size: 13px">미진행</div></div>
            	</div>
            		<hr/>
            
              <div class="d-flex justify-content-center">
                <button class="btn btn-outline-success" id="withdraw_btn">
                  출금요청
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
      <c:import url="../template/footer.jsp"></c:import>

  </body>
</html>
