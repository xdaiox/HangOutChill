<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/5/5
  Time: 下午 11:33
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
<div class="container">
    <div class="box-wrapper">
        <div class="box box-border">
            <div class="box-body">
                <h4>請輸入忘記密碼之信箱</h4>
                <form action="${contextRoot}/member/ForgetPwd" method="get" onblur="checkMail(event)">
                    <div class="form-group">
                        <label>使用者信箱<span id="wrongMail" style="color: red"></span></label>
                        <input type="text" name="account" class="form-control"  id="account">
                    </div>
                    <div class="form-group text-right">
                        <button class="btn btn-primary btn-block" type="submit">送出</button>
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
    function checkMail() {
        let mail = document.getElementById('account').value
        let reg = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
        if (!(reg.test(mail))) {
            document.getElementById('wrongMail').innerText = '錯誤的信箱格式'
            return false
        }else{
            return true;
        }
    }

    function checked(event){
        let mailCheck = checkMail();
        if(mailCheck){
            this.submit()
        }else{
            alert("請確認所有欄位格式皆正確")
            event.preventDefault()
        }
    }
</script>
</body>
</html>
