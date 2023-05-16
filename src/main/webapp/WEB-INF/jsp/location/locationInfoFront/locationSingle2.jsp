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
                    <article class="blog_item">
                        <div class="blog_details" style="background-color: white ; height:250px">
                            <figure style="height:180px">
                                <img width="300" height="178px" src="${contextRoot}/img/HangOutChill.png"/>
                            </figure>

                            <div>
                                <h2 style="color: black;">The Public House</h2>
                            </div>

                            <div>
                                <h4 style="display: inline; margin-right: 20px;">這裡放分類</h4>
                                <h4 style="display: inline; margin-right: 20px;">$ $ $ $</h4>
                                <br>
                                <h5 style="display: inline; margin-right: 5px;">台北市</h5>
                                <h5 style="display: inline; margin-right: 5px;">大安區</h5>
                            </div>

                        </div>
                    </article>


                    <!--================左2 =================-->
                    <article class="blog_item" style="background-color: white">


                        <div class="blog_details" style="background-color: white ; height:200px">
                            <div>
                                <h3 style="color: black;">簡介</h3>
                            </div>

                            <div>
                                <p>位於信義安和的「The Public House」，外觀為傳統的英式PUB風格，而PUB也就是Public
                                    House的縮寫，就像是「The Public
                                    House」給人的感覺一樣，比起傳統的專業、沉靜的酒吧，這裡的整體風格更貼近日常生活，有時會出現英式小酒館鬧哄哄的氣氛，美味的餐點加上各種專業性十足的調酒，打造出一個輕鬆的氛圍！</p>
                            </div>
                        </div>
                    </article>


                    <!--================左3 =================-->
                    <article class="blog_item" style="background-color: white">
                        <div class="blog_details" style="background-color: white; height: 950px">
                            <div>
                                <h3 style="color: black;">精選圖片</h3>
                            </div>

                            <div style="display: flex; flex-wrap: wrap; justify-content: center; align-items: center; height: 100%;">
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/img/HangOutChill.png"
                                         style="width: 100%; height: 100%; object-fit: contain;" alt="Image 1">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/img/HangOutChill.png"
                                         style="width: 100%; height: 100%; object-fit: contain;" alt="Image 2">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="image3.jpg" style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 3">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="image4.jpg" style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 4">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="image5.jpg" style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 5">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="image6.jpg" style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 6">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="image7.jpg" style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 7">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="image8.jpg" style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 8">
                                </div>
                            </div>
                        </div>
                    </article>


                    <!--================左4 =================-->
                    <article class="blog_item" style="background-color: white">


                        <div class="blog_details">
                            <a class="d-inline-block" href="single-blog.html">
                                <h2>Google inks pact for new 35-storey office</h2>
                            </a>
                            <p>That dominion stars lights dominion divide years for fourth have don't stars is that he
                                earth it first without heaven in place seed it second morning saying.</p>
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
                                <div class="input-group" style="margin-bottom: 0;">
                                    <input type="button" id="submitBtnSearch"
                                           class="button rounded-0 primary-bg text-white w-100"
                                           onclick="search()" value="收藏"
                                           style="border: 1px solid #744FC6; background:#744FC6 "/>
                                </div>
                            </div>
                        </form>
                    </aside>


                    <!--================右2 =================-->
                    <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">資訊</h4>
                        <ul class="list cat-list">
                                <li><span class="d-flex">地址： 開始時間 - 結束時間</span></li>
                                <li><span class="d-flex">電話： 開始時間 - 結束時間</span></li>
                                <li><span class="d-flex">Link： 開始時間 - 結束時間</span></li>
                            </ul>
                    </aside>

                    <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">營業時間</h4>
                        <ul class="list cat-list">
                            <li><span class="d-flex">星期一： 開始時間 - 結束時間</span></li>
                            <li><span class="d-flex">星期二： 開始時間 - 結束時間</span></li>
                            <li><span class="d-flex">星期三： 開始時間 - 結束時間</span></li>
                            <li><span class="d-flex">星期四： 開始時間 - 結束時間</span></li>
                            <li><span class="d-flex">星期五： 開始時間 - 結束時間</span></li>
                            <li><span class="d-flex">星期六： 開始時間 - 結束時間</span></li>
                            <li><span class="d-flex">星期日： 開始時間 - 結束時間</span></li>
                        </ul>
                    </aside>


                </div>
            </div>
            <!--================右區 結束 =================-->


        </div>
    </div>
</section>
<!--================Blog Area =================-->





<jsp:include page="../../layout/footer.jsp"/>

</body>
</html>
