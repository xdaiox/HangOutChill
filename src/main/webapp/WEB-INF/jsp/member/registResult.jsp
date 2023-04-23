<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/22
  Time: 下午 08:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
    <title>註冊結果</title>
</head>
<body>
<h1>陽春結果</h1>
<p>
    ${latest.account}
    <br>
    ${latest.password}
    <br>
    ${latest.reallName}
    <br>
    ${latest.nickName}
    <br>
    ${latest.gender}
    <br>
    ${latest.tel}
    <br>
    ${latest.birthdate}
    <br>
    ${latest.registTime}
    <br>
    ${latest.id}
    <br>
    <img src="${latest.photoB64}">
</p>

</body>
</html>
