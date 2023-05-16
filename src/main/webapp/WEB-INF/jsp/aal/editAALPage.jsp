<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>活動/課程申辦頁面</title>
<jsp:include page="../layout/navbar.jsp" />
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-zh-TW.js"></script>
<script>
$(document).ready(function() {
	$('#summernote').summernote({
	    placeholder: '請輸入內容',
	    tabsize:2, 
	    height:500,
	    lang: 'zh-TW',
	    toolbar: [
	      ['style', ['style']],
	      ['font', ['bold', 'underline', 'clear']],
	      ['fontname', ['fontname']],
	      ['color', ['color']],
	      ['para', ['ul', 'ol', 'paragraph']],
	      ['table', ['table']],
	      ['insert', ['link', 'picture', 'video']],
	      ['view', ['help']]
	    ]
	  });
	 });
</script>

</head>

<body>

	<div class="container content_view"
		style="background-color: #ffffff00;">
		<div class="content_box ">
			<div class="content"
				style="background-color: #ffffff00; height: 100%">
				<div class="col-8" style="margin: auto">
					<div class="card">
						<div class="card-header text-center">活動/課程修改頁面</div>
						<div class="card-body">
							<form:form class="" modelAttribute="aal"
								enctype="multipart/form-data" method="PUT"
								action="${contextRoot}/actandles/shop/edit">
								<!-- 								<p>項目ID:</p> -->
								<form:input path="id" value="${aal.id}" class="form-control"
									type="hidden"></form:input>
								<!-- 											<p>提交者ID:</p> -->
								<form:input path="normalMember.id"
									value="${aal.normalMember.id}" class="form-control"
									type="hidden"></form:input>
								<div class="mb-3">活動/課程名稱
								<form:input path="name" value="${aal.name}" class="form-control"
									type="text"></form:input></div>
								<br>
								<div class="mb-3">
									類別:<span id="printTopic"></span>
								</div>
								<form:input path="topic" id="targetTopic" value="${aal.topic}"
									class="form-control" type="hidden"></form:input>
								<div class="mb-3">
									舉辦日: <span><fmt:formatDate pattern="yyyy-MM-dd"
											value="${aal.theDayofStarts}" /></span>
								
											更新:<form:input path="theDayofStarts"
									value="${aal.theDayofStarts}" class="form-control" type="date"></form:input></div>
								<div class="mb-3">報名費用:
								<form:input path="fee" value="${aal.fee}" class="form-control"
									type="text"></form:input></div>
								<div class="mb-3">預計名額:
								<form:input path="quota" value="${aal.quota}"
									class="form-control" type="text"></form:input></div>
								<div class="mb-3">最低開辦人數:
								<form:input path="lowerLimit" value="${aal.lowerLimit}"
									class="form-control" type="text"></form:input></div>
								<div class="mb-3">
									報名截止日: <span><fmt:formatDate pattern="yyyy-MM-dd"
											value="${aal.deadLine}" /></span></div>
								
								<form:input path="deadLine" value="${aal.deadLine}"
									class="form-control" type="date"></form:input>
								<jstl:choose>
									<jstl:when test="${result.role.roleId!=3}">
										<form:input path="currentStatus" class="form-control"
											type="hidden" value="unreviewed"></form:input>
									</jstl:when>
									<jstl:when test="${result.role.roleId==3}">
										<form:input path="currentStatus" class="form-control"
											type="hidden" value="overruled"></form:input>
									</jstl:when>							
								</jstl:choose>
								<div class="mb-3">預覽圖-原圖:
								<img width="200px" height="200px" id="preview"
									src="data:image/png;base64,${aal.base64image}"></div>
								<div class="mb-3">預覽圖更新:
								<form:input path="imageFile" id="target" class="form-control"
									type="file"></form:input></div>
								<div class="mb-3">文案內容:
								<form:textarea path="aalContent" id="summernote"
									value="${aalContent}" /></div>
								<div class="mb-3">	
								<jstl:if test="${not empty aal.cause}">
									<input type="hidden" name="cause">
									<input style="color: red;" type="text" readonly value="駁回原因:${aal.cause}">
								</jstl:if>
								<jstl:if test="${result.role.roleId==3}">
									<div>駁回原因：</div>
										<form:textarea path="cause" style="width:100%;height:"
											class="form-check form-check-inline " type="text" />
								</jstl:if></div>
								<div style="text-align: center;">
								<button type="submit" class="btn btn-primary">送出</button></div>
							</form:form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />
	<script>
				//圖片上傳前預覽
					const input = document.getElementById("target")
					const preview = document.getElementById("preview")
					input.addEventListener('change', () => {
						const file = input.files[0];
						const reader = new FileReader();

						reader.addEventListener('load', () => {
							preview.src = reader.result;
						});

						if (file) {
							reader.readAsDataURL(file);
						} else {
							preview.src = "";
						}
					});
					
				//類別判別,印出文字
					const inputTopic = document.getElementById("printTopic")
					const topic = document.getElementById("targetTopic")
						if(topic.value=="act"){
							inputTopic.innerText="活動"
						}else{
							inputTopic.innerText="課程"
						}
				
				</script>

</body>

</html>