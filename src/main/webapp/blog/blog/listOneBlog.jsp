<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.lazytravel.blog.entity.Blog"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	Blog blog = (Blog) request.getAttribute("blog"); 
%>

<html>

<head>
	<title>�峹��� - listOneBlog.jsp</title>

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
			<h3>�峹��� - listOneBlog.jsp</h3>
			<h4><a href="select_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
		</td></tr>
	</table>

	<table>
		<tr>
			<th>�峹ID</th>
			<th>�峹���D</th>
			<th>�|��ID</th>
			<th>�i�C���</th>
			<th>�峹����</th>
			<th>��s�ɶ�</th>
			<th>�o���ɶ�</th>
			<th>���g��</th>
			<th>�s����</th>
			<th>���ü�</th>
			<th>�Y��</th>
			<th>�峹���A</th>
		</tr>
		<tr>
			    <td>${blog.getBlogId()}</td>
				<td>${blog.getTitle()}</td>
				<td>${blog.customer.customerId}</td>
				<td>${blog.blogDate}</td>
				<td>${blog.content}</td>
				<td>${blog.upDateTime}</td>
				<td>${blog.createTime}</td>
<%-- 				<td>${(customer.customerStatus.equals("0")) ? "���v" : "�ҥ�"}</td> --%>
				<td>${blog.likeSum}</td>
				<td>${blog.viewSum}</td>
				<td>${blog.clSum}</td>
				<td>${blog.img}</td>
				<td>${(blog.blogStatus ==  0) ?  "���v" : "�ҥ�"}</td>
				
		</tr>
	</table>

</body>

</html>