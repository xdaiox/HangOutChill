<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>HangOut趣</title>
</head>
<body>
  <div class="container-scroller">
  	<jsp:include page="dbLayout/top_navbar.jsp" />

    <div class="container-fluid page-body-wrapper">
		<jsp:include page="dbLayout/left_navbar.jsp" />
      
    </div>
  </div>
</body>

</html>