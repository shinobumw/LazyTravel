<%@page import="com.lazytravel.order.entity.Orders"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>

<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	Orders order = (Orders) request.getAttribute("order"); 
%>

<html>

<head>
	<title>�q���� - listOneEmp.jsp</title>

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

<!-- 	<h4>�����Ƚm�߱ĥ� EL ���g�k����:</h4> -->
	<table id="table-1">
		<tr><td>
			<h3>�q���� - listOneEmp.jsp</h3>
			<h4><a href="select_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
		</td></tr>
	</table>order

	<table>
		<tr>
			<th>�q��Id</th>
			<th>�q��s��</th>
			<th>�|��Id</th>
			<th>�Ȧ��Id</th>
			<th>�ȫȤH��</th>
			<th>�ϥη|����</th>
			<th>�u�f��Id</th>
			<th>���O�`���B</th>
			<th>�I�ڮɶ�</th>
			<th>�������e</th>
			<th>��������</th>
			<th>�����ɶ�</th>
			<th>�إ߮ɶ�</th>
			<th>��s�ɶ�</th>
			<th>�q�檬�A</th>
		</tr>
		
		<tr>
			<td>${order.getOrderId()}</td>
			<td>${order.getOrderNo()}</td>
			<td>${order.getCustomerId()}</td>
			<td>${order.getGroupId()}</td>
			<td>${order.getTourist()}</td>
			<td>${order.getCustomerPoint()}</td>
			<td>${order.getCouponId()}</td>
			<td>${order.getTotalAmt()}</td>
			<td>${order.getPaidTime()}</td>
			<td>${order.getContent()}</td>
			<td>${order.getScore()}</td>
			<td>${order.getContentTime()}</td>
			<td>${order.getCreateTime()}</td>
			<td>${order.getUpdateTime()}</td>
			<td>${order.getOrderStatus()}</td>
			
		</tr>
	</table>

</body>

</html>