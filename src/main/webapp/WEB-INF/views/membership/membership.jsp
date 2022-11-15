<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MemberShip</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/index.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/login.css" />
  </head>
  <body>
    <section class="container" style="width: 75%">
      <c:import url="../template/top_part.jsp"></c:import>
      <c:import url="../template/header.jsp"></c:import>

      <div
        class="membership_img"
        style="margin-top: 1em; padding: 2em; width: 100%; text-align: center"
      >
        <a
          href=""
          data-bs-toggle="modal"
          data-bs-target="#exampleModal_membership"
          data-bs-whatever="@mdo"
          ><img src="/images/제목을-입력해주세요_-001.jpg" alt="" width="95%"
        /></a>
      </div>

      <!-- 모달창 -->
      <div
        class="modal fade"
        id="exampleModal_membership"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">
                멤버십가입
              </h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <form>
                <div class="mb-3">
                  <label for="recipient-name" class="col-form-label"
                    >가입내용</label
                  >
                  <input type="text" class="form-control" id="recipient-name" />
                </div>
                <div class="mb-3">
                  <label for="message-text" class="col-form-label"
                    >가입혜택</label
                  >
                  <textarea class="form-control" id="message-text"></textarea>
                </div>
                <div class="d-flex justify-content-center">
                  <button class="btn btn-outline-primary">가입하기</button>
                </div>
              </form>
            </div>
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
