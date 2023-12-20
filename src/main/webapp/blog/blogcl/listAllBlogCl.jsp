<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lazytravel.blog.entity.*"%>
<%@ page import="com.lazytravel.blog.dao.*"%>
<%@ page import="com.lazytravel.blog.service.*"%>

<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
BlogClService blogClSvc = new BlogClServiceImpl();
List<BlogCl> list = blogClSvc.getAllBlogCls();
pageContext.setAttribute("list",list);
%>


<html>

<head>
	<title>�Ҧ��峹��� - listAllBlogCl.jsp</title>

	<style>
	  table#table-1 {
		background-color: #CCCCFF;
		border: 2px solid black;
		text-align: center;
	  }
	  table#table-1 h4 {
		color: red;
		display: block;
		margin-bottom: 1px;
	  }
	  h4 {
		color: blue;
		display: inline;
	  }
	</style>

	<style>
	  table {
		/*width: 800px;*/
		background-color: white;
		margin-top: 5px;
		margin-bottom: 5px;
	  }
	  table, th, td {
		border: 1px solid #CCCCFF;
	  }
	  th, td {
		padding: 5px;
		text-align: center;
	  }
	</style>

</head>

<body>

	<h4>�����m�߱ĥ� EL ���g�k����:</h4>
	<table id="table-1">
		<tr><td>
			<h3>�Ҧ��|����� - listAllBlogCl.jsp</h3>
			<h4><a href="blogCl_select_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
		</td></tr>
	</table>

	<table>
		<tr>
			<th>�峹����ID</th>
			<th>�|��ID</th>
			<th>���îɶ�</th>
			<th>�峹ID</th>
			<th>���A</th>
		</tr>
<%--		<%@ include file="page1.file" %>--%>
<%--		<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">--%>
		<c:forEach var="blogCl" items="${list}">
			<tr>
				<td>${blogCl.getBlogClId()}</td>
				<td>${blogCl.customer.customerId}</td>
				<td>${blogCl.likeTime}</td>
				<td>${blogCl.blog.blogId}</td>
				<td>${blogCl.blogClStatus}</td>
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/blog/blogcl/blogCl.do" style="margin-bottom: 0px;">
					 <input type="submit" value="�ק�">
					 <input type="hidden" name="blogClId"  value="${blogCl.blogClId}">
					 <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
<%--	<%@ include file="page2.file" %>--%>

</body>

</html>