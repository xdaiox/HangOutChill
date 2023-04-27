<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>個人活動管理</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp" />
	<div class="container content_view"style="background-color: #ffffff00">
		<div class="content_box">
    <div class="content" style="background-color: #ffffff00;height: 100%">
    	<div class="row justify-content-center">
			<div class="col-8" style="margin:auto;" >
				<h1 style="text-align: center;" >活動/課程管理</h1>
				<jstl:forEach var="aal" items="${page.content}">
					<div class="card">
						<div class="card-header">
							新增時間: <span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${aal.theDayofSubmission}" /></span>
						</div>
						<div class="card-body">
							<p/>項目ID: ${aal.id}
							<p/>商家ID: ${aal.shop_Id}
							<p/>名稱: ${aal.name}
							<p/>內容: ${aal.aalContent}
							<p/>分類: ${aal.topic}
							<p/>舉辦日: ${aal.theDayofSubmission}
							<p/>報名費用: ${aal.fee}
							<p/>預計名額: ${aal.quota}
							<p/>最低開辦人數: ${aal.lowerLimit}
							<p/>報名截止日: ${aal.deadLine}
							<p/>當前狀態: ${aal.currentStatus}
							<p/>預覽圖: <img width="200px" height="200px" src="data:image/png;base64,${aal.base64image}">
							<br/>
							<div style="display:flex">
						<form action="${contextRoot}/actandles/edit">
						   <input type="hidden" name="id" value="${aal.id}" />
						   <input type="submit" class="btn btn-outline-info btn-sm" value="編輯" />
						</form>
				
						<form action="${contextRoot}/actandles/delete" method="post">
						   <input type="hidden" name="_method" value="delete" />
						   <input type="hidden" name="id" value="${aal.id}" />
						   <input type="submit" class="btn btn-outline-danger btn-sm" value="刪除" />
						</form>
						</div>
						</div>
					</div>
				</jstl:forEach>
				<br />
				<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">	
<%-- 					<jstl:if test="${page.number == pageNumber-1}"><span>${pageNumber}</span></jstl:if> --%>
<%-- 					<jstl:if test="${page.number != pageNumber-1}"><a href="${contextRoot}/messages?p=${pageNumber}">${pageNumber}</a></jstl:if> --%>
					<jstl:choose>
						<jstl:when test="${page.number == pageNumber-1}">
							<span>${pageNumber}</span>
						</jstl:when>
						<jstl:otherwise>
							<a href="${contextRoot}/actandles/postall?p=${pageNumber}">${pageNumber}</a>
						</jstl:otherwise>
					</jstl:choose>
				</jstl:forEach>
			</div>
		</div>
    </div>
  </div>
</div>
	
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>