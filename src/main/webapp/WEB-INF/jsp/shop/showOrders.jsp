<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示所有產品</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../dbLayout/top_navbar.jsp" />

		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../dbLayout/left_navbar.jsp" />
<!-- 			<div class="container"> -->
			<div class="content_box" style="width: 100%">
				<div class="row justify-content-center">
					<!-- 			<h2>產品資料</h2> -->
					<h3>${sucessMessage}</h3>
						<div class="col-md-6">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="搜尋訂單">
								<button class="btn btn-outline-secondary" type="button">搜尋</button>
							</div>
						</div>
					<table class="table table-hover table-bordered table-light">
						<thead>
							<tr>
								<th scope="col">訂單編號</th>
								<th scope="col">訂購人</th>
								<th scope="col">收件人</th>
								<th scope="col">支付方式</th>
								<th scope="col">付款狀態</th>
								<th scope="col">物流方式</th>
								<th scope="col">訂購日期</th>
								<th scope="col">出貨日期</th>
<!-- 								<th scope="col">刪除</th> -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${orderPage.content}">
								<tr>
									<td><a
										href="${contextRoot}/shop/order/orderinfo?orderno=${order.orderNo}">${order.orderNo}</a></td>
									<td>${order.member.reallName}</td>
									<td>${order.recipientName}</td>
									<td>${order.paymentVia}</td>
									<td class="paymentstate">${order.paymentState}</td>
									<td>${order.shipVia}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.orderDate}"/></td>
									<td class="shippedDate">${order.shippedDate}</td>
<!-- 									<td> -->
<%-- 										<form action="${contextRoot}/shop/delete/product" --%>
<!-- 											method="post"> -->
<!-- 											<input type="hidden" name="_method" value="delete" /> <input -->
<%-- 												type="hidden" name="productid" value="${order.orderId}" /> --%>
<!-- 											<input type="submit" class="btn btn-danger" value="刪除" /> -->
<!-- 										</form> -->
<!-- 									</td> -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example"
						style="text-align: center" id="pageNum">
						<c:forEach var="pageNum" begin="1" end="${orderPage.totalPages}">
							<c:choose>
								<c:when test="${orderPage.number+1 == pageNum}">
								${pageNum}
								</c:when>
								<c:otherwise>
									<a href="${contextRoot}/shop/allorders?p=${pageNum}">${pageNum}</a>
								</c:otherwise>
							</c:choose>

							<c:if test="${pageNum != orderPage.totalPages}">
							</c:if>
						</c:forEach>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 出貨狀態
		let theShipDate = document.getElementsByClassName('shippedDate');
		for(let i=0; i<theShipDate.length; i++){
			if(!theShipDate[i].innerHTML){
				theShipDate[i].innerHTML = '<span class="badge badge-pill badge-success">待出貨</span>';
			}
		}

		// 付款狀態
		let paymentState = document.getElementsByClassName('paymentstate');
		for(let i=0; i<paymentState.length; i++){
			if(paymentState[i].innerHTML === "true"){
				paymentState[i].innerHTML = '<span class="badge badge-pill badge-info">已付款</span>'; 
			}else{
				paymentState[i].innerHTML = '<span class="badge badge-pill badge-danger">未付款</span>';
			}
		}


	</script>
</body>
</html>