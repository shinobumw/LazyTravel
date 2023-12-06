<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lazytravel.order.entity.*"%>
<%@ page import="com.lazytravel.order.dao.*"%>
<%@ page import="com.lazytravel.order.service.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	OrdersService ordSvc = new OrdersService();
	List<Orders> list = ordSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>

<head>
	<title>�Ҧ��q���� - listAllEmp.jsp</title>

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
			<h3>�Ҧ��|����� - listAllEmp.jsp</h3>
			<h4><a href="select_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
		</td></tr>
	</table>

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
<%--		<%@ include file="page1.file" %>--%>
<%--		<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">--%>
		<c:forEach var="order" items="${list}">

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
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do" style="margin-bottom: 0px;">
					 <input type="submit" value="�ק�">
					 <input type="hidden" name="order_id"  value="${order.orderId}">
					 <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
<%--	<%@ include file="page2.file" %>--%>

</body>

</html>