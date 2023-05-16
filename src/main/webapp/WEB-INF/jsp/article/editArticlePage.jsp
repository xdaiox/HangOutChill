<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <title>HangOut趣</title>
</head>
<body>
  <div class="container-scroller">
  	<jsp:include page="../dbLayout/top_navbar.jsp" />

    <div class="container-fluid page-body-wrapper">
		<jsp:include page="../dbLayout/left_navbar.jsp" />
		<div class="main-panel">
		    <h3>編輯專欄</h3>
		    <div class="content-wrapper">
		      <div class="row cw">
		        <div class=" content articleform col-8">
		          <div class="form-floating mb-3">
		            <form:form class="row g-3" modelAttribute="articles" enctype="multipart/form-data" method="put" action="${contextRoot}/article/edit">
		              <form:input type="hidden" path="article_id"/>
		              <form:input type="hidden" path="normalmember.id"/>
		              <div class="col-12">
		                <div class="titleName">
		                  <form:input path="article_name" class="title" type="text" name="" id="articleName" placeholder="專欄名稱"/>
		                </div>
		              </div>
		              <div class="col-md-6">
		                <label for="inputCity" class="form-label">主題</label>
		                <form:select path="article_theme" class="form-select form-select-lg mb-3" id="inputCity" aria-label="Default select example">
		                  <form:option value="life">生活</form:option>
		                  <form:option value="eats">宵夜</form:option>
		                  <form:option value="fun">玩樂</form:option>
		                </form:select>
		              	<label for="inputGroupFile02" class="form-label">專欄封面圖</label>
				  		<form:input path="mainImg" type="file" class="form-control" id="target"/>
		              </div>
		              <div class="col-md-4">
		              	<label for="inputGroupFile03" class="form-label">封面原圖</label>
		              	<img class="originalImg" width="300px" height="200px" src="${articles.article_mainImg}" alt="" name="inputGroupFile03">
		              </div>
   	              	  <div class="formContent col-12">
		                <label for="form-check-inline1" class="form-label">簡介</label>
		                <form:textarea name="form-check-inline1" path="article_excerpt" id="articleExcerpt" class="form-control"></form:textarea>
		              </div>
	              	  <div class="formContent col-12">
		                <label for="form-check-inline2" class="form-label">內容</label>
		                <form:textarea name="form-check-inline2" path="article_content" class="form-control" id="summernote"></form:textarea>
		              </div>
					  <div class="col-12">
		                <label for="form-check-inline" class="form-label">狀態</label>
		                <div class="form-check-box">
		                  <div class="form-check form-check-inline" id="form-check-inline">
		                    <form:radiobutton path="status" class="form-check-input" name="inlineRadioOptions" id="inlineRadio1" value="1"/>
		                    <label class="form-check-label" for="inlineRadio1">上架</label>
		                  </div>
		                  <div class="form-check form-check-inline">
		                    <form:radiobutton path="status" class="form-check-input" name="inlineRadioOptions" id="inlineRadio2" value="0"/>
		                    <label class="form-check-label" for="inlineRadio2">下架</label>
		                  </div>
		                </div>
		              </div>
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
	          		<div class=" col-12 ">
		       			<div class="uploadbox defaultSummerBox">
	        				<button class="defaultSummerBtn btn btn-primary">預覽內文</button>
	        			</div>
        			</div>
      		  	</div>
		      	</div>
		    </div>
		 </div>
   	</div>
  </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
       ['insert', ['link','picture','video']],
       ['view', ['fullscreen', 'codeview', 'help']]
     ]
   });
  });
</script>

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

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const input2 = document.getElementById('articleName');
    const displayDiv2 = document.getElementById('showArticleName');

    const textContent = input2.value;

    displayDiv2.textContent = textContent;
    
    input2.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        displayDiv2.textContent = inputValue;
      });
  });
</script>

<!-- 簡介預覽 -->
<script>
	document.addEventListener('DOMContentLoaded', function() {
		const textarea = document.getElementById('articleExcerpt');
		const displayDiv = document.getElementById('showArticleExcerpt');
		
		displayDiv.textContent = textarea.value;
	
		textarea.addEventListener('input', function(event) {
		  	const text = event.target.value;
	    	displayDiv.textContent = text;
  	});
  });
</script>



</html>