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
								<form:input path="name" class="form-control" type="text" id="name" ></form:input></div>
								<div class="mb-3">類別:
								<form:radiobutton path="topic"
									class="form-check form-check-inline " value="act" id="act" />活動
								<form:radiobutton path="topic"
									class="form-check form-check-inline " value="les" />課程
								</div>	
								<div class="mb-3">舉辦日:
								<form:input path="theDayofStarts" class="form-control" id="theDayofStarts"
									type="date"></form:input></div>
								<div class="mb-3">報名費用:
								<form:input path="fee" class="form-control" type="text" id="fee" ></form:input></div>
								<div class="mb-3">預計名額:
								<form:input path="quota" class="form-control" type="text" id="quota" ></form:input></div>
								<div class="mb-3">最低開辦人數:
								<form:input path="lowerLimit" class="form-control" type="text" id="lowerLimit" ></form:input></div>
								<div class="mb-3">報名截止日:
								<form:input path="deadLine" class="form-control" type="date" id="deadLine" ></form:input></div>
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
	<button id="demo" class="mb-3" style="float: left;" >DEMO</button>
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

	document.getElementById("demo").addEventListener("click", demo);


	function demo(){
		document.getElementById("name").value='熱炒樂享日';
		document.getElementById("act").checked=true;
		theDayofStarts = document.getElementById("theDayofStarts").value='2023-06-17';
		fee = document.getElementById("fee").value=500;
		quota = document.getElementById("quota").value=50;
		lowerLimit = document.getElementById("lowerLimit").value=25;
		deadLine = document.getElementById("deadLine").value='2023-05-25';
		aalContent = document.getElementById("summernote");
		let content = '感謝各位美食愛好者的一路陪伴，我們榮幸宣布即將舉辦一場為期一天的盛大活動 - 熱炒樂享日！在這個特別的日子裡，我們將為您呈獻一場美食盛宴和歡樂時刻，讓您享受無比美味的熱炒料理和難忘的用餐體驗。<br><br>'
						+'在這次活動中，我們將邀請到優秀的熱炒大師作為我們的特別來賓，他們將為您展示各種經典和創新的熱炒料理技巧。您將有機會近距離觀摩他們的精湛廚藝和技巧，並學習到一些秘訣和窍門，讓您在家中也能輕鬆煮出美味的熱炒菜餚。<br><br>'
						+'此外，我們還為參與活動的每位貴賓準備了一份特別的優惠。當天參與活動的客人可享受全天熱炒菜品九折優惠，讓您在品味美食的同時，也能感受到我們對您的感激之情。<br><br>'
						+'活動名額有限，僅限50位參加者。為了確保每位參與者都能有充分的體驗和服務，請儘早致電我們的預訂專線進行報名，以確保您的位置。<br><br>'
						+'我們誠摯邀請您參加熱炒樂享日活動，與我們一同品味豐富多彩的熱炒料理，並度過一個愉快而難忘的日子。期待與您共享美食和歡樂！'
		$(aalContent).summernote('code',content);

	}


	</script>
</body>
</html>