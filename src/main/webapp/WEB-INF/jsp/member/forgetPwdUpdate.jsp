<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/5/6
  Time: 上午 01:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<jsp:include page="../layout/navbar.jsp"/>

<html>
<head>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
    <title>忘記密碼</title>
</head>
<body>
<div class="box-wrapper">
    <div class="box box-border">
        <div class="box-body">
            <h4>請輸入新密碼</h4>
            <form method="post" action="${contextRoot}/member/updatePwdForget ">
                <input type="hidden" name="_method" value="put">
                <input type="hidden" value="${forgotM.id}" name="id">
                <div class="form-group">
                    <label>密碼</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                    <label>再次確認密碼</label>
                    <input type="password" name="" class="form-control">
                </div>
                <div class="form-group text-right">
                    <button class="btn btn-primary btn-block" type="submit">送出</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
