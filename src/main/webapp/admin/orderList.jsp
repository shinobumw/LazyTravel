<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>後臺 - 訂單管理</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<link rel="icon" href="../static/images/logo.ico" type="image/x-icon">

<style>


  button.btn-modify, #filterBtn, a.btn-modify {
        background-color: #9C6644;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
        border-radius: 8px;
  }
  
  button.btn-modify:hover, #filterBtn:hover, a.btn-modify:hover {
     background-color: #804C33;
        background-color: #B07C56;
        /* Slightly lighter shade for hover */
        color: white;
  }
  
 	button.btn-modify:active, #filterBtn:active, a.btn-modify:active{
           background-color: #804C33;
        /* Slightly darker shade for click */
        color: white;
        box-shadow: 0 5px #666;
        transform: translateY(4px);
  }

#order thead th div.dt-head-inner {
	white-space: nowrap;
	display: inline-block;
}

#order thead th {
	white-space: nowrap;
}

/* 設置表格佈局為固定 */
#order {
	table-layout: fixed;
	width: 100%; /* 根據需要調整 */
}

/* 設置每列的寬度 */
#order thead th {
	width: 100px;
}

#order td {
	text-align: center; /* 水平居中 */
	vertical-align: middle; /* 垂直居中 */
}
</style>
</head>

<body>
	<div id="header"></div>

	<div id="main" class="p-3">
		<h3 class="mx-3 mb-4">訂單總覽</h3>
		<div class="card mx-5 my-5">
			<div class="card-header">總覽查詢</div>
			<div class="mx-5 my-5">
				<table id="order" class="table table-striped">
					<thead>
						<tr>
							<th style="text-align: center">修改</th>
							<th style="text-align: center">明細</th>
							<th style="text-align: center">訂單編號</th>
							<th style="text-align: center">訂單Id</th>
							<th style="text-align: center">顧客編號</th>
							<th style="text-align: center">團編號</th>
							<th style="text-align: center">旅客人數</th>
							<th style="text-align: center">會員金</th>
							<th style="text-align: center">優惠券Id</th>
							<th style="text-align: center">總金額</th>
							<th style="text-align: center">創建日期</th>
							<th style="text-align: center">更新日期</th>
							<th style="text-align: center">付款日期</th>
							<th style="text-align: center">訂單狀態</th>



						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/select/1.7.0/js/dataTables.select.min.js"></script>




	<script>

		$(function () {

			$("#header").load("../admin/header.jsp");
			init();


		});

		function init() {


			$.ajax({
				url: "<%=request.getContextPath()%>/order/order.do",
				type: "GET",
				data: { "action": "getall" },
				dataType: "json",
				beforeSend: function () {
					$("ul.task_list").html(
						'<li style="text-align: center;"><i class="fas fa-spinner fa-spin fa-3x"></i></li>'
					);
				},

							

				success: function (data) {
					let dataSet = [];
					data.forEach((item) => {
						let tmpArr = [];
						console.log(item.orderId)
// 						let modifyBtn = `
// 						    <td>
// 							 <a href="orderEditor.jsp?order_id=${item.orderId}&order_no=${item.orderNo}&order_status=${item.orderStatus}" class="btn-modify btn" style="white-space: nowrap;">修改</a>
// 						            <input type="hidden" name="action" value="update">
// 						    </td>
// 						`;
	
							let modifyBtn = 
						    '<td>' + 
							'<a href="orderEditor.jsp?order_id=' + item.orderId + '&order_no=' + item.orderNo + '&order_status=' + item.orderStatus + '" class="btn-modify btn" style="white-space: nowrap;">修改</a>' +
						    '<input type="hidden" name="action" value="update">' +
						    '</td>';
						
						let customerDetail = 
							'<td>' +
				            '<a class="customerDetail btn-modify btn" href="passengerDetails.jsp?order_id=' + item.orderId + '&order_no=' + item.orderNo + '&order_status=' + item.orderStatus +'&tourist=' + item.tourist + '" class="btn-modify btn" style="white-space: nowrap;">旅客明細</a>' +							
							'</td>';
						
						let statusCell = '';
						if (item.orderStatus == 0) {
							statusCell = '<span class="status-unpaid">未付款</span>';
						} else if (item.orderStatus == 1) {
							statusCell = '<span class="status-paid">已付款</span>';
						} else if (item.orderStatus == 2) {
							statusCell = '<span class="status-canceled">已取消</span>';
						}

						let paidtimeCell = '';
						if (item.paidTime == null) {
							paidtimeCell = '<span class="status-unpaid">--</span>';
						}else{
							paidtimeCell = formatDateTime(item.paidTime);
						}


						let scoreCell = '';
						if (item.score == null) {
							scoreCell = '<span>--</span>';
						}

						let contentCell = '';
						if (item.content == null) {
							contentCell = '<span>--</span>';
						}

						let contentTimeCell = '';
						if (item.contentTime == null) {
							contentTimeCell = '<span>--</span>';
						}
						
						let couponIdCell = '';
						if(item.couponId == null){
							couponIdCell = '未使用'
						}else{
							couponIdCell = item.couponId;
						}


						function formatDateTime(timestamp) {
							const options = {
								year: 'numeric',
								month: '2-digit',
								day: '2-digit',
								hour: '2-digit',
								minute: '2-digit',
								second: '2-digit',
							};
							return new Date(timestamp).toLocaleString('zh-TW', options).replace(',', '');
						}
						
						tmpArr.push(modifyBtn);
						tmpArr.push(customerDetail);
						tmpArr.push(item.orderNo);
						tmpArr.push(item.orderId);
						tmpArr.push(item.customerId);
						tmpArr.push(item.groupId);
						tmpArr.push(item.tourist);
						tmpArr.push(item.customerPoint);
						tmpArr.push(couponIdCell);
						tmpArr.push(item.totalAmt);
						tmpArr.push(formatDateTime(item.createTime));
						tmpArr.push(formatDateTime(item.updateTime));
						tmpArr.push(paidtimeCell);
						tmpArr.push(statusCell);
					
						
						dataSet.push(tmpArr)
					});



					new DataTable('#order', {
						autoWidth: false,
						data: dataSet,
						scrollX: true,

						columns: [
							{ data: 0 , orderable: false, searchable: false },
							{ data: 1 , orderable: false, searchable: false },
							{ data: 2 },
							{ data: 3 },
							{ data: 4 },
							{ data: 5 },
							{ data: 6 },
							{ data: 7 },
							{ data: 8 },
							{ data: 9 },
							{ data: 10 },
							{ data: 11 },
							{ data: 12 },
							{ data: 13 }

						],
					});
				},

				error: function () {
					console.log("init error");
				}

				
			});

		}


	</script>
</body>

</html>