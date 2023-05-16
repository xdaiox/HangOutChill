<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="${contextRoot}/css/article/articleForm.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>投稿專區</title>

<jsp:include page="../layout/navbar.jsp"/>
</head>

<body>
  <div class="container-scroller">

    <div class="container-fluid page-body-wrapper">
		<div class="main">
			<div class="main-panel">
				<div class="titleSpace d-flex">
				    <h3 class="createContent col-8">新增專欄</h3>
				    <h3 class="defaultImg col-4">預覽圖</h3>
				</div>
			    <div class="content-wrapper">
			      <div class="row cw">
			        <div class=" content articleform col-8">
			          <div class="form-floating mb-3">
			            <form:form class="row g-3" modelAttribute="articles" enctype="multipart/form-data" method="post" action="${contextRoot}/article/articleForm">
			              
			              <div class="col-12">
			                <div class="titleName">
			                  <form:input path="article_name" class="title" type="text" name="" id="articleName" placeholder="專欄名稱"/>
			                </div>
			              </div>
			              <div class="col-md-4">
			                <label for="inputCity" class="form-label">主題</label>
			                <form:select path="article_theme" class="form-select form-select-lg mb-3" id="inputCity" aria-label="Default select example">
			                  <option selected disabled>------請選擇主題-------</option>
			                  <option value="life">生活</option>
			                  <option value="eats">宵夜</option>
			                  <option value="fun">玩樂</option>
			                </form:select>
			              </div>
	   		              <div class="col-md-8">
			              	<label for="inputGroupFile02" class="form-label">專欄封面圖</label>
					  		<form:input path="mainImg" type="file" class="form-control" id="target" aria-placeholder="專欄封面圖"/>
			              </div>
	   	              	  <div class="formContent col-12">
			                <label for="form-check-inline1" class="form-label">簡介</label>
			                <form:textarea name="form-check-inline1" path="article_excerpt" id="articleExcerpt"  class="form-control"></form:textarea>
			              </div>
		              	  <div class="formContent col-12">
			                <label for="form-check-inline" class="form-label">內容</label>
			                <form:textarea path="article_content" name="picturefile" class="form-control" id="summernote"></form:textarea>
			              </div>
<!-- 						  <div class="col-12"> -->
<!-- 			                <label for="form-check-inline" class="form-label">狀態</label> -->
<!-- 			                <div class="form-check-box"> -->
<!-- 			                  <div class="form-check form-check-inline" id="form-check-inline"> -->
<%-- 			                    <form:radiobutton path="status" class="form-check-input" name="inlineRadioOptions" id="inlineRadio1" value="1"/> --%>
<!-- 			                    <label class="form-check-label" for="inlineRadio1">上架</label> -->
<!-- 			                  </div> -->
<!-- 			                  <div class="form-check form-check-inline"> -->
<%-- 			                    <form:radiobutton path="status" class="form-check-input" name="inlineRadioOptions" id="inlineRadio2" value="2"/> --%>
<!-- 			                    <label class="form-check-label" for="inlineRadio2">下架</label> -->
<!-- 			                  </div> -->
<!-- 			                </div> -->
<!-- 			              </div> -->
			              <div class="col-12">
			                <button type="submit" class="btn btn-primary">Submit</button>
			              </div>
			            </form:form>
			          </div>
			        </div>
	              	
	              	
	              	<div class="content col-4 defaultBox"> 
		          		<div class=" col-12 ">
				            <div class="uploadbox">
				            	<img class="originalImg" src="${contextRoot}/img/article/default.png" alt="" id="preview">
				            </div>
		          		</div>
		          		<div class=" col-12 ">
				            <div class="uploadbox showArticleNameBox">
				            	<div id="showArticleName"></div>
				            </div>
		          		</div>
		          		<div class=" col-12 ">
				            <div class="uploadbox showArticleExcerptBox">
				            	<div id="showArticleExcerpt"></div>
				            </div>
		          		</div>
		          		
	      		  	</div>
			      	</div>
			    </div>
			 </div>
		 </div>
    </div>
  </div>
  <jsp:include page="../layout/footer.jsp"/>
  
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-zh-TW.js"></script>
<script>
$(document).ready(function() {
 $('#summernote').summernote({
     placeholder: '請輸入內容',
     tabsize:2, 
     height:450,
     lang: 'zh-TW',
     toolbar: [
       ['style', ['style']],
       ['font', ['bold', 'underline', 'clear']],
       ['fontname', ['fontname']],
       ['color', ['color']],
       ['para', ['ul', 'ol', 'paragraph']],
       ['table', ['table']],
       ['insert', ['link','picture','video']],
       ['view', ['fullscreen', 'codeview', 'help']]
     ]
   });
  });
</script>

<!-- 圖片預覽 -->
<script>
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

<!-- 簡欄名稱預覽 -->
<script>
	const input2 = document.getElementById('articleName');
	const displayDiv2 = document.getElementById('showArticleName');

	input2.addEventListener('input', function(event) {
  	const text = event.target.value;
    displayDiv2.textContent = text;
  });
</script>

<!-- 簡介預覽 -->
<script>
	const textarea = document.getElementById('articleExcerpt');
	const displayDiv = document.getElementById('showArticleExcerpt');

	textarea.addEventListener('input', function(event) {
  	const text = event.target.value;
    displayDiv.textContent = text;
  });
</script>


 </body>
 </html>