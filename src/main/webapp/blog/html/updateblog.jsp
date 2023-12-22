<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lazytravel.blog.entity.Blog"%>
<%@ page import="com.lazytravel.customer.entity.Customer"%>

<%
Blog blog = (Blog) request.getAttribute("blog");
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet" />
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
		<div class="container" METHOD="post" ACTION="blog.do" name="form1">
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">�Эץ��H�U���~:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<div class="row">
				<div class="col-9"></div>
				<div class="col w-25 p-0 mt-3">
					<div class="btn-group align-items-end justify-content-end d-flex"
						role="group" aria-label="Basic radio toggle button group"></div>
				</div>
			</div>
			
			<hr />
			
			<div class="row">
				<div class="col-3 d-flex align-items-center">
					<p class="h4 mb-0">1.���D:</p>
				</div>
				<div class="input-group w-50 m-1">
					<input type="text" class="form-control"  name="blog_id"  value="<%=blog.getBlogId()%>" 
						aria-label="Recipient's username" aria-describedby="button-addon2" />
				</div>
			</div>
			<div class="row">
				<div class="col-3 d-flex align-items-center">
					<p class="h4 mb-0">2.�ϰ����:</p>
				</div>
				<div class="col-9 input-group w-50 h-auto m-1">
					<input type="text" class="form-control"
						aria-label="Text input with segmented dropdown button" />

					<button type="button"
						class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split"
						data-bs-toggle="dropdown" aria-expanded="false">
						<span class="visually-hidden"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="#">�x�_</a></li>
						<li><a class="dropdown-item" href="#">���</a></li>
						<li><a class="dropdown-item" href="#">�s��</a></li>
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-3 d-flex align-items-center">
					<p class="h4 mb-0">3.�������O����:</p>
				</div>
				<div class="col-9 input-group w-50 h-auto m-1">
					<input type="text" class="form-control"
						aria-label="Text input with segmented dropdown button" />

					<button type="button"
						class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split"
						data-bs-toggle="dropdown" aria-expanded="false">
						<span class="visually-hidden"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="#">����</a></li>
						<li><a class="dropdown-item" href="#">�~�s��</a></li>
						<li><a class="dropdown-item" href="#">�����Ʋz</a></li>
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-3 d-flex align-items-center">
					<p class="h4 mb-0">4.�i�C���:</p>
				</div>
				<div class="col-9 input-group w-50 h-auto m-1">
					<div class="input-group">
						<input type="text" class="form-control" id="datepicker"
							placeholder="��ܤ��" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-3 d-flex align-items-center">
					<p class="h4 mb-0">5.�����Ϥ��W��:</p>
				</div>
				<div class="col-7 d-flex align-items-center">
					<div class="input-group mb-3 h-auto mt-3 m-1" style="width: 545px">
						<input type="file" class="form-control" id="inputGroupFile01" />
					</div>
				</div>
				<div class="col-2 d-flex align-items-center">
					<button type="button" class="btn btn-success">�����Ϥ�</button>
				</div>
			</div>
		</div>
		<hr />
		<div class="container-fluid">
			<div class="row mx-5">
				<div id="summernote" style="height: 100px">Let'go Travel</div>
			</div>
			<div class="row d-flex">
				<div class="col-10"></div>
				<div class="col-1 justify-content-end d-flex">
					<button type="button" class="btn btn-success">����</button>
				</div>
				<div class="col-1 justify-content-end d-flex">
					<button type="button" class="btn btn-success">�e�X</button>
				</div>
			</div>
		</div>
	</main>
	<img src="/" alt="" />
	<footer id="footer"></footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js">
		$('#summernote').summernote();
	</script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script>
		$(function() {
			$("#header").load("../../components/html/header.html");
			$("#footer").load("../../components/html/footer.html");
		});
		$(document).ready(function() {
			$("#summernote").summernote();
		});

		flatpickr("#datepicker", {
			// ��ܾ��t�m�ﶵ�A�i�H�ھڻݭn�i��վ�
			dateFormat : "Y-m-d",
		// ��h�ﶵ�i�H�Ѧ� Flatpickr ����
		});
	</script>
</body>
</html>
