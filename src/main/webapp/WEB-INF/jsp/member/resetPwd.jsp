<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/5/10
  Time: 下午 02:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<jsp:include page="../layout/navbar.jsp"/>
<html>
<head>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
    <title>修改密碼</title>
</head>
<body>
<div class="container">
    <div class="box-wrapper">
        <div class="box box-border">
            <div class="box-body">
                <h4>請輸入目前密碼</h4>
                <form action="${contextRoot}/member/checkPassWord" method="post">
                    <input type="hidden" name="memberId" value="${memberId}">
                    <div class="form-group">
                        <label>密碼</label>
                        <input type="password" name="pwd" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>密碼 (請再輸入一次)</label>
                        <input type="password" name="" class="form-control">
                    </div>
                    <div class="form-group text-right">
                        <button class="btn btn-primary btn-block" type="submit">送出</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
