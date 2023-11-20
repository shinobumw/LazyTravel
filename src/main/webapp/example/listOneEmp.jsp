<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.lazytravel.example.entity.Customer"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	Customer customer = (Customer) request.getAttribute("customer"); // �bCustomerService��setAttribute("customer")
%>

<html>

<head>
	<title>���u��� - listOneEmp.jsp</title>

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
			<h3>�|����� - listOneEmp.jsp</h3>
			<h4><a href="select_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
		</td></tr>
	</table>

	<table>
		<tr>
			<th>�|��ID</th>
			<th>�m�W</th>
			<th>�ʺ�</th>
			<th>�ʧO</th>
			<th>�q��</th>
			<th>�ͤ�</th>
			<th>�a�}</th>
			<th>Email</th>
			<th>���A</th>
			<th>������</th>
			<th>�|����</th>
			<th>�إ߮ɶ�</th>
			<th>��s�ɶ�</th>
		</tr>
		<tr>
			<td><%=customer.getCustomerId()%></td>
			<td><%=customer.getCustomerName()%></td>
			<td><%=customer.getNickname()%></td>
			<td><%=(customer.getSex().equals("0")) ? "�k" : "�k"%></td>
			<td><%=customer.getPhone()%></td>
			<td><%=customer.getBirth()%></td>
			<td><%=customer.getAddress()%></td>
			<td><%=customer.getEmail()%></td>
			<td><%=(customer.getCustomerStatus().equals("0")) ? "���v" : "�ҥ�"%></td>
			<td><%=customer.getIdno()%></td>
			<td><%=customer.getCustomerPoint()%></td>
			<td><%=customer.getCreateTime()%></td>
			<td><%=customer.getUpdateTime()%></td>
		</tr>
	</table>

</body>

</html>