<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/21
  Time: 下午 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
    <title>一般會員中心</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"/>
<div class="blog_right_sidebar">
    <div class="btn-group-vertical my-3">

        <button type="button" class="btn btn-primary">123</button>
        <button type="button" class="btn btn-primary">2345</button>
    </div>
</div>
<div>
    目前登入者資料
    ${result.account}
    <br/>
    ${result.nickName}
    <br/>
    <img src="${result.photoB64}">
</div>


<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
