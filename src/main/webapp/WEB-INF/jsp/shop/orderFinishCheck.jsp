<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/20
  Time: 下午 03:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>購物車</title>

<jsp:include page="layout/navbar.jsp" />


</head>
<body>
	<main>
		<section class="category-page area-padding">
			<link
				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
				rel="stylesheet">

			<div class="container center" style="width: 30%;">
				<div class="row">
					<h2>訂單詳細資訊</h2>
					<table class="table" style="width: 100%; background-color: white">
						<tbody>
							<tr>
								<th>訂單編號</th>
								<td><span>${order.orderNo}</span></td>
							</tr>
							<tr>
								<th>訂單成立日期</th>
								<td><span>${order.orderDate}</span></td>
							</tr>
							<tr>
								<th>購買人姓名</th>
								<td><span>${order.member.reallName}</span></td>
							</tr>
							<tr>
								<th>購買人電話</th>
								<td><span>${order.memberPhone}</span></td>
							</tr>
							<tr>
								<th>購買人Email</th>
								<td><span>${order.memberMail}</span></td>
							</tr>
							<tr>
								<th>收件人姓名</th>
								<td><span>${order.recipientName}</span></td>
							</tr>
							<tr>
								<th>收件人電話</th>
								<td><span>${order.recipientPhone}</span></td>
							</tr>
							<tr>
								<th>收件人Email</th>
								<td><span>${order.recipientMail}</span></td>
							</tr>
							<tr>
								<th>收件地址</th>
								<td><span>${order.shipAddress}</span></td>
							</tr>
							<tr>
								<th>付款狀態</th>
								<td><span>${order.paymentVia}</span></td>
							</tr>
							<tr>
								<th>出貨狀態</th>
								<td><span>${order.shippedDate}</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="shopping-cart-footer">
				<div class="column">
					<!-- 						<a class="btn btn-outline-secondary" href="#"><i -->
					<!-- 							class="icon-arrow-left"></i>&nbsp;繼續購物</a> -->
				</div>
				<div class="column">
					<a class="btn btn-primary" href="#" data-toast=""
						data-toast-type="success" data-toast-position="topRight"
						data-toast-icon="icon-circle-check" data-toast-title="Your cart"
						data-toast-message="is updated successfully!">回商城首頁</a><a
						class="btn btn-success" href='<c:url value="/shop/orderdetail" />'>回HangoutChill首頁</a>
				</div>
			</div>

		</section>



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
		$
				.ajax({
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
			let amount = document.getElementById('amount' + i).value;
			// console.log(amount);
			let subtotal = document.getElementById('subtotal' + i);
			let actprice = parseInt(price.slice(1));

			//             console.log(price.slice(1));
			subtotal.innerHTML = Math.round(actprice * discount * amount);

			totalPriceCount += Math.round(actprice * discount * amount);

			if (discount === "1.0") {
				document.getElementById('discount' + i).innerHTML = "—";
			}

		}
		totalPrice.innerHTML = totalPriceCount;

		// 數量更改
		// 但這邊要不要使用AJAX，讓數量隨之更改時更改資料庫的紀錄?
		for (let i = 0; i < cartNum; i++) {
			let amount = document.getElementById('amount' + i);
			console.log(amount.value);
			amount.addEventListener('change', updatePrice);
		}

		function updatePrice() {
			totalPriceCount = 0;
			for (let i = 0; i < cartNum; i++) {
				let price = document.getElementById('price' + i);
				if (price != null) {
					let discount = document.getElementById('discount' + i).innerHTML;
					if (discount == "—") {
						discount = 1;
					}
					let amount = document.getElementById('amount' + i).value;
					// console.log(amount);
					let subtotal = document.getElementById('subtotal' + i);
					let actprice = parseInt(price.innerHTML.slice(1));
					// console.log(actprice);
					subtotal.innerHTML = Math.round(actprice * discount
							* amount);
					totalPriceCount += Math.round(actprice * discount * amount);
					if (discount === "1.0") {
						document.getElementById('discount' + i).innerHTML = "—";
					}
				}
			}
			totalPrice.innerHTML = totalPriceCount
		}

		// 刪除品項
		for (let i = 0; i < cartNum; i++) {
			let deleteBtn = document.getElementById('deleteBtn' + i);
			let theItem = document.getElementById('productItem' + i);
			deleteBtn
					.addEventListener(
							'click',
							function() {
								let sId = deleteBtn.dataset.id;
								console.log(sId);
								let check = confirm('是否從購物車中刪除這個商品?');
								if (check) {
									theItem.remove();
									// 以AJAX同步更新資料表
									$
											.ajax({
												url : 'http://localhost:8080/hangoutchill/shop/delete/cartItem',
												method : 'delete',
												contentType : "application/json;charset=UTF-8",
												dataType : 'json',
												data : JSON.stringify({
													'cartid' : sId
												}),
												success : function(result) {
													console.log(result);
													alert("本項商品已成功刪除！");
												},
												error : function(err) {
													console.log(err);
													alert("購物車中無此項商品2222");
												}
											});

									$
											.ajax({
												url : 'http://localhost:8080/hangoutchill/shop/get/shoppingCartItemNum',
												type : 'GET',
												contentType : "application/json;charset=UTF-8",
												datatype : 'json',
												success : function(result) {
													console.log(result);
													if (result == 0) {
														$('.count').hide();
													} else {
														$('.count')
																.text(result);
													}

												},
												error : function(err) {
													console.log(err);
													$('.count').hide();
												}
											})

									// 									 以AJAX同步更新資料表
									updatePrice();
								}

							});

		}

		// 點擊數量按鈕增減
		let plus = document
				.getElementsByClassName('btn btn-outline-primary js-btn-plus');
		let minus = document
				.getElementsByClassName('btn btn-outline-primary js-btn-minus');

		for (let i = 0; i < plus.length; i++) {
			plus[i].addEventListener('click', function() {
				let theAmount = this.parentElement.previousElementSibling;
				let actValue = parseInt(theAmount.value);
				let sId = theAmount.dataset.id;
				actValue++;
				theAmount.value = actValue;
				updateAmount(sId, actValue);
				theAmount.dispatchEvent(new Event('change'));
			})
		}

		for (let i = 0; i < minus.length; i++) {
			minus[i].addEventListener('click', function() {
				let theAmount = this.parentElement.nextElementSibling;
				let actValue = parseInt(theAmount.value);
				let sId = theAmount.dataset.id;
				if (actValue > 1) {
					actValue--;
					theAmount.value = actValue;
					updateAmount(sId, actValue);
					theAmount.dispatchEvent(new Event('change'));
				}
			})
		}

		function updateAmount(sId, updatedAmount) {
			$
					.ajax({
						url : 'http://localhost:8080/hangoutchill/shop/put/amountupdate',
						method : 'PUT',
						contentType : "application/json;charset=UTF-8",
						dataType : 'json',
						data : JSON.stringify({
							'cartid' : sId,
							'amount' : updatedAmount
						}),
						success : function(result) {
							console.log(result);
							alert(result);
						},
						error : function(err) {
							console.log(err);
							alert(err);
						}
					});
		}
	</script>
</body>
</html>
