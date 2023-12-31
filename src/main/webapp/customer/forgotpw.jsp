<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  Boolean emailNotExists = false;
  if (request.getAttribute("emailNotExists") != null)
    emailNotExists = (Boolean) request.getAttribute("emailNotExists");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>忘記密碼</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="icon" href="<%=request.getContextPath()%>/static/images/logo.ico" type="image/x-icon">

</head>

<body>
<header id="header"></header>

<div class="container d-flex justify-content-center mb-5">
  <form method="post" action="customer.do" class="row border m-3 p-3 rounded-3 w-50">
    <h2 class="mb-4 text-center">忘記密碼</h2>

    <div class="alert alert-warning <%= (emailNotExists) ? "" : "d-none" %>" role="alert">
      此Email信箱尚未註冊過，請重新輸入！
    </div>

    <div class="col-12 mb-3">
      <label for="inputEmail" class="form-label">Email 信箱</label>
      <input type="email" name="email" class="form-control" id="inputEmail" placeholder="name@gmail.com"
             aria-describedby="validationEmail" required>
      <div id="emailHelp1" class="form-text">請輸入註冊時填寫的Email，系統將會發送重置密碼的信件至您的信箱。</div>
      <div class="valid-feedback">
        格式正確
      </div>
      <div id="validationEmail" class="invalid-feedback">
        請輸入正確的Email格式
      </div>
    </div>

    <div class="col-12 mt-3">
      <input type="hidden" name="action" value="sendForgotPwMail">
      <button type="submit" id="btn-confirm" class="btn w-100" style="background-color: #6B705C;">
        <span class="text-light">確認</span>
      </button>
    </div>
  </form>
</div>

<footer id="footer"></footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
    $(function () {
        $("#header").load("<%=request.getContextPath()%>/components/html/header.jsp");
        $("#footer").load("<%=request.getContextPath()%>/components/html/footer.jsp");
    });


    function validateRequired() {
        let isRequired = true;

        // Email
        const email = $("#inputEmail");
        if (email.val() === "")
            email.removeClass("is-valid").addClass("is-invalid");
        else
            email.removeClass("is-invalid").addClass("is-valid");

        if (email.hasClass("is-invalid"))
            isRequired = false;

        return isRequired;
    }

    function validateCustomized() {
        let isValidated = true;

        // Email
        const email = $("#inputEmail");
        const emailRegex = /^\w+((-\w+)|(\.\w+))*@[A-Za-z0-9]+(([.\-])[A-Za-z0-9]+)*\.[A-Za-z]+$/;
        if (!email.val().match(emailRegex)) {
            email.removeClass("is-valid").addClass("is-invalid");
            isValidated = false;
        } else {
            email.removeClass("is-invalid").addClass("is-valid");
        }

        return isValidated;
    }

    $("#btn-confirm").on("click", function (e) {
        e.preventDefault();

        if (validateRequired() && validateCustomized()) {
            console.log("Validate form succeeded!");
            e.target.closest("form").submit();
        } else {
            console.log("Validate form failed...");
        }
    })

</script>


</body>

</html>