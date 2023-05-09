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
<title>個人活動管理</title>
<jsp:include page="../../layout/navbar.jsp" />

</head>
<body>
	<div class="container content_view" style="background-color: #ffffff00">
		<div class="content_box" style="width: 100%">
			<div class="content"
				style="background-color: #ffffff00; height: 100%;">
				<div class="row justify-content-center">
					<div class="" style="margin: auto;">
						<h1 style="text-align: center;">報名資訊確認</h1>
						<div class="table-responsive">
							<table class="table table-hover table-bordered table-light">
								<ins>報名活動確認:</ins>
								<thead>
									<tr>
										<th>商家名稱
										<th>活動名稱
										<th>分類
										<th>舉辦日
										<th>報名費用
								</thead>
								<tbody>

									<tr>
										<td class="align-middle">${result.nickName}
										<td class="align-middle">${aal.name}
										<td class="align-middle"><jstl:if
												test="${aal.topic=='act'}">活動</jstl:if> <jstl:if
												test="${aal.topic=='les'}">課程</jstl:if>
										<td class="align-middle"><span><fmt:formatDate
													pattern="yyyy-MM-dd" value="${aal.theDayofStarts}" /></span>
										<td class="align-middle">${aal.fee}
								</tbody>
							</table>
							<form:form method="post"
								action="${contextRoot}/actandles/detail/lessignup">
							<table class="table table-hover table-bordered table-light">
								<ins>報名會員資訊:</ins>
								<thead>
									<tr>
										<th>聯絡信箱:
										<th>姓名:
										<th>電話:
										<jstl:if test="${aal.topic=='act'}"><th>人數:</jstl:if>
										
								</thead>
								<tbody>
									<tr>
										<td class="align-middle">${result.account}
										<td class="align-middle">${result.reallName}
										<td class="align-middle"><input name="tel" value="${result.tel}" type="text" />
										
												<jstl:if test="${aal.topic=='act'}"><td class="align-middle"><input name="numbersOfPeople"  type="text" /></jstl:if>
												<jstl:if test="${aal.topic=='les'}"><input name="numbersOfPeople" value="1" type="hidden" /></jstl:if>
										
								</tbody>
							</table>
								<input value="${aal.id}" type="hidden" name="id" />
								<button type="submit" class="btn btn-primary">確定送出</button>
							</form:form>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../../layout/footer.jsp" />

</body>
</html>