<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8">
<style>
	label{
		margin:20px 0px;
	}
</style>
<title>訂單詳細資訊頁面</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>

<body>
<div class="container-scroller">
<jsp:include page="../dbLayout/top_navbar.jsp" />
<div class="container-fluid page-body-wrapper">
<jsp:include page="../dbLayout/left_navbar.jsp" />
<div class="container">

<div class="content_box" style="width: 100%">

			<h3  style="text-align: center;">訂單詳細資訊：</h3>
			
			<div class="content"
						style="background-color: #ffffff00; height: 100%">
				<div class="col-12" style="margin: auto">
				<div class="card">
				<div class="card-body">
			
			
			<form:form method="put" action="${contextRoot}/shop/edit/product" modelAttribute="order"
				enctype="multipart/form-data">
						<p><span>*</span> <label for="proname">訂單編號 :</label></p>
						<form:input name="proname" id="proname" path="orderNo" disabled="true" class="form-control" /><span
							id="nerror" class="error"></span><span
							id="ncorrect" class="correct"></span>
						<p><span>*</span> <label for="category">購買人姓名 :</label></p>
						<form:input name="category" id="category" path="member.reallName" disabled="true" class="form-control" />
								<span id="catgerror" class="error"></span><span id="catgcorrect"
							class="correct"></span>
						<p><span>* </span><label for="content">購買人電話 :</label></p>
						<form:input type="text" name="content" id="content"  path="memberPhone" disabled="true" class="form-control"/><span
							id="contenterror" class="error"></span><span
							id="contentcorrect" class="correct"></span>
						<p><span>* </span><label for="content">購買人email :</label></p>
						<form:input type="text" name="content" id="content" path="memberMail" disabled="true" class="form-control" /><span
							id="contenterror" class="error"></span><span
							id="contentcorrect" class="correct"></span>
						<p><span>* </span><label for="unitprice">收件人姓名 :</label></p>
						<form:input type="text" name="unitprice" id="unitprice" path="recipientName" disabled="true" class="form-control"/><span
							id="prierror" class="error"></span><span
							id="pricorrect" class="correct"></span>
						<p><span>* </span><label for="unitprice">收件人電話 :</label></p>
						<form:input type="text" name="unitprice" id="unitprice" path="recipientPhone" disabled="true" class="form-control"/><span
							id="prierror" class="error"></span><span
							id="pricorrect" class="correct"></span>
						<p><span>* </span><label for="unitprice">收件人email:</label></p>
						<form:input type="text" name="unitprice" id="unitprice" path="recipientMail" disabled="true" class="form-control"/><span
							id="prierror" class="error"></span><span
							id="pricorrect" class="correct"></span>
						<p><span>* </span><label for="discount"> 訂購日期：</label><br />
						<form:input type="text" name="discount" id="discount" path="orderDate" disabled="true" class="form-control" /><span
							id="dserror" class="error"></span><span
							id="dscorrect" class="correct"></span>
						<p><span>* </span><label for="discount"> 付款方式：</label><br />
						<form:input type="text" name="discount" id="discount" path="paymentVia" disabled="true" class="form-control" /><span
							id="dserror" class="error"></span><span
							id="dscorrect" class="correct"></span>
						<p><span>* </span><label for="launchdate">付款狀態:</label></p>
						<form:input type="text" name="launchdate" id="launchdate" path="paymentState" disabled="true" class="form-control"  /><span
							id="dateerror" class="error"></span><span
							id="datecorrect" class="correct"></span>
						<h4 style="margin-top: 30px;">訂購商品：</h4>
						<div>
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
			</form:form>
			<form action="${contextRoot}/shop/edit/product" style="display:inline;">
											<input type="hidden" name="productid"
												value="" /> <input type="submit"
												class="btn btn-primary" value="編輯訂單" />
										</form>

						<a href="${contextRoot}/shop/allorders" style="display:inline;"><input type="button" value="回前頁" class="btn btn-outline-warning" /></a>

</div>
</div>
</div>
</div>

</div>

</div>
</div>
</div>
	<script>
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

//			            console.log(price.slice(1));
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
//		if(!paymentState.innerHTML && paymentVia === "線上刷卡"){
//			console.log("嗨嚕");
//			paymentState.innerHTML = "已付款";
//		}
	if(paymentState.innerHTML){
//			console.log("嗨嚕");
		paymentState.innerHTML = "已付款";
	}
	console.log(paymentState.innerHTML);
	console.log(paymentVia.innerHTML);
    </script>
</body>
</html>


