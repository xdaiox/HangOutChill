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

				<div class="container" style="background-color: white; display: flex; justify-content: center; align-items: center; width:65% ">
    <div class="row">
      <!-- BEGIN INVOICE -->
      <div class="col-xs-12">
        <div class="grid invoice">
          <div class="grid-body">
            <div class="invoice-title">
              <div class="row">
                <div class="col-xs-12">
                </div>
              </div>
              <br>
              <div class="row">
                <div class="col-xs-12">
                  <h2>訂單明細<br>
                    <span class="small">訂單編號 #1082</span>
                  </h2>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-md-6">
                <address>
                  <strong>Billed To:</strong><br>
                  Twitter, Inc.<br>
                  795 Folsom Ave, Suite 600<br>
                  San Francisco, CA 94107<br>
                  <abbr title="Phone">P:</abbr> (123) 456-7890
                </address>
              </div>
              <div class="col-md-6 text-right">
                <address>
                  <strong>Shipped To:</strong><br>
                  Elaine Hernandez<br>
                  P. Sherman 42,<br>
                  Wallaby Way, Sidney<br>
                  <abbr title="Phone">P:</abbr> (123) 345-6789
                </address>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <address>
                  <strong>Payment Method:</strong><br>
                  Visa ending **** 1234<br>
                  h.elaine@gmail.com<br>
                </address>
              </div>
              <div class="col-md-6 text-right">
                <address>
                  <strong>Order Date:</strong><br>
                  17/06/14
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
                      <th class="text-center"><strong>PROJECT</strong></th>
                      <th class="text-center"><strong>HRS</strong></th>
                      <th class="text-right"><strong>RATE</strong></th>
                      <th class="text-right"><strong>SUBTOTAL</strong></th>
                    </tr>
                  </thead>
                  <tbody> 
                    <tr>
                      <td>1</td>
                      <td><strong>Template Design</strong><br>A website template is a pre-designed webpage, or set of webpages, that anyone can modify with their own content and images to setup a website.</td>
                      <td class="text-center">15</td>
                      <td class="text-center">$75</td>
                      <td class="text-right">$1,125.00</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td><strong>Template Development</strong><br>Web development is a broad term for the work involved in developing a website for the Internet (World Wide Web) or an intranet (a private network).</td>
                      <td class="text-center">15</td>
                      <td class="text-center">$75</td>
                      <td class="text-right">$1,125.00</td>
                    </tr>
                    <tr class="line">
                      <td>3</td>
                      <td><strong>Testing</strong><br>Take measures to check the quality, performance, or reliability of something, especially before putting it into widespread use or practice.</td>
                      <td class="text-center">2</td>
                      <td class="text-center">$75</td>
                      <td class="text-right">$150.00</td>
                    </tr>
                    <tr>
                      <td colspan="3"></td>
                      <td class="text-right"><strong>Taxes</strong></td>
                      <td class="text-right"><strong>N/A</strong></td>
                    </tr>
                    <tr>
                      <td colspan="3"></td>
                      <td class="text-right"><strong>Total</strong></td>
                      <td class="text-right"><strong>$2,400.00</strong></td>
                    </tr>
                </table>
              </div>
            </div>
          </div>
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
