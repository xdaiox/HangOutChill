<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/5/10
  Time: 下午 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>

    <!-- Stylesheets -->
    <link href="../locationTheme/css/bootstrap.css" rel="stylesheet">
    <link href="../locationTheme/css/style.css" rel="stylesheet">
    <link href="../locationTheme/css/responsive.css" rel="stylesheet">

    <link rel="shortcut icon" href="../locationTheme/images/favicon.png" type="image/x-icon">
    <link rel="icon" href="../locationTheme/images/favicon.png" type="image/x-icon">





    <jsp:include page="../../layout/navbar.jsp"/>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <meta charset="UTF-8">
    <title>該地點名稱</title>
</head>

<body>

<div class="page-wrapper">

    <!-- Preloader -->
    <div class="preloader"></div>

    <!-- Main Header-->
    <header class="main-header">

        <!-- Main box -->
        <div class="main-box">
            <div class="logo-box">
                <div class="logo"><a href="index.html"><img src="images/logo.png" alt="" title=""></a></div>

                <!-- Search Btn -->
                <div class="search-box">
                    <!-- Search Backdrop -->
                    <div class="search-backdrop"></div>

                    <div class="header-search-form">
                        <input type="text" name="header-search" id="cusom-search" data-list=".search-list" placeholder="What are you looking for?">
                        <span class="search-btn"><i class="flaticon-magnifying-glass"></i></span>
                    </div>

                    <div class="search-list">
                        <div class="search-item region">
                            <i class="icon flaticon-placeholder"></i>
                            <div class="text">City Of London </div>
                            <span class="cat">Region</span>
                            <a href="listing-single.html" class="overlay-link"></a>
                        </div>
                        <div class="search-item region">
                            <i class="icon flaticon-placeholder"></i>
                            <div class="text">City of Westminster </div>
                            <span class="cat">Region</span>
                            <a href="listing-single.html" class="overlay-link"></a>
                        </div>
                        <div class="search-item region">
                            <i class="icon flaticon-placeholder"></i>
                            <div class="text">Chelsea District </div>
                            <span class="cat">Region</span>
                            <a href="listing-single.html" class="overlay-link"></a>
                        </div>
                        <div class="search-item listing">
                            <i class="icon flaticon-placeholder"></i>
                            <div class="text">Top Picks </div>
                            <span class="cat">Featured Listings</span>
                            <a href="listing-single.html" class="overlay-link"></a>
                        </div>
                        <div class="search-item shopping">
                            <i class="icon flaticon-placeholder"></i>
                            <div class="text">Shopping </div>
                            <span class="cat">Category</span>
                            <a href="listing-single.html" class="overlay-link"></a>
                        </div>
                        <div class="search-item food">
                            <i class="icon flaticon-placeholder"></i>
                            <div class="text">Local Food </div>
                            <span class="cat">Category</span>
                            <a href="listing-single.html" class="overlay-link"></a>
                        </div>
                        <div class="search-item prize">
                            <i class="icon flaticon-placeholder"></i>
                            <div class="text">Free Entrance </div>
                            <span class="cat">Tag</span>
                            <a href="listing-single.html" class="overlay-link"></a>
                        </div>
                    </div>
                </div>
            </div>

            <!--Nav Box-->
            <div class="nav-outer">
                <nav class="nav main-menu">
                    <ul class="navigation" id="navbar">
                        <li class="dropdown">
                            <span>Home</span>
                            <ul>
                                <li><a href="index.html">Home Page One</a></li>
                                <li><a href="index-2.html">Home Page Two</a></li>
                                <li><a href="index-3.html">Home Page Three</a></li>
                                <li><a href="index-4.html">Home Page Four</a></li>
                                <li><a href="index-5.html">Home Page Five</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <span>Pages</span>
                            <ul>
                                <li class="dropdown">
                                    <span>Dashboard</span>
                                    <ul>
                                        <li class="active"><a href="dashboard.html"> Dashboard</a></li>
                                        <li><a href="dashboard-profile.html">Profile</a></li>
                                        <li><a href="dashboard-listing.html">Listings</a></li>
                                        <li><a href="dashboard-messages.html">Messages </a></li>
                                        <li><a href="dashboard-reviews.html">Reviews</a></li>
                                        <li><a href="dashboard-favorites.html">Favorites</a></li>
                                    </ul>
                                </li>
                                <li><a href="about-us.html">About Us</a></li>
                                <li><a href="how-it-works.html">How It Works</a></li>
                                <li><a href="pricing-table.html">Pricing Table</a></li>
                                <li><a href="listing-style.html">Listing Style</a></li>
                                <li><a href="terms-and-condition.html">Terms and Condition</a></li>
                                <li><a href="elements.html">UI Elements</a></li>
                                <li><a href="coming-soon.html">Coming Soon</a></li>
                                <li><a href="error-page.html">Error 404</a></li>
                            </ul>
                        </li>
                        <li class="dropdown current">
                            <span>Listings</span>
                            <ul>
                                <li class="dropdown">
                                    <span>Listing Layout</span>
                                    <ul>
                                        <li><a href="listing-layout-1.html">Layout 01</a></li>
                                        <li><a href="listing-layout-2.html">Layout 02</a></li>
                                        <li><a href="listing-layout-3.html">Layout 03</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <span>Listing With Map</span>
                                    <ul>
                                        <li><a href="listing-map-layout-1.html">Map Layout 01</a></li>
                                        <li><a href="listing-map-layout-2.html">Map Layout 02</a></li>
                                        <li><a href="listing-map-layout-3.html">Map Layout 03</a></li>
                                        <li><a href="listing-map-layout-4.html">Map Layout 04</a></li>
                                        <li><a href="listing-map-layout-5.html">Map Layout 05</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <span>Listing Single</span>
                                    <ul>
                                        <li><a href="listing-single.html">Listing Single 01</a></li>
                                        <li class="current"><a href="listing-single-2.html">Listing Single 02</a></li>
                                        <li><a href="listing-single-3.html">Listing Single 03</a></li>
                                        <li><a href="listing-single-4.html">Listing Single 04</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <span>Shop</span>
                            <ul>
                                <li><a href="shop.html">Shop</a></li>
                                <li><a href="shop-single.html">Shop Single</a></li>
                                <li><a href="shopping-cart.html">Shopping Cart</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <span>Blog</span>
                            <ul>
                                <li><a href="blog.html">Blog Grid</a></li>
                                <li><a href="blog-single.html">Blog Single</a></li>
                            </ul>
                        </li>

                        <li><a href="contact.html">Contact</a></li>
                        <li class="mm-add-listing"><a href="add-listing.html" class="theme-btn btn-style-three"><span class="flaticon-plus-symbol"></span>Add Listing</a></li>
                    </ul>
                </nav>
                <!-- Main Menu End-->

                <div class="outer-box">
                    <!-- Add Listing -->
                    <a href="add-listing.html" class="add-listing"> <span class="flaticon-plus-symbol"></span> Add Listing</a>

                    <!-- Cart btn -->
                    <div class="cart-btn">
                        <a href="shopping-cart.html"><i class="icon flaticon-shopping-bag"></i> <span class="count">2</span></a>

                        <div class="shopping-cart">
                            <ul class="shopping-cart-items">
                                <li class="cart-item">
                                    <img src="images/resource/item-thumb-1.jpg" alt="" class="thumb" />
                                    <span class="item-name">Dolar Sit Amet</span>
                                    <span class="item-quantity">1 x <span class="item-amount">$7.90</span></span>
                                    <a href="shop-single.html" class="product-detail"></a>
                                    <button class="remove-item"><span class="fa fa-times"></span></button>
                                </li>

                                <li class="cart-item">
                                    <img src="images/resource/item-thumb-2.jpg" alt="" class="thumb"  />
                                    <span class="item-name">Lorem Ipsum</span>
                                    <span class="item-quantity">3 x <span class="item-amount">$7.90</span></span>
                                    <a href="shop-single.html" class="product-detail"></a>
                                    <button class="remove-item"><span class="fa fa-times"></span></button>
                                </li>
                            </ul>

                            <div class="shopping-cart-total"><span>Subtotal: </span> $57.70</div>

                            <div class="cart-footer">
                                <a href="cart.html" class="theme-btn btn-style-one">View Cart</a>
                                <a href="checkout.html" class="theme-btn btn-style-two">Checkout</a>
                            </div>
                        </div> <!--end shopping-cart -->
                    </div>

                    <!-- Login/Register -->
                    <div class="login-box">
                        <span class="flaticon-user"></span>
                        <a href="login.html" class="call-modal">Login</a> or
                        <a href="register.html" class="call-modal">Register </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mobile Header -->
        <div class="mobile-header">
            <div class="logo"><a href="index.html"><img src="images/logo.png" alt="" title=""></a></div>

            <!--Nav Box-->
            <div class="nav-outer clearfix">

                <div class="outer-box">
                    <!-- Search Btn -->
                    <div class="search-box">
                        <button class="search-btn mobile-search-btn"><i class="flaticon-magnifying-glass"></i></button>
                    </div>

                    <!-- Cart btn -->
                    <div class="cart-btn">
                        <a href="shopping-cart.html"><i class="icon flaticon-shopping-bag"></i> <span class="count">2</span></a>
                    </div>

                    <!-- Login/Register -->
                    <div class="login-box">
                        <a href="login.html" class="call-modal"><span class="flaticon-user"></span></a>
                    </div>
                    <a href="#nav-mobile" class="mobile-nav-toggler navbar-trigger"><span class="fa fa-bars"></span></a>
                </div>
            </div>
        </div>

        <!-- Mobile Nav -->
        <div id="nav-mobile"></div>

        <!-- Header Search -->
        <div class="search-popup">
            <span class="search-back-drop"></span>

            <div class="search-inner">
                <button class="close-search"><span class="fa fa-times"></span></button>
                <form method="post" action="blog-showcase.html">
                    <div class="form-group">
                        <input type="search" name="search-field" value="" placeholder="Search..." required="">
                        <button type="submit"><i class="flaticon-magnifying-glass"></i></button>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Header Search -->

    </header>
    <!--End Main Header -->

    <!-- Listing Banner Two -->
    <section class="listing-banner-two" id="banner">
        <!-- Single Item Carousel -->
        <div class="single-item-carousel owl-carousel owl-theme">
            <div class="slide-item" style="background-image: url(images/background/6.jpg);"></div>
            <div class="slide-item" style="background-image: url(images/background/5.jpg);"></div>
            <div class="slide-item" style="background-image: url(images/background/4.jpg);"></div>
        </div>

        <div class="cotnent-outer">
            <div class="auto-container">
                <!-- Content Box -->
                <div class="content-box">
                    <figure class="image"><img src="images/resource/listing-icon-2.jpg" alt=""></figure>
                    <h3>Bear Hotel-Spa <span class="icon icon-verified"></span></h3>
                    <div class="text">Luxury hotel in the heart of Bloomsbury.</div>
                    <div class="rating">
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        <span class="title">(7 review)</span>
                    </div>
                </div>

                <!-- Listing Options -->
                <div class="listing-options-two">
                    <ul class="options-list">
                        <li><a href="#"><span class="icon flaticon-compass"></span> Get Directions</a></li>
                        <li><a href="#"><span class="icon flaticon-phone-call-1"></span> Call Now</a></li>
                        <li><a href="#"><span class="icon flaticon-unlink"></span> Website</a></li>
                        <li><button id="more-options"><span class="flaticon-more-button-interface-symbol-of-three-horizontal-aligned-dots"></span></button>
                            <ul class="option-box">
                                <li><a href="social-share.html" class="call-modal"><span class="icon flaticon-share"></span> Share </a></li>
                                <li><a href="#"><span class="icon flaticon-comment-1"></span> Write a review </a></li>
                                <li><a href="report-listing.html" class="call-modal"><span class="icon flaticon-flag"></span> Report </a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- End Listing Banner Two  -->

    <!-- Listing Nav -->
    <div class="listing-nav">
        <div class="auto-container">
            <div class="nav-inner">
                <ul class="navigation">
                    <li data-target="#banner" class="active"><span class="icon flaticon-house"></span> Home</li>
                    <li data-target="#description"><span class="icon flaticon-menu"></span> Description</li>
                    <li data-target="#features"><span class="icon flaticon-list"></span> Listing Features</li>
                    <li data-target="#gallery"><span class="icon flaticon-gallery"></span> Photos</li>
                    <li data-target="#video"><span class="icon flaticon-button"></span> Videos</li>
                    <li data-target="#review"><span class="icon flaticon-consulting-message"></span> Review</li>
                </ul>
                <div class="like-btn">
                    <a href="#"><span class="flaticon-heart"></span> Save</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Listing Nav -->

    <!-- Sidebar Page Container -->
    <div class="sidebar-page-container bg_alice">
        <div class="auto-container">
            <div class="row">
                <!--Content Side-->
                <div class="content-side col-lg-8 col-md-12 col-sm-12">
                    <!-- Listing Single -->
                    <div class="listing-single">
                        <!-- Description Widget -->
                        <div class="description-widget ls-widget" id="description">
                            <div class="widget-title"><h4><span class="icon flaticon-menu"></span> Description</h4></div>
                            <div class="widget-content">
                                <p>Searcys St Pancras' adored Champagne bar is famously the longest in Europe. Here, guests can enjoy panoramic views of the magnificent station. For those looking to enjoy a glass of something special, the menu showcases a variety of Champagne and sparkling wines from around the world, including nine options by the glass.</p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar. Donec a consectetur nulla. Nulla posuere sapien vitae lectus suscipit, et pulvinar nisi tincidunt. Aliquam erat volutpat. Curabitur convallis fringilla diam sed aliquam. Sed tempor iaculis massa faucibus feugiat. In fermentum facilisis massa, a consequat purus viverra purus viverra</p>
                            </div>
                        </div>

                        <!-- Features Widget -->
                        <div class="features-widget ls-widget" id="features">
                            <div class="widget-title"><h4><span class="icon flaticon-list"></span> Listing Features</h4></div>
                            <div class="widget-content">
                                <ul class="listing-features">
                                    <li><span class="icon flaticon-reservation"></span> Full Bar</li>
                                    <li><span class="icon flaticon-headphones"></span> Reservations</li>
                                    <li><span class="icon flaticon-armchair"></span> Seating</li>
                                    <li><span class="icon flaticon-beer"></span> Serves Alcohol</li>
                                    <li><span class="icon flaticon-parking"></span> Valet Parking</li>
                                    <li><span class="icon flaticon-service"></span> Waitstaff</li>
                                    <li><span class="icon flaticon-disability"></span> Wheelchair Accessible</li>
                                    <li><span class="icon flaticon-wifi"></span> Wifi</li>
                                </ul>
                            </div>
                        </div>

                        <!-- Gallery Widget -->
                        <div class="gallery-widget ls-widget" id="gallery">
                            <div class="widget-title"><h4><span class="icon flaticon-gallery"></span> Gallery</h4></div>
                            <div class="widget-content">
                                <ul class="listing-gallery">
                                    <!-- Gallery Item -->
                                    <li class="gallery-item">
                                        <div class="inner-box">
                                            <figure class="image"><img src="images/gallery/1-1.jpg" alt=""></figure>
                                            <div class="overlay"><a href="images/gallery/1-1.jpg" class="lightbox-image" data-fancybox="ls-gallery"><span class="icon flaticon-magnifying-glass"></span></a></div>
                                        </div>
                                    </li>

                                    <!-- Gallery Item -->
                                    <li class="gallery-item">
                                        <div class="inner-box">
                                            <figure class="image"><img src="images/gallery/1-2.jpg" alt=""></figure>
                                            <div class="overlay"><a href="images/gallery/1-2.jpg" class="lightbox-image" data-fancybox="ls-gallery"><span class="icon flaticon-magnifying-glass"></span></a></div>
                                        </div>
                                    </li>

                                    <!-- Gallery Item -->
                                    <li class="gallery-item">
                                        <div class="inner-box">
                                            <figure class="image"><img src="images/gallery/1-3.jpg" alt=""></figure>
                                            <div class="overlay"><a href="images/gallery/1-3.jpg" class="lightbox-image" data-fancybox="ls-gallery"><span class="icon flaticon-magnifying-glass"></span></a></div>
                                        </div>
                                    </li>

                                    <!-- Gallery Item -->
                                    <li class="gallery-item">
                                        <div class="inner-box">
                                            <figure class="image"><img src="images/gallery/1-4.jpg" alt=""></figure>
                                            <div class="overlay"><a href="images/gallery/1-4.jpg" class="lightbox-image" data-fancybox="ls-gallery"><span class="icon flaticon-magnifying-glass"></span></a></div>
                                        </div>
                                    </li>

                                    <!-- Gallery Item -->
                                    <li class="gallery-item">
                                        <div class="inner-box">
                                            <figure class="image"><img src="images/gallery/1-5.jpg" alt=""></figure>
                                            <div class="overlay"><a href="images/gallery/1-5.jpg" class="lightbox-image" data-fancybox="ls-gallery"><span class="icon flaticon-magnifying-glass"></span></a></div>
                                        </div>
                                    </li>

                                    <!-- Gallery Item -->
                                    <li class="gallery-item">
                                        <div class="inner-box">
                                            <figure class="image"><img src="images/gallery/1-6.jpg" alt=""></figure>
                                            <div class="overlay"><a href="images/gallery/1-6.jpg" class="lightbox-image" data-fancybox="ls-gallery"><span class="icon flaticon-magnifying-glass"></span></a></div>
                                        </div>
                                    </li>

                                    <!-- Gallery Item -->
                                    <li class="gallery-item">
                                        <div class="inner-box">
                                            <figure class="image"><img src="images/gallery/1-7.jpg" alt=""></figure>
                                            <div class="overlay"><a href="images/gallery/1-7.jpg" class="lightbox-image" data-fancybox="ls-gallery"><span class="icon flaticon-magnifying-glass"></span></a></div>
                                        </div>
                                    </li>

                                    <!-- Gallery Item -->
                                    <li class="gallery-item">
                                        <div class="inner-box">
                                            <figure class="image"><img src="images/gallery/1-8.jpg" alt=""></figure>
                                            <div class="overlay"><a href="images/gallery/1-8.jpg" class="lightbox-image" data-fancybox="ls-gallery"><span class="icon flaticon-magnifying-glass"></span></a></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Video Widget -->
                        <div class="video-widget ls-widget" id="video">
                            <div class="widget-title"><h4><span class="icon flaticon-list"></span> Video</h4></div>
                            <div class="widget-content">
                                <div class="video-box">
                                    <figure class="image"><img src="images/resource/video-img.jpg" alt=""></figure>
                                    <a href="https://www.youtube.com/watch?v=kxPCFljwJws" class="lightbox-image"><span class="icon flaticon-button"></span></a>
                                </div>
                            </div>
                        </div>

                        <!-- Average Reviews Widget -->
                        <div class="average-reviews-widget ls-widget" id="reviews">
                            <div class="widget-title"><h4><span class="icon flaticon-star-1"></span> Average Reviews</h4></div>
                            <div class="widget-content">
                                <div class="review-outer">
                                    <!-- Review Box -->
                                    <div class="review-box">
                                        <h1>4.7</h1>
                                        <span class="title">Out of 5.0</span>
                                        <ul class="rating">
                                            <li><span class="fa fa-star"></span></li>
                                            <li><span class="fa fa-star"></span></li>
                                            <li><span class="fa fa-star"></span></li>
                                            <li><span class="fa fa-star"></span></li>
                                            <li><span class="fa fa-star"></span></li>
                                        </ul>
                                    </div>

                                    <div class="rating-bars">
                                        <!-- Rating Bars -->
                                        <div class="rating-bars-item">
                                            <span class="rating-bars-name">Quality</span>
                                            <span class="rating-bars-inner">
                                                <span class="rating-bars-rating" data-rating="4.8">
                                                    <span class="rating-bars-rating-inner"></span>
                                                </span>
                                                <strong>4.8</strong>
                                            </span>
                                        </div>

                                        <!-- Rating Bars -->
                                        <div class="rating-bars-item">
                                            <span class="rating-bars-name">Location</span>
                                            <span class="rating-bars-inner">
                                                <span class="rating-bars-rating" data-rating="1.4">
                                                    <span class="rating-bars-rating-inner"></span>
                                                </span>
                                                <strong>1.4</strong>
                                            </span>
                                        </div>

                                        <!-- Rating Bars -->
                                        <div class="rating-bars-item">
                                            <span class="rating-bars-name">Space</span>
                                            <span class="rating-bars-inner">
                                                <span class="rating-bars-rating" data-rating="3.2">
                                                    <span class="rating-bars-rating-inner"></span>
                                                </span>
                                                <strong>3.2</strong>
                                            </span>
                                        </div>

                                        <!-- Rating Bars -->
                                        <div class="rating-bars-item">
                                            <span class="rating-bars-name">Service</span>
                                            <span class="rating-bars-inner">
                                                <span class="rating-bars-rating" data-rating="5.0">
                                                    <span class="rating-bars-rating-inner"></span>
                                                </span>
                                                <strong>5.0</strong>
                                            </span>
                                        </div>

                                        <!-- Rating Bars -->
                                        <div class="rating-bars-item">
                                            <span class="rating-bars-name">Price</span>
                                            <span class="rating-bars-inner">
                                                <span class="rating-bars-rating" data-rating="4.8">
                                                    <span class="rating-bars-rating-inner"></span>
                                                </span>
                                                <strong>4.8</strong>
                                            </span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Comments Widget -->
                        <div class="comments-widget ls-widget" id="comments">
                            <div class="widget-title"><h4><span class="icon flaticon-consulting-message"></span> 7 Reviews For Bear Restaurant</h4></div>
                            <div class="widget-content">
                                <!-- Comment Box -->
                                <div class="comment-box">
                                    <!-- Comment -->
                                    <div class="comment">
                                        <div class="user-thumb"><img src="images/resource/avatar-1.jpg" alt=""></div>
                                        <div class="user-name">Adam Gilchrist</div>
                                        <div class="comment-info">
                                            <ul class="rating">
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                            </ul>
                                            <div class="comment-time">April 25, 2019 at 10:46 am</div>
                                        </div>
                                        <span class="title">Really cool and surprisingly affordable</span>
                                        <div class="text">Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus </div>
                                        <ul class="review-images">
                                            <li class="image"><a href="images/resource/review-img-1.jpg" class="lightbox-image" data-fancybox="reivews"><img src="images/resource/review-img-1.jpg" alt=""></a></li>

                                            <li class="image"><a href="images/resource/review-img-2.jpg" class="lightbox-image" data-fancybox="reivews"><img src="images/resource/review-img-2.jpg" alt=""></a></li>

                                            <li class="image"><a href="images/resource/review-img-3.jpg" class="lightbox-image" data-fancybox="reivews"><img src="images/resource/review-img-3.jpg" alt=""></a></li>

                                            <li class="image"><a href="images/resource/review-img-4.jpg" class="lightbox-image" data-fancybox="reivews"><img src="images/resource/review-img-4.jpg" alt=""></a></li>
                                        </ul>

                                        <div class="rate-reveiw">
                                            <div class="text">Was This Review...?</div>
                                            <ul class="options">
                                                <li><a href="#" class="like"><span class="icon flaticon-like"></span> Like</a></li>
                                                <li><a href="#" class="dislike"><span class="icon flaticon-dislike"></span> Dislike</a></li>
                                                <li><a href="#" class="love"><span class="icon flaticon-heart"></span> Love</a></li>
                                            </ul>
                                        </div>
                                        <div class="reply"><a href="#" class="reply-btn"><span class="icon flaticon-left"></span> Reply</a></div>
                                    </div>

                                    <!-- Comment -->
                                    <div class="comment reply-comment">
                                        <div class="user-thumb"><img src="images/resource/avatar-2.jpg" alt=""></div>
                                        <div class="user-name">Simon</div>
                                        <div class="comment-info">
                                            <ul class="rating">
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                            </ul>
                                            <div class="comment-time">April 25, 2019 at 10:46 am</div>
                                        </div>
                                        <span class="title">Really cool and surprisingly affordable</span>
                                        <div class="text">Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus </div>
                                    </div>
                                </div>

                                <!-- Comment Box -->
                                <div class="comment-box">
                                    <!-- Comment -->
                                    <div class="comment">
                                        <div class="user-thumb"><img src="images/resource/avatar-3.jpg" alt=""></div>
                                        <div class="user-name">Adam Gilchrist</div>
                                        <div class="comment-info">
                                            <ul class="rating">
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                                <li><span class="fa fa-star"></span></li>
                                            </ul>
                                            <div class="comment-time">April 25, 2019 at 10:46 am</div>
                                        </div>
                                        <span class="title">Really cool and surprisingly affordable</span>
                                        <div class="text">Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus </div>
                                        <div class="rate-reveiw">
                                            <div class="text">Was This Review...?</div>
                                            <ul class="options">
                                                <li><a href="#" class="like"><span class="icon flaticon-like"></span> Like</a></li>
                                                <li><a href="#" class="dislike"><span class="icon flaticon-dislike"></span> Dislike</a></li>
                                                <li><a href="#" class="love"><span class="icon flaticon-heart"></span> Love</a></li>
                                            </ul>
                                        </div>
                                        <div class="reply"><a href="#" class="reply-btn"><span class="icon flaticon-left"></span> Reply</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Comments Form Widget -->
                        <div class="comments-form-widget ls-widget" id="review">
                            <div class="widget-title"><h4><span class="icon flaticon-consulting-message"></span> Add a Review</h4></div>
                            <div class="widget-content">
                                <!-- Subratings Container -->
                                <div class="sub-ratings-container">
                                    <!-- Subrating #1 -->
                                    <div class="add-sub-rating">
                                        <div class="sub-rating-title">Quality</div>
                                        <div class="sub-rating-stars">
                                            <!-- Leave Rating -->
                                            <form class="leave-rating">
                                                <input type="radio" name="rating" id="rating-1" value="1"/>
                                                <label for="rating-1" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-2" value="2"/>
                                                <label for="rating-2" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-3" value="3"/>
                                                <label for="rating-3" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-4" value="4"/>
                                                <label for="rating-4" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-5" value="5"/>
                                                <label for="rating-5" class="fa fa-star"></label>
                                            </form>
                                        </div>
                                    </div>

                                    <!-- Subrating #2 -->
                                    <div class="add-sub-rating">
                                        <div class="sub-rating-title">Location</div>
                                        <div class="sub-rating-stars">
                                            <!-- Leave Rating -->
                                            <div class="clearfix"></div>
                                            <form class="leave-rating">
                                                <input type="radio" name="rating" id="rating-11" value="1"/>
                                                <label for="rating-11" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-12" value="2"/>
                                                <label for="rating-12" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-13" value="3"/>
                                                <label for="rating-13" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-14" value="4"/>
                                                <label for="rating-14" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-15" value="5"/>
                                                <label for="rating-15" class="fa fa-star"></label>
                                            </form>
                                        </div>
                                    </div>

                                    <!-- Subrating #3 -->
                                    <div class="add-sub-rating">
                                        <div class="sub-rating-title">Price</div>
                                        <div class="sub-rating-stars">
                                            <!-- Leave Rating -->
                                            <div class="clearfix"></div>
                                            <form class="leave-rating">
                                                <input type="radio" name="rating" id="rating-21" value="1"/>
                                                <label for="rating-21" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-22" value="2"/>
                                                <label for="rating-22" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-23" value="3"/>
                                                <label for="rating-23" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-24" value="4"/>
                                                <label for="rating-24" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-25" value="5"/>
                                                <label for="rating-25" class="fa fa-star"></label>
                                            </form>
                                        </div>
                                    </div>

                                    <!-- Subrating #4 -->
                                    <div class="add-sub-rating">
                                        <div class="sub-rating-title">Space</div>
                                        <div class="sub-rating-stars">
                                            <!-- Leave Rating -->
                                            <div class="clearfix"></div>
                                            <form class="leave-rating">
                                                <input type="radio" name="rating" id="rating-31" value="1"/>
                                                <label for="rating-31" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-32" value="2"/>
                                                <label for="rating-32" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-33" value="3"/>
                                                <label for="rating-33" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-34" value="4"/>
                                                <label for="rating-34" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-35" value="5"/>
                                                <label for="rating-35" class="fa fa-star"></label>
                                            </form>
                                        </div>
                                    </div>

                                    <!-- Subrating #4 -->
                                    <div class="add-sub-rating">
                                        <div class="sub-rating-title">Service</div>
                                        <div class="sub-rating-stars">
                                            <!-- Leave Rating -->
                                            <div class="clearfix"></div>
                                            <form class="leave-rating">
                                                <input type="radio" name="rating" id="rating-36" value="1"/>
                                                <label for="rating-36" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-37" value="2"/>
                                                <label for="rating-37" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-38" value="3"/>
                                                <label for="rating-38" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-39" value="4"/>
                                                <label for="rating-39" class="fa fa-star"></label>
                                                <input type="radio" name="rating" id="rating-40" value="5"/>
                                                <label for="rating-40" class="fa fa-star"></label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- Subratings Container / End -->

                                <div class="uploading-outer">
                                    <div class="uploadButton">
                                        <input class="uploadButton-input" type="file"  name="attachments[]" accept="image/*, application/pdf" id="upload" multiple/>
                                        <label class="uploadButton-button ripple-effect" for="upload">Add Photos</label>
                                        <span class="uploadButton-file-name"></span>
                                    </div>
                                </div>

                                <!-- Comment Form -->
                                <div class="comment-form default-form">
                                    <!--Comment Form-->
                                    <form>
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <input type="text" name="username" placeholder="Name" required>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <input type="email" name="email" placeholder="Email" required>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <textarea class="darma" name="message" placeholder="Write Comment"></textarea>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <button class="theme-btn btn-style-two" type="submit" name="submit-form">Submit Review</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!--End Comment Form -->
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Side -->
                <div class="sidebar-side col-lg-4 col-md-12 col-sm-12">
                    <aside class="sidebar">
                        <!-- Timing Widget -->
                        <div class="timing-widget ls-widget">
                            <div class="widget-title">
                                <h4><span class="icon flaticon-menu"></span>Opening Hours</h4>
                                <span class="status">Open Now</span>
                            </div>
                            <div class="widget-content">
                                <ul class="timing-list">
                                    <li><span>Monday</span> <span>12:00 - 00:00</span></li>
                                    <li><span>Tuesday</span> <span>12:00 - 00:00</span></li>
                                    <li><span>Wednesday</span> <span>12:00 - 00:00</span></li>
                                    <li class="active"><span>Thursday</span> <span>12:00 - 00:00</span></li>
                                    <li><span>Friday</span> <span>12:00 - 00:00</span></li>
                                    <li><span>Saturday</span> <span>12:00 - 00:00</span></li>
                                    <li><span>Sunday</span> <span>12:00 - 00:00</span></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Business Info Widget -->
                        <div class="business-info-widget ls-widget">
                            <div class="widget-title">
                                <h4><span class="icon flaticon-menu"></span>Business Info</h4>
                            </div>
                            <div class="widget-content">
                                <div class="map-box">
                                    <div class="map-canvas"
                                         data-zoom="12"
                                         data-lat="-37.817085"
                                         data-lng="144.955631"
                                         data-type="roadmap"
                                         data-hue="#ffc400"
                                         data-title="Envato"
                                         data-icon-path="images/icons/map-marker.png"
                                         data-content="Melbourne VIC 3000, Australia<br><a href='mailto:info@youremail.com'>info@youremail.com</a>">
                                    </div>
                                </div>

                                <ul class="contact-info-list">
                                    <li><span class="icon flaticon-pin"></span> 484 Ellis St, San Francisco, CA 94102,<br> United States</li>
                                    <li><span class="icon flaticon-call"></span> <a href="tel:61282369200">+61 2 8236 9200 </a></li>
                                    <li><span class="icon flaticon-mail"></span> <a href="mailto:support@listdo.com">support@listdo.com </a></li>
                                    <li><span class="icon flaticon-unlink"></span> <a href="www.listdo.com">www.listdo.com</a></li>
                                </ul>

                                <ul class="social-icon-two">
                                    <li><a href="#"><span class="fab fa-facebook"></span></a></li>
                                    <li><a href="#"><span class="fab fa-twitter"></span></a></li>
                                    <li><a href="#"><span class="fab fa-instagram"></span></a></li>
                                    <li><a href="#"><span class="fab fa-pinterest"></span></a></li>
                                    <li><a href="#"><span class="fab fa-dribbble"></span></a></li>
                                    <li><a href="#"><span class="fab fa-google"></span></a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Price Range Widget -->
                        <div class="price-range-widget ls-widget">
                            <div class="widget-title">
                                <h4><span class="icon flaticon-menu"></span>Price Range</h4>
                            </div>
                            <div class="widget-content">
                                <div class="range-slider-one clearfix">
                                    <div class="price-range-slider"></div>
                                    <div class="btn-outer">
                                        <div class="input-box">
                                            <div class="title">Price:</div>
                                            <div class="input"><input type="text" class="property-amount" name="field-name" readonly></div>
                                        </div>
                                        <div class="btn-box">
                                            <a href="#" class="theme-btn btn-style-two">Filtter</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Categories Widget -->
                        <div class="categories-widget ls-widget">
                            <div class="widget-title"><h4><span class="icon flaticon-menu"></span>Categories</h4></div>
                            <div class="widget-content">
                                <ul class="categories-list">
                                    <li class="rest"><a href="#"><span class="icon flaticon-chef"></span> restaurant</a></li>
                                    <li class="art"><a href="#"><span class="icon flaticon-museum-1"></span> Art & History</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Statistic Widget -->
                        <div class="statistic-widget ls-widget">
                            <div class="widget-title"><h4><span class="icon flaticon-menu"></span>Categories</h4></div>
                            <div class="widget-content">
                                <ul class="statistic-list">
                                    <li><span class="icon flaticon-view"></span> 8490 Views </li>
                                    <li><span class="icon flaticon-star"></span> 22 Ratings </li>
                                    <li><span class="icon flaticon-heart"></span> 152 Favorites </li>
                                    <li><span class="icon flaticon-share"></span> 50 Shares </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Contact Widget -->
                        <div class="contact-widget ls-widget">
                            <div class="widget-title"><h4><span class="icon flaticon-phone-call-1"></span>Contact business</h4></div>
                            <div class="widget-content">
                                <!-- Comment Form -->
                                <div class="default-form">
                                    <!--Comment Form-->
                                    <form>
                                        <div class="row clearfix">
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <input type="text" name="username" placeholder="Name" required>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <input type="email" name="email" placeholder="Your Email Address" required>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <textarea class="darma" name="message" placeholder="Write Comment"></textarea>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <button class="theme-btn btn-style-two" type="submit" name="submit-form">Submit Review</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Nearby Widget -->
                        <div class="nearby-widget ls-widget">
                            <div class="widget-title"><h4><span class="icon flaticon-map"></span> Nearby Restaurant</h4></div>
                            <div class="widget-content">
                                <!-- Listing Block Six -->
                                <div class="listing-block-six">
                                    <div class="inner-box">
                                        <div class="image-box">
                                            <figure class="image"><a href="listing-single.html"><img src="images/resource/listing/3-1.jpg" alt=""></a></figure>
                                        </div>
                                        <div class="content">
                                            <h3><a href="listing-single.html">Best Museum <span class="icon icon-verified"></span> </a></h3>
                                            <ul class="info">
                                                <li><span class="flaticon-pin"></span> Santa Monica, CA</li>
                                            </ul>
                                            <div class="rating">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="title">(7 review)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Listing Block Six -->
                                <div class="listing-block-six">
                                    <div class="inner-box">
                                        <div class="image-box">
                                            <figure class="image"><a href="listing-single.html"><img src="images/resource/listing/3-2.jpg" alt=""></a></figure>
                                        </div>
                                        <div class="content">
                                            <h3><a href="listing-single.html">Private Hotel-Spa <span class="icon icon-verified"></span> </a></h3>
                                            <ul class="info">
                                                <li><span class="flaticon-pin"></span> Santa Monica, CA</li>
                                            </ul>
                                            <div class="rating">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="title">(7 review)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Listing Block Six -->
                                <div class="listing-block-six">
                                    <div class="inner-box">
                                        <div class="image-box">
                                            <figure class="image"><a href="listing-single.html"><img src="images/resource/listing/3-3.jpg" alt=""></a></figure>
                                        </div>
                                        <div class="content">
                                            <h3><a href="listing-single.html">Moonlight Restourant <span class="icon icon-verified"></span> </a></h3>
                                            <ul class="info">
                                                <li><span class="flaticon-pin"></span> Santa Monica, CA</li>
                                            </ul>
                                            <div class="rating">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="title">(7 review)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Author Widget -->
                        <div class="author-widget ls-widget">
                            <div class="widget-title"><h4><span class="icon flaticon-user-1"></span> Author</h4></div>
                            <div class="widget-content">
                                <div class="author-box">
                                    <figure class="image"><img src="images/resource/author.jpg" alt=""></figure>
                                    <h4 class="name">Ali TUFAN</h4>
                                    <span class="info">Member since November 2019</span>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
                <!-- End Sidebar Side -->
            </div>
        </div>
    </div>
    <!--End Sidebar Page Container -->


    <!-- Main Footer -->
    <footer class="main-footer style-two">
        <!-- Footer Upper -->
        <div class="footer-upper">
            <ul class="footer-nav">
                <li><a href="#">Home</a></li>
                <li><a href="#">Listings</a></li>
                <li><a href="#">Shop</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Pages</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>

        <!-- Footer Content -->
        <div class="footer-content">
            <div class="auto-container">
                <ul class="social-icon-two">
                    <li><a href="#"><span class="fab fa-facebook"></span></a></li>
                    <li><a href="#"><span class="fab fa-twitter"></span></a></li>
                    <li><a href="#"><span class="fab fa-instagram"></span></a></li>
                    <li><a href="#"><span class="fab fa-pinterest"></span></a></li>
                    <li><a href="#"><span class="fab fa-dribbble"></span></a></li>
                    <li><a href="#"><span class="fab fa-google"></span></a></li>
                </ul>

                <ul class="copyright-text">
                    <li>Copyright © 2019 Listdo</li>
                    <li>New York, NY</li>
                    <li><a href="#">+61 2 8236 9200</a></li>
                </ul>
            </div>
        </div>

        <!-- Footer Bottom -->
        <div class="footer-bottom">
            <div class="text">Proudly Listdo by CreativeLayers</div>
        </div>

        <!-- Scroll To Top -->
        <div class="scroll-to-top scroll-to-target" data-target="html"><span class="flaticon-up"></span></div>
    </footer>
    <!-- End Footer -->
</div><!-- End Page Wrapper -->

<script src="../locationTheme/js/jquery.js"></script>
<script src="../locationTheme/js/popper.min.js"></script>
<script src="../locationTheme/js/chosen.min.js"></script>
<script src="../locationTheme/js/bootstrap.min.js"></script>
<script src="../locationTheme/js/jquery-ui.min.js"></script>
<script src="../locationTheme/js/jquery.fancybox.js"></script>
<script src="../locationTheme/js/jquery.modal.min.js"></script>
<script src="../locationTheme/js/jquery.hideseek.min.js"></script>
<script src="../locationTheme/js/mmenu.polyfills.js"></script>
<script src="../locationTheme/js/mmenu.js"></script>
<script src="../locationTheme/js/appear.js"></script>
<script src="../locationTheme/js/owl.js"></script>
<script src="../locationTheme/js/wow.js"></script>
<script src="../locationTheme/js/script.js"></script>
<!--Google Map APi Key-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2uu6KHbLc_y7fyAVA4dpqSVM4w9ZnnUw"></script>
<script src="../locationTheme/js/map-script.js"></script>
<!--End Google Map APi-->





<jsp:include page="../../layout/footer.jsp"/>

</body>
</html>
