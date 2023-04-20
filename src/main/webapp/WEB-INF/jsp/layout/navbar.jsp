<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="" type="image/png">
    <title>HangoutChill Holiday</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/themify-iconscopy.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">

    <!-- main css -->
    <link rel="stylesheet" href="css/stylecopy.css">
    <link rel="stylesheet" href="css/responsivecopy.css">
    <link rel="stylesheet" href="css/contentcopy.css">
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
                <a href="index.html" class="logo">
                    <img src="img/picwish.png" alt="" style="height: 80px;">
                </a>
            </div>
            <div class="col-lg-4 col-md-3 col-sm-6 search-trigger">
                <div class="right-button">
                    <ul>
                        <li><a id="search" href="javascript:void(0)"><i class="fas fa-search"></i></a></li>
                        <li><a href="#"><i class="ti-btnshopcart"></i></a></li>
                        <li><a class="btn-login" href="login.html">登入</a></li>
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
                        <li class="nav-item active"><a class="nav-link" href="index.html">首頁</a></li>
                        <li class="nav-item"><a class="nav-link" href="article.html">專欄</a></li>
                        <li class="nav-item"><a class="nav-link" href="location.html">精選地點</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="discussion.html" class="nav-link dropdown-toggle">討論區</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="actandles.html">活動與課程</a></li>
                        <li class="nav-item"><a class="nav-link" href="commerceIndex.html">商城</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.html">聯絡我們</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    </section>
</body>
</html>