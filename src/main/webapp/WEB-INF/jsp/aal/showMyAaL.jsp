<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>個人活動管理</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp" />
	<div class="container content_view" style="background-color: #ffffff00">
		<div class="content_box" style="width: 100%">
			<div class="content"
				style="background-color: #ffffff00; height: 100%;">
				<div class="row justify-content-center">
					<div class="" style="margin: auto;">
						<h1 style="text-align: center;">活動/課程管理</h1>
						<form action="${contextRoot}/actandles/shop/add">
						<input type="submit" class="btn btn-outline-info btn-sm"value="新增" /></form>
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
										<th>
								</thead>
								<tbody>
									<jstl:forEach var="aal" items="${page.content}">
										<tr>
											<td  class="align-middle">${aal.id}
											<td class="align-middle">${aal.shop_Id}
											<td class="align-middle">${aal.name}
											<td class="align-middle">${aal.aalContent}
											<td class="align-middle"><jstl:if test="${aal.topic=='act'}">活動</jstl:if> <jstl:if
													test="${aal.topic=='les'}">課程</jstl:if>
											<td class="align-middle"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
													value="${aal.theDayofSubmission}" />
											<td class="align-middle"><span><fmt:formatDate pattern="yyyy-MM-dd"
														value="${aal.theDayofStarts}" /></span>
											<td class="align-middle">${aal.fee}
											<td class="align-middle">${aal.quota}
											<td class="align-middle">${aal.lowerLimit}
											<td class="align-middle"><span><fmt:formatDate pattern="yyyy-MM-dd"
														value="${aal.deadLine}" /></span>
											<td class="align-middle">${aal.currentStatus}
											<td class="align-middle"><img width="200px" height="200px"
												src="data:image/png;base64,${aal.base64image}"> <br />
											<td class="align-middle">
												<div style="display: flex">
													<form action="${contextRoot}/actandles/shop/edit">
														<input type="hidden" name="id" value="${aal.id}" /> <input
															type="submit" class="btn btn-outline-info btn-sm"
															value="編輯" />
													</form>

													<form action="${contextRoot}/actandles/shop/delete"
														method="post">
														<input type="hidden" name="_method" value="delete" /> <input
															type="hidden" name="id" value="${aal.id}" /> <input
															type="submit" class="btn btn-outline-danger btn-sm"
															value="刪除" onclick="return confirm('確定刪除?')" />
													</form>
												</div>
									</jstl:forEach>
								</tbody>
							</table>
						</div>
						<br />
						<div  style="text-align:center;" >
						<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
							<%-- 					<jstl:if test="${page.number == pageNumber-1}"><span>${pageNumber}</span></jstl:if> --%>
							<%-- 					<jstl:if test="${page.number != pageNumber-1}"><a href="${contextRoot}/messages?p=${pageNumber}">${pageNumber}</a></jstl:if> --%>
							<jstl:choose>
								<jstl:when test="${page.number == pageNumber-1}">
									<span>${pageNumber}</span>
								</jstl:when>
								<jstl:otherwise>
									<a href="${contextRoot}/actandles/shop/postall?p=${pageNumber}">${pageNumber}</a>
								</jstl:otherwise>
							</jstl:choose>
						</jstl:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp" />

</body>
</html>