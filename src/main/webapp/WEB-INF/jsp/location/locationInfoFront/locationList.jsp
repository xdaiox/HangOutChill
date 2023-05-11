<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/4/22
  Time: 下午 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<jsp:include page="../../layout/navbar.jsp"/>
<html>
<head>
    <title>精選地點</title>
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
        figure img{
            width: 100%;
        }

    </style>
</head>
<body>
<div class="container">
    <%--        <div class="row" style="margin: auto">--%>
    <%--            <div class="col-1"></div>--%>
    <%--            <div class="col-lg-3 col-md-12 col-sm-12">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Rem maxime nemo saepe vero debitis corrupti quos laborum facere aperiam voluptatibus. Explicabo cumque commodi ea a aliquam! Suscipit placeat facilis qui.</div>--%>
    <%--            <div class="col-lg-7 col-md-6 col-sm-12">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem, id. Omnis nobis praesentium eveniet, atque, esse quos qui unde neque laboriosam libero mollitia ducimus exercitationem asperiores excepturi temporibus aliquid nihil.</div>--%>
    <%--            <div class="col-1"></div>--%>
    <%--        </div>--%>


    <!--================Blog Area =================-->
    <section class="blog_area area-padding">
        <div class="container">
            <div class="row">

                <!--================搜尋side bar =================-->

                <div class="col-lg-3">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <h2>篩選</h2>
                            <form id="searchForm" action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" id="name" name="name" class="form-control"
                                               placeholder="輸入地點名稱"/>
                                    </div>
                                    <div class="input-group mb-3">
                                        <select id="category" name="category" class="form-control">
                                            <option value="" label="請選擇分類..."></option>
                                            <option value="酒吧" label="酒吧"></option>
                                            <option value="燒烤" label="燒烤"></option>
                                            <option value="咖啡廳" label="咖啡廳"></option>
                                            <option value="餐館" label="餐館"></option>
                                            <option value="宵夜" label="宵夜"></option>
                                            <option value="未分類" label="未分類"></option>
                                        </select>
                                    </div>
                                    <div class="input-group mb-3">
                                        <select id="price" name="price" class="form-control">
                                            <option value="" label="請選擇消費水準..."></option>
                                            <option value="$" label="$"></option>
                                            <option value="$ $" label="$ $"></option>
                                            <option value="$ $ $" label="$ $ $"></option>
                                            <option value="$ $ $ $" label="$ $ $ $"></option>
                                            <option value="$ $ $ $ $" label="$ $ $ $ $"></option>
                                        </select>
                                    </div>
                                    <div class="input-group mb-3">
                                        <input type="text" id="city" name="city" class="form-control"
                                               placeholder="輸入地點城市"/>
                                    </div>
                                    <div class="input-group mb-3">
                                        <input type="text" id="dist" name="dist" class="form-control"
                                               placeholder="輸入地點區域"/>
                                    </div>
                                    <%--<input type="button" id="submitBtnSearch" class="button rounded-0 primary-bg text-white w-100" value="查詢" onclick="search()"/>--%>
                                    <div>
                                        <button id="submitBtnSearch"
                                                class="button rounded-0 primary-bg text-white w-100" type="submit"
                                                onclick="search()">
                                            Search
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </aside>
                    </div>
                </div>

                                <div class="col-lg-8 mb-5 mb-lg-0">
                                    <div class="blog_left_sidebar">


                                        <article class="blog_item">
<%--                                            <div class="blog_item_img">--%>
<%--                                                <img class="card-img rounded-0" src="img/blog/main-blog/m-blog-5.jpg" alt="">--%>

<%--                                            </div>--%>



                                            <div class="blog_details" style="background-color: white">
                                               <figure>
                                                   <img src="${contextRoot}/img/HangOutChill.png"/>
                                               </figure>
                                                <div>
                                                <a class="d-inline-block" href="single-blog.html">
                                                    <h2>這裡放地點名稱</h2>
                                                </a>
                                                </div>
                                                <div>
                                                <p>That dominion stars lights dominion divide years for fourth have don't stars is that he earth it first without heaven in place seed it second morning saying.</p>
                                                <ul class="blog-info-link">
                                                    <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                                    <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                                                </ul>
                                                </div>
                                            </div>
                                        </article>


                                        <nav class="blog-pagination justify-content-center d-flex">
                                            <ul class="pagination">
                                                <li class="page-item">
                                                    <a href="#" class="page-link" aria-label="Previous">
                                                        <i class="ti-angle-left"></i>
                                                    </a>
                                                </li>
                                                <li class="page-item">
                                                    <a href="#" class="page-link">1</a>
                                                </li>
                                                <li class="page-item active">
                                                    <a href="#" class="page-link">2</a>
                                                </li>
                                                <li class="page-item">
                                                    <a href="#" class="page-link" aria-label="Next">
                                                        <i class="ti-angle-right"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>


            </div>
        </div>
    </section>
    <!--================Blog Area =================-->


    <jsp:include page="../../layout/footer.jsp"/>
</body>
</html>
