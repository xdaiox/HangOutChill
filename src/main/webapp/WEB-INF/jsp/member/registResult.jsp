<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/22
  Time: 下午 08:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../layout/navbar.jsp"/>
    <title>註冊結果</title>
</head>
<body>
<div class="text-center">
    <h3>恭喜您註冊完成</h3>
    <img src="${contextRoot}/img/HangOutChill.png" class="rounded" height="200px">
    <p style="font-size: larger">請到您註冊的信箱點選開通郵件連結</p>
    <input type="hidden" value="${latest.id}" id="memberId">
    <a href="#" class="btn btn-primary btn-lg active" role="button" aria-pressed="true" id="resend">重寄驗證信</a>
    <script>
        document.getElementById("resend").addEventListener('click',resendResult)
        function resendResult(){
            let theId = parseInt(document.getElementById("memberId").value)
            console.log(theId)
            axios.get("${contextRoot}/member/resendMail?id="+ theId)
                .then((res) =>{
                    // console.log(res.data)
                    alert(res.data)
                }).catch((err)=>{
                    // console.log(err.data)
                    alert(err)
            })
        }
    </script>
</div>
</body>
</html>
