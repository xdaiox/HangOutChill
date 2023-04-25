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
	<div class="container content_view"style="background-color: #ffffff00">
		<div class="content_box ">
	    <div class="content" style="background-color: #ffffff00">
	    <div class="col-8">
				<div class="card">
				<div class="card-header">活動/課程申辦頁面</div>
					<div class="card-body">
						<form:form class="" modelAttribute="aal" enctype="multipart/form-data"
							method="POST" action="${contextRoot}/messages/post">
							<form:input path="id" class="form-control" type="text"/>
							<form:input path="shop_Id" class="form-control" type="text"/>
							<form:input path="name" class="form-control" type="text"/>
							<form:input path="aalContent" class="form-control" type="text"/>
							<form:input path="topic" class="form-control" type="text"/>
							<form:input path="theDayofStarts" class="form-control" type="date"/>
							<form:input path="fee" class="form-control" type="text"/>
							<form:input path="quota" class="form-control" type="text"/>
							<form:input path="lowerLimit" class="form-control" type="text"/>
							<form:input path="deadLine" class="form-control" type="date"/>
							<form:input path="currentStatus" class="form-control" type="text"/>
							<form:input path="image" class="form-control"  type="file"/>
							<button type="submit" class="btn btn-primary">送出</button>
						</form:form>

					</div>
				</div>
		</div>
		</div>
  </div>
</div>
	
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>