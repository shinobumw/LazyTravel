<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.lazytravel.customer.entity.Customer" %>

<%
  Customer customer = (Customer) session.getAttribute("customer");
  String customerAvatar = request.getContextPath() + "/customer/ImageReader?id=" + customer.getCustomerId();
%>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>會員中心</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="icon" href="../static/images/logo.ico" type="image/x-icon">

  <style>
      #preview {
          border: 1px solid lightgray;
          display: inline-block;
          width: 150px;
          min-height: 150px;
          position: relative;
      }

      #preview span.text {
          position: absolute;
          display: inline-block;
          left: 50%;
          top: 50%;
          transform: translate(-50%, -50%);
          z-index: -1;
          color: lightgray;
      }

      #preview img.preview_img {
          width: 100%;
      }
  </style>

</head>

<body>
<header id="header"></header>

<div class="container mx-5 my-3">
  <h2>會員中心</h2>
  <div class="row my-3 d-flex justify-content-around">
    <div class="col-md-4 mb-3">
      <h3>會員資料</h3>
      <div class="row mt-3">
        <label class="col-sm-4 col-form-label">大頭貼</label>
        <div class="col-sm-8">
          <div id="preview">
            <%--            <span class="text">預覽圖</span>--%>
            <img src="<%= customerAvatar %>" class="preview_img" alt="avatar">
          </div>
        </div>
      </div>
      <div class="row">
        <label for="staticId" class="col-sm-4 col-form-label">會員ID</label>
        <div class="col-sm-8">
          <input type="text" readonly class="form-control-plaintext" id="staticId"
                 value="<%= customer.getCustomerId() %>">
        </div>
      </div>
      <div class="row">
        <label for="staticName" class="col-sm-4 col-form-label">姓名</label>
        <div class="col-sm-8">
          <input type="text" readonly class="form-control-plaintext" id="staticName"
                 value="<%= customer.getCustomerName() %>">
        </div>
      </div>
      <div class="row">
        <label for="staticNickname" class="col-sm-4 col-form-label">暱稱</label>
        <div class="col-sm-8">
          <input type="text" readonly class="form-control-plaintext" id="staticNickname"
                 value="<%= customer.getNickname() %>">
        </div>
      </div>
      <div class="row">
        <label for="staticEmail" class="col-sm-4 col-form-label">Email</label>
        <div class="col-sm-8">
          <input type="text" readonly class="form-control-plaintext" id="staticEmail"
                 value="<%= customer.getEmail() %>">
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <h3>服務</h3>
      <ul class="nav flex-column mt-3">
        <li class="nav-item mb-2">
          <a href="<%=request.getContextPath()%>/customerCenter/customer-modify.jsp" class="nav-link p-0 text-muted">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                 class="bi bi-person-fill" viewBox="0 0 16 16">
              <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
            </svg>
            修改會員資料</a>
        </li>
        <li class="nav-item mb-2">
          <a href="<%=request.getContextPath()%>/customerCenter/customer-resetpw.jsp" class="nav-link p-0 text-muted">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill"
                 viewBox="0 0 16 16">
              <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2"/>
            </svg>
            修改密碼</a>
        </li>
        <li class="nav-item mb-2"><a href="<%=request.getContextPath()%>/customerCenter/orderList.jsp" class="nav-link p-0 text-muted">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-fill"
               viewBox="0 0 16 16">
            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4z"/>
          </svg>
          歷史訂單</a>
        </li>
        <li class="nav-item mb-2"><a href="<%=request.getContextPath()%>/customerCenter/coupon.jsp"
                                     class="nav-link p-0 text-muted">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tag-fill"
               viewBox="0 0 16 16">
            <path d="M2 1a1 1 0 0 0-1 1v4.586a1 1 0 0 0 .293.707l7 7a1 1 0 0 0 1.414 0l4.586-4.586a1 1 0 0 0 0-1.414l-7-7A1 1 0 0 0 6.586 1zm4 3.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
          </svg>
          優惠券</a>
        </li>
        <li class="nav-item mb-2"><a href="<%=request.getContextPath()%>/blog/blog/myblog.jsp" class="nav-link p-0 text-muted">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
            <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001"/>
          </svg>
          我的文章</a>
        </li>
      </ul>
    </div>
  </div>
</div>

<footer id="footer"></footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
    $(function () {
        $("#header").load("<%=request.getContextPath()%>/components/html/header.jsp");
        $("#footer").load("<%=request.getContextPath()%>/components/html/footer.jsp");
    });


</script>
</body>

</html>