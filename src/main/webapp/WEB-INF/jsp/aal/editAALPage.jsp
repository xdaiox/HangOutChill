<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動/課程申辦頁面</title>

</head>
<body>
	<jsp:include page="../layout/navbar.jsp" />

	<div class="container content_view"
		style="background-color: #ffffff00;">
		<div class="content_box ">
			<div class="content"
				style="background-color: #ffffff00; height: 100%">
				<div class="col-8" style="margin:auto">
					<div class="card">
						<div class="card-header">活動/課程修改頁面</div>
						<div class="card-body">
							<form:form class="" modelAttribute="aal"
								enctype="multipart/form-data" method="PUT"
								action="${contextRoot}/actandles/edit">
<!-- 								<p>項目ID:</p> -->
								<form:input path="id" value="${aal.id}" class="form-control" type="hidden"></form:input>
								<p>提交者ID:</p>
								<form:input path="shop_Id" value="${aal.shop_Id}" class="form-control" type="text" readonly ></form:input>
								<p>活動/課程名稱</p>
								<form:input path="name" value="${aal.name}" class="form-control" type="text"></form:input>
								<p>類別:</p><span>${aal.topic}</span>
								<p>舉辦日:</p>
								<form:input path="theDayofStarts" value="${aal.theDayofStarts}" class="form-control"
									type="date"></form:input>
								<p>報名費用:</p>
								<form:input path="fee" value="${aal.fee}" class="form-control" type="text"></form:input>
								<p>預計名額:</p>
								<form:input path="quota" value="${aal.quota}" class="form-control" type="text"></form:input>
								<p>最低開辦人數:</p>
								<form:input path="lowerLimit" value="${aal.lowerLimit}" class="form-control" type="text"></form:input>
								<p>報名截止日:</p>
								<form:input path="deadLine" value="${aal.deadLine}" class="form-control" type="date"></form:input>
								<form:input path="currentStatus" class="form-control"
											type="hidden" value="審核中"></form:input>
								<p>預覽圖-原圖:</p>
								<img width="200px" height="200px" src="data:image/png;base64,${aal.base64image}">
								<p>預覽圖更新:</p>
								<form:input path="imageFile" class="form-control" type="file"></form:input>
								<p>文案內容:</p>
								<form:textarea path="aalContent" value="${aalContent}" class="form-control" style="height:200px;" ></form:textarea>
								<button type="submit" class="btn btn-primary">送出</button>
							</form:form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>