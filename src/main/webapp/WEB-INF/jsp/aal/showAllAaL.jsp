<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

			<div class="content" style="background-color: #ffffff00;">
				<h1>輪播圖</h1>

			</div>
			<div class="content" style="background-color: #ffffff00;">
				<p>活動總攬
				<form action="${contextRoot}/actandles/shop/postall">
					<input type="submit" class="btn btn-outline-info btn-sm"
						value="活動總覽" />
				</form>
				<form action="${contextRoot}/actandles/detail/showmysignup">
					<input type="submit" class="btn btn-outline-info btn-sm"
						value="我的活動/課程" />
				</form>
				<div class="table-responsive">
					<table class="table table-hover table-bordered table-light">
						<thead>
							<tr>
								<th>項目ID
								<th>商家ID
								<th>名稱
								<th>內容
								<th>分類
								<th>新增時間
								<th>舉辦日
								<th>報名費用
								<th>預計名額
								<th>最低開辦人數
								<th>報名截止日
								<th>當前狀態
								<th>預覽圖
						</thead>
						<tbody>
							<jstl:forEach var="aal" items="${page.content}">
								<tr>
									<td class="align-middle">${aal.id}
									<td class="align-middle">${aal.normalMember.id}
									<td class="align-middle"><a href="${contextRoot}/actandles/${aal.id}">${aal.name}</a>
									<td class="align-middle">${aal.aalContent}
									<td class="align-middle"><jstl:if
											test="${aal.topic=='act'}">活動</jstl:if> <jstl:if
											test="${aal.topic=='les'}">課程</jstl:if>
									<td class="align-middle"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm:ss"
											value="${aal.theDayofSubmission}" />
									<td class="align-middle"><span><fmt:formatDate
												pattern="yyyy-MM-dd" value="${aal.theDayofStarts}" /></span>
									<td class="align-middle">${aal.fee}
									<td class="align-middle">${aal.quota}
									<td class="align-middle">${aal.lowerLimit}
									<td class="align-middle"><span><fmt:formatDate
												pattern="yyyy-MM-dd" value="${aal.deadLine}" /></span>
									<td class="align-middle">${aal.currentStatus}
									<td class="align-middle"><img width="200px" height="200px"
										src="data:image/png;base64,${aal.base64image}"> <br />
									<td class="align-middle">
							</jstl:forEach>
						</tbody>
					</table>

				</div>

			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp" />
</body>
</html>