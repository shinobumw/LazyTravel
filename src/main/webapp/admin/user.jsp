<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>後臺 - 後臺使用者</title>

  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
  <link rel="icon" href="<%=request.getContextPath()%>/static/images/logo.ico" type="image/x-icon">

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
  </style>
</head>

<body>
<div id="header"></div>

<div id="main" class="p-3">
  <div class="mx-3 mb-4 d-flex align-items-start">
    <h3 class="d-inline-block me-3">後臺使用者</h3>
    <a href="user-add.jsp" id="add" class="btn">新增</a>
  </div>

  <div class="table-responsive mx-3">
    <table id="example" class="table table-striped" style="width:100%">
      <thead>
      <tr>
        <th scope="col">修改</th>
        <th scope="col">ID</th>
        <th scope="col">帳號</th>
        <th scope="col">角色</th>
        <th scope="col">狀態</th>
        <th scope="col">建立時間</th>
        <th scope="col">更新時間</th>
      </tr>

      </thead>
      <tbody>
      <%--      <tr>--%>
      <%--        <td>--%>
      <%--          <form method="post" action="">--%>
      <%--            <button type="submit" class="btn-modify btn">修改</button>--%>
      <%--            <input type="hidden" name="customer_id" value="">--%>
      <%--            <input type="hidden" name="action" value="modify">--%>
      <%--          </form>--%>
      <%--        </td>--%>
      <%--        <td>1</td>--%>
      <%--        <td>admin</td>--%>
      <%--        <td>管理員</td>--%>
      <%--        <td>啟用</td>--%>
      <%--        <td>2023-11-21 23:56:59.0</td>--%>
      <%--        <td>2023-11-21 23:56:59.0</td>--%>
      <%--      </tr>--%>
      </tbody>
    </table>
  </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script>
    function init() {
        $.ajax({
            url: "<%=request.getContextPath()%>/admin/user.do",
            type: "GET",
            data: {"action": "getall"},
            dataType: "json",
            beforeSend: function () {
                // $("ul.task_list").html(
                //         '<li style="text-align: center;"><i class="fas fa-spinner fa-spin fa-3x"></i></li>'
                // );
            },
            success: function (data) {
                let dataSet = [];
                data.forEach((item) => {
                    let tmpArr = [];
                    let modifyBtn =
                        '<td>' +
                        '<form method="get" action="user-modify.jsp">' +
                        '<button type="submit" class="btn-modify btn">修改</button>' +
                        '<input type="hidden" name="user_id" value="' + item.userId + '">' +
                        // '<input type="hidden" name="action" value="getOneModify">' +
                        '</form>' +
                        '</td>';

                    tmpArr.push(modifyBtn);
                    tmpArr.push(item.userId);
                    tmpArr.push(item.username);
                    tmpArr.push(item.roleName);
                    tmpArr.push(item.userStatus);
                    tmpArr.push(item.createTime);
                    tmpArr.push(item.updateTime);
                    dataSet.push(tmpArr)
                });

                new DataTable('#example', {
                    data: dataSet
                });

            },
            error: function () {
                console.log("init error");
            },
        });
    }

    $(function () {
        $("#header").load("<%=request.getContextPath()%>/admin/header.jsp");

        init()
    });
</script>
</body>

</html>