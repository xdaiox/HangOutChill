<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<!DOCTYPE html>
<html>
<head>
  	<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
	
	<meta charset="UTF-8">
	<link rel="icon" href="" type="image/png">
	<link rel="stylesheet" href="${contextRoot}/css/article/articleForm.css">
	
	<title>Insert title here</title>
	<jsp:include page="../layout/navbar.jsp"/>
</head>
<body>
    <div class="main">
        <div class="pickers">
            <ul class="pickers_ul">
                <li class="pickers_li"><a href="">訂單管理</a></li>
                <li class="pickers_li"><a href="">我的書籤</a></li>
                <li class="pickers_li"><a href="">活動管理</a></li>
                <li class="pickers_li"><a href="">地點收藏</a></li>
                <li class="pickers_li"><a href="">討論收藏</a></li>
            </ul>
        </div>
        <section class="my profile">
            <div class="profile_container">
                <h1 class="my_title">帳號管理</h1>

                <div class="contentBox">
                    <div class="ImgBox">
                        <div class="ImgInfo">
                            <img class="headshot" src="/images/cat.jpg" alt="">
                            <a href=""><img class="cameraicon" src="/images/cameraicon.png" alt=""></a>
                        </div>
                        <div class="editPwd">
                            <button class="profile_enter google" type="submit">Google登入</button>
                            <button class="profile_enter line" type="submit">LINE登入</button>
                            <button class="profile_enter fb" type="submit">Facebook登入</button>
                        </div>
                        <button class="profile_enter" type="submit">修改密碼</button>
                    </div>

                    <form action="">
                        <div class="my_or">
                            <p>個人資料</p>
                        </div>
                        <div class="profile_form">
                            <div class="profile_item">
                                <p>姓名</p>
                                <div class="profile_different">
                                    <input type="text" class="profile_input" placeholder="輸入你的名字" name="name" maxlength="30">
                                </div>
                            </div>
                            <div class="profile_item">
                                <p>暱稱</p>
                                <div class="profile_different">
                                    <input type="text" class="profile_input" placeholder="輸入你的暱稱" name="nickname" maxlength="30">
                                </div>
                            </div>
                            <div class="profile_item">
                                <p>性別</p>
                                <div class="profile_sex">
                                    <label for="grnder-1" class="profile_sexLabel">
                                        <input type="radio" name="gender" id="gender-1" value="男" class="profile_sexRadio">
                                        <p class="profile_sexText">男</p>
                                    </label>
                                    <label for="grnder-2" class="profile_sexLabel">
                                        <input type="radio" name="gender" id="gender-2" value="女" class="profile_sexRadio">
                                        <p class="profile_sexText">女</p>
                                    </label>
                                </div>
                            </div>
                            <div class="profile_item">
                                <p>手機號碼</p>
                                <div class="profile_different">
                                    <input type="tel" class="profile_input" name="mobile" placeholder="輸入你的手機" maxlength="10">
                                </div>
                            </div>
                            <div class="profile_item">
                                <p>E-mail</p>
                                <div class="profile_different">
                                    <input type="email" class="profile_input" placeholder="輸入你的信箱" name="email" maxlength="30">
                                </div>
                            </div>
                            <div class="profile_item">
                                <p>生日</p>
                                <input type="date" class="profile_input" name="date">
                            </div>
    
                            <button class="profile_enter" type="submit">更新個人資料</button>

                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="../layout/footer.jsp"/>
</body>
</html>