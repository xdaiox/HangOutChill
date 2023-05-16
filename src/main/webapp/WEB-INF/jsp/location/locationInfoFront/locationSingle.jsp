<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/4/23
  Time: 下午 02:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <jsp:include page="../../layout/navbar.jsp"/>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <meta charset="UTF-8">
    <title>該地點名稱</title>

    <style>
        figure {
            width: 300px;
            height: 200px;
            overflow: hidden;
            background-color: #000;
            float: left;
            display: inline-block;
            margin-bottom: 30px;
            margin-right: 30px;
        }

        figure img {
            width: 100%;
        }

    </style>


</head>

<body>

<!--================Blog Area =================-->
<section class="blog_area area-padding">
    <div class="container">
        <div class="row justify-content-center">


            <!--================左區 開始 =================-->
            <div class="col-lg-6 mb-5 mb-lg-0">
                <div class="blog_left_sidebar">


                    <!--================左1 =================-->
                    <article class="blog_item" style="background-color: white ; height:250px">
                        <div class="blog_details" >

                            <figure style="height:180px">
                                <img width="300" height="100%" src="${contextRoot}/img/HangOutChill.png" />
                            </figure>

                            <a class="d-inline-block" href="single-blog.html">
                                <h2>這裡放地點名稱</h2>
                            </a>

                        </div>
                    </article>


                    <!--================左2 =================-->
                    <article class="blog_item" style="background-color: white" >


                        <div class="blog_details">
                            <a class="d-inline-block" href="single-blog.html">
                                <h2>Google inks pact for new 35-storey office</h2>
                            </a>
                            <p>That dominion stars lights dominion divide years for fourth have don't stars is that he earth it first without heaven in place seed it second morning saying.</p>
                            <ul class="blog-info-link">
                                <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                            </ul>
                        </div>
                    </article>


                    <!--================左3 =================-->
                    <article class="blog_item" style="background-color: white" >


                        <div class="blog_details">
                            <a class="d-inline-block" href="single-blog.html">
                                <h2>Google inks pact for new 35-storey office</h2>
                            </a>
                            <p>That dominion stars lights dominion divide years for fourth have don't stars is that he earth it first without heaven in place seed it second morning saying.</p>
                            <ul class="blog-info-link">
                                <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                            </ul>
                        </div>
                    </article>

                    <!--================左4 =================-->
                    <article class="blog_item" style="background-color: white" >


                        <div class="blog_details">
                            <a class="d-inline-block" href="single-blog.html">
                                <h2>Google inks pact for new 35-storey office</h2>
                            </a>
                            <p>That dominion stars lights dominion divide years for fourth have don't stars is that he earth it first without heaven in place seed it second morning saying.</p>
                            <ul class="blog-info-link">
                                <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                            </ul>
                        </div>
                    </article>



                </div>
            </div>
            <!--================左區 結束 =================-->



            <!--================右區 開始 =================-->
            <div class="col-lg-3">
                <div class="blog_right_sidebar">



                    <!--================右1 =================-->
                    <aside class="single_sidebar_widget search_widget">
                        <form action="#">
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="Search Keyword">
                                    <div class="input-group-append">
                                        <button class="btn" type="button"><i class="ti-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <button class="button rounded-0 primary-bg text-white w-100" type="submit">Search</button>
                        </form>
                    </aside>


                    <!--================右2 =================-->
                    <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">Category</h4>
                        <ul class="list cat-list">
                            <li>
                                <a href="#" class="d-flex">
                                    <p>Resaurant food</p>
                                    <p>(37)</p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="d-flex">
                                    <p>Travel news</p>
                                    <p>(10)</p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="d-flex">
                                    <p>Modern technology</p>
                                    <p>(03)</p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="d-flex">
                                    <p>Product</p>
                                    <p>(11)</p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="d-flex">
                                    <p>Inspiration</p>
                                    <p>21</p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="d-flex">
                                    <p>Health Care (21)</p>
                                    <p>09</p>
                                </a>
                            </li>
                        </ul>
                    </aside>











                </div>
            </div>
            <!--================右區 結束 =================-->






        </div>
    </div>
</section>
<!--================Blog Area =================-->








<%--<div class="container">--%>

    <!--================Blog Area =================-->
<%--    <section class="blog_area area-padding">--%>
<%--        <div class="container">--%>
<%--            <div class="row justify-content-center">--%>


<%--                <!--================右側區1 =================-->--%>
<%--                <div class="col-lg-8 mb-5 mb-lg-0">--%>
<%--                    <div class="blog_left_sidebar" id="searchResult-list">--%>

<%--                        <article class="blog_item">--%>
<%--                            <div class="blog_details" style="background-color: white">--%>
<%--                                <figure style="height:178px">--%>
<%--                                    <img width="300" height="100%" src="${contextRoot}/img/HangOutChill.png"/>--%>
<%--                                </figure>--%>
<%--                                <div>--%>
<%--                                    <a class="d-inline-block" href="single-blog.html">--%>
<%--                                        <h2>這裡放地點名稱</h2>--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <div>--%>
<%--                                        <h4 style="display: inline; margin-right: 20px;">這裡放分類</h4>--%>
<%--                                        <h4 style="display: inline;">$ $ $</h4>--%>
<%--                                        <br>--%>
<%--                                        <h5 style="display: inline; margin-right: 20px;">台南市</h5>--%>
<%--                                        <h5 style="display: inline;">永康區</h5>--%>
<%--                                    </div>--%>
<%--                                    <div>--%>
<%--                                        <p class="mb-0">位於信義安和的「The Public House」，外觀為傳統的英式PUB風格，而PUB也就是Public--%>
<%--                                            House的縮寫，就像是「The Public--%>
<%--                                            House」給人的感覺一樣，比起傳統的專業、沉靜的酒吧，這裡的整體風格更貼近日常生活，有時會出現英式小酒館鬧哄哄的氣氛，美味的餐點加上各種專業性十足的調酒，打造出一個輕鬆的氛圍！</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </article>--%>


<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--================右側區1 =================-->--%>


<%--                <!--================左側區1 =================-->--%>
<%--                <div class="col-lg-3">--%>
<%--                    <div class="blog_right_sidebar">--%>
<%--                        <aside class="single_sidebar_widget search_widget">--%>
<%--                            <h2>篩選</h2>--%>
<%--                            <form id="searchForm" action="#">--%>
<%--                                <div class="form-group">--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="name" name="name" class="form-control"--%>
<%--                                               placeholder="輸入地點名稱"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="category" name="category" class="form-control">--%>
<%--                                            <option value="" label="請選擇分類..."></option>--%>
<%--                                            <option value="酒吧" label="酒吧"></option>--%>
<%--                                            <option value="燒烤" label="燒烤"></option>--%>
<%--                                            <option value="咖啡廳" label="咖啡廳"></option>--%>
<%--                                            <option value="餐館" label="餐館"></option>--%>
<%--                                            <option value="宵夜" label="宵夜"></option>--%>
<%--                                            <option value="未分類" label="未分類"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="price" name="price" class="form-control">--%>
<%--                                            <option value="" label="請選擇消費水準..."></option>--%>
<%--                                            <option value="$" label="$"></option>--%>
<%--                                            <option value="$ $" label="$ $"></option>--%>
<%--                                            <option value="$ $ $" label="$ $ $"></option>--%>
<%--                                            <option value="$ $ $ $" label="$ $ $ $"></option>--%>
<%--                                            <option value="$ $ $ $ $" label="$ $ $ $ $"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="city" name="city" class="form-control"--%>
<%--                                               placeholder="輸入地點城市"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="dist" name="dist" class="form-control"--%>
<%--                                               placeholder="輸入地點區域"/>--%>
<%--                                    </div>--%>
<%--                                    &lt;%&ndash;<input type="button" id="submitBtnSearch" class="button rounded-0 primary-bg text-white w-100" value="查詢" onclick="search()"/>&ndash;%&gt;--%>
<%--                                    <div>--%>
<%--                                        <input type="button" id="submitBtnSearch"--%>
<%--                                               class="button rounded-0 primary-bg text-white w-100"--%>
<%--                                               onclick="search()" value="Search"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </aside>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--================左側區1=================-->--%>


<%--                <!--================右側區1 =================-->--%>
<%--                <div class="col-lg-8 mb-5 mb-lg-0">--%>
<%--                    <div class="blog_left_sidebar" id="searchResult-list">--%>

<%--                        <article class="blog_item">--%>
<%--                            <div class="blog_details" style="background-color: white">--%>
<%--                                <figure style="height:178px">--%>
<%--                                    <img width="300" height="100%" src="${contextRoot}/img/HangOutChill.png"/>--%>
<%--                                </figure>--%>
<%--                                <div>--%>
<%--                                    <a class="d-inline-block" href="single-blog.html">--%>
<%--                                        <h2>這裡放地點名稱</h2>--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <div>--%>
<%--                                        <h4 style="display: inline; margin-right: 20px;">這裡放分類</h4>--%>
<%--                                        <h4 style="display: inline;">$ $ $</h4>--%>
<%--                                        <br>--%>
<%--                                        <h5 style="display: inline; margin-right: 20px;">台南市</h5>--%>
<%--                                        <h5 style="display: inline;">永康區</h5>--%>
<%--                                    </div>--%>
<%--                                    <div>--%>
<%--                                        <p class="mb-0">位於信義安和的「The Public House」，外觀為傳統的英式PUB風格，而PUB也就是Public--%>
<%--                                            House的縮寫，就像是「The Public--%>
<%--                                            House」給人的感覺一樣，比起傳統的專業、沉靜的酒吧，這裡的整體風格更貼近日常生活，有時會出現英式小酒館鬧哄哄的氣氛，美味的餐點加上各種專業性十足的調酒，打造出一個輕鬆的氛圍！</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </article>--%>


<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--================右側區1 =================-->--%>

<%--                <!--================左側區1 =================-->--%>
<%--                <div class="col-lg-3">--%>
<%--                    <div class="blog_right_sidebar">--%>
<%--                        <aside class="single_sidebar_widget search_widget">--%>
<%--                            <h2>篩選</h2>--%>
<%--                            <form id="searchForm" action="#">--%>
<%--                                <div class="form-group">--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="name" name="name" class="form-control"--%>
<%--                                               placeholder="輸入地點名稱"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="category" name="category" class="form-control">--%>
<%--                                            <option value="" label="請選擇分類..."></option>--%>
<%--                                            <option value="酒吧" label="酒吧"></option>--%>
<%--                                            <option value="燒烤" label="燒烤"></option>--%>
<%--                                            <option value="咖啡廳" label="咖啡廳"></option>--%>
<%--                                            <option value="餐館" label="餐館"></option>--%>
<%--                                            <option value="宵夜" label="宵夜"></option>--%>
<%--                                            <option value="未分類" label="未分類"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="price" name="price" class="form-control">--%>
<%--                                            <option value="" label="請選擇消費水準..."></option>--%>
<%--                                            <option value="$" label="$"></option>--%>
<%--                                            <option value="$ $" label="$ $"></option>--%>
<%--                                            <option value="$ $ $" label="$ $ $"></option>--%>
<%--                                            <option value="$ $ $ $" label="$ $ $ $"></option>--%>
<%--                                            <option value="$ $ $ $ $" label="$ $ $ $ $"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="city" name="city" class="form-control"--%>
<%--                                               placeholder="輸入地點城市"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="dist" name="dist" class="form-control"--%>
<%--                                               placeholder="輸入地點區域"/>--%>
<%--                                    </div>--%>
<%--                                    &lt;%&ndash;<input type="button" id="submitBtnSearch" class="button rounded-0 primary-bg text-white w-100" value="查詢" onclick="search()"/>&ndash;%&gt;--%>
<%--                                    <div>--%>
<%--                                        <input type="button" id="submitBtnSearch"--%>
<%--                                               class="button rounded-0 primary-bg text-white w-100"--%>
<%--                                               onclick="search()" value="Search"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </aside>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--================左側區1=================-->--%>


<%--                <!--================右側區1 =================-->--%>
<%--                <div class="col-lg-8 mb-5 mb-lg-0">--%>
<%--                    <div class="blog_left_sidebar" id="searchResult-list">--%>

<%--                        <article class="blog_item">--%>
<%--                            <div class="blog_details" style="background-color: white">--%>
<%--                                <figure style="height:178px">--%>
<%--                                    <img width="300" height="100%" src="${contextRoot}/img/HangOutChill.png"/>--%>
<%--                                </figure>--%>
<%--                                <div>--%>
<%--                                    <a class="d-inline-block" href="single-blog.html">--%>
<%--                                        <h2>這裡放地點名稱</h2>--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <div>--%>
<%--                                        <h4 style="display: inline; margin-right: 20px;">這裡放分類</h4>--%>
<%--                                        <h4 style="display: inline;">$ $ $</h4>--%>
<%--                                        <br>--%>
<%--                                        <h5 style="display: inline; margin-right: 20px;">台南市</h5>--%>
<%--                                        <h5 style="display: inline;">永康區</h5>--%>
<%--                                    </div>--%>
<%--                                    <div>--%>
<%--                                        <p class="mb-0">位於信義安和的「The Public House」，外觀為傳統的英式PUB風格，而PUB也就是Public--%>
<%--                                            House的縮寫，就像是「The Public--%>
<%--                                            House」給人的感覺一樣，比起傳統的專業、沉靜的酒吧，這裡的整體風格更貼近日常生活，有時會出現英式小酒館鬧哄哄的氣氛，美味的餐點加上各種專業性十足的調酒，打造出一個輕鬆的氛圍！</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </article>--%>


<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--================右側區1 =================-->--%>

<%--                <!--================左側區1 =================-->--%>
<%--                <div class="col-lg-3">--%>
<%--                    <div class="blog_right_sidebar">--%>
<%--                        <aside class="single_sidebar_widget search_widget">--%>
<%--                            <h2>篩選</h2>--%>
<%--                            <form id="searchForm" action="#">--%>
<%--                                <div class="form-group">--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="name" name="name" class="form-control"--%>
<%--                                               placeholder="輸入地點名稱"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="category" name="category" class="form-control">--%>
<%--                                            <option value="" label="請選擇分類..."></option>--%>
<%--                                            <option value="酒吧" label="酒吧"></option>--%>
<%--                                            <option value="燒烤" label="燒烤"></option>--%>
<%--                                            <option value="咖啡廳" label="咖啡廳"></option>--%>
<%--                                            <option value="餐館" label="餐館"></option>--%>
<%--                                            <option value="宵夜" label="宵夜"></option>--%>
<%--                                            <option value="未分類" label="未分類"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="price" name="price" class="form-control">--%>
<%--                                            <option value="" label="請選擇消費水準..."></option>--%>
<%--                                            <option value="$" label="$"></option>--%>
<%--                                            <option value="$ $" label="$ $"></option>--%>
<%--                                            <option value="$ $ $" label="$ $ $"></option>--%>
<%--                                            <option value="$ $ $ $" label="$ $ $ $"></option>--%>
<%--                                            <option value="$ $ $ $ $" label="$ $ $ $ $"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="city" name="city" class="form-control"--%>
<%--                                               placeholder="輸入地點城市"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="dist" name="dist" class="form-control"--%>
<%--                                               placeholder="輸入地點區域"/>--%>
<%--                                    </div>--%>
<%--                                    &lt;%&ndash;<input type="button" id="submitBtnSearch" class="button rounded-0 primary-bg text-white w-100" value="查詢" onclick="search()"/>&ndash;%&gt;--%>
<%--                                    <div>--%>
<%--                                        <input type="button" id="submitBtnSearch"--%>
<%--                                               class="button rounded-0 primary-bg text-white w-100"--%>
<%--                                               onclick="search()" value="Search"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </aside>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--================左側區1=================-->--%>


<%--                <!--================左側區1 =================-->--%>
<%--                <div class="col-lg-3">--%>
<%--                    <div class="blog_right_sidebar">--%>
<%--                        <aside class="single_sidebar_widget search_widget">--%>
<%--                            <h2>篩選</h2>--%>
<%--                            <form id="searchForm" action="#">--%>
<%--                                <div class="form-group">--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="name" name="name" class="form-control"--%>
<%--                                               placeholder="輸入地點名稱"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="category" name="category" class="form-control">--%>
<%--                                            <option value="" label="請選擇分類..."></option>--%>
<%--                                            <option value="酒吧" label="酒吧"></option>--%>
<%--                                            <option value="燒烤" label="燒烤"></option>--%>
<%--                                            <option value="咖啡廳" label="咖啡廳"></option>--%>
<%--                                            <option value="餐館" label="餐館"></option>--%>
<%--                                            <option value="宵夜" label="宵夜"></option>--%>
<%--                                            <option value="未分類" label="未分類"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="price" name="price" class="form-control">--%>
<%--                                            <option value="" label="請選擇消費水準..."></option>--%>
<%--                                            <option value="$" label="$"></option>--%>
<%--                                            <option value="$ $" label="$ $"></option>--%>
<%--                                            <option value="$ $ $" label="$ $ $"></option>--%>
<%--                                            <option value="$ $ $ $" label="$ $ $ $"></option>--%>
<%--                                            <option value="$ $ $ $ $" label="$ $ $ $ $"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="city" name="city" class="form-control"--%>
<%--                                               placeholder="輸入地點城市"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="dist" name="dist" class="form-control"--%>
<%--                                               placeholder="輸入地點區域"/>--%>
<%--                                    </div>--%>
<%--                                    &lt;%&ndash;<input type="button" id="submitBtnSearch" class="button rounded-0 primary-bg text-white w-100" value="查詢" onclick="search()"/>&ndash;%&gt;--%>
<%--                                    <div>--%>
<%--                                        <input type="button" id="submitBtnSearch"--%>
<%--                                               class="button rounded-0 primary-bg text-white w-100"--%>
<%--                                               onclick="search()" value="Search"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </aside>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--================左側區1=================-->--%>


<%--                <!--================左側區1 =================-->--%>
<%--                <div class="col-lg-3">--%>
<%--                    <div class="blog_right_sidebar">--%>
<%--                        <aside class="single_sidebar_widget search_widget">--%>
<%--                            <h2>篩選</h2>--%>
<%--                            <form id="searchForm" action="#">--%>
<%--                                <div class="form-group">--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="name" name="name" class="form-control"--%>
<%--                                               placeholder="輸入地點名稱"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="category" name="category" class="form-control">--%>
<%--                                            <option value="" label="請選擇分類..."></option>--%>
<%--                                            <option value="酒吧" label="酒吧"></option>--%>
<%--                                            <option value="燒烤" label="燒烤"></option>--%>
<%--                                            <option value="咖啡廳" label="咖啡廳"></option>--%>
<%--                                            <option value="餐館" label="餐館"></option>--%>
<%--                                            <option value="宵夜" label="宵夜"></option>--%>
<%--                                            <option value="未分類" label="未分類"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <select id="price" name="price" class="form-control">--%>
<%--                                            <option value="" label="請選擇消費水準..."></option>--%>
<%--                                            <option value="$" label="$"></option>--%>
<%--                                            <option value="$ $" label="$ $"></option>--%>
<%--                                            <option value="$ $ $" label="$ $ $"></option>--%>
<%--                                            <option value="$ $ $ $" label="$ $ $ $"></option>--%>
<%--                                            <option value="$ $ $ $ $" label="$ $ $ $ $"></option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="city" name="city" class="form-control"--%>
<%--                                               placeholder="輸入地點城市"/>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="text" id="dist" name="dist" class="form-control"--%>
<%--                                               placeholder="輸入地點區域"/>--%>
<%--                                    </div>--%>
<%--                                    &lt;%&ndash;<input type="button" id="submitBtnSearch" class="button rounded-0 primary-bg text-white w-100" value="查詢" onclick="search()"/>&ndash;%&gt;--%>
<%--                                    <div>--%>
<%--                                        <input type="button" id="submitBtnSearch"--%>
<%--                                               class="button rounded-0 primary-bg text-white w-100"--%>
<%--                                               onclick="search()" value="Search"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </aside>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--================左側區1=================-->--%>



<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>


    <jsp:include page="../../layout/footer.jsp"/>

</body>
</html>
