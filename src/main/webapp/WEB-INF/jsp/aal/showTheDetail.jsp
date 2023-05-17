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

			
			
			<div class="content" style="background-color: #ffffff00;height: 100%;">
				
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
								<tr>
									<td class="align-middle">${aal.id}
									<td class="align-middle">${aal.normalMember.id}
									<td class="align-middle">${aal.name}
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
										
									<jstl:if test="${result.role.roleId!=3}">
									<td class="align-middle">
										<form:form method="get" action="${contextRoot}/actandles/detail/lessignup">
											<jstl:choose>
											<jstl:when test="${(aal.quota-aal.registered)>0}">
											<input value="${aal.id}" type="hidden" name="id" />
												<button type="submit" class="btn btn-primary" >前往報名</button>
											</jstl:when>
											<jstl:when test="${(aal.quota-aal.registered)==0}">
												<button  disabled class="btn btn-primary">已額滿</button>
											</jstl:when>
											</jstl:choose>
										</form:form>
									</jstl:if>
						</tbody>
					</table>

				</div>

			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp" />
</body>
</html>