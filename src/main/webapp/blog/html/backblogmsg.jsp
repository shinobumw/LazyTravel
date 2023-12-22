<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lazytravel.blog.entity.*"%>
<%@ page import="com.lazytravel.blog.dao.*"%>
<%@ page import="com.lazytravel.blog.service.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
BlogMsgService blogMsgSvc = new BlogMsgServiceImpl();
List<BlogMsg> list = blogMsgSvc.getAllBlogMsgs();
pageContext.setAttribute("list",list);
%>


<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>��O - ��O�\��</title>

    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" />
    <link rel="icon" href="../../static/images/logo.ico" type="image/x-icon" />

    <style>
      button.btn-modify {
        background-color: #9c6644;
        color: white;
      }

      a#add {
        background-color: #b7b7a4;
        color: white;
      }

      a#add:hover {
        background-color: #6b705c;
        color: white;
      }
    </style>
  </head>

  <body>
    <div id="header"></div>

    <div id="main" class="p-3">
      <div class="mx-3 mb-4 d-flex align-items-start">
        <h3 class="d-inline-block me-3">������d���d��</h3>
      </div>

      <div class="table-responsive mx-4">
        <table id="example" class="table table-striped" style="width: 100%">
          <thead>
            <tr>
              <th scope="col">�d��ID</th>
              <th scope="col">�|���W��</th>
              <th scope="col">�峹���D</th>
              <th scope="col">�d�����e</th>
              <th scope="col">�o���ɶ�</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="blog_msg" items="${list}">
            <tr>
              <td>${blog_msg.getBlogMsgId()}</td>
              <td>${blog_msg.customer.customerName}</td>
              <td>${blog_msg.blog.title}</td>
              <td>${blog_msg.content}</td>
              <td>${blog_msg.createTime}</td>
              <td>
                <form method="post" action="<%=request.getContextPath()%>/blog/blogmsg/blogMsg.do" style="margin-bottom: 0px;">
                    <button type="submit" name="action" value="getOne_For_Update" class="btn-modify btn">�ק�</button>
                    <button type="submit" name="action" value="delete" class="btn-modify btn">�R��</button>
                    <input type="hidden" name="blog_msg_id" value="${blog_msg.getBlogMsgId()}">
                </form>
              </td>
            </tr>
        </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script>
      $(function () {
        $("#header").load("../../admin/header.html");
        new DataTable("#example");
      });
    </script>
  </body>
</html>
