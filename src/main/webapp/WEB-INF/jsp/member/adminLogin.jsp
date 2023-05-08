<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/5/7
  Time: 下午 04:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../layout/navbar.jsp"/>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
    <title>管理者登入</title>
</head>
<body>
<div class="container">
    <div class="box-wrapper">
        <div class="box box-border">
            <div class="box-body">
                <h4>登入</h4>
                <form action="${contextRoot}/admin/login" method="post">
                    <div class="form-group">
                        <label>管理員帳號</label>
                        <input type="text" name="username" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fw">管理員密碼
                        </label>
                        <input type="password" name="password" class="form-control">
                    </div>
                    <div class="form-group text-right">
                        <button class="btn btn-primary btn-block" type="submit">登入</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
