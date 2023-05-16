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
</head>

<body>





<article class="blog_item">
    <div class="blog_details" style="background-color: white">
        <figure style="height:178px">
            <img width="300" height="100%" src="${contextRoot}/img/HangOutChill.png" />
        </figure>
        <div>
            <a class="d-inline-block" href="single-blog.html">
                <h2>這裡放地點名稱</h2>
            </a>
        </div>
        <div>
            <div>
                <h4 style="display: inline; margin-right: 20px;">這裡放分類</h4>
                <h4 style="display: inline;" >$ $ $</h4>
                <br>
                <h5 style="display: inline; margin-right: 20px;">台南市</h5>
                <h5 style="display: inline;" >永康區</h5>
            </div>
            <%--                                    <br>--%>
            <div>
                <p class="mb-0">位於信義安和的「The Public House」，外觀為傳統的英式PUB風格，而PUB也就是Public House的縮寫，就像是「The Public House」給人的感覺一樣，比起傳統的專業、沉靜的酒吧，這裡的整體風格更貼近日常生活，有時會出現英式小酒館鬧哄哄的氣氛，美味的餐點加上各種專業性十足的調酒，打造出一個輕鬆的氛圍！</p>
            </div>
        </div>
    </div>
</article>













<%--<section class="blog_area area-padding">--%>
<%--    <div class="container">--%>
<%--        <div class="row justify-content-center">--%>
<%--            <div class="col-lg-10 mb-5 mb-lg-0">--%>
<%--                <article class="blog_item">--%>
<%--                    <div class="blog_details mb-0" style="background-color: white">--%>
<%--                        <a class="d-inline-block" href="single-blog.html">--%>
<%--                            <h2>Google inks pact for new 35-storey office</h2>--%>
<%--                        </a>--%>
<%--                        <p>That dominion stars lights dominion divide years for fourth have don't stars is that he earth--%>
<%--                            it first without heaven in place seed it second morning saying.</p>--%>
<%--                        <ul class="blog-info-link">--%>
<%--                            <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>--%>
<%--                            <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </article>--%>

<%--            </div>--%>

<%--            <div class="col-lg-7 mb-5 mb-lg-0">--%>
<%--                <div class="blog_left_sidebar">--%>
<%--                    <article class="blog_item">--%>


<%--                        <div class="blog_details" style="background-color: white">--%>
<%--                            <a class="d-inline-block" href="single-blog.html">--%>
<%--                                <h2>Google inks pact for new 35-storey office</h2>--%>
<%--                            </a>--%>
<%--                            <p>That dominion stars lights dominion divide years for fourth have don't stars is that he--%>
<%--                                earth it first without heaven in place seed it second morning saying.</p>--%>
<%--                            <ul class="blog-info-link">--%>
<%--                                <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>--%>
<%--                                <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>--%>
<%--                            </ul>--%>

<%--                        </div>--%>
<%--                    </article>--%>

<%--                    <article class="blog_item">--%>


<%--                        <div class="blog_details" style="background-color: white">--%>
<%--                            <a class="d-inline-block" href="single-blog.html">--%>
<%--                                <h2>Google inks pact for new 35-storey office</h2>--%>
<%--                            </a>--%>
<%--                            <p>That dominion stars lights dominion divide years for fourth have don't stars is that he--%>
<%--                                earth it first without heaven in place seed it second morning saying.</p>--%>
<%--                            <ul class="blog-info-link">--%>
<%--                                <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>--%>
<%--                                <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>--%>
<%--                            </ul>--%>

<%--                        </div>--%>
<%--                    </article>--%>


<%--                    <article class="blog_item">--%>


<%--                        <div class="blog_details" style="background-color: white">--%>
<%--                            <a class="d-inline-block" href="single-blog.html">--%>
<%--                                <h2>Google inks pact for new 35-storey office</h2>--%>
<%--                            </a>--%>
<%--                            <p>That dominion stars lights dominion divide years for fourth have don't stars is that he--%>
<%--                                earth it first without heaven in place seed it second morning saying.</p>--%>
<%--                            <ul class="blog-info-link">--%>
<%--                                <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>--%>
<%--                                <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>--%>
<%--                            </ul>--%>

<%--                        </div>--%>
<%--                    </article>--%>


<%--                </div>--%>
<%--            </div>--%>


<%--            <div class="col-lg-3">--%>
<%--                <div class="blog_right_sidebar">--%>
<%--                    <aside class="single_sidebar_widget search_widget">--%>
<%--                        <form action="#">--%>
<%--                            <div class="form-group">--%>
<%--                                <div class="input-group mb-3">--%>
<%--                                    <input type="text" class="form-control" placeholder="Search Keyword">--%>
<%--                                    <div class="input-group-append">--%>
<%--                                        <button class="btn" type="button"><i class="ti-search"></i></button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <button class="button rounded-0 primary-bg text-white w-100" type="submit">Search</button>--%>
<%--                        </form>--%>
<%--                    </aside>--%>

<%--                    <aside class="single_sidebar_widget post_category_widget">--%>
<%--                        <h4 class="widget_title">Category</h4>--%>
<%--                        <ul class="list cat-list">--%>
<%--                            <li>--%>
<%--                                <a href="#" class="d-flex">--%>
<%--                                    <p>Resaurant food</p>--%>
<%--                                    <p>(37)</p>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#" class="d-flex">--%>
<%--                                    <p>Travel news</p>--%>
<%--                                    <p>(10)</p>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#" class="d-flex">--%>
<%--                                    <p>Modern technology</p>--%>
<%--                                    <p>(03)</p>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#" class="d-flex">--%>
<%--                                    <p>Product</p>--%>
<%--                                    <p>(11)</p>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#" class="d-flex">--%>
<%--                                    <p>Inspiration</p>--%>
<%--                                    <p>21</p>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#" class="d-flex">--%>
<%--                                    <p>Health Care (21)</p>--%>
<%--                                    <p>09</p>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </aside>--%>

<%--                    <aside class="single_sidebar_widget popular_post_widget">--%>
<%--                        <h3 class="widget_title">Recent Post</h3>--%>
<%--                        <div class="media post_item">--%>
<%--                            <img src="img/blog/popular-post/post1.jpg" alt="post">--%>
<%--                            <div class="media-body">--%>
<%--                                <a href="single-blog.html">--%>
<%--                                    <h3>From life was you fish...</h3>--%>
<%--                                </a>--%>
<%--                                <p>January 12, 2019</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="media post_item">--%>
<%--                            <img src="img/blog/popular-post/post2.jpg" alt="post">--%>
<%--                            <div class="media-body">--%>
<%--                                <a href="single-blog.html">--%>
<%--                                    <h3>The Amazing Hubble</h3>--%>
<%--                                </a>--%>
<%--                                <p>02 Hours ago</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="media post_item">--%>
<%--                            <img src="img/blog/popular-post/post3.jpg" alt="post">--%>
<%--                            <div class="media-body">--%>
<%--                                <a href="single-blog.html">--%>
<%--                                    <h3>Astronomy Or Astrology</h3>--%>
<%--                                </a>--%>
<%--                                <p>03 Hours ago</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="media post_item">--%>
<%--                            <img src="img/blog/popular-post/post4.jpg" alt="post">--%>
<%--                            <div class="media-body">--%>
<%--                                <a href="single-blog.html">--%>
<%--                                    <h3>Asteroids telescope</h3>--%>
<%--                                </a>--%>
<%--                                <p>01 Hours ago</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </aside>--%>
<%--                    <aside class="single_sidebar_widget tag_cloud_widget">--%>
<%--                        <h4 class="widget_title">Tag Clouds</h4>--%>
<%--                        <ul class="list">--%>
<%--                            <li>--%>
<%--                                <a href="#">project</a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">love</a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">technology</a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">travel</a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">restaurant</a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">life style</a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">design</a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">illustration</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </aside>--%>


<%--                    <aside class="single_sidebar_widget instagram_feeds">--%>
<%--                        <h4 class="widget_title">Instagram Feeds</h4>--%>
<%--                        <ul class="instagram_row flex-wrap">--%>
<%--                            <li>--%>
<%--                                <a href="#">--%>
<%--                                    <img class="img-fluid" src="img/instagram/widget-i1.png" alt="">--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">--%>
<%--                                    <img class="img-fluid" src="img/instagram/widget-i2.png" alt="">--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">--%>
<%--                                    <img class="img-fluid" src="img/instagram/widget-i3.png" alt="">--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">--%>
<%--                                    <img class="img-fluid" src="img/instagram/widget-i4.png" alt="">--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">--%>
<%--                                    <img class="img-fluid" src="img/instagram/widget-i5.png" alt="">--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#">--%>
<%--                                    <img class="img-fluid" src="img/instagram/widget-i6.png" alt="">--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </aside>--%>


<%--                    <aside class="single_sidebar_widget newsletter_widget">--%>
<%--                        <h4 class="widget_title">Newsletter</h4>--%>

<%--                        <form action="#">--%>
<%--                            <div class="form-group">--%>
<%--                                <input type="email" class="form-control" placeholder="Enter email" required>--%>
<%--                            </div>--%>
<%--                            <button class="button rounded-0 primary-bg text-white w-100" type="submit">Subscribe--%>
<%--                            </button>--%>
<%--                        </form>--%>
<%--                    </aside>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!--================Blog Area =================-->








<jsp:include page="../../layout/footer.jsp"/>

</body>
</html>
