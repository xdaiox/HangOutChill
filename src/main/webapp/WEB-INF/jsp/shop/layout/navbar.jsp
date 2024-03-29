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
    <title>HangoutChill Shop</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.css">
    <link rel="stylesheet" href="${contextRoot}/css/themify-iconscopy.css">
    <link rel="stylesheet" href="${contextRoot}/css/flaticon.css">


    <!-- main css -->
    <link rel="stylesheet" href="${contextRoot}/css/stylecopy.css">
    <link rel="stylesheet" href="${contextRoot}/css/responsivecopy.css">
    <link rel="stylesheet" href="${contextRoot}/css/contentcopy.css">
    
<!--     test css -->
    <link rel="stylesheet" href="${contextRoot}/css/shop/cartitem.css">
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
                <a href="${contextRoot}/shop/index" class="logo">
<!--                     <img src="" alt="商城LOGO" style="height: 80px;"> -->
                    <h3>商城LOGO</h3>
                </a>
            </div>
            <div class="col-lg-4 col-md-3 col-sm-6 search-trigger">
                <div class="right-button">
                    <ul>
<!--                         <li><a id="search" href="javascript:void(0)"><i class="fas fa-search"></i></a></li> -->
                        <li><a href="${contextRoot}/shop/shoppingCart" class="site-cart">
                        
                         <i class="ti-btnshopcart"></i>
                      		<span class="count"></span>
                        </a>
                        </li>
<%--                         <li><a class="btn-login" href="${contextRoot}/member/loginHome">登入</a></li> --%>
                    	<li><a href="#"><i class="ti-user"></i>
                            <jstl:choose>
                            <jstl:when
                                    test="${result.nickName != null}">
                            <a href="${contextRoot}/member/NormalMemberDetail">${result.nickName}您好</a></jstl:when>
                        </jstl:choose>
                        </a></li>
                        <jstl:choose>
                            <jstl:when test="${result.nickName != null}">
                                <li><a class="btn-login" href="${contextRoot}/logout">登出</a></li>
                            </jstl:when>
                            <jstl:otherwise>
                                <li><a class="btn-login" href="${contextRoot}/member/loginHome">登入</a></li>
                            </jstl:otherwise>
                        </jstl:choose>
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
                        <li class="nav-item"><a class="nav-link" href="/hangoutchill/shop/products?category=全部商品">全部商品</a></li>
                        <li class="nav-item"><a class="nav-link" href="/hangoutchill/shop/products?category=美味嚐點">美味嚐點</a></li>
                        <li class="nav-item"><a class="nav-link" href="/hangoutchill/shop/products?category=文創商品">文創商品</a></li>
                        <li class="nav-item"><a class="nav-link" href="/hangoutchill/shop/products?category=實用嚴選">實用嚴選</a></li>
                        <li class="nav-item"><a class="nav-link" href="/hangoutchill/shop/productcategory?category=全部商品">測試用版</a></li>
<!--                         <li class="nav-item submenu dropdown"> -->
<%--                             <a href="${contextRoot}/discussion/showAllDiscussion" class="nav-link dropdown-toggle">實用嚴選</a> --%>
<!--                         </li> -->
                        <li class="nav-item"><a class="nav-link" href="${contextRoot}/">HanoutChill首頁</a></li>
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
    <script src="vendors/popup/jquery.magnific-popup.min.js"></script>
    <script src="${contextRoot}/js/jquery.ajaxchimp.min.js"></script>
    <script src="${contextRoot}/js/waypoints.min.js"></script>
    <script src="${contextRoot}/js/mail-script.js"></script>
    <script src="${contextRoot}/js/contact.js"></script>
    <script src="${contextRoot}/js/jquery.form.js"></script>
    <script src="${contextRoot}/js/jquery.validate.min.js"></script>
    <script src="${contextRoot}/js/mail-script.js"></script>
    <script src="${contextRoot}/js/theme.js"></script>
    <script>
    	let categories = document.getElementsByClassName('nav-link');
        let categoriesAmount = categories.length;
        let url = location.href;
        if(url.indexOf('?') != -1){
            let array1 = url.split('?');
            console.log(array1[1]);
            let categoryName = array1[1].split('=')[1];
            console.log(categoryName);
            let theName = decodeURIComponent(categoryName);
            console.log(theName);
            for(let i=0; i<categoriesAmount; i++){
                if (categories[i].innerHTML === theName){
                    categories[i].parentElement.setAttribute('class','nav-item active');
                }
            }

        }


    </script>
<%--     <script src="${contextRoot}/js/jquery-3.6.4.min.js"></script> --%>
</body>
</html>