<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台-優惠券新增</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/checkComplete.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
    <script src="https://kit.fontawesome.com/cb6bf56872.js" crossorigin="anonymous"></script>
    <link rel="icon" href="../static/images/logo.ico" type="image/x-icon">


    <style>
        button.btn_submit {
            width: 100px;
            height: 30px;
            border-radius: 90px;
            border-color: transparent;

            color: white;
            background: #9C6644;
            margin-right: 15px;
        }

        button.btn_submit:active {
            outline: 2px solid #CCD5AE;
            box-shadow: 0 0 8px #a1a397
        }

        button.btn_reset {
            width: 100px;
            height: 30px;
            border-radius: 90px;
            border-color: transparent;
            color: white;
            background: #CCD5AE;
        }

    </style>
</head>


<body>
    <header id="header"></header>
    <main class="main" class="p-3">
        <h3 class="mx-3 my-4">優惠券</h3>

        <div class="card mx-5 my-5">
            <div class="card-header">
                優惠券新增
            </div>
            <div class="card-body">

                <form method="post" action="coupon.do" id="couponForm">
                    <div class="serialNo my-3">
                        <label>優惠號碼：</label>
                        <input type="text" name="serialNo" required>
                    </div>

                    <div class="couponName my-3">
                        <label>優惠名稱： </label>
                        <input type="text" name="couponName" required>
                    </div>

                    <div class="discount my-3">
                        <label>折扣金額： </label>
                        <input type="text" name="discount" required>
                    </div>

                    <div class="threshold my-3">
                        <label>折扣門檻： </label>
                        <input type="text" name="threshold" required>
                    </div>

                    <div class="startTime my-3">
                        <label>生效日期： </label>
                        <input type="datetime-local" name="startTime" required>
                    </div>

                    <div class="endTime my-3">
                        <label>結束日期： </label>
                        <input type="datetime-local" name="endTime" required>
                    </div>

                    <div class="total my-3">
                        <label>發放數量： </label>
                        <input type="number" name="total" required>
                    </div>


                    <div class="div_btn d-flex justify-content-end">
                    	<input type="hidden" name="action" value="insert">
                        <button type="submit" class="btn_submit mx-2">送出</button>
                        <button type="reset" class="btn_reset mx-2" onclick="goBack()" >取消</button>
                    </div>

                </form>


            </div>
        </div>




    </main>

    <footer id="footer"></footer>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="//cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>




    <script>
        $(function () {
            $("#header").load("../admin/header.jsp");
            
        });
        
        document.addEventListener('DOMContentLoaded', function () {
            const startTimeInput = document.querySelector('input[name="startTime"]');
            const endTimeInput = document.querySelector('input[name="endTime"]');
            const discountInput = document.querySelector('input[name="discount"]');
            const thresholdInput = document.querySelector('input[name="threshold"]');

            function clearamtInputs() {
            	discountInput.value = '';
            	thresholdInput.value = '';
            }
            
            function cleartimeInputs() {
                startTimeInput.value = '';
                endTimeInput.value = '';
            }
            
            function validate() {
                const startTime = new Date(startTimeInput.value);
                const endTime = new Date(endTimeInput.value);
                const now = new Date();
                const discount = parseFloat(discountInput.value);
                const threshold = parseFloat(thresholdInput.value);

                if (!isNaN(discount) && !isNaN(threshold) && threshold < discount) {
                    alert('折扣門檻不能小於折扣金額。');
                    clearamtInputs();
                    return false;
                }


                if (startTime > endTime) {
                    alert('生效日期不能晚於結束日期。');
                    cleartimeInputs();
                    return false;
                }

//                 if (startTime > now || endTime > now) {
//                     alert('日期不能大於當前時間。');
//                     cleartimeInputs();
//                     return false;	
//                 }

                return true;
            }

            startTimeInput.addEventListener('change', validate);
            endTimeInput.addEventListener('change', validate);
            discountInput.addEventListener('change', validate);
            thresholdInput.addEventListener('change', validate);
        });
		
        function goBack() {
            // 使用 history 物件返回上一頁
            window.history.go(-1);
        }

    </script>




</body>

</html>