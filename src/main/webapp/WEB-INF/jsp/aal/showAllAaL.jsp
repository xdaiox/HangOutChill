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
<title>活動與課程</title>



</head>
<body>
	<jsp:include page="../layout/navbar.jsp" />
	<h1 class="text-center">活動與課程</h1>

	<div class="container content_view mb-3" 
		style="background-color: #ffffff00;">
		<div class="content_box" >
			<div class="d-flex justify-content-around mb-3 "
				style="background-color: #ffffff00;">
			<input type="button" id="showall" class="btn btn-link" value="總攬"/>
			<input type="button" id="showtheact" class="btn btn-link" value="僅活動"/>
			<input type="button" id="showtheles" class="btn btn-link" value="僅課程"/>
				<form action="${contextRoot}/actandles/detail/showmysignup">
					<input type="submit" class="btn btn-link"
						value="個人報名管理" />
				</form>
				<form action="${contextRoot}/actandles/shop/postall">
					<input type="submit" class="btn btn-link"
						value="商家活動申辦" />
				</form>
			</div>
			<div class="content content_view" id="all"
				style="background-color: #ffffff00;width: 100%;flex-wrap: wrap;height: unset;">
							<jstl:forEach var="aal" items="${page.content}">
							
							<div class="text-center  mb-3 aalBox" style="height:450px;width: 25%;border: 1px solid gray;">
							<div style="height:200px;width: 100%;">
								<a href="${contextRoot}/actandles/${aal.id}"><img style="background-size: cover;height: 100%;" class="img-fluid img-thumbnail rounded" src="data:image/png;base64,${aal.base64image}"></a>
							</div>
								<div class="row d-flex justify-content-center">
								<div class="col-md-9"  ><a style="font-size: 20px;" href="${contextRoot}/actandles/${aal.id}">${aal.name}</a></div> 
								<div class="col-md-9" ><jstl:if test="${aal.topic=='act'}">類型：活動</jstl:if> 
									<jstl:if test="${aal.topic=='les'}">類型：課程</jstl:if></div> 
								<div class="col-md-9" >舉辦日：<fmt:formatDate pattern="yyyy-MM-dd" value="${aal.theDayofStarts}" /></div>
								<div class="col-md-9" >報名費用：${aal.fee}</div>
								<div class="col-md-9" >名額上限:${aal.quota}</div>
								<div class="col-md-9" >開辦人數：${aal.lowerLimit}</div>
								<div class="col-md-9" >
														<jstl:choose>
																<jstl:when test="${(aal.quota-aal.registered)<5}">
																	<p style="color: red; font-weight: bold;">剩餘名額：${aal.quota-aal.registered}人
																</jstl:when>
																<jstl:when test="${(aal.quota-aal.registered)>5}">
																	<p>剩餘名額：${aal.quota-aal.registered}人
																</jstl:when>
															</jstl:choose></div>
								<div class="col-md-9" >報名截止：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${aal.deadLine}" /></div>
								</div>
							</div>
							</jstl:forEach>
<!-- 							<div style="text-align: center;"> -->
<%-- 							<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>
<%-- 								<jstl:choose> --%>
<%-- 									<jstl:when test="${page.number == pageNumber-1}"> --%>
<%-- 										<span>${pageNumber}</span> --%>
<%-- 									</jstl:when> --%>
<%-- 									<jstl:otherwise> --%>
<!-- 										<a -->
<%-- 											href="${contextRoot}/actandles?p=${pageNumber}">${pageNumber}</a> --%>
<%-- 									</jstl:otherwise> --%>
<%-- 								</jstl:choose> --%>
<%-- 							</jstl:forEach> --%>
<!-- 						</div> -->
			</div>
			<div class="content content_view" id="act"
				style="background-color: #ffffff00;  display: none;width: 100%;flex-wrap: wrap;height: unset;">
							<jstl:forEach var="aal" items="${pageforAct.content}">
							
							<div class="text-center  mb-3" style="height:450px;width: 25%;border: 1px solid gray;">
							<div style="height:200px;width: 100%;">
								<a href="${contextRoot}/actandles/${aal.id}"><img style="background-size: cover;height: 100%;" class="img-fluid img-thumbnail rounded" src="data:image/png;base64,${aal.base64image}"></a>
							</div>
								<div class="row d-flex justify-content-center">
								<div class="col-md-9" ><a style="font-size: 20px;" href="${contextRoot}/actandles/${aal.id}">${aal.name}</a></div> 
								<div class="col-md-9" ><jstl:if test="${aal.topic=='act'}">類型：活動</jstl:if> 
									<jstl:if test="${aal.topic=='les'}">類型：課程</jstl:if></div> 
								<div class="col-md-9" >舉辦日：<fmt:formatDate pattern="yyyy-MM-dd" value="${aal.theDayofStarts}" /></div>
								<div class="col-md-9" >報名費用：${aal.fee}</div>
								<div class="col-md-9" >名額上限:${aal.quota}</div>
								<div class="col-md-9" >開辦人數：${aal.lowerLimit}</div>
								<div class="col-md-9" >
														<jstl:choose>
																<jstl:when test="${(aal.quota-aal.registered)<5}">
																	<p style="color: red; font-weight: bold;">剩餘名額：${aal.quota-aal.registered}人
																</jstl:when>
																<jstl:when test="${(aal.quota-aal.registered)>5}">
																	<p>剩餘名額：${aal.quota-aal.registered}人
																</jstl:when>
															</jstl:choose></div>
								<div class="col-md-9" >報名截止：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${aal.deadLine}" /></div>
								</div>
							</div>
							</jstl:forEach>
<!-- 							<div style="text-align: center;"> -->
<%-- 							<jstl:forEach var="pageNumber" begin="1" end="${pageforAct.totalPages}"> --%>
<%-- 								<jstl:choose> --%>
<%-- 									<jstl:when test="${pageforAct.number == pageNumber-1}"> --%>
<%-- 										<span>${pageNumber}</span> --%>
<%-- 									</jstl:when> --%>
<%-- 									<jstl:otherwise> --%>
<!-- 										<a -->
<%-- 											href="${contextRoot}/actandles?p=${pageNumber}">${pageNumber}</a> --%>
<%-- 									</jstl:otherwise> --%>
<%-- 								</jstl:choose> --%>
<%-- 							</jstl:forEach> --%>
<!-- 						</div> -->
			</div>
			<div class="content content_view" id="les"
				style="background-color: #ffffff00; display: none;width: 100%;flex-wrap: wrap;height: unset;">
							<jstl:forEach var="aal" items="${pageforLes.content}">
							
							<div class="text-center  mb-3" style="height:450px;width: 25%;border: 1px solid gray;">
							<div style="height:200px;width: 100%;">
								<a href="${contextRoot}/actandles/${aal.id}"><img style="background-size: cover;height: 100%;" class="img-fluid img-thumbnail rounded" src="data:image/png;base64,${aal.base64image}"></a>
							</div>
								<div class="row d-flex justify-content-center">
								<div class="col-md-9" ><a style="font-size: 20px;" href="${contextRoot}/actandles/${aal.id}">${aal.name}</a></div> 
								<div class="col-md-9" ><jstl:if test="${aal.topic=='act'}">類型：活動</jstl:if> 
									<jstl:if test="${aal.topic=='les'}">類型：課程</jstl:if></div> 
								<div class="col-md-9" >舉辦日：<fmt:formatDate pattern="yyyy-MM-dd" value="${aal.theDayofStarts}" /></div>
								<div class="col-md-9" >報名費用：${aal.fee}</div>
								<div class="col-md-9" >名額上限:${aal.quota}</div>
								<div class="col-md-9" >開辦人數：${aal.lowerLimit}</div>
								<div class="col-md-9" >
														<jstl:choose>
																<jstl:when test="${(aal.quota-aal.registered)<5}">
																	<p style="color: red; font-weight: bold;">剩餘名額：${aal.quota-aal.registered}人
																</jstl:when>
																<jstl:when test="${(aal.quota-aal.registered)>5}">
																	<p>剩餘名額：${aal.quota-aal.registered}人
																</jstl:when>
															</jstl:choose></div>
								<div class="col-md-9" >報名截止：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${aal.deadLine}" /></div>
								</div>
							</div>
							</jstl:forEach>
<!-- 							<div style="text-align: center;"> -->
<%-- 							<jstl:forEach var="pageNumber" begin="1" end="${pageforLes.totalPages}"> --%>
<%-- 								<jstl:choose> --%>
<%-- 									<jstl:when test="${pageforLes.number == pageNumber-1}"> --%>
<%-- 										<span>${pageNumber}</span> --%>
<%-- 									</jstl:when> --%>
<%-- 									<jstl:otherwise> --%>
<!-- 										<a -->
<%-- 											href="${contextRoot}/actandles?p=${pageNumber}">${pageNumber}</a> --%>
<%-- 									</jstl:otherwise> --%>
<%-- 								</jstl:choose> --%>
<%-- 							</jstl:forEach> --%>
<!-- 						</div> -->
			</div>
		</div>
	</div>

	

	<jsp:include page="../layout/footer.jsp" />



</body>

<script>
$(document).ready(function(){
	  $('#showall').click(function(){
	    $('#all').fadeIn();
	    $('#act, #les').hide();
	  });
	  $('#showtheact').click(function(){
	    $('#act').fadeIn();
	    $('#all, #les').hide();
	  });
	  $('#showtheles').click(function(){
	    $('#les').fadeIn();
	    $('#all, #act').hide();
	  });
	});



</script>
</html>