<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.lazytravel.blog.entity.BlogTag"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	BlogTag blogTag = (BlogTag) request.getAttribute("blogTag"); 
%>

<html>

<head>
	<title>�峹��� - listOneBlogTag.jsp</title>

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
		/*width: 600px;*/
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

<body bgcolor='white'>

	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
	<table id="table-1">
		<tr><td>
			<h3>�峹��� - listOneBlogTag.jsp</h3>
			<h4><a href="blogTag_select_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
		</td></tr>
	</table>

	<table>
		<tr>
			<th>�峹ID</th>
			<th>����ID</th>
		</tr>
		<tr>
			    <td>${blogTag.getBlogId()}</td>
				<td>${blogTag.getTagId()}</td>
		</tr>
	</table>

</body>

</html>