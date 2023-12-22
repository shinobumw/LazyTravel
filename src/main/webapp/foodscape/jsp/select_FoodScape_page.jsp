<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Lazy Travel: FoodScape</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>

<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>Lazy Travel: FoodScape</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for Lazy Travel: FoodScape</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~�C��--%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllFoodScape.jsp'>List</a> all FoodScapes.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="foodscape.do" >
        <b>��J�������I�s�� (�p22001):</b>
        <input type="text" name="foodScape_Id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="foodscapeSvc" scope="page" class="com.lazytravel.foodscape.service.FoodScapeServiceImpl" />
   
  <li>
     <FORM METHOD="post" ACTION="foodscape.do" >
       <b>��ܬ������I�s��:</b>
       <select size="1" name="foodScape_Id">
         <c:forEach var="foodscape" items="${foodscapeSvc.all}" >
          <option value="${foodscape.foodScapeId}">${foodscape.foodScapeId}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="foodscape.do" >
       <b>��ܬ������I�W��:</b>
       <select size="1" name="foodScape_Id">
         <c:forEach var="foodscape" items="${foodscapeSvc.all}" >
          <option value="${foodscape.foodScapeId}">${foodscape.foodScapeName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�������I�޲z</h3>

<ul>
  <li><a href='addFoodScape.jsp'>Add</a> a new FoodScape.</li>
</ul>

</body>

</html>