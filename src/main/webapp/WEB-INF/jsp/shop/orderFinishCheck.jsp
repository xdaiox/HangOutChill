<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/20
  Time: 下午 03:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="" type="image/png">
<link rel="stylesheet" href="${contextRoot}/css/shop/shoppingcart.css">
<%-- <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css"> --%>
<jsp:include page="../layout/navbar.jsp" />
<title>訂單確認</title>



</head>
<body>
	<main>
		<!-- 		<section class="category-page area-padding"> -->
		<!-- 			<link -->
		<!-- 				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" -->
		<!-- 				rel="stylesheet"> -->

		<!-- 			<div class="container center" style="width: 30%;"> -->
		<!-- 				<div class="row"> -->
		<!-- 					<h2>訂單資訊</h2> -->
		<!-- 					<table class="table" style="width: 100%; background-color: white"> -->
		<!-- 						<tbody> -->
		<!-- 							<tr> -->
		<!-- 								<th>訂單編號</th> -->
		<%-- 								<td><span>${order.orderNo}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>訂單成立日期</th> -->
		<%-- 								<td><span>${order.orderDate}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>購買人姓名</th> -->
		<%-- 								<td><span>${order.member.reallName}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>購買人電話</th> -->
		<%-- 								<td><span>${order.memberPhone}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>購買人Email</th> -->
		<%-- 								<td><span>${order.memberMail}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>收件人姓名</th> -->
		<%-- 								<td><span>${order.recipientName}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>收件人電話</th> -->
		<%-- 								<td><span>${order.recipientPhone}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>收件人Email</th> -->
		<%-- 								<td><span>${order.recipientMail}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>收件地址</th> -->
		<%-- 								<td><span>${order.shipAddress}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>付款狀態</th> -->
		<%-- 								<td><span>${order.paymentVia}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 							<tr> -->
		<!-- 								<th>出貨狀態</th> -->
		<%-- 								<td><span>${order.shippedDate}</span></td> --%>
		<!-- 							</tr> -->
		<!-- 						</tbody> -->
		<!-- 					</table> -->
		<!-- 				</div> -->
		<!-- 				<h4>感謝您的訂購！</h4> -->
		<!-- 			<div class="shopping-cart-footer"> -->
		<!-- 				<div class="column"> -->
		<!-- 					<a class="btn btn-primary" href="#" data-toast="" -->
		<!-- 						data-toast-type="success" data-toast-position="topRight" -->
		<!-- 						data-toast-icon="icon-circle-check" data-toast-title="Your cart" -->
		<!-- 						data-toast-message="is updated successfully!">回商城首頁</a><a -->
		<%-- 						class="btn btn-success" href='<c:url value="/shop/orderdetail" />'>回HangoutChill首頁</a> --%>
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 			</div> -->

		<!-- 				test -->
		<h5 style="text-align: center;">感謝您的訂購！</h5>
		<div class="container"
			style="background-color: white; display: flex; justify-content: center; align-items: center; width: 65%">
			<div class="row">
				<!-- BEGIN INVOICE -->
				<div class="col-xs-12">
					<div class="grid invoice">
						<div class="grid-body">
							<div class="invoice-title">
								<div class="row">
									<div class="col-xs-12"></div>
								</div>
								<br>
								<div class="row">
									<div class="col-xs-12">
										<h3>
											訂單明細<br> <span class="small">訂單編號: ${order.orderNo}</span>
										</h3>
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-6">
									<address>
										<strong>購買人資訊:</strong><br> 
										姓名: ${order.member.reallName}<br>
										電話: ${order.memberPhone}<br> 
										email:${order.memberMail} <br>
									</address>
								</div>
								<div class="col-md-6 text-right">
									<address>
										<strong>收件人資訊:</strong><br> 
										姓名: ${order.recipientName}<br>
										電話: ${order.recipientPhone}<br> 
										email:${order.recipientMail} <br>
									</address>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<address>
										<strong>付款方式:</strong><br> 
										 <span id="paymentvia">${order.paymentVia}</span> 
									</address>
									<address>
										<strong>付款狀態:</strong><br> 
										  <span id="paymentState">${order.paymentState}</span>
									</address>
								</div>
								<div class="col-md-6 text-right">
									<address>
										<strong>訂購日期:</strong><br> 
										 <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.orderDate}"/>
									</address>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<h3>訂購商品</h3>
									<table class="table table-striped">
										<thead>
											<tr class="line">
												<th><strong>#</strong></th>
												<th class="text-center"><strong>品名</strong></th>
												<th class="text-center"><strong>數量</strong></th>
												<th class="text-right"><strong>單價</strong></th>
												<th class="text-right"><strong>折扣</strong></th>
												<th class="text-right"><strong>小計</strong></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="product" items="${orderDetails}" >
											<tr class="product-title">
												<td>${orderDetails.indexOf(product)+1}</td>
												<td><strong>${product.product.productName}</strong><br></td>
												<td class="text-center" id="amount${orderDetails.indexOf(product)}">${product.amount}</td>
												<td class="text-center" id="price${orderDetails.indexOf(product)}">$${product.product.unitPrice }</td>
												<td class="text-center" id="discount${orderDetails.indexOf(product)}">${product.discount }</td>
												<td class="text-right" id="subtotal${orderDetails.indexOf(product)}"></td>
											</tr>
											
											</c:forEach>
											
											<tr>
												<td colspan="4"></td>
												<td class="text-right"><strong>運費</strong></td>
												<td class="text-right"><strong id="shipfee">$100</strong></td>
											</tr>
											<tr>
												<td colspan="4"></td>
												<td class="text-right"><strong>小計</strong></td>
												<td class="text-right" ><strong id="totalPrice"></strong></td>
											</tr>
											<tr>
												<td colspan="4"></td>
												<td class="text-right"><strong>總計</strong></td>
												<td class="text-right" ><strong id="totalAllPrice"></strong></td>
											</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
					<div class="shopping-cart-footer">
						<div class="column" style="text-align: center;">
							<a class="btn btn-primary" href='<c:url value="/shop/index" />' data-toast=""
								data-toast-type="success" data-toast-position="topRight"
								data-toast-icon="icon-circle-check" data-toast-title="Your cart"
								data-toast-message="is updated successfully!">回商城首頁</a><a
								class="btn btn-success" href='<c:url value="/" />'>回HangoutChill首頁</a>
						</div>
					</div>
			</div>
		</div>


		<!-- 		</section> -->



	</main>




	<!-- 	<footer class="footer-area"> </footer> -->
	<jsp:include page="../layout/footer.jsp" />
	<script src="${contextRoot}/js/jquery-2.2.4.min.js"></script>
	<script src="${contextRoot}/js/popper.js"></script>
	<script src="${contextRoot}/js/bootstrap.min.js"></script>
	<script src="${contextRoot}/js/stellar.js"></script>
	<script src="${contextRoot}/js/jquery.ajaxchimp.min.js"></script>
	<script src="${contextRoot}/js/waypoints.min.js"></script>
	<script src="${contextRoot}/js/mail-script.js"></script>
	<script src="${contextRoot}/js/contact.js"></script>
	<script src="${contextRoot}/js/jquery.form.js"></script>
	<script src="${contextRoot}/js/jquery.validate.min.js"></script>
	<script src="${contextRoot}/js/jquery.validate.min.js"></script>
	<script src="${contextRoot}/js/mail-script.js"></script>
	<script src="${contextRoot}/js/jquery-3.6.4.min.js"></script>
	<script src="${contextRoot}/js/shop/templatemo.js"></script>
	<script src="${contextRoot}/js/theme.js"></script>
	<script>
		// 購物車上的小圖示同步購物車內品項數量
			$.ajax({
					url : 'http://localhost:8080/hangoutchill/shop/get/shoppingCartItemNum',
					type : 'GET',
					contentType : "application/json;charset=UTF-8",
					datatype : 'json',
					success : function(result) {
						console.log(result);
						if (result == 0) {
							$('.count').hide();
						} else {
							$('.count').text(result);
						}

					},
					error : function(err) {
						console.log(err);
						$('.count').hide();
					}
				})

		// 計算各項產品價格與總價
		let cartItems = document.getElementsByClassName('product-title');
		let cartNum = cartItems.length;
		let allPrice = document.getElementById('totalAllPrice');
		let allPriceCount = 0;
		let shipFee = document.getElementById('shipfee');
		console.log(cartNum);
		let totalPrice = document.getElementById('totalPrice');
		let totalPriceCount = 0;
		for (let i = 0; i < cartNum; i++) {
			let price = document.getElementById('price' + i).innerHTML;
			//             console.log(price)
			let discount = document.getElementById('discount' + i).innerHTML;
			if (discount == "—") {
				discount = 1;
			}
			let amount = document.getElementById('amount' + i).innerHTML;
			console.log(amount);
			let subtotal = document.getElementById('subtotal' + i);
			let actprice = parseInt(price.slice(1));

// 			            console.log(price.slice(1));
			subtotal.innerHTML = Math.round(actprice * discount * amount);

			totalPriceCount += Math.round(actprice * discount * amount);

			if (discount === "1.0") {
				document.getElementById('discount' + i).innerHTML = "—";
			}

		}
		totalPrice.innerHTML = '$' + totalPriceCount;
		if(totalPriceCount >= 799){
			allPrice.innerHTML = '$' + totalPriceCount;
			shipFee.innerHTML = '$0';
		}else{
			allPrice.innerHTML = '$' + (totalPriceCount+100);
			shipFee.innerHTML = '$100';
		}
		
		
		

		let paymentState = document.getElementById('paymentState');
		let paymentVia = document.getElementById('paymentvia').innerHTML;
// 		if(!paymentState.innerHTML && paymentVia === "線上刷卡"){
// 			console.log("嗨嚕");
// 			paymentState.innerHTML = "已付款";
// 		}
		if(paymentState.innerHTML){
// 			console.log("嗨嚕");
			paymentState.innerHTML = "已付款";
		}
		console.log(paymentState.innerHTML);
		console.log(paymentVia.innerHTML);
		// 刪除品項
		

		// 點擊數量按鈕增減
		
	</script>
</body>
</html>
