<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lazytravel.journey.entity.Journey"%>

<%
	Journey journey = (Journey) request.getAttribute("journey");
%>

<html>

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title>��{���-�s�W</title>

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
		width: 450px;
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
		<h3>��{���-�s�W</h3></td><td>
		<h4><a href="select_Journey_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">��^��{����</a></h4>
	</td></tr>
</table>

<h3>��{���-�s�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="journey.do" name="form1">
	<table>
		<tr>
			<td>��{�W��:</td>
			<td><input type="TEXT" name="journey_name" value="<%= (journey==null)? "��{�W��..." : journey.getJourneyName()%>" size="45"/></td>
		</tr>
		<tr>
			<td>��{����:</td>
			<td><input type="NUMBER" name="price" value="<%= (journey==null)? "0" : journey.getPrice()%>" size="45"/></td>
		</tr>
		<tr>
			<td>��{����:</td>
			<td><input type="TEXT" name="content" value="<%= (journey==null)? "��{����..." : journey.getContent()%>" size="45"/></td>
		</tr>
		<tr>
			<td>��{�Ѽ�:</td>
			<td><input type="NUMBER" name="days" value="<%= (journey==null)? "0" : journey.getDays()%>" size="45"/></td>
		</tr>
		<tr>
			<td>��{���A:</td>
			<td>
				<select name="journey_status">
					<option value="0" ${journey.journeyStatus == 0 ? "selected" : ""} >���W�[</option>
					<option value="1" ${journey.journeyStatus == 1 ? "selected" : ""} >�w�W�[</option>
				</select>
			</td>
		</tr>
	</table>
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="�e�X�s�W">
</FORM>

</body>

</html>