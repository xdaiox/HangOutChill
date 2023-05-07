<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/21
  Time: 下午 01:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <jsp:include page="../layout/navbar.jsp"/>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
    <title>一般會員註冊</title>
</head>
<body>

        <div class="box-wrapper">
            <div class="box box-border">
                <div class="box-body">
                    <h4>一般註冊</h4>
                    <form:form action="${contextRoot}/NormalMember/registed" method="post" modelAttribute="newNormalMember" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="fw">帳號 (信箱)</label>
                            <form:input path="account" type="email" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label class="fw">密碼</label>
                            <form:input path="password" type="password" name="password" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label class="fw">密碼 (請再輸入一次)</label>
                            <input type="password" name="againpassword" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="fw">暱稱</label>
                            <form:input path="nickName" type="text" name="nickname" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label class="fw">真實姓名</label>
                            <form:input  path="reallName" type="text" name="realname" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label class="fw">性別</label>
                            <label>男
                                <form:radiobutton path="gender" value="male" />
                            </label>
                            <label>女
                                <form:radiobutton path="gender" value="female" />
                            </label>
                        </div>
                            <div class="form-group">
                            <label class="fw">手機</label>
                            <form:input path="tel" type="text" name="tel" class="form-control"/>
                            </div>
                        <div class="form-group">
                            <label class="fw">出生年月日</label>
                            <form:input  path="birthdate" type="date" name="birthdate" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label class="fw">大頭貼</label>
                            <form:input path="file" type="file" name="profilePhoto" class="form-control" id="target"/>
                            <p><img src="" id="preview"></p>
                        </div>
                        <div class="form-group text-right">
                            <button class="btn btn-primary btn-block" type="submit">註冊</button>
                        </div>
                        <div class="form-group text-center">
                            <span class="text-muted">已經有帳號了?</span> <a href="login.html">登入</a>
                        </div>
                    </form:form>
                </div>
                </div>
        </div>
        <script >
            //圖片上傳前預覽
            const input = document.getElementById("target")
            const preview = document.getElementById("preview")
            input.addEventListener('change', () => {
                const file = input.files[0];
                const reader = new FileReader();

                reader.addEventListener('load', () => {
                    preview.src = reader.result;
                });

                if (file) {
                    reader.readAsDataURL(file);
                } else {
                    preview.src = "";
                }
            });
        </script>
</body>
</html>
