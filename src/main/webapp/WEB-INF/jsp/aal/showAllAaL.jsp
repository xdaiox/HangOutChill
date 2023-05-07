<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動與課程</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp" />
	<div class="container content_view" style="background-color: #ffffff00">
		<div class="content_box">

			<div class="content_title" style="background-color: #ffffff00">
				<h1>主頁面</h1>
				<br>
			</div>
			<div class="content" style="background-color: #ffffff00">
				<form action="${contextRoot}/actandles/shop/postall">
					<input type="submit" class="btn btn-outline-info btn-sm" value="活動總覽" />
				</form>
				<form action="${contextRoot}/actandles/detail/showmysignup">
					<input type="submit" class="btn btn-outline-info btn-sm" value="我的活動/課程" />
				</form>

			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp" />
</body>
</html>