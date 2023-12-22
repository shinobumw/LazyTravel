<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lazytravel.order.entity.Orders"%>

<%
	Orders order = (Orders) request.getAttribute("order");
%>

<html>

<head>

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title>�q���ƭק� - update_emp_input.jsp</title>

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
		width: 550px;
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
		<h3>�q���ƭק� - update_emp_input.jsp</h3></td><td>
		<h4><a href="select_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
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

<FORM METHOD="post" ACTION="order.do" name="form1">
	<table>
		<tr>
			<td>�q��ID:<font color=red><b>*</b></font></td>
			<td><%=order.getOrderId()%></td>
		</tr>
		<tr>
			<td>�q��s��:</td>
			<td><input type="TEXT" name="order_no" value= "${(order==null)? 2024112201 : order.getOrderNo()}" size="45"/></td>
		</tr>
		<tr>
			<td>�|��Id:</td>
			<td><input type="TEXT" name="customer_id" value= "${(order==null)? 11001 : order.getCustomerId() }" size= "45" ></td>
		</tr>
		<tr>
			<td>�Ȧ��Id:</td>
			<td><input type="TEXT" name="group_id" value= "${ (order==null)? 24001 : order.getGroupId()}" size="45"/></td>
		</tr>
		<tr>
			<td>�ȫȤH��:</td>
			<td><input type="TEXT" name="tourist" value= "${ (order==null)? 1 : order.getTourist()}" size="45"/></td>
		</tr>
		<tr>
			<td>�ϥη|����:</td>
			<td><input type="TEXT" name="customer_point" value= "${ (order==null)? 0 : order.getCustomerPoint()}" size="45"/></td>
		</tr>
		<tr>
			<td>�u�f��Id:</td>
			<td><input type="TEXT" name="coupon_id" value= "${ (order==null)? 32001 : order.getCouponId()}" size="45"/></td>
		</tr>
		<tr>
			<td>���O�`���B:</td>
			<td><input type="TEXT" name="total_amt" value= "${ (order==null)? 4000 : order.getTotalAmt()}" size="45"/></td>
		</tr>
		
		<tr>
			<td>���A:</td>
			<td>
				<select name="order_status">
					<option value="2" selected>����</option>
					<option value="1" selected>�w�I��</option>
					<option value="0">���I��</option>
				</select>
			</td>
		<tr>
	</table>
	<br>
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="order_id" value="<%=order.getOrderId()%>">
	<input type="submit" value="�e�X�ק�">
</FORM>

</body>

</html>
