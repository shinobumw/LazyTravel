<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lazytravel.foodscape.entity.FoodScape"%>

<%
	FoodScape foodscape = (FoodScape) request.getAttribute("foodscape");
%>

<html>

<head>

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title>�������I��ƭק�</title>

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
		<h3>�������I��ƭק�</h3></td><td>
		<h4><a href="select_FoodScape_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="foodscape.do" name="form1">
	<table>
		<tr>
			<td>�|��ID:<font color=red><b>*</b></font></td>
			<td><%=foodscape.getFoodScapeId()%></td>
		</tr>
		<tr>
			<td>�������I:</td>
			<td><input type="TEXT" name="foodscape_name" value="<%= (foodscape==null)? "�x�_101" : foodscape.getFoodScapeName()%>" size="45"/></td>
		</tr>
		<tr>
			<td>�q��:</td>
			<td><input type="TEXT" name="phone" value="<%= (foodscape==null)? "81018800" : foodscape.getPhone()%>" size="45"/></td>
		</tr>
		<tr>
			<td>�a�}:</td>
			<td><input type="TEXT" name="address" value="<%= (foodscape==null)? "�H�q�ϥ�����45��" : foodscape.getAddress()%>" size="45"/></td>
		</tr>
		<tr>
			<td>����:</td>
			<td><input type="TEXT" name="city" value="<%= (foodscape==null)? "�x�_��" : foodscape.getCity()%>" size="45"/></td>
		</tr>
		<tr>
			<td>�g��:</td>
			<td><input type="TEXT" name="lng" value="<%= (foodscape==null)? "121.5615184" : foodscape.getLng()%>" size="45"/></td>
		</tr>
		<tr>
			<td>�n��:</td>
			<td><input type="TEXT" name="lat" value="<%= (foodscape==null)? "25.0338315" : foodscape.getLat()%>" size="45"/></td>
		</tr>
		<tr>
			<td>����:</td>
			<td><input type="TEXT" name="intro" value="<%= (foodscape==null)? "�[���x�i�H�ݾ�ӥ_�����]��" : foodscape.getIntro()%>" size="45"/></td>
		</tr>

		<tr>
			<td>���A:</td>
			<td>
				<select name="foodscape_status">
					<option value="1" selected>�w�W�[</option>
					<option value="0">���W�[</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>���O:</td>
			<td><input type="TEXT" name="category" value="<%= (foodscape==null)? "���I" : foodscape.getCategory()%>" size="45"/></td>
		</tr>
	</table>
	<br>
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="foodscape_id" value="<%=foodscape.getFoodScapeId()%>">
	<input type="submit" value="�e�X�ק�">
</FORM>

</body>

</html>
