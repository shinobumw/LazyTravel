<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.lazytravel.foodscape.entity.FoodScape"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	FoodScape foodscape = (FoodScape) request.getAttribute("foodscape"); // �bFoodscapeService��setAttribute("foodscape")
%>

<html>

<head>
	<title>�������I��� - listOneFoodScape.jsp</title>

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

<!-- 	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4> -->
	<table id="table-1">
		<tr><td>
			<h3>�������I��� - listOneFoodScape.jsp</h3>
			<h4><a href="select_FoodScape_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
		</td></tr>
	</table>

	<table>
		<tr>
			<th>����/���IID</th>
			<th>����/���I�W��</th>
			<th>�q��</th>
			<th>�a�}</th>
			<th>����</th>
			<th>�g��</th>
			<th>�n��</th>
			<th>����</th>
			<th>��s�ɶ�</th>
			<th>���A</th>
			<th>���O</th>
		</tr>
		<tr>
			<td><%= foodscape.getFoodScapeId()%></td>
			<td><%= foodscape.getFoodScapeName()%></td>
			<td><%= foodscape.getPhone()%></td>
			<td><%= foodscape.getAddress()%></td>
			<td><%= foodscape.getCity()%></td>
			<td><%= foodscape.getLng()%></td>
			<td><%= foodscape.getLat()%></td>
			<td><%= foodscape.getIntro()%></td>
			<td><%= foodscape.getUpdateTime()%></td>
			<td><%= (foodscape.getFoodScapeStatus().equals("0")) ? "�w�W�[" : "�w�U�["%></td>
			<td><%= foodscape.getCategory()%></td>


		</tr>
	</table>

</body>

</html>