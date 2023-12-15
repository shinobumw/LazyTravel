<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lazytravel.blog.entity.*"%>
<%@ page import="com.lazytravel.blog.dao.*"%>
<%@ page import="com.lazytravel.blog.service.*"%>

<html>
<head>
<title>Lazy Travel: Home</title>

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
   <tr><td><h3>Lazy Travel: BlogLikeHome</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for Lazy Travel: Home</p>

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
  <li><a href='listAllBlogLike.jsp'>List</a> all BlogLikes.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="blogLike.do" >
        <b>��J���g�s�� (�p1):</b>
        <input type="text" name="blogLikeId">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="blogLikeSvc" scope="page" class="com.lazytravel.blog.service.BlogLikeServiceImpl" />
  <li>
     <FORM METHOD="post" ACTION="blogLike.do" >
    
       <b>��ܤ峹ID:</b>
       <select size="1" name="blogLikeId">
         <c:forEach var="blogLike" items="${blogLikeSvc.getAllBlogLikes()}" >
          <option value="${blogLike.getBlogLikeId()}">${blogLike.blog.getBlogId()}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="blogLike.do" >
       <b>��ܯd��ID:</b>
       <select size="1" name="blogLikeId">
         <c:forEach var="blogLike" items="${blogLikeSvc.getAllBlogLikes()}" >
          <option value="${blogLike.getBlogLikeId()}">${blogLike.getBlogLikeId()}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�|���޲z</h3>

<ul>
  <li><a href='addBlogLike.jsp'>Add</a> a new blog.</li>
</ul>

</body>

</html>