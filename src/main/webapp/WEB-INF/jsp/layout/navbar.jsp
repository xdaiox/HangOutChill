<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link rel="icon" href="" type="image/png">
    <title>HangoutChill Holiday</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.css">
    <link rel="stylesheet" href="${contextRoot}/css/themify-iconscopy.css">
    <link rel="stylesheet" href="${contextRoot}/css/flaticon.css">


    <!-- main css -->
    <link rel="stylesheet" href="${contextRoot}/css/stylecopy.css">
    <link rel="stylesheet" href="${contextRoot}/css/responsivecopy.css">
    <link rel="stylesheet" href="${contextRoot}/css/contentcopy.css">
<title>導覽列</title>
</head>
<body>
    <section class="header-top">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-3 col-lg-4 social">
                <div class="float-left">
                    <ul class="header_social">
                        <li><a href="#"><i class="ti-facebook"></i></a></li>
                        <li><a href="#"><i class="ti-twitter"></i></a></li>
                        <li><a href="#"><i class="ti-instagram"></i></a></li>
                        <li><a href="#"><i class="ti-skype"></i></a></li>
                        <li><a href="#"><i class="ti-vimeo"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-6 col-lg-4 col-md-3 col-sm-6 logo-wrapper">
                <a href="${contextRoot}/" class="logo">
                    <img src="${contextRoot}/img/picwish.png" alt="" style="height: 80px;">
                </a>
            </div>
            <div class="col-lg-4 col-md-3 col-sm-6 search-trigger">
                <div class="right-button">
                    <ul>
                        <li><a id="search" href="javascript:void(0)"><i class="fas fa-search"></i></a></li>
                        <li><a href="#"><i class="ti-btnshopcart"></i></a></li>
                        <li><a class="btn-login" href="${contextRoot}/member/loginHome">登入</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </section>
    <section  id="header" class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                        <li class="nav-item active"><a class="nav-link" href="${contextRoot}/">首頁</a></li>
                        <li class="nav-item"><a class="nav-link" href="article.html">專欄</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextRoot}/location/locationList">精選地點</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="${contextRoot}/discussion/showAllDiscussion" class="nav-link dropdown-toggle">討論區</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="${contextRoot}/actandles">活動與課程</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextRoot}/shop/index">商城</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.html">聯絡我們</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    </section>

 	<script src="${contextRoot}/js/jquery-2.2.4.min.js"></script>
    <script src="${contextRoot}/js/popper.js"></script>
    <script src="${contextRoot}/js/bootstrap.min.js"></script>
    <script src="${contextRoot}/js/stellar.js"></script>
<!--     <script src="vendors/popup/jquery.magnific-popup.min.js"></script> -->
    <script src="${contextRoot}/js/jquery.ajaxchimp.min.js"></script>
    <script src="${contextRoot}/js/waypoints.min.js"></script>
    <script src="${contextRoot}/js/mail-script.js"></script>
    <script src="${contextRoot}/js/contact.js"></script>
    <script src="${contextRoot}/js/jquery.form.js"></script>
    <script src="${contextRoot}/js/jquery.validate.min.js"></script>
    <script src="${contextRoot}/js/mail-script.js"></script>
    <script src="${contextRoot}/js/theme.js"></script>
</body>
</html>