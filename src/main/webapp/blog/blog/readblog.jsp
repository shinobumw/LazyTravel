<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lazytravel.blog.entity.*"%>
<%@ page import="com.lazytravel.blog.dao.*"%>
<%@ page import="com.lazytravel.blog.service.*"%>


<%
BlogService blogSvc = new BlogServiceImpl();
List<Blog> list = blogSvc.getAllBlogs();
pageContext.setAttribute("list",list);
%>

<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- CSS only -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
      crossorigin="anonymous" />
    <link rel="icon" href="../../static/images/logo.ico" type="image/x-icon" />
    <style>
      /* .row > div,
      .check {
        background: #ccc;
        border: 2px solid #aaa;
        margin-bottom: 5px;
      }  */
      /* .title {
        color: #6b705c;
        font-feature-settings: "clig" off, "liga" off;
        letter-spacing: -1.1px;
        font: 700 55px/66px Inter, sans-serif;
      } */
      .thumds {
        width: 18px;
      }
    </style>
  </head>
  <body>
    <header id="header"></header>
    <main>
    <c:forEach var="blog" items="${list}">
      <div class="container">
        <div class="row">
          <div class="col my-2">
            <img
              src="../../static/blogimages/�x�����I.jpg"
              class="img-fluid"
              alt="�峹�j��" />
          </div>
        </div>
        <div class="row">
          <div class="col">
            <h5 class="display-6 lead my-2">
              <strong>${blog.getTitle()}</strong>
            </h5>
          </div>
          <div
            class="col-4 d-inline-flex justify-content-center align-items-center">
            <img src="../../static/blogimages/���g.svg" class="thumds" alt="" />
            <p class="m-1 p-1">${blog.likeSum}</p>
            <img
              src="../../static/blogimages/�s����.svg "
              class="thumds"
              alt="" />
            <p class="m-1 p-1">${blog.viewSum}</p>
            <img
              src="../../static/blogimages/UN����.svg"
              class="thumds"
              alt="" />
          </div>
        </div>
        <div class="row-cols-auto d-inline-flex d-flex justify-content-center">
          <div class="col-7">
            <p class="h6 p-2">${blog.createTime}</p>
          </div>

          <div class="col d-inline-flex">
            <p class="p-2">${blog.customer.nickname}</p>
            <img
              src="${blog.customer.avatar}" 
              class="img-fluid p-0 img-thumbnail"
              style="height: 50px"
              alt="" />
          </div>
        </div>
        <hr />
        <div class="row">
          <div class="col">
            <p class="h6 my-3">
              ${blog.content}
            </p>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <p class="h1 my-5"><strong>�d����</strong></p>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="col d-inline-flex">
              <p class="h5">�d�d��</p>
              <p class="h5 text-black-50">��2023�~11��7���o�G</p>
            </div>
            <div class="col">�Pı�ܴ���</div>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col d-inline-flex p-2">
            <p class="p-2">�i�_</p>
            <img
              src="../../static/blogimages/�i�_.png"
              class="img-fluid p-0"
              style="height: 50px"
              alt="" />
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="form-group">
              <input
                type="text"
                class="form-control"
                style="height: 200px"
                id="exampleInput"
                placeholder="�ӯd�Ө��a" />
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <button type="button" class="btn btn-success m-2 float-end">
              Success
            </button>
          </div>
        </div>
      </div>
      </c:forEach>

      <hr />
    </main>
    <footer id="footer"></footer>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script>
      $(function () {
        $("#header").load("../../components/html/header.jsp");
        $("#footer").load("../../components/html/footer.jsp");
      });
    </script>
  </body>
</html>

</html>