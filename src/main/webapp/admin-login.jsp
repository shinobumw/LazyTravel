<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>後臺登入</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="icon" href="static/images/logo.ico" type="image/x-icon">

  <style>
      #box-login {
          /* border: 1px solid aqua; */
          position: absolute;
          top: 40%;
          left: 50%;
          transform: translate(-50%, -50%);
          max-width: 480px;
      }
  </style>
</head>

<body>
<div id="box-login" class="container-sm shadow p-3 mb-5 bg-body-tertiary rounded-4">
  <div class="d-flex flex-column justify-content-center align-items-center">
    <div class="h1 mt-1 mb-3">後臺登入</div>

    <form action="#" method="post" class="w-75">
      <div id="alert-fail" class="alert alert-warning d-none" role="alert">
        帳號或密碼輸入錯誤，請重新輸入！
      </div>
      <div id="alert-danger" class="alert alert-danger d-none" role="alert">
        該使用者帳號已被停用。
      </div>
      <div class="mb-3">
        <label for="inputUsername" class="form-label">Username</label>
        <input type="text" class="form-control" id="inputUsername" placeholder="請輸入帳號..."
               aria-describedby="validationUsername" required>
      </div>
      <div class="valid-feedback">
        格式正確
      </div>
      <div id="validationUsername" class="invalid-feedback">
        請輸入帳號
      </div>
      <div class="mb-3">
        <label for="inputPassword" class="form-label">Password</label>
        <input type="password" class="form-control" id="inputPassword" placeholder="請輸入密碼..."
               aria-describedby="validationPassword" required>
      </div>
      <div class="valid-feedback">
        格式正確
      </div>
      <div id="validationPassword" class="invalid-feedback">
        請輸入密碼
      </div>
      <div class="d-grid gap-2 mt-3">
        <button type="submit" id="btn-login" class="btn btn-primary mb-3"
                style="background-color: #6B705C;">登入
        </button>
      </div>
    </form>

    <div class="w-75 text-center">
      <div id="forget-pw" data-bs-toggle="tooltip" data-bs-title="請洽後臺管理人員" data-bs-placement="right"
           class="d-inline text-secondary">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
             fill="currentColor" class="bi bi-question-circle-fill" viewBox="0 0 16 16">
          <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z"/>
        </svg>
        忘記密碼？
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

    function validateRequired() {
        let isRequired = true;

        // 帳號
        const username = $("#inputUsername");
        if (username.val() === "")
            username.removeClass("is-valid").addClass("is-invalid");
        else
            username.removeClass("is-invalid").addClass("is-valid");

        if (username.hasClass("is-invalid"))
            isRequired = false;

        // 姓名
        const password = $("#inputPassword");
        if (password.val() === "")
            password.removeClass("is-valid").addClass("is-invalid");
        else
            password.removeClass("is-invalid").addClass("is-valid");

        if (password.hasClass("is-invalid"))
            isRequired = false;

        return isRequired;
    }

    function login() {
        const host = window.location.origin;
        const path = window.location.pathname;
        const webCtx = path.substring(0, path.indexOf('/', 1));
        const apiURL = host + webCtx + "/adminLogin.do";
        console.log("apiURL: " + apiURL);

        let username = $("#inputUsername").val();
        let password = $("#inputPassword").val();
        let loginInfo = {"username": username, "password": password};

        $.ajax({
            url: apiURL,
            type: "POST",
            data: JSON.stringify(loginInfo),
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                if (data === "OK") {
                    window.location.replace(host + webCtx + "/admin");
                } else if (data === "BAN") {
                    $("#alert-fail").addClass("d-none");
                    $("#alert-danger").removeClass("d-none");
                } else {
                    $("#alert-danger").addClass("d-none");
                    $("#alert-fail").removeClass("d-none");
                }
            },
            error: function () {
                console.log("ajax error");
            },
        });
    }

    $("#btn-login").on("click", function (e) {
        e.preventDefault();

        if (validateRequired())
            login()
    });

    document.getElementById("forget-pw").onclick = (e) => {
        // console.log(e.target);
        e.preventDefault();
    }
</script>
</body>

</html>