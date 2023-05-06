<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/5/6
  Time: 上午 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../layout/navbar.jsp"/>
    <title>忘記密碼</title>
</head>
<body>
<div class="text-center">
    <img src="${contextRoot}/img/HangOutChill.png" class="rounded" height="200px">
    <p style="font-size: larger">請到您註冊的信箱點選開通郵件連結，以修改密碼</p>
    <a href="#" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">重寄驗證信</a>
</div>

</body>
</html>
