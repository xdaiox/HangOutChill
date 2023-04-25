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
			<table>
				<thead>
					<tr>
						<th scope="col">產品編號</th>
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
						<td>${product.productName}</td>
						<td>${product.category}</td>
						<td>${product.productSpec}</td>
						<td>${product.unitPrice}</td>
						<td>${product.discount}</td>
						<td>${product.launchdate}</td>
						<td><input type="button" value="編輯"></td>
						<td><input type="button" value="刪除"></td>						
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>