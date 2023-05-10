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
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
                    <form:form action="${contextRoot}/NormalMember/registed" method="post" modelAttribute="newNormalMember" enctype="multipart/form-data" id="NewMemberForm" onsubmit="checked(event);">
                        <div class="form-group">
                            <label class="fw">帳號 (信箱)<span id="wrongMail" style="color: red"></span></label>
                            <form:input path="account" type="email" class="form-control" name="account" id="account"/>
                        </div>
                        <div class="form-group">
                            <label class="fw">密碼<span id="spWrongPwd" style="color: red"></span></label>
                            <form:input path="password" type="password" name="password" class="form-control" id="pwd"/>
                        </div>
                        <div class="form-group">
                            <label class="fw">密碼 (請再輸入一次)<span id="wrongPwd2" style="color: red"></span></label>
                            <input type="password" name="againpassword" class="form-control" id="pwd2">
                        </div>
                        <div class="form-group">
                            <label class="fw">暱稱<span id="wrongNickname" style="color: red"></span></label>
                            <form:input path="nickName" type="text" name="nickname" class="form-control" id="nickName"/>
                        </div>
                        <div class="form-group">
                            <label class="fw">真實姓名<span id="wrongName" style="color: red"></span></label>
                            <form:input  path="reallName" type="text" name="realname" class="form-control" id="realname"/>
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
                                <label class="fw">手機<span id="wrongTel" style="color: red"></span></label>
                            <form:input path="tel" type="text" name="tel" class="form-control" id="phone"/>
                            </div>
                        <div class="form-group">
                            <label class="fw">出生年月日<span id="wrongDate" style="color: red"></span></label>
                            <form:input  path="birthdate" type="date" name="birthdate" class="form-control" id="date"/>
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
            //確認表單內容
            document.getElementById('phone').addEventListener('blur', checkTel)
            function checkTel() {
                let tel = document.getElementById('phone').value
                let reg = /^(09)[0-9]{8}$/
                if (!(reg.test(tel))) {
                    document.getElementById('wrongTel').innerText = '格式錯誤'
                    return false
                } else {
                    document.getElementById('wrongTel').innerText = ''
                    return true
                }
            }
            document.getElementById('nickName').addEventListener('blur', checkNickname)
            function checkNickname() {
                let nickName = document.getElementById('nickName').value
                if (nickName == "") {
                    document.getElementById('wrongNickname').innerText = '不可為空'
                    return false
                } else {
                    document.getElementById('wrongNickname').innerText = ''
                    return true
                }
            }
            document.getElementById('account').addEventListener('blur', checkMail)
            function checkMail() {
                let mail = document.getElementById('account').value
                let reg = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
                let flagMail = true;
                if (!(reg.test(mail))) {
                    document.getElementById('wrongMail').innerText = '錯誤的信箱格式'
                    return false
                } else  {
                    axios.get("${contextRoot}/member/existed?account="+mail)
                        .then( (res) => {
                            if(res.data){
                                alert(
                                    "此信箱可使用")
                                 flagMail = true;
                            }else {
                                alert("此帳號已使用")
                                 flagMail = false;
                            }
                        })
                        .catch( (err) => {
                            alert(err)

                        });
                    document.getElementById('wrongMail').innerText = ''

                    if(flagMail){
                        return  true;
                    }return false;
                }


            }
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
            document.getElementById('date').addEventListener('blur', checkDate)
            function checkDate() {
                let date = document.getElementById('date').value
                if (date == "" | date == undefined) {
                    document.getElementById('wrongDate').innerText = '請選擇西元出生年月日'
                    return false
                } else {
                    return true;
                }
            }
            document.getElementById('realname').addEventListener('blur',checkName)
            function checkName() {
                let name = document.getElementById('realname').value
                let flagName = false;

                if (name == "") {
                    document.getElementById('wrongName').innerHTML = '不可為空'
                } else {
                    if (name.length < 2) {
                        document.getElementById('wrongName').innerHTML = '不可小於2字'
                        return false
                    } else {
                        for (let i = 0; i <= name.length; i++) {
                            let eachChar = name.charCodeAt(i);
                            if (eachChar >= 0x4e00 && eachChar <= 0x9fff) {
                                flagName = true;
                                continue;
                            }
                        }
                        if (flagName) {
                            document.getElementById('wrongName').innerHTML = ''
                            return true
                        } else {
                            document.getElementById('wrongName').innerHTML = '錯誤的姓名格式'
                            return false
                        }
                    }
                }
            }
            function checked(event){
                let mailCheck = checkMail()
                let telCheck = checkTel()
                let nicknameCheck = checkNickname()
                let nameCheck = checkName()
                let passwordCheck = checkPassword()
                let dateCheck = checkDate()
                let passwordCheck2 = passwordMatch()
                if(mailCheck && telCheck && nicknameCheck && nameCheck && passwordCheck && dateCheck && passwordCheck2){
                    this.submit()
                }else{
                    alert("請確認所有欄位格式皆正確")
                    event.preventDefault()
                }
            }

        </script>
</body>
</html>
