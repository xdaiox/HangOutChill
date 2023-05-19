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
<style>
.popup {
display: none;
position: fixed;
z-index: 999;
left: 0;
top: 0;
width: 100%;
height: 100%;
overflow: auto;
background-color: rgba(0, 0, 0, 0.4);
}
.popup-content {
background-color: #ffffff;
margin:5% auto;
padding: 20px;
border: 1px solid #bcbcbc;
width: 60%;
height: 100%;
max-width: 80%;
position: relative;
border-radius: 10px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
overflow:scroll;
}
 pop-content p img{ 
 width: auto; 
 height: auto; 
 white-space: normal; 
 border-radius: unset; 
 } 
.close {
position: absolute;
top: 10px;
right: 10px;
font-size: 28px;
font-weight: bold;
color: #999999;
cursor: pointer;
transition: color 0.3s ease;
}

.close:hover {
color: #3e3e3e;
}
</style>


</head>
<body>


	<div class="container-scroller">
		<jsp:include page="../../dbLayout/top_navbar.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../../dbLayout/left_navbar.jsp" />
			<div class="content" style="text-align: center;align-content: center;height: 100%;margin:0 auto;">
				<div class="table-responsive">
					<table class="table table-hover table-bordered table-light">
						<thead>
							<tr>
								<th>項目ID
								<th>商家ID
								<th>名稱
								<th>內容
								<th>分類
								<th>新增時間
								<th>舉辦日
								<th>報名費用
								<th>預計名額
								<th>最低開辦人數
								<th>報名截止日
								<th>當前狀態
								<th>預覽圖
								<th>
						</thead>
						<tbody>
							<jstl:forEach var="aal" items="${page.content}">
								<tr>
									<td class="align-middle">${aal.id}
									<td class="align-middle">${aal.normalMember.id}
									<td class="align-middle">${aal.name}
									<td class="align-middle"><button class="123 btn btn-primary">預覽</button>
									
									<td class="align-middle"><jstl:if
											test="${aal.topic=='act'}">活動</jstl:if> <jstl:if
											test="${aal.topic=='les'}">課程</jstl:if>
									<td class="align-middle"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm:ss"
											value="${aal.theDayofSubmission}" />
									<td class="align-middle"><span><fmt:formatDate
												pattern="yyyy-MM-dd" value="${aal.theDayofStarts}" /></span>
									<td class="align-middle">${aal.fee}
									<td class="align-middle">${aal.quota}
									<td class="align-middle">${aal.lowerLimit}
									<td class="align-middle"><span><fmt:formatDate
												pattern="yyyy-MM-dd" value="${aal.deadLine}" /></span>
									<td class="align-middle"><jstl:if test="${aal.currentStatus=='unreviewed'}">審核中</jstl:if> 
									<td class="align-middle"><img width="200px" height="200px"
										src="data:image/png;base64,${aal.base64image}"> <br />
									<td class="align-middle">
										<div style="display: flex">
											<form:form action="${contextRoot}/actandles/admin/chackaal" method="PUT">
												<input type="hidden" name="id" value="${aal.id}" />
												<input type="hidden" name="currentStatus" value="approved" />												 
												 <input type="submit" class="btn btn-outline-info btn-sm"
												 onclick="return confirm('確定上架?')" value="上架" />
											</form:form>

											<form:form action="${contextRoot}/actandles/shop/edit"
												method="get" modelAttribute="aal" > 
												<input type="hidden" name="id" value="${aal.id}" />
												<input type="hidden" name="normalMember.id" value="${aal.normalMember.id}" />
												<input type="hidden" name="name" value="${aal.name}" />
												<input type="hidden" name="aalContent" value="${aal.aalContent}" />
												<input type="hidden" name="topic" value="${aal.topic}" />
												<input type="hidden" name="theDayofSubmission" value="${aal.theDayofSubmission}" />
												<input type="hidden" name="fee" value="${aal.fee}" />
												<input type="hidden" name="quota" value="${aal.quota}" />
												<input type="hidden" name="lowerLimit" value="${aal.lowerLimit}" />
												<input type="hidden" name="currentStatus" value="${currentStatus}" />
												<input type="hidden" name="currentStatus" value="${currentStatus}" />
												 <input	type="submit" class="btn btn-outline-danger btn-sm"
													value="駁回" onclick="return confirm('確定駁回?')" />
											</form:form>
											</div>
										</td>
										<div id="popup-date" class="popup">
											<div class="popup-content" >
											<span class="close">&times;</span>${aal.aalContent}
											</div></div>
										
							</jstl:forEach>
						</tbody>
					</table>

				</div>
				<br />
				<div style="text-align: center;">
					<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<%-- 					<jstl:if test="${page.number == pageNumber-1}"><span>${pageNumber}</span></jstl:if> --%>
						<%-- 					<jstl:if test="${page.number != pageNumber-1}"><a href="${contextRoot}/messages?p=${pageNumber}">${pageNumber}</a></jstl:if> --%>
						<jstl:choose>
							<jstl:when test="${page.number == pageNumber-1}">
								<span>${pageNumber}</span>
							</jstl:when>
							<jstl:otherwise>
								<a href="${contextRoot}/actandles/admin/chackaal?p=${pageNumber}">${pageNumber}</a>
							</jstl:otherwise>
						</jstl:choose>
					</jstl:forEach>
				</div>
			</div>

		</div>
	</div>
<script>
	const buttons = document.querySelectorAll('button');

	// 監聽每個按鈕的點擊事件
	buttons.forEach(function(button) {
	  button.addEventListener('click', function() {
	    // 判斷按鈕是否擁有 "123" 這個 class
	    if (button.classList.contains('123')) {
	      // 取得彈出視窗元素
	      const popup = document.getElementById('popup-date');
	      // 顯示彈出視窗
	      popup.style.display = 'block';
	    }
	  });
	});

	// 取得所有的關閉按鈕元素
	const closeButtons = document.querySelectorAll('.close');

	// 監聽每個關閉按鈕的點擊事件
	closeButtons.forEach(function(closeButton) {
	  closeButton.addEventListener('click', function() {
	    // 取得彈出視窗元素
	    const popup = document.getElementById('popup-date');
	    // 隱藏彈出視窗
	    popup.style.display = 'none';
	  });
	});
 </script>

</body>
</html>