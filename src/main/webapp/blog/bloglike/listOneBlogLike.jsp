<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.lazytravel.blog.entity.BlogLike"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	BlogLike blogLike = (BlogLike) request.getAttribute("blogLike"); 
%>

<html>

<head>
	<title>���g��� - listOneBlogLike.jsp</title>

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
			<h3>���g��� - listOneBlogLike.jsp</h3>
			<h4><a href="blogLike_select_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
		</td></tr>
	</table>

	<table>
		<tr>
			<th>���gID</th>
			<th>�|��ID</th>
			<th>���g�ɶ�</th>
			<th>�峹ID</th>
			<th>���A</th>
		</tr>
		<tr>
			    <td>${blogLike.getBlogLikeId()}</td>
				<td>${blogLike.customer.customerId}</td>
				<td>${blogLike.createTime}</td>
				<td>${blogLike.blog.blogId}</td>
				<td>${blogLike.blogLikeStatus}</td>
				<td>
				
		</tr>
	</table>

</body>

</html>