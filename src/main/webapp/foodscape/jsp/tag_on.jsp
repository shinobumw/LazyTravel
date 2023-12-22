<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.lazytravel.foodscape.dao.*"%>
<%@page import="com.lazytravel.foodscape.entity.*"%>
<%@page import="com.lazytravel.foodscape.service.*"%>

<%@ include file="/admin/header.html" %>

<!DOCTYPE html>
<html>
<head>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>後台-標籤(新增)</title>

<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<link rel="icon" href="../static/images/logo.ico" type="image/x-icon">

  <style>
    button.btn-modify {
    background-color: #9C6644;
    color: white;
    }

    a#add {
    background-color: #B7B7A4;
    color: white;
    }
    
    a#add:hover {
    background-color: #6B705C;
    color: white;
    }

   *{
        box-sizing: border-box;
    }

    body{
        margin: 0;
    }

    main#main{
        padding: 50px 80px;
    }

    input, textarea{
        border: 1px solid #CCD5AE;   
    }

    input:focus, textarea:focus{
        outline: 2px solid #CCD5AE;
        box-shadow: 0 0 8px #a1a397
    }

    select {
        border: 1px solid #CCD5AE;
        height: 27px;
    }

    select:focus {
        border:2px solid #CCD5AE;
        box-shadow: 0 0 8px #a1a397;
    }

    button.btn_submit{
        width: 100px;
        height: 30px;
        border-radius: 90px;
        border-color: transparent;
        color: white;
        background: #CCD5AE;
        
        margin-right: 15px;
    }

    button.btn_submit:active {
        outline: 2px solid #CCD5AE;
        box-shadow: 0 0 8px #a1a397
    }
    
    button.btn_reset{
        width: 100px;
        height: 30px;
        border-radius: 90px;
        border-color: transparent;
        color: white;
        background: #9C6644;
    }

    button.btn_reset:active {
        outline: 2px solid #9C6644;
        box-shadow: 0 0 8px #a1a397
    }


    table {
        border-collapse: separate;
        border-spacing: 10px;
    }

    body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

         label {
            display: block;
            margin-bottom: 8px;
        } 

        input, select, textarea {
            width: 100%;
            padding: 2px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }  
  
</style>
<%
	Tag tag = (Tag) request.getAttribute("tag");

	TagService tagService = new TagServiceImpl();
	List<Tag> TagList = tagService.getAllTags();
	pageContext.setAttribute("tag", TagList);
	
	pageContext.getAttribute("tagId");
	pageContext.getAttribute("tagName");
	%>
</head>
<body>
    <div id="header"></div>

    
    <main id="main">
          
        <h2>新增標籤</h2>

        <form action="/your-backend-endpoint" method="post">
            <label for="tag_id">標籤ID:</label>
            <input type="text" id="tagName" name="tagName" required>
  			    
  			    <select id="tagOption" name="tag_id" onchange="updateHiddenField(this)">
			        <c:forEach var="tag" items="${tag}">
			            <option value="${tag.getTagId()}" ${tag.getTagId() == tag.getTagId() ? "selected" : ""}>
			                ${tag.getTagId()}  ${tag.getTagName()}
			            </option>
			        </c:forEach>
			    </select>  
    
            <label for="tagName">標籤名稱:</label>
            <input type="text" id="tagName" name="tagName" required>

            </select>
    
            <label for="updateTime">更新時間:</label>
            <input type="text" id="updateTime" name="updateTime" required>
    

    
        </form>

      <br>
      <div class="row justify-content-end" style="margin-left: 75%;">
        <div class="div_btn">
            <button type="submit" class="btn_submit">送出</button>
            <button type="reset" class="btn_reset">取消</button>
        </div>
    </div>
    

  </main>



  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
  <script>
    $(function () {
      $("#header").load("header.html");
      new DataTable('#example');
    });
  </script>
</body>

</html>