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
    <style>
        .profile_enter {
            cursor: pointer;
            width: 165px;
            margin: auto;
            margin-top: 10px;
            text-align: center;
            font-size: 16px;
            padding: 12px 10px;
            background-color: transparent;
            outline: none;
            display: block;
            color: #343434;
            border: 1px solid #343434;
            border-radius: 3px;
        }

        .fb {
            background-color: #4888ff !important;
            color: #fff !important;
        }

        .google {
            background-color: #ea6363 !important;
            color: #fff !important;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="box-wrapper">
        <div class="box box-border">
            <div class="box-body">
                <h4>登入</h4>
                <span ><button type="button" class="btn btn-primary btn-sm" style="margin-bottom: 20px;" id="nmemberBtn">一般會員</button></span> 
                <span ><button type="button" class="btn btn-primary btn-sm" style="margin-bottom: 20px;" id="adminBtn">管理者</button></span>
                <span ><button type="button" class="btn btn-primary btn-sm" style="margin-bottom: 20px;" id="locationMember">精選地點商家</button></span>
                <span ><button type="button" class="btn btn-primary btn-sm" style="margin-bottom: 20px;" id="locationActivity">精選活動商家</button></span>
                <form action="${contextRoot}/member/login" method="post">
                    <div class="form-group">
                        <label>使用者信箱</label>
                        <input type="text" name="username" class="form-control" id="usermail">
                    </div>
                    <div class="form-group">
                        <label class="fw">密碼
                            <a href="${contextRoot}/member/forgetPwd" class="pull-right">忘記密碼</a>
                        </label>
                        <input type="password" name="password" class="form-control" id="userpwd">
                    </div>
                    <div class="form-group text-right" style="margin-bottom: 5px">
                        <button class="btn btn-primary btn-block" type="submit">登入</button>
                    </div>
                    <div style="display: inline-flex">
                    <a class="profile_enter google" type="button" href="${contextRoot}/oauth2/authorization/google" >Google登入</a>
                    </div>
                    <div style="display: inline-flex">
                    <a class="profile_enter fb" type="button" href="${contextRoot}/oauth2/authorization/facebook">Facebook登入</a>
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

<script>
    document.getElementById('nmemberBtn').addEventListener('click',function(){
        document.getElementById('usermail').value = 'estherturkeychen0815@gmail.com';
        document.getElementById('userpwd').value = '!miki50230';

    })
    document.getElementById('adminBtn').addEventListener('click',function(){
        document.getElementById('usermail').value = 'hsin@gmail.com';
        document.getElementById('userpwd').value = '!miki50230';

    })

    document.getElementById('locationMember').addEventListener('click',function(){
        document.getElementById('usermail').value = 'ray861213@gmail.com';
        document.getElementById('userpwd').value = '1234';

    })
    document.getElementById('locationActivity').addEventListener('click',function(){
        document.getElementById('usermail').value = 'hangoutchillforeeit61@gmail.com';
        document.getElementById('userpwd').value = '1234@abc';

    })


</script>


</body>
</html>
