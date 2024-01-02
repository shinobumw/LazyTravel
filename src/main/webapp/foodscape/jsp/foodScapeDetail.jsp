<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.lazytravel.foodscape.dao.*"%>
<%@page import="com.lazytravel.foodscape.entity.*"%>
<%@ page import="java.util.List" %>

<%@ include file="/components/html/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>店家內文</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="icon" href="../static/images/logo.ico" type="image/x-icon">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <style>
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

            margin-right: 15px;
        }

        button.btn_reset:active {
            outline: 2px solid #9C6644;
            box-shadow: 0 0 8px #a1a397
        }

        button.btn_more{
            width: 100px;
            height: 30px;
            border-radius: 90px;
            border-color: transparent;
            color: white;
            background: #6B705C;
        }

        button.btn_more:active {
            outline: 2px solid #6B705C;
            box-shadow: 0 0 8px #a1a397
        }

        div.div_btn{
            display: flex;
            justify-content: flex-end;
        }

        hr:not([zzz]) {
            height: 1.5px;
            background: rgba(0, 0, 0, 0.863);
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.368);
        }

        div.list_group li{
            list-style: none;
            padding-left: 80px;
        }

        button.btn_x{
            width: 19px;
            height: 19px;
            line-height: 10px;
            border-radius: 90px;
            border-color: transparent;
            background-color: #CCCCCC;
            color: white;

            margin-left: 20px;
            margin-bottom: 5px;
            padding-left: 3.5px;
        }
        
        button.btn_x:active{
            outline: 2px solid #CCCCCC;
            box-shadow: 0 0 8px #a1a397
        }

        div.select_journey{
            margin: 20px 0px;
        }
        
        li.journey{
            box-sizing: border-box;
            background: rgba(217, 217, 217, 0.42);
            border-radius: 20px;
            list-style: none;
            border: 1px dotted rgba(109, 109, 109, 0.737);
            margin: 20px 0 0 -40px;
            padding: 20px 40px 20px 40px;
        }

        div.journey_name{
            margin-bottom: 10px;
        }

        div.journey_name span{
            margin-right: 5px;
        }

        span.journey_title {
            margin-right: 10px;
        }

        span.journey_title,
        div.journey_store,
        div.journey_price{
            /* border: 1px solid red; */
            display: inline-block;
            height: 132.5px;
        }

        /* div.journey_store div{
            border: 1px solid red;
        } */

        div.journey_store button{
            margin-top: 7px;
        }
        
        div.journey_price{
            display: flex;
            justify-content: flex-end;
        }

        div.journey_price_div{
            color: #787878;
            display: flex;
            justify-content: space-between;
        }

        span.journey_price_span{
            margin-left: auto;
            margin-right: 5px;
            margin-bottom: 10px;
        }


        
        div.label span{
            border-radius: 90px;
            border-color: transparent;
            color: white;
            background: #6B705C;
            padding: 4px 7px 4px 18px;
            margin-right: 8px;

            white-space: nowrap;   
        }

        div.label{
            display: flex;
            flex-wrap: wrap;
            gap: 5px;     
        }
        
        button.btn_label_x{
            line-height: 10px;
            border-radius: 90px;
            border-color: transparent;
            color: white;
            background: #6B705C;

            padding-left: 15px;
        }

        .flex-container {
        display: flex;
        justify-content: center;
        gap: 20px; /* 調整兩部分的距離 */
        margin-top: 20px; /* 如果需要在上方添加一些間距，可以使用margin-top */
    }

    .flex-container > div {
        flex: 1;
    }

    .div_business_hours {
        max-width: 520px; /* 右邊區塊的最大寬度，可以根據實際需要調整 */
    }
        
    </style>
</head>
<body>
    <header id="header"></header>

    <main id="main">

<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-4  d-flex justify-content-start"> -->
<!--                     <div class="row"> -->
<!--                         <label class="col-3 d-flex justify-content-end ">地點</label> -->
<!--                         <input type="text" class="col-9"> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-4 d-flex justify-content-start"> -->
<!--                     <div class="row"> -->
<!--                         <label class="col-4">美食/景點</label> -->
<!--                         <input type="text" class="col-8"> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-4 d-flex justify-content-end"> -->
<!--                     <div class="row"> -->
<!--                         <label class="col-3 d-flex justify-content-end">預算</label> -->
<!--                         <input type="text" class="col-9"> -->
<!--                     </div> -->
<!--                 </div> -->

<!--             </div> -->
<!--         </div> -->

<!--         <br> -->
<!--         <div class="label"> -->
<!--             <span>標籤AAAAA<button type="button" class="btn_label_x">x</button></span> -->
<!--             <span>標籤BBBBB<button type="button" class="btn_label_x">x</button></span> -->
<!--             <span>標籤CCCCC<button type="button" class="btn_label_x">x</button></span> -->
<!--             <span>標籤DDDDD<button type="button" class="btn_label_x">x</button></span> -->
<!--             <span>標籤EEEEE<button type="button" class="btn_label_x">x</button></span> -->
<!--         </div> -->
            
<!--         <br> -->
<!--         <div class="div_btn"> -->
<!--             <button type="reset" class="btn_reset">重新篩選</button> -->
<!--             <button type="submit" class="btn_submit">送出</button> -->
<!--         </div> -->
<!--         <hr> -->
<!--         <br> -->
<!--         <div> -->
<!--             <div class="container"> -->
<!--                 <div class="row"> -->
<!--                     <span class="col-8" style="font-size: 20px">店家內文</span> -->
<!--                     <div class="col-4 d-flex justify-content-end"> -->
<!--                         <span class="mr-3">常見問題&nbsp;&nbsp;</span> -->
<!--                         <span class="mr-3">|&nbsp;&nbsp;</span> -->
<!--                         <span>聯繫客服</span> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         <br> -->
<!--         <br> -->
    
     <h1>店家內文</h1>
    <c:if test="${not empty foodScape}">
        <p>店名: ${foodScape.foodScapeName}</p>
        <p>電話: ${foodScape.phone}</p>
        <p>地址: ${foodScape.address}</p>
        <p>介紹: ${foodScape.intro}</p>
        <!-- 顯示其他欄位... -->
    </c:if>
    <c:if test="${empty foodScape}">
        <p>FoodScape not found.</p>
    </c:if>
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-md-6 d-flex align-items-center"> -->
<!--                     左一大張 -->
<!--                     <img src="image/舒芙蕾.jpg" alt="圖片描述" class="img-fluid mb-4 mt-4 align-self-center" style="height: 100%; object-fit: cover;"> -->
<!--                 </div> -->
<!--                 <div class="col-md-6"> -->
<!--                     右直立並排 -->
<!--                     <div class="row"> -->
<!--                         <div class="col-md-12 mb-4 align-self-center"> 使用 mb-4 增加下方留白 -->
<!--                             <img src="image/鮭魚卵.jpg" alt="Description of 圖片" class="img-fluid mt-4 mb-4 align-self-center" style="height: 100%; object-fit: cover;"> -->
<!--                         </div> -->
<!--                         <div class="col-md-12 mt-4 align-self-center"> 使用 mt-4 增加上方留白 -->
<!--                             <img src="image/螃蟹.jpg" alt="圖片描述" class="img-fluid mt-4 align-self-center" style="height: 100%; object-fit: cover;"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
        

<!--             <div class="flex-container mt-4"> -->
<!--                 左邊的區塊 -->
<!--                 <div> -->
<!--                     <div> -->
<!--                         <span style="font-weight: bold;">店名:</span> -->
<!--                         <span>台北101</span> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                         <span style="font-weight: bold;">電話:</span> -->
<!--                         <span>2754-3322</span> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                         <span style="font-weight: bold;">地址:</span> -->
<!--                         <span>台北市信義區信義路五段336號</span> -->
<!--                     </div> -->
<!--                     <div> -->
<!--                         <span style="font-weight: bold;">介紹:</span> -->
<!--                         <span>這裡夜景真的很美</span> -->
<!--                     </div> -->
<!--                 </div> -->
            
<!--                 右邊的區塊 -->
<!--                 <div class="div_business_hours"> -->
<!--                     <label>營業時間 :</label> -->
            
<!--                     <br> -->
            
<!--                     <span><b>星期一：</b> 09:00 - 18:00</span><br> -->
<!--                     <span><b>星期二：</b> 09:00 - 18:00</span><br> -->
<!--                     <span><b>星期三：</b> 09:00 - 18:00</span><br> -->
<!--                     <span><b>星期四：</b> 09:00 - 18:00</span><br> -->
<!--                     <span><b>星期五：</b> 09:00 - 18:00</span><br> -->
<!--                     <span><b>星期六：</b> 10:00 - 15:00</span><br> -->
<!--                     <span><b>星期日：</b> 休息</span> -->

<!--                 </div> -->
<!--             </div> -->
            
            
<!--                 <span style="font-size: 20px">最新部落格</span> -->
<!--                 <br> -->
<!--                 <button type="reset" class="btn_reset " style="margin-left: 90%;">重新篩選</button> -->
           

  



        
    </main>

    <footer id="footer">
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script>
        $(function () {
            $("#header").load("../components/html/header.jsp");
            $("#footer").load("../components/html/footer.jsp");
        });
    </script>
  
</body>
</html>