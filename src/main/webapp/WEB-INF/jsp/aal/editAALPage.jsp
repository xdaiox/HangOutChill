<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

			<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>活動/課程申辦頁面</title>

			</head>

			<body>
				<jsp:include page="../layout/navbar.jsp" />

				<div class="container content_view" style="background-color: #ffffff00;">
					<div class="content_box ">
						<div class="content" style="background-color: #ffffff00; height: 100%">
							<div class="col-8" style="margin:auto">
								<div class="card">
									<div class="card-header">活動/課程修改頁面</div>
									<div class="card-body">
										<form:form class="" modelAttribute="aal" enctype="multipart/form-data"
											method="PUT" action="${contextRoot}/actandles/shop/edit">
											<!-- 								<p>項目ID:</p> -->
											<form:input path="id" value="${aal.id}" class="form-control" type="hidden"></form:input>
<!-- 											<p>提交者ID:</p> -->
											<form:input path="normalMember.id" value="${aal.normalMember.id}" class="form-control"
												type="hidden"></form:input>
											<p>活動/課程名稱</p>
											<form:input path="name" value="${aal.name}" class="form-control"
												type="text"></form:input>
												<br>
											<p>類別:<span id="printTopic"></span></p>
											<form:input path="topic" id="targetTopic" value="${aal.topic}" class="form-control"
												type="hidden"></form:input>
											<p>舉辦日: <span><fmt:formatDate pattern="yyyy-MM-dd"
														value="${aal.theDayofStarts}" /></span></p>
											更新:<form:input path="theDayofStarts" value="${aal.theDayofStarts}"
												class="form-control" type="date"></form:input>
											<p>報名費用:</p>
											<form:input path="fee" value="${aal.fee}" class="form-control" type="text"></form:input>
											<p>預計名額:</p>
											<form:input path="quota" value="${aal.quota}" class="form-control"
												type="text"></form:input>
											<p>最低開辦人數:</p>
											<form:input path="lowerLimit" value="${aal.lowerLimit}" class="form-control"
												type="text"></form:input>
											<p>報名截止日: <span><fmt:formatDate pattern="yyyy-MM-dd"
														value="${aal.deadLine}" /></span></p>
											<form:input path="deadLine" value="${aal.deadLine}" class="form-control"
												type="date"></form:input>
											<p>狀態:</p>
											<form:select path="currentStatus" class="form-control">
												<form:option value="上架中">上架中</form:option>
												<form:option value="審核中">審核中</form:option>
												<form:option value="已下架">已下架</form:option>										
												<form:option value="已刪除">已刪除</form:option>										
											</form:select>
											<p>預覽圖-原圖:</p>
											<img width="200px" height="200px"
												src="data:image/png;base64,${aal.base64image}">
											<p>預覽圖更新:</p>
											<form:input path="imageFile" id="target" class="form-control" type="file"></form:input>
											<span><img id="preview" src=""></span>
											<p>文案內容:</p>
											<form:textarea path="aalContent" value="${aalContent}" class="form-control"
												style="height:200px;"></form:textarea>
											<button type="submit" class="btn btn-primary">送出</button>
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