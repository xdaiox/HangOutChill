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
				    <h3 class="createContent col-12">專欄投稿</h3>

				</div>
			    <div class="content-wrapper">
			      <div class="row cw">
			        <div class=" content articleform col-8">
			          <div class="form-floating mb-3">
			            <form:form class="row g-3" modelAttribute="articles" enctype="multipart/form-data" method="post" action="${contextRoot}/article/articleForm">
			              
			              <div class="col-11">
			                <div class="titleName">
			                  <form:input path="article_name" class="title" type="text" name="" id="articleName" placeholder="專欄名稱"/>
			                </div>
			              </div>
			              <div class="col-1">
			              	<button id="demo">Demo</button>
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
			              <div class="col-12">
			                <button type="submit" class="btn btn-primary">投稿</button>
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


<script>
	function demo() {
		document.getElementById("articleName").value="那些精釀沒說的事，A2H精釀啤酒：飲酒是生活內涵的累積";
		document.getElementById("articleExcerpt").value="鄰近台北實踐大學的複合型精釀啤酒咖啡館A2H，把德國啤酒文化帶進台北街頭，在城市中刻畫一幅源自歐洲的生活場景。它以德式精釀啤酒工藝為根基，融入台灣風土元素，創作獨樹一格的風味口感。無論純飲、搭配甜食，白天或黑夜，A2H令喝啤酒不再有時間與空間的界線，融入台灣人的日常。";
		articleContent = document.getElementById("summernote");
		let content = '「沒有啤酒的你不是你！」（Du bist nicht du, wenn du kein Bier hast.）一句流傳久遠的德國俗諺，卻道盡了啤酒之於德意志民族的意義。'
						+'千年之前，德國修道院士本為興建教堂、修繕居所，而後開始精研啤酒釀製以換取報酬。如今釀製啤酒的工藝經過世代傳承、時間淬煉，成為舉世標竿。修道士或許始料未及，這些從酵母轉化為液體黃金的啤酒，現已深植德國人的DNA，更隨著德國的啤酒純釀工法遠播至世界各處，在台灣悄然生根。'
						+'閒適騎乘單車，或漫步於陽光與林蔭中，再走進街邊小店來杯啤酒放鬆解渴的場景，正在大直A2H每日上演。這家複合型精釀啤酒咖啡館，源自於發展電動輔助自行車（E-Bike）起家的母集團達瑞創新BESV，創辦人蘇開建醉心於歐洲人文精神落實於生活的嚮往，進一步跨足餐飲並打造出A2H。'
		$(articleContent).summernote('code', content);
	}
	
	$('#demo').click(function() {
	 	event.preventDefault();
		demo();
	});

</script>


 </body>
 </html>