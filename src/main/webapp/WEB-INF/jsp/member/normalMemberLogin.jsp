<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/26
  Time: 下午 09:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../layout/navbar.jsp"/>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
    <title>一般會員登入</title>
</head>
<body>
<div class="container">
    <div class="box-wrapper">
        <div class="box box-border">
            <div class="box-body">
                <h4>登入</h4>
                <h4><a href="${contextRoot}/oauth2/authorization/google">Login with Google</a>
                    <br/>
                     <a href="${contextRoot}/oauth2/authorization/facebook">Login with Facebook</a></h4>
                <form action="${contextRoot}/member/login" method="post">
                    <div class="form-group">
                        <label>使用者信箱</label>
                        <input type="text" name="username" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fw">密碼
                            <a href="${contextRoot}/member/forgetPwd" class="pull-right">忘記密碼</a>
                        </label>
                        <input type="password" name="password" class="form-control">
                    </div>
                    <div class="form-group text-right">
                        <button class="btn btn-primary btn-block" type="submit">登入</button>
                    </div>
                    <div class="form-group text-center">
                        <span class="text-muted"> 沒有帳號?</span> <a href="${contextRoot}/member/registration">創建帳戶
                    </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
