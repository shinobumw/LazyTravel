<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lazytravel.blog.entity.Blog"%>
<%@ page import="com.lazytravel.customer.entity.Customer"%>
<%@ page import="com.lazytravel.blog.service.*"%>
<%@ page import="java.util.List"%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>

<%
Blog blog = (Blog) request.getAttribute("blog");
BlogService blogSvc = new BlogServiceImpl();
List<Blog> list = blogSvc.getAllBlogs();
pageContext.setAttribute("list", list);
String blogImg = request.getContextPath()+ "/blog/blog/BlogImgReader?blogId="+blog.getBlogId();
// Customer customer = (Customer) session.getAttribute("customer");
%>

<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>��x�峹�ק�</title>
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

	<form METHOD="post" ACTION="blog.do" name="form1" enctype="multipart/form-data">
		<div class="container"  >
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
					<input type="text" class="form-control" name="title"
						value="<%=blog.getTitle()%>" aria-label="Recipient's username"
						aria-describedby="button-addon2" />
				</div>
			</div>
			<div class="row">
				<div class="col-3 d-flex align-items-center">
					<p class="h4 mb-0">2.�i�C���:</p>
				</div>
				<div class="col-9 input-group w-50 h-auto m-1">
					<div class="input-group">
					<%
   // �Ыؤ@�ӷ�e�ɶ��� Timestamp ��H
   Timestamp currentTimestamp = new java.sql.Timestamp(System.currentTimeMillis());

   // �ϥ� SimpleDateFormat �N Timestamp �榡�Ƭ��w�����Ҧ�
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   String formattedTimestamp = sdf.format(new Date(currentTimestamp.getTime()));
%>
						<input type="text" class="form-control" id="datepicker"
							name="blog_date"
							value="<%=formattedTimestamp%>"
							placeholder="��ܤ��" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-3 d-flex align-items-center">
					<p class="h4 mb-0">3.�����Ϥ��W��:</p>
				</div>
				<div class="col-7 d-flex align-items-center">
					<div class="input-group mb-3 h-auto mt-3 m-1" style="width: 545px">
						<input type="file" name="blogImg" value="<%=blogImg %>" 
							class="form-control" id="inputGroupFile01" />
					</div>
				</div>
				<div id="preview"  style="text-align: center;">
			<img class="top-50 start-50" src="<%=blogImg %>"  style="width: 545px;height:300px"/>
			</div>
			</div>
		</div>
		<hr />
		<div class="container-fluid">
			<div class="row mx-5">
				<textarea  id="summernote"  name="content" style="height: 100px"><%=blog.getContent()%>
			</textarea>
			<div class="row d-flex">
				<div class="col-10"></div>
				<div class="col-1 justify-content-end d-flex">
					<button type="button" onclick="redirectToMyBlog()" class="btn btn-success">����</button>
				</div>
				<div class="col-1 justify-content-end d-flex">
					<input type="submit" id="saveButton" class="btn btn-success" value="�e�X�ק�">
					<input type="hidden" name="action" value="BackUpdate"> 
					<input type="hidden" name="customer_id" value="<%=blog.getCustomer().getCustomerId()%>" size="45"/>
					<input type="hidden" name="blogId" value="<%=blog.getBlogId()%>">
					<input type="hidden" name="updateTime" value="<%=new java.sql.Timestamp(System.currentTimeMillis())%>">
					<input type="hidden" name="createTime" value="<%=blog.getCreateTime()%>">
					<input type="hidden" name="blogStatus" value="<%=blog.getBlogStatus()%>">
					<input type="hidden" name="viewSum" value="<%=blog.getViewSum()%>">
					<input type="hidden" name="clSum" value="<%=blog.getClSum()%>">
					<input type="hidden" name="likeSum" value="<%=blog.getLikeSum()%>">
					
				</div>
			</div>
		</div>
		</div>
	</form>
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
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script>
		$(function() {
			$("#header").load("../../components/html/header.jsp");
			$("#footer").load("../../components/html/footer.jsp");
		});

		flatpickr("#datepicker", {
			// ��ܾ��t�m�ﶵ�A�i�H�ھڻݭn�i��վ�
			dateFormat : "Y-m-d",
		// ��h�ﶵ�i�H�Ѧ� Flatpickr ����
		});
		
		function redirectToMyBlog() {
	        // �ϥ� window.location.href �N�����ɯ�� myblog.jsp
	        window.location.href = 'myblog.jsp';
	    };
	    
	    $(document).ready(function () {
	        $('.tag-item').on('click', function () {
	            var tagName = $(this).data('name');
	            $('#tagInput').val(tagName);
	        });
	    });
	    
	    let preview_img = function (file) {
	        let reader = new FileReader();
	        reader.readAsDataURL(file);
	        reader.addEventListener("load", function () {
	            <%--let img_src = `<img src="${reader.result}" class="preview_img">`;--%>
	            let img_src = '<img src="' + reader.result + '" class="preview_img" alt="img" style="width: 545px; height: 300px;">';
	            $("#preview").html(img_src);
	        })
	    };
	    
	    $("#inputGroupFile01").on("change", function (e) {
	        // console.log(this);
	        console.log(this.files);

	        if (this.files.length > 0)
	            preview_img(this.files[0]);
	        else
	            $("#preview").html('<span class="text">�w����</span>');
	    });
	    
	    $(document).ready(function() {
	        $('#summernote').summernote();

	        // �ϥ� Ajax �N���e�ǰe����
	        $('#saveButton').click(function() {
	            var summernoteContent = $('#summernote').summernote('code');
	            $.ajax({
	                type: 'POST',
	                url: "/blog/blog/blog.do", // �������A�� Servlet �� URL
	                data: {
	                    content: summernoteContent
	                },
	                success: function(response) {
	                    console.log('���\�x�s���Ʈw');
	                    // �b�o�̳B�z���\�x�s������
	                },
	                error: function(error) {
	                    console.error('�x�s����');
	                    // �b�o�̳B�z���~
	                }
	            });
	        });
	    });
	</script>
</body>
</html>
