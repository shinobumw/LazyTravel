<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.lazytravel.journey.entity.Journey"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	Journey journey = (Journey) request.getAttribute("journey");	// �n�bJourneyServlet.java �s�Jreq��Journey����A�ù�journey��setAttribute  
%>                                                                  

<html>

<head>
	<title>��{���-�d��</title>

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
			<h3>��{���-�d��</h3>
			<h4><a href="select_Journey_page.jsp"><img src="../static/images/logo.png" width="100" height="100" border="0" alt="">�^��{����</a></h4>
		</td></tr>
	</table>

	<table>
		<tr>
			<th>��{ID</th>
			<th>��{�W��</th>
			<th>����</th>
			<th>���Ф�</th>
			<th>�إ߮ɶ�</th>
			<th>��{�Ѽ�</th>
			<th>�ʶR����</th>
			<th>��������</th>
			<th>��������</th>
			<th>���A</th>
		</tr>
		<tr>
			<td><%= journey.getJourneyId() %></td>
			<td><%= journey.getJourneyName() %></td>
			<td><%= journey.getPrice() %></td>
			<td><%= journey.getContent() %></td>
			<td><%= journey.getCreateTime() %></td>
			<td><%= journey.getDays() %></td>
			<td><%= journey.getBuyCount() %></td>
			<td><%= journey.getAvgScore() %></td>
			<td><%= journey.getScoreCount() %></td>
			<td><%= (journey.getJourneyStatus().equals("0")) ? "���W�[" : "�w�W�[" %></td>
		</tr>
	</table>

</body>

</html>