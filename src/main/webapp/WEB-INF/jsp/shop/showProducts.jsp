<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<div class="content_box" style="width: 100%">
				<div class="row justify-content-center">
					<!-- 			<h2>產品資料</h2> -->
					<h3>${sucessMessage}</h3>
						<div class="col-md-6">
							<a  href="/hangoutchill/shop/add">
								<button class="btn btn-outline-info">新增商品</button>
							</a>
						</div>
						<div class="col-md-6">
							<form method="get" action="${contextRoot}/shop/productslistbyname">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="搜尋產品" name="keyword">
								<button class="btn btn-outline-secondary" type="submit">搜尋</button>
							</div>
							</form>
						</div>
						<h4>${SearchResult}</h4>
					<table class="table table-hover table-bordered table-light">
						<thead>
							<tr>
								<th scope="col">產品編號</th>
								<th scope="col">產品封面</th>
								<th scope="col">產品名稱</th>
								<th scope="col">產品分類</th>
								<th scope="col">產品規格</th>
								<th scope="col">單價</th>
								<th scope="col">折扣</th>
								<th scope="col">上架日期</th>
								<th scope="col">編輯</th>
								<th scope="col">刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${page.content}">
								<tr>
									<td><a
										href="${contextRoot}/shop/singleproduct?productid=${product.productId}">${product.productId}</a></td>
									<td><img width='100' height='100'
										src='<c:url value="/shop/getPicture/${product.productId}" />' />
									</td>
									<td>${product.productName}</td>
									<td>${product.category}</td>
									<td>${product.productSpec}</td>
									<td>${product.unitPrice}</td>
									<td>${product.discount}</td>
									<td>${product.launchdate}</td>
									<td>
										<form action="${contextRoot}/shop/edit/product">
											<input type="hidden" name="productid"
												value="${product.productId}" /> <input type="submit"
												class="btn btn-primary" value="編輯" />
										</form>
									</td>
									<td>
										<form action="${contextRoot}/shop/delete/product"
											method="post">
											<input type="hidden" name="_method" value="delete" /> <input
												type="hidden" name="productid" value="${product.productId}" />
											<input type="submit" class="btn btn-danger" value="刪除" />
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example"
						style="text-align: center" id="pageNum">
						<c:forEach var="pageNum" begin="1" end="${page.totalPages}">
								<c:choose>
								<c:when test="${page.number+1 == pageNum}">
								${pageNum}
								</c:when>
								<c:when test="${search}">
									<a href="${contextRoot}/shop/productslistbyname?p=${pageNum}&keyword=${keyword}">${pageNum}</a>
								</c:when>
								<c:otherwise>
									<a href="${contextRoot}/shop/allproducts?p=${pageNum}">${pageNum}</a>
								</c:otherwise>
								</c:choose>

							<c:if test="${pageNum != page.totalPages}">
							</c:if>
						</c:forEach>
					</nav>
				</div>
			</div>

		</div>
	</div>
</body>
</html>