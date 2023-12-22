<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lazytravel.foodscape.entity.*"%>
<%@ page import="com.lazytravel.foodscape.dao.*"%>
<%@ page import="com.lazytravel.foodscape.service.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	int currentPage = 10;
	FoodScapeServiceImpl foodscapeImpl = new  FoodScapeServiceImpl();
    List<FoodScape> list = foodscapeImpl.getAllFoodScapes(currentPage);
    pageContext.setAttribute("list",list);
%>


<html>

<head>
	<title>�Ҧ��������I��� - listAllFoodScape.jsp</title>

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
			<h3>�Ҧ��������I��� - listAllFoodScape.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/foodscape/select_FoodScape_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^����</a></h4>
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
<%--		<%@ include file="page1.file" %>--%>
<%--		<c:forEach var="FoodScape" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">--%>
		<c:forEach var="foodscape" items="${list}">

			<tr>
				<td>${foodscape.foodScapeId}</td>
				<td>${foodscape.foodScapeName}</td>
				<td>${foodscape.phone}</td>
				<td>${foodscape.address}</td>
				<td>${foodscape.city}</td>
				<td>${foodscape.lng}</td>
				<td>${foodscape.lat}</td>
				<td>${foodscape.intro}</td>
				<td>${foodscape.updateTime}</td>
				<td>${foodscape.foodScapeStatus}</td>
				<td>${foodscape.category}</td>
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/foodscape/foodscape.do" style="margin-bottom: 0px;">
					 <input type="submit" value="�ק�">
					 <input type="hidden" name="foodscape_id"  value="${foodscape.foodScapeId}">
					 <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
<%--	<%@ include file="page2.file" %>--%>

</body>

</html>