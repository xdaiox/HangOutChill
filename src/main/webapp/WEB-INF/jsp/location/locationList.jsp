<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/4/22
  Time: 下午 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<%--<link rel="stylesheet" href="${contextRoot}/css/location/locationList.css">--%>
<jsp:include page="../layout/navbar.jsp"/>
<html>
<head>
    <title>精選地點</title>
</head>
<body>
    <div class="container">
        <div class="row" style="margin: auto">
            <div class="col-1"></div>
            <div class="col-lg-3 col-md-12 col-sm-12">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Rem maxime nemo saepe vero debitis corrupti quos laborum facere aperiam voluptatibus. Explicabo cumque commodi ea a aliquam! Suscipit placeat facilis qui.</div>
            <div class="col-lg-7 col-md-6 col-sm-12">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem, id. Omnis nobis praesentium eveniet, atque, esse quos qui unde neque laboriosam libero mollitia ducimus exercitationem asperiores excepturi temporibus aliquid nihil.</div>
            <div class="col-1"></div>
        </div>




<jsp:include page="../layout/footer.jsp" />
</body>
</html>
