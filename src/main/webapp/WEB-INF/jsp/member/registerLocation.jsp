<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/21
  Time: 下午 01:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../layout/navbar.jsp"/>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
    <title>商家會員註冊</title>
</head>
<body>

    <div class="box-wrapper">
        <div class="box box-border">
            <div class="box-body">
                <h4>商家註冊</h4>
                <form>
                    <div class="form-group">
                        <label class="fw">帳號 (信箱)</label>
                        <input type="email" name="email" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fw">密碼</label>
                        <input type="password" name="password" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fw">密碼 (請再輸入一次)</label>
                        <input type="password" name="againpassword" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fw">暱稱</label>
                        <input type="text" name="nickname" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fw">真實姓名</label>
                        <input type="text" name="realname" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fw">手機</label>
                        <input type="text" name="tel" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fw">出生年月日</label>
                        <input type="date" name="birthdate" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fw">大頭貼</label>
                        <input type="file" name="tel" class="form-control">
                    </div>
                    <div class="form-group text-right">
                        <button class="btn btn-primary btn-block">註冊</button>
                    </div>
                    <div class="form-group text-center">
                        <span class="text-muted">已經有帳號了?</span> <a href="login.html">登入</a>
                    </div>
                </form>
            </div>
        </div>
    </div>


</body>
</html>
