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
	<div class="container">
		<div class="row justify-content-center">
			<h2>產品資料</h2>
			<h3>${sucessMessage}</h3>
			<table>
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
						<td>${product.productId}</td>
						<td><img width='100' height='100' src='<c:url value="/shop/getPicture/${product.productId}" />' /> </td>
						<td>${product.productName}</td>
						<td>${product.category}</td>
						<td>${product.productSpec}</td>
						<td>${product.unitPrice}</td>
						<td>${product.discount}</td>
						<td>${product.launchdate}</td>
						<td><a href="'<c:url value="/shop/edit/product?productid=${product.productId}" />'" ><input type="button" value="編輯"></a></td>
						<td>
						<form action="${contextRoot}/shop/delete/product" method="post">
						<input type="hidden" name="_method" value="delete" />
						<input type="hidden" name="productid" value="${product.productId}" />
						<input type="submit" class="btn btn-danger" value="刪除" />
						</form>
						</td>						
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<c:forEach var="pageNum" begin="1" end="${page.totalPages}">
				<c:choose>
				<c:when test = "${page.number+1 == pageNum}">
					${pageNum}
				</c:when>
				<c:otherwise>
					<a href="${contextRoot}/shop/allproducts?p=${pageNum}">${pageNum}</a>
				</c:otherwise>
				</c:choose>
				
				<c:if test ="${pageNum != page.totalPages}">
				-
				</c:if>
				
				</c:forEach>
		</div>
	</div>

</body>
</html>