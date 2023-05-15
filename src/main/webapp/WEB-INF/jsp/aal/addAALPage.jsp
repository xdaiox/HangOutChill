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

<jsp:include page="../layout/navbar.jsp" />
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-zh-TW.js"></script>
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
						<div class="card-header text-center" style="font-size: 20px;" >活動/課程申辦頁面</div>
						<div class="card-body" style="font-size: 15px;">
							<form:form class="col" modelAttribute="aal"
								enctype="multipart/form-data" method="POST"
								action="${contextRoot}/actandles/shop/post">
								<!-- 								<p>項目ID:</p> -->
								<%-- 								<form:input path="id" class="form-control" type="text"></form:input> --%>
								
								<form:input path="normalMember.id" class="form-control"
									type="hidden" value="${result.id }"></form:input>
								<div class="mb-3">名稱
								<form:input path="name" class="form-control" type="text"></form:input></div>
								<div class="mb-3">類別:
								<form:radiobutton path="topic"
									class="form-check form-check-inline " value="act" />活動
								<form:radiobutton path="topic"
									class="form-check form-check-inline " value="les" />課程
								</div>	
								<div class="mb-3">舉辦日:
								<form:input path="theDayofStarts" class="form-control"
									type="date"></form:input></div>
								<div class="mb-3">報名費用:
								<form:input path="fee" class="form-control" type="text"></form:input></div>
								<div class="mb-3">預計名額:
								<form:input path="quota" class="form-control" type="text"></form:input></div>
								<div class="mb-3">最低開辦人數:
								<form:input path="lowerLimit" class="form-control" type="text"></form:input></div>
								<div class="mb-3">報名截止日:
								<form:input path="deadLine" class="form-control" type="date"></form:input></div>
								<form:input path="currentStatus" class="form-control"
									type="hidden" value="unreviewed"></form:input>
								<div class="mb-3" >
								<form:input  path="imageFile" id="target" class="form-control"
									type="file"></form:input></div>
								<span>圖片預覽:<img style="max-width: 200px;" id="preview" src=""></span>
								<div class="mb-3">文案內容:
								<form:textarea path="aalContent" id="summernote"/></div>
								<div style="text-align: center;">
								<button type="submit" class="btn btn-primary" >送出</button></div>
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

	</script>
</body>
</html>