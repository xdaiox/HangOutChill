<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/20
  Time: 下午 02:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
    <jsp:include page="../layout/navbar.jsp"/>

    <title>會員身分</title>
</head>
<body>


<div class="container overflow-hidden" style="text-align: center">
    <h3>請選擇欲登入的身分</h3>
    <div class="row gy-5">
        <div class="col-md-6" style="text-align: center" >
            <button class="btn btn-primary btn-lg" class=" bg-light" type="button" >一般會員登入</button>
        </div>
        <div class="col-md-6"style="text-align: center" >
            <button class="btn btn-secondary btn-lg" class=" bg-light" type="button" >商家會員登入</button>
        </div>
        <div class="col-md-6" style="text-align: center">
                <button class="btn btn-primary btn-lg" class=" bg-light" type="button" >一般會員註冊</button>
        </div>
        <div class="col-md-6"style="text-align: center" >
            <button class="btn btn-secondary btn-lg" class=" bg-light" type="button" >商家會員註冊</button>
        </div>
    </div>
</div>


</body>
</html>
