<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lazytravel.blog.entity.*"%>
<%@ page import="com.lazytravel.blog.dao.*"%>
<%@ page import="com.lazytravel.blog.service.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
BlogMsgService blogMsgSvc = new BlogMsgServiceImpl();
List<BlogMsg> list = blogMsgSvc.getAllBlogMsgs();
pageContext.setAttribute("list",list);
%>


<html>

<head>
	<title>�Ҧ��峹��� - listAllBlogMsg.jsp</title>

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
			<h3>�Ҧ��d����� - listAllBlogMsg.jsp</h3>
			
			<h4><a href="blogMsg_select_page.jsp"><img src=".../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
		</td></tr>
	</table>

	<table>
		<tr>
			<th>�d��ID</th>
			<th>�d������</th>
			<th>�峹ID</th>
			<th>�|��ID</th>
			<th>�o���ɶ�</th>
		</tr>
<%--		<%@ include file="page1.file" %>--%>
<%--		<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">--%>
		<c:forEach var="blog_msg" items="${list}">
			<tr>
				<td>${blog_msg.getBlogMsgId()}</td>
				<td>${blog_msg.content}</td>
				<td>${blog_msg.blog.blogId}</td>
				<td>${blog_msg.customer.customerId}</td>
				<td>${blog_msg.createTime}</td>
				<td>
				
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/blog/blogmsg/blogMsg.do" style="margin-bottom: 0px;">
					 <input type="submit" value="�ק�">
					 <input type="hidden" name="blog_msg_id"  value="${blog_msg.getBlogMsgId()}">
					 <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
				</td>
				<td>
				
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/blog/blogmsg/blogMsg.do" style="margin-bottom: 0px;">
					 <input type="submit" value="�R��">
					 <input type="hidden" name="blog_msg_id"  value="${blog_msg.getBlogMsgId()}">
					 <input type="hidden" name="action"	value="delete"></FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
<%--	<%@ include file="page2.file" %>--%>

</body>

</html>