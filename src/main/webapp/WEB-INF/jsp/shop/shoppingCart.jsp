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
			<div class="container padding-bottom-3x mb-1" style="max-width: 70%">
				<div class="table-responsive shopping-cart">
					<div style="text-align: center;">
						<h2>我的購物車</h2>
					</div>
					<table class="table" style="background-color: white">
						<thead>
							<tr>
								<th>產品名稱</th>
								<th class="text-center">數量</th>
								<th class="text-center">單價</th>
								<th class="text-center">折扣</th>
								<th class="text-center">小計</th>
								<th class="text-center"><a
									class="btn btn-sm btn-outline-danger" href="#">刪除產品</a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cartItem" items="${shoppingCartItems}">
								<tr id="productItem${shoppingCartItems.indexOf(cartItem)}">
									<td>
										<div class="product-item">
											<a class="product-thumb" href="#"><img width='100'
												height='100'
												src='<c:url value="/shop/getPicture/${cartItem.product.productId}" />'
												alt="Product"></a>
											<div class="product-info">
												<h4 class="product-title">
													<a href="#">${cartItem.product.productName}</a>
												</h4>
												<span>${cartItem.product.productSpec}</span>
											</div>
										</div>
									</td>
									<td class="text-center">
										<div class="input-group mb-3"
											style="max-width: 120px; margin: auto;">
											<div class="input-group-prepend">
												<button class="btn btn-outline-primary js-btn-minus"
													type="button">&minus;</button>
											</div>
											<input type="text" class="form-control text-center"
												value="${cartItem.amount}" placeholder=""
												aria-label="Example text with button addon"
												aria-describedby="button-addon1"
												id="amount${shoppingCartItems.indexOf(cartItem)}">
											<div class="input-group-append">
												<button class="btn btn-outline-primary js-btn-plus"
													type="button">&plus;</button>
											</div>
										</div>
									</td>
									<td class="text-center text-lg text-medium"
										id="price${shoppingCartItems.indexOf(cartItem)}">$${cartItem.product.unitPrice}</td>
									<td class="text-center text-lg text-medium"
										id="discount${shoppingCartItems.indexOf(cartItem)}">${cartItem.product.discount}</td>
									<td class="text-center text-lg text-medium"
										id="subtotal${shoppingCartItems.indexOf(cartItem)}"></td>
									<td class="text-center"><a class="remove-from-cart"
										href="#" data-toggle="tooltip" title=""
										data-original-title="Remove item"><i class="fa fa-trash"
											id="deleteBtn${shoppingCartItems.indexOf(cartItem)}"></i></a></td>
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
							style="font-size: 1.5em; color: red;"></span>
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
							data-toast-message="is updated successfully!">繼續逛逛</a><a
							class="btn btn-success" href="#">確認結帳</a>
					</div>
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
	<script src="${contextRoot}/js/mail-script.js"></script>

	<script src="${contextRoot}/js/shop/templatemo.js"></script>
	<script src="${contextRoot}/js/theme.js"></script>
	<script>
		

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
			deleteBtn.addEventListener('click', function() {
				theItem.remove();
				updatePrice();
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
				actValue++;
				theAmount.value = actValue;
				theAmount.dispatchEvent(new Event('change'));
			})
		}

		for (let i = 0; i < minus.length; i++) {
			minus[i].addEventListener('click', function() {
				let theAmount = this.parentElement.nextElementSibling;
				let actValue = parseInt(theAmount.value);
				if (actValue > 1) {
					actValue--;
					theAmount.value = actValue;
					theAmount.dispatchEvent(new Event('change'));
				}
			})
		}
		
		
	</script>
</body>
</html>
