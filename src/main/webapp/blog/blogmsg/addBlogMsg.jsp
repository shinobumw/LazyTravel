<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lazytravel.blog.entity.BlogMsg"%>
<%@ page import="com.lazytravel.blog.entity.Blog"%>
<%@ page import="com.lazytravel.customer.entity.Customer"%>

<%
	BlogMsg blogMsg = (BlogMsg) request.getAttribute("blogMsg");
%>

<html>

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title>�峹�s�W - addBlogMsg.jsp</title>

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
		width: 450px;
		background-color: white;
		margin-top: 1px;
		margin-bottom: 1px;
	  }
	  table, th, td {
		border: 0px solid #CCCCFF;
	  }
	  th, td {
		padding: 1px;
	  }
	</style>

</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		<h3>�峹�s�W - addBlogMsg.jsp</h3></td><td>
		<h4><a href="blog/blogmsg/blogMsg_select_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="blogMsg.do" name="form1">
	<table>
		<tr>
			<td>�d��ID:</td>
			<td><input  readonly="readonly"  type="TEXT" name="blog_msg_id" value="<%=  (blogMsg == null)? "1" : blogMsg.getBlogMsgId() %>" size="45"/></td>
		</tr>
		<tr>
			<td>�d������:</td>
			<td><input   type="TEXT" name="content" value="<%= (blogMsg == null)? "XXXXXx" : blogMsg.getContent() %>" size="45"/></td>
		</tr>
		<tr>
			<td>�峹ID:</td>
			<td><input type="TEXT" name="blog_id" value="<%=(blogMsg ==null)? "41001" :  blogMsg.getBlog().getBlogId()%>" size="45"/></td>
		</tr>
		<tr>
			<td>�|��ID:</td>
			<td><input readonly="readonly" type="TEXT" name="customer_id" value="<%= (blogMsg==null)? "11002" : blogMsg.getCustomer().getCustomerId()%>" size="45"/></td>
		</tr>
		<tr>
			<td>�o���ɶ�:</td>
			<td><input type="TEXT" name="createTime" value="<%= (blogMsg==null)? new java.sql.Timestamp(System.currentTimeMillis()) : blogMsg.getCreateTime()%>" size="45"/></td>
		</tr>
		
	</table>
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="�e�X�s�W">
</FORM>

</body>

</html>