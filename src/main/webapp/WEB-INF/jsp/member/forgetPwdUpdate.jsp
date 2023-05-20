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
            <span ><button type="button" class="btn btn-primary btn-sm" style="margin-bottom: 20px;" id="reset">重設密碼</button></span>
            <form method="post" action="${contextRoot}/member/updatePwdForget " onblur="checkMail(event)">
                <input type="hidden" name="_method" value="put">
                <input type="hidden" value="${forgotM.id}" name="id">
                <div class="form-group">
                    <label>密碼<span id="spWrongPwd" style="color: red"></span></label>
                    <input type="password" name="password" class="form-control" id="pwd">
                </div>
                <div class="form-group">
                    <label>再次確認密碼<span id="wrongPwd2" style="color: red"></span></label>
                    <input type="password" name="" class="form-control" id="pwd2">
                </div>
                <div class="form-group text-right">
                    <button class="btn btn-primary btn-block" type="submit">送出</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    document.getElementById("pwd").addEventListener("blur", checkPassword)
    function checkPassword() {
        let pwdObj = document.getElementById("pwd");
        let strpwd = pwdObj.value;
        let str = "";
        let re = /^(?=.*[a-z])(?=.*[\d])(?=.*[!@#$%^&*])[a-z\d!@#$%^&*]{0,}$/

        if (strpwd != "") {//密碼為空
            if (strpwd.length >= 6) {//密碼小於6
                for (i = 0; i < strpwd.length; i++) {
                    let ch = strpwd.charAt(i).toLowerCase();
                    str += ch;
                }
                if (re.test(str)) {//密碼格式錯誤
                    console.log(str);
                    document.getElementById("spWrongPwd").innerHTML = ''
                    return true
                } else {
                    document.getElementById("spWrongPwd").innerHTML = '密碼須包含!@#$%^&*等特殊符號'
                    return false
                }
            } else {
                document.getElementById("spWrongPwd").innerHTML = '密碼不可小於6碼'
                return false
            }
        } else {
            document.getElementById("spWrongPwd").innerHTML = '密碼不可為空'
            return false
        }

    }
    document.getElementById('pwd2').addEventListener('input',passwordMatch)
    function passwordMatch(){
        if (document.getElementById('pwd').value==document.getElementById('pwd2').value){
            document.getElementById('wrongPwd2').innerHTML='密碼相同'
            return true;
        }else {
            document.getElementById('wrongPwd2').innerHTML='密碼不一致'
            return false;
        }
    }

    function checked(event){
        let passwordCheck = checkPassword()
        let passwordCheck2 = passwordMatch()
        if(passwordCheck && passwordCheck2){
            this.submit()
        }else{
            alert("請確認所有欄位格式皆正確")
            event.preventDefault()
        }
    }

    document.getElementById('reset').addEventListener('click',function(){
        document.getElementById('pwd').value = '!miki50230';
        document.getElementById('pwd2').value = '!miki50230';

    })
</script>

</body>
</html>
