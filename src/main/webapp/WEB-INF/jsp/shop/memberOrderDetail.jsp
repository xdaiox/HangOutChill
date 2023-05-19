<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/21
  Time: 下午 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
    <title>一般會員中心</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"/>
<section class="search">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <aside>
                    <div class="aside-body">
                        <div class=" btn-group-vertical my-3" >
                            <ul>
                                <li class="btn btn-primary btn-lg" style="margin: 0px 0px 0px -1px; background: #9C84BC;border: #c8cbcf 0px; border-radius: 5px 5px 0px 0px"><a href="#" style="color: azure;">我的訂單</a>
                                </li>
                                <li class="btn btn-secondary btn-lg" style="background: #E1E3E5; border: #c8cbcf 0px"><a href="#" style="color: #7455bb;">收藏文章</a></li>
                                <li class="btn btn-primary btn-lg" style=" background: #9C84BC;border: #c8cbcf 0px;"><a href="${contextRoot}/actandles/detail/gotoMemberCenter"  style="color: azure;" >我的活動</a></li>
                                <li class="btn btn-secondary btn-lg" style="background: #E1E3E5; border: #c8cbcf 0px ;" ><a href="#" style="color: #7455bb;">我的地點</a></li>
                                <a href="${contextRoot}/discussion/allFavourite"  style="color: azure;" ><li class="btn btn-primary btn-lg" style=" background: #9C84BC;border: #c8cbcf 0px;  border-radius: 0px 0px 5px 5px">收藏討論</li></a>
                            </ul>
                        </div>
                    </div>
                </aside>
            </div>
                <div class="col-md-9" style="background-color: white">
                    <div style="width:60%;">
                            <div class="col-sm-12">
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
												<th class="text-center"><strong>單價</strong></th>
												<th class="text-center"><strong>折扣</strong></th>
												<th class="text-right"><strong>小計</strong></th>
											</tr>
										</thead>
										<tbody>
											<jstl:forEach var="product" items="${orderDetails}" >
											<tr class="product-title">
												<td>${orderDetails.indexOf(product)+1}</td>
												<td><strong>${product.product.productName}</strong><br></td>
												<td class="text-center" id="amount${orderDetails.indexOf(product)}">${product.amount}</td>
												<td class="text-center" id="price${orderDetails.indexOf(product)}">$${product.product.unitPrice }</td>
												<td class="text-center" id="discount${orderDetails.indexOf(product)}">${product.discount }</td>
												<td class="text-right" id="subtotal${orderDetails.indexOf(product)}"></td>
											</tr>
											
											</jstl:forEach>
											
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
                    </div>
                </div>
        </div>
    </div>
</section>
<jsp:include page="../layout/footer.jsp"/>
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

//		            console.log(price.slice(1));
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
//	if(!paymentState.innerHTML && paymentVia === "線上刷卡"){
//		console.log("嗨嚕");
//		paymentState.innerHTML = "已付款";
//	}
if(paymentState.innerHTML){
//		console.log("嗨嚕");
	paymentState.innerHTML = "已付款";
}
console.log(paymentState.innerHTML);
console.log(paymentVia.innerHTML);
// 刪除品項


</script>

</body>
</html>
