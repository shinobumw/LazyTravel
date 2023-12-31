<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/checkComplete.css">
    <script src="https://kit.fontawesome.com/cb6bf56872.js" crossorigin="anonymous"></script>
    <link rel="icon" href="../static/images/logo.ico" type="image/x-icon">
</head>


<body>
    <header id="header"></header>
    <main class="main">
        <div class="container mt-5 px-3 d-flex justify-content-center">
            <div class="progresss-container ">
                <div class="progresss" id="progress"> </div>
                <div class="circle active" style="font-weight: bold;">選擇行程</div>
                <div class="circle" style="font-weight: bold;">填寫資料</div>
                <div class="circle" style="font-weight: bold;">完成付款</div>
            </div>
        </div>
        <hr class="mx-5">


        <div class="card mx-5 mt-5">
            <div class="card-header" style="font-size: 18px; font-weight: 600; color: gray;">
                已完成付款
            </div>
            <div class="card-body" style="background-color: #FEFAE0;">
            <div class="text-center mt-5">
                <span class="card-text">恭喜您已完成付款流程<br>
                    本次購買行程明細可於會員中心的歷史訂單查看，祝您旅途愉快 ~</span>
            </div>
              
              <div class="d-flex justify-content-end mt-5">
                <button class="btnn" id = "backtohomeButton" onclick="backwardClick()">回首頁</button>
            </div>
            </div>
          </div>

        

    </main>

    <footer id="footer"></footer>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->

    <script>
        $("#header").load("../components/html/header.jsp");
        $("#footer").load("../components/html/footer.jsp");
    </script>

    <script>

        // 進度條特效
        const progress = document.getElementById("progress");
        const stepCircles = document.querySelectorAll(".circle");
        let currentActive = 1;

        //NOTE CHANGE HERE TO 1-4
        //1=25%
        //2=50%
        //3=75%
        //4=100%
        update(3);

        function update(currentActive) {
            stepCircles.forEach((circle, i) => {
                if (i < currentActive) {
                    circle.classList.add("active");
                } else {
                    circle.classList.remove("active");
                }
            });

            const activeCircles = document.querySelectorAll(".active");
            progress.style.width =
                ((activeCircles.length - 1) / (stepCircles.length - 1)) * 100 + "%";


        }

        

        function backwardClick() {
            var button = document.getElementById('backtohomeButton');
        button.classList.add('clicked');

        window.location.href = '"<%=request.getContextPath()%>/index.jsp';

        }
        
        




    </script>


</body>

</html>