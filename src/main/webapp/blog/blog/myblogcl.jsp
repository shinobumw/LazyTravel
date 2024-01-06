<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lazytravel.blog.entity.*"%>
<%@ page import="com.lazytravel.blog.dao.*"%>
<%@ page import="com.lazytravel.blog.service.*"%>
<%@ page import="com.lazytravel.customer.entity.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ page import="java.util.Set"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
BlogService blogSvc = new BlogServiceImpl();
BlogLikeService blogLikeSvc = new BlogLikeServiceImpl();
// BlogClService blogClSvc = new BlogClServiceImpl();
List<Blog>  list = null;

Customer customer = (Customer) session.getAttribute("customer");
Integer customerId = (customer != null) ? customer.getCustomerId() : 0;


if (customer != null) {
    list = blogSvc.getBlogClByCustomerId((Integer)customer.getCustomerId());
} else {
    // �p�G�|�����n�J�A�ɦV�n�J����
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}
pageContext.setAttribute("list", list);
%>


<html>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>�ڪ����æC��</title>
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

.dashed-border {
	border: 2px dashed #757d86; /* ��u���e�סB�˦��M�C�� */
	padding: 10px; /* �i�H�K�[�@�Ǥ���Z�H�Ϥ��e���K����� */
}
</style>
</head>
<body>
	<header id="header"></header>

	<div class="container">
		<div class="row my-3">
			<div class="col">
				<h1 class="title">�ڪ����æC��</h1>
			</div>
		</div>

		<div class="row ">
					<div class="col-9  d-inline-flex">
						
					</div>


			<div class="col-3 d-flex justify-content-end w-25 p-0">
						<div class="btn-group" role="group"
							aria-label="Basic radio toggle button group">
							<input type="radio" class="btn-check" name="btnradio"
								id="btnradio1" autocomplete="off" checked /> 
								<label
								class="btn btn-outline-primary" for="btnradio1"style="background: #6B705C;border-color: transparent;color: white;border-radius: 90px;"onclick=" ToBlogFirst()">�峹�C��</label> 
								<input
								type="radio" class="btn-check" name="btnradio" id="btnradio2" style="background: #CCD5AE;border-color: transparent;color: white"
								autocomplete="off" /> 
								<label class="btn btn-outline-primary" for="btnradio2" style="background: #6B705C;border-color: transparent;color: white;border-radius: 90px;" onclick=" ToMyBlog()">�ڪ��峹</label> 
								<input type="radio" style="background: #CCD5AE;border-color: transparent;color: white"
								class="btn-check" name="btnradio" id="btnradio3"
								autocomplete="off" /> <label class="btn btn-outline-primary" style="background: #6B705C;border-color: transparent;color: white;border-radius: 90px;"
								for="btnradio3">�峹����</label>
						</div>
			</div>
		</div>



		<hr />
		<div class="container">
	    <div class="row" >
	        <c:forEach var="blog" items="${list}">
	        <c:if test="${blog.blogStatus ne 0}">
	        <c:set var="foundClStatus" value="false" />
	        <c:forEach var="blogCl" items="${blog.blogCls}">
	        <c:if test="${blogCl.customer.customerId eq customer.customerId and blogCl.blogClStatus eq '1' and foundClStatus eq 'false'}">
	            <div class="col-md-4" id="blogCard-${blog.blogId}">
	                <div class="card" style="width: 22rem;height: 450px; margin: 10px;">
	                <img class="card-img-top" src="<%=request.getContextPath()%>/blog/blog/BlogImgReader?blogId=${blog.blogId}" style="width: 351px; height: 160px;" />
	                    <div class="card-body p">
	                       <h5 class="card-title"style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${blog.title}</h5>
	                        <div class="d-inline-flex">
	                            <p class="h6"></p>
	                        </div>
	                        <div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
	                        <c:set var="formattedDate">
    							<fmt:formatDate value="${blog.blogDate}" pattern="yyyy-MM-dd HH:mm"/>
								</c:set>
								<p class="h6">${formattedDate}</p>
	                        <p class="card-text">${fn:substring(blog.content, 0, 25)}${fn:length(blog.content) > 25 ? '...' : ''}</p>
	                        <div class="d-flex justify-content-end align-items-center">
	                            <div class="col-md-3 pr-0">
	                                <p>${blog.customer.customerName}</p>
	                            </div>
	                            <div class="col-md-5 p-0">
	                            <img class="card-img-top" src="<%=request.getContextPath()%>/customer/ImageReader?id=${blog.customer.customerId}" style=" width: 50%; height: 70px; "alt="${blog.customer.customerName}" />
	                            </div>
	                            <div class="col-md-4 d-inline-flex align-items-center">
	                            
	                            
	                                <button type="button" class="blogLikeSubmit P-1"
												data-blogid="${blog.blogId}"
												style="border: none; background: none; padding: 0;">
												<c:choose>
													<c:when test="${not empty blog.blogLikes}">
														<c:set var="foundLike" value="false" />
														<c:forEach var="blogLike" items="${blog.blogLikes}">
															<c:if
 																test="${blogLike.customer.customerId eq customer.customerId and blogLike.blogLikeStatus eq '1' and foundLike eq 'false'}"> 
<!-- 																��ܤw���ê��ϥ� -->
																<img src="../../static/blogimages/�w�g.svg" id="updateblogLike" class="thumds m-0 blogLike"
												alt="�g" />
																<c:set var="foundLike" value="true" />
															</c:if>
														</c:forEach>
<!-- 														�p�G�䤣�즬�áA��ܥ����ê��ϥ� -->
														<c:if test="${foundLike eq 'false'}">
															<img src="../../static/blogimages/���g.svg" id="updateblogLike" class="thumds m-0 blogLike"
												alt="�g" />
														</c:if>
													</c:when>
													<c:otherwise>
<!-- 														��ܥ����ê��ϥ� -->
														<img src="../../static/blogimages/���g.svg" id="updateblogLike" class="thumds m-0 blogLike" 
												alt="�g" />
													</c:otherwise>
												</c:choose>
												<input type="hidden" id="blogId" value="${blog.blogId}" />
											</button>
	                                
	                                <button type="button" class="blogClSubmit"
												data-blogid="${blog.blogId}"
												style="border: none; background: none; padding: 0;">
												<c:choose>
													<c:when test="${not empty blog.blogCls}">
														<c:set var="foundFavorite" value="false" />
														<c:forEach var="blogCl" items="${blog.blogCls}">
															<c:if
																test="${blogCl.customer.customerId eq customer.customerId and blogCl.blogClStatus eq '1' and foundFavorite eq 'false'}">
																<!-- ��ܤw���ê��ϥ� -->
																<img src="../../static/blogimages/ON����.svg"
																	id="updateblogCl" class="thumds m-0 blogCl" alt="����" />
																<c:set var="foundFavorite" value="true" />
															</c:if>
														</c:forEach>
														<!-- �p�G�䤣�즬�áA��ܥ����ê��ϥ� -->
														<c:if test="${foundFavorite eq 'false'}">
															<img src="../../static/blogimages/UN����.svg"
																id="updateblogCl" class="thumds m-0 blogCl" alt="����" />
														</c:if>
													</c:when>
													<c:otherwise>
														<!-- ��ܥ����ê��ϥ� -->
														<img src="../../static/blogimages/UN����.svg"
															id="updateblogCl" class="thumds m-0 blogCl" alt="����" />
													</c:otherwise>
												</c:choose>
												<input type="hidden" id="blogId" value="${blog.blogId}" />
											</button>
	                                
	                                <img src="../../static/blogimages/�s����.svg " class="thumds" alt="view"  />
	                                <p class="m-1 p-1">${blog.viewSum}</p>
	                            </div>
	                        </div>
	                        <form class=" row d-flex justify-content-end" METHOD="post" ACTION="blog.do" style="margin-bottom: 0px;">
	                        <input type="hidden"  name="blogId" value="${blog.blogId}">
	                        <input type="hidden" name="action" value="getOne_For_Display">
 						   <input type="submit"  value="�ݧ�h" class="btn btn-primary m-1 p-1" style="background: #9C6644;border-color: transparent;color: white;width: 100px;height: 30px">
	                    </form>
	                    		</div>
	                </div>
	            </div>
	             </c:if>
	        </c:forEach>
	             </c:if>
	        </c:forEach>
	    </div>
	</div>
				
				
			</div>





		<footer id="footer"></footer>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		<script>
			$(function() {
				$("#header").load("../../components/html/header.jsp");
				$("#footer").load("../../components/html/footer.jsp");
			});
			
		    
		    function ToBlogFirst() {
		        // �ϥ� window.location.href �N�����ɯ�� myblog.jsp
		        window.location.href = 'blogfirst.jsp';
		    };
		    function ToMyBlog() {
		        // �ϥ� window.location.href �N�����ɯ�� myblog.jsp
		        window.location.href = 'myblog.jsp';
		    };
		    
		    $(document).ready(function () {
				$(document).on('click', '.blogClSubmit', function (e){
					e.stopPropagation();
			    	var customerId = parseInt("<%=customerId%>", 10);
			    	var blogId = $(this).data('blogid');
				
			        // �ˬd�Τ�O�_�w�n�J
			        if (customerId === 0 || customerId === "") {
			            alert("�Х��n�J�~�ব�áC");
			            console.log(customerId);
			        } else {
			            // �ϥ� AJAX �N���ê���T�ǰe����
			            var dataToSend = {
			                "action" : "toggleFavorite",
			                blogId: $(this).data('blogid'),
			                customerId: customerId
			            };

			            $.ajax({
			                type: "POST",
			                url: "<%=request.getContextPath()%>/blog/blog/blog.do",
			                data: JSON.stringify(dataToSend),
			                contentType: "application/json; charset=utf-8",
			                dataType: "json",
			                success: function (response) {
			                	if (response.result === 'success') {
			                		var updateblogCl = $('#blogCard-' + blogId + ' .blogClSubmit .blogCl');
			                		console.log(updateblogCl)
			                		if (response.blogclstatus === '0' || response.blogclstatus === 'novalue') {
			                            updateblogCl.prop('src', "../../static/blogimages/ON����.svg");
			                        } else {
			                            updateblogCl.prop('src', "../../static/blogimages/UN����.svg");
			                        }
			                        // �B�z���\���޿�
			                        console.log('���\�G', response);
			                    } else {
			                        // �B�z���Ѫ��޿�
			                        console.error('���~�G', response.error);
			                    }
			                }
// 			                error: function (xhr, s, error) {
// 			                    alert(xhr.status);
// 			                    alert(xhr.readyState);
// 			                }
			            });
			        }
			    });
			});
		    
		    
			$(document).ready(function () {
				$(document).on('click', '.blogLikeSubmit', function (e){
					e.stopPropagation();
			    	var customerId = parseInt("<%=customerId%>", 10);
			    	var blogId = $(this).data('blogid');
			    	console.log(updateblogLike);
				
			        // �ˬd�Τ�O�_�w�n�J
			        if (customerId === 0 || customerId === "") {
			            alert("�Х��n�J�~�ব�áC");
			            console.log(customerId);
			        } else {
			            // �ϥ� AJAX �N���ê���T�ǰe����
			            var dataToSend = {
			                "action" : "toggleLike",
			                blogId: $(this).data('blogid'),
			                customerId: customerId
			            };

			            $.ajax({
			                type: "POST",
			                url: "<%=request.getContextPath()%>/blog/blog/blog.do",
			                data: JSON.stringify(dataToSend),
			                contentType: "application/json; charset=utf-8",
			                dataType: "json",
			                success: function (response) {
			                	if (response.result === 'success') {
			                		var updateblogLike = $('#blogCard-' + blogId + ' .blogLikeSubmit .blogLike');
			                		console.log(updateblogLike)
			                		if (response.blogLikeStatus === '0' || response.blogLikeStatus === 'novalue') {
			                            updateblogLike.prop('src', "../../static/blogimages/�w�g.svg");
			                        } else {
			                            updateblogLike.prop('src', "../../static/blogimages/���g.svg");
			                        }
			                        // �B�z���\���޿�
			                        console.log('���\�G', response);
			                    } else {
			                        // �B�z���Ѫ��޿�
			                        console.error('���~�G', response.error);
			                    }
			                }
// 			                error: function (xhr, s, error) {
// 			                    alert(xhr.status);
// 			                    alert(xhr.readyState);
// 			                }
			            });
			        }
			    });
			});
				</script>
</body>
</html>
