<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${contextRoot}/css/article/articlelist.css">
<jsp:include page="../layout/navbar.jsp" />
<title>新增專欄</title>
</head>
<body>
	<div class="container">
		<div class="form-floating mb-3">
			<label for="floatingInput">文章標題</label>
		  	<input type="text" class="form-control" id="floatingInput" placeholder="請輸入標題">
		</div>
		<div class="form-group">
		  	<label for="exampleFormControlTextarea1">文章內容</label>
		  	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		<div class="form-floating mb-3">
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
			  <label class="form-check-label" for="inlineCheckbox1">1</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
			  <label class="form-check-label" for="inlineCheckbox2">2</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
			  <label class="form-check-label" for="inlineCheckbox3">3</label>
			</div>
		</div>
	</div>
</body>
</html>