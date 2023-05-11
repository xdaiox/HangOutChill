<%-- Created by IntelliJ IDEA. User: iztuc Date: 2023/4/20 Time: 下午 03:12 To change this template use File | Settings |
	File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
<title>訂單明細</title>

<jsp:include page="layout/navbar.jsp" />


</head>

<body>
	<main>
		<section class="category-page area-padding">
			<link
				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
				rel="stylesheet">
			<div class="container padding-bottom-3x mb-1" style="max-width: 70%">
				<div class="table-responsive shopping-cart"
					style="margin-bottom: 0px;">
					<div style="text-align: left; background-color: #D9D9D9;">
						<h2 style="padding: 10px; margin-bottom: 0">訂單明細</h2>
					</div>
					<table class="table" style="background-color: white">
						<thead>
							<tr>
								<th>產品名稱</th>
								<th class="text-center">數量</th>
								<th class="text-center">單價</th>
								<th class="text-center">折扣</th>
								<th class="text-center">小計</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cartItem" items="${shoppingCartItems}">
								<tr id="productItem${shoppingCartItems.indexOf(cartItem)}">
									<td>
										<div class="product-item">
											<div class="product-info">
												<h4 class="product-title">
													<a href="#">${cartItem.product.productName}</a>
												</h4>
												<span>${cartItem.product.productSpec}</span>
											</div>
										</div>
									</td>
									<td class="text-center">
										<div class="count-input"
											id="amount${shoppingCartItems.indexOf(cartItem)}">
											${cartItem.amount}</div>

									</td>
									<td class="text-center text-lg text-medium"
										id="price${shoppingCartItems.indexOf(cartItem)}">$${cartItem.product.unitPrice}</td>
									<td class="text-center text-lg text-medium"
										id="discount${shoppingCartItems.indexOf(cartItem)}">${cartItem.product.discount}</td>
									<td class="text-center text-lg text-medium"
										id="subtotal${shoppingCartItems.indexOf(cartItem)}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="shopping-cart-footer">
					<div class="column">
						<!-- 						<form class="coupon-form" method="post"> -->
						<!-- 							<input class="form-control form-control-sm" type="text" -->
						<!-- 								placeholder="Coupon code" required=""> -->
						<!-- 							<button class="btn btn-outline-primary btn-sm" type="submit">Apply -->
						<!-- 								Coupon</button> -->
						<!-- 						</form> -->
					</div>
					<div class="column text-lg">
						運費: <span class="text-medium" style="font-size: larger;">$588</span><br>
						總計: <span class="text-medium" id="totalPrice"
							style="font-size: 1.5em; color: red;">${totalprice}</span>
					</div>
				</div>
				<div class="container" style="background-color: white">
					<form:form method="post" action="${contextRoot}/shop/ecpaycheckout" modelAttribute="order">
					<div class="row">
						<div class="col-md-5">
							<h3 style="text-align: left; margin: 20px 0px;">付款方式</h3>
							<div class="form-group">
								<label for="payment-method">選擇配送方式</label> 
								<form:select class="form-control" id="payment-method" name="shipVia" path="shipVia">
									<form:option value="宅配到府" label="宅配到府"/>
									<form:option value="超商取貨" label="超商取貨"/>
								</form:select>
							</div>
							<div class="form-group">
								<label for="payment-method">選擇付款方式</label> 
								<form:select class="form-control" id="payment-method" name="paymentVia" path="paymentVia">
									<form:option value="線上刷卡" label="線上刷卡"/>
									<form:option value="貨到付款" label="貨到付款"/>
								</form:select>
							</div>
							
						</div>
						<div class="col-md-7">
							<h3 style="text-align: left; margin: 20px 0px;">購買人資訊</h3>
							<div class="form-row">
								<div class="col">
									<label for="buyer-name">購買人姓名</label> <input type="text"
										class="form-control" id="buyer-name" value="${user.reallName}"
										readonly="readonly">
								</div>
								<div class="col">
									<label for="buyer-phone">購買人手機</label> 
									<form:input type="text" class="form-control" id="buyer-phone" path="memberPhone" />
								</div>
							</div>
							<div class="form-group">
								<label for="buyer-address">購買人email</label> <form:input type="text"
									class="form-control" id="buyer-address" placeholder=""
									value="${user.account}" path="memberMail" />
							</div>
							<h3
								style="text-align: left; margin: 20px 0px; display: inline-block;">收件人資訊</h3>
							<input type="button" value="複製購買人資訊"
								class="btn btn-outline-warning" style="font-size: 0.8em;">
							<div class="form-row">
								<div class="col">
									<label for="buyer-name">收件人姓名</label> <form:input type="text"
										class="form-control" id="buyer-name" placeholder="" path="recipientName" />
								</div>
								<div class="col">
									<label for="buyer-phone">收件人手機</label> <form:input type="text"
										class="form-control" id="buyer-phone" placeholder="" path="recipientPhone" />
								</div>
							</div>
							<div class="form-group">
								<label for="buyer-address">收件人email</label> <form:input type="text"
									class="form-control" id="buyer-address" placeholder="" path="recipientMail" />
							</div>

							<div class="form-group">
								<label for="recipient-address">收件人地址</label> <form:input type="text"
									class="form-control" id="recipient-address" placeholder="" path="shipAddress" />
							</div>

						</div>
					</div>
					<div class="shopping-cart-footer">
						<!-- <div class="column"><a class="btn btn-outline-secondary" href="#"><i class="icon-arrow-left"></i>&nbsp;Back to Shopping</a></div> -->
						<div class="column" style="text-align: center;">
							<!-- <a class="btn btn-primary" href="#" data-toast="" data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Your cart" data-toast-message="is updated successfully!">繼續逛逛</a> -->
							<input class="btn btn-success" value="提交訂單" id="submit" type="submit">
						</div>
					</div>
					</form:form>
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

		let cartItems = document.getElementsByClassName('product-title');
		let cartNum = cartItems.length;
		console.log(cartNum);
		for (let i = 0; i < cartNum; i++) {
			let price = document.getElementById('price' + i).innerHTML;
			console.log(price.slice(2, -1));
			let discount = document.getElementById('discount' + i).innerHTML;
			if (discount == "—") {
				discount = 1;
			}
			let amount = document.getElementById('amount' + i).innerHTML;
			console.log(amount);
			let subtotal = document.getElementById('subtotal' + i);
			let actprice = parseInt(price.slice(1));
			subtotal.innerHTML = Math.round(actprice * discount * amount);

			if (discount === "1.0") {
				document.getElementById('discount' + i).innerHTML = "—";
			}
		}
	</script>
</body>

</html>