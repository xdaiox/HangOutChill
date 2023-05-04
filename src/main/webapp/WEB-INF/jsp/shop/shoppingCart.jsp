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
							<tr>
								<td>
									<div class="product-item">
										<a class="product-thumb" href="#"><img
											width='100' height='100'
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
										<input type="text" class="form-control text-center" value="${cartItem.amount}"
											placeholder="" aria-label="Example text with button addon"
											aria-describedby="button-addon1">
										<div class="input-group-append">
											<button class="btn btn-outline-primary js-btn-plus"
												type="button">&plus;</button>
										</div>
									</div>
								</td>
								<td class="text-center text-lg text-medium">$ ${cartItem.product.unitPrice}</td>
								<td class="text-center text-lg text-medium">${cartItem.product.discount}</td>
								<td class="text-center text-lg text-medium">$ </td>
								<td class="text-center"><a class="remove-from-cart"
									href="#" data-toggle="tooltip" title=""
									data-original-title="Remove item"><i class="fa fa-trash"></i></a></td>
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
						總計: <span class="text-medium" style="font-size: larger;">$289.68</span>
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
</body>
</html>
