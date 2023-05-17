<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/20
  Time: 下午 03:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="${contextRoot}/css/vendors/index.css">
  <link rel="icon" href="" type="image/png">
  
  <title>HangoutChill Holiday</title>

  <title>首頁</title>
  <jsp:include page="layout/navbar.jsp"/>

</head>
<body>
	
    <div class="carouserl">
        <div class="leftbox">
            <img id="left" style="opacity: 0;" src="/images/left-arrow.png" alt="">
        </div>
        <div class="contentbox">
            <div class="content">
                <div class="imgbox">
                    <img class="img" id="img1" src="/images/wcc-bar-01.jpg" alt="">
                </div>
                <div class="imgbox">
                    <img class="img" id="img2" src="/images/archipelago.jpg" alt="">
                </div>
                <!-- <div class="imgbox">
                    <img class="img" id="img3" src="" alt="">
                </div>
                <div class="imgbox">
                    <img class="img" id="img4" src="" alt="">
                </div>
                <div class="imgbox">
                    <img class="img" id="img5" src="" alt="">
                </div> -->
            </div>
            <div class="dotsbox">
                <div class="dots" onclick="currentSlide(1)"></div>
                <div class="dots" onclick="currentSlide(2)"></div>
                <!-- <div class="dots" onclick="currentSlide(3)"></div>
                <div class="dots" onclick="currentSlide(4)"></div>
                <div class="dots" onclick="currentSlide(5)"></div> -->
            </div>
        </div>
        <div class="rightbox">
            <img id="right" style="opacity: 0;" src="/images/right-arrow.png" alt="">
        </div>
        <div class="neon">
            <span style="--color:#a827af">H</span>
            <span style="--color:#a827af">A</span>
            <span style="--color:#a827af">N</span>
            <span style="--color:#a827af">G</span>
            <span style="--color:#a827af">O</span>
            <span style="--color:#a827af">U</span>
            <span style="--color:#a827af">T</span>
        </div>
        <!-- <h1>HANGOUT</h1> -->
    </div>

    <section class="content_wrapper">
        <div class="newArticle">
            <div class="titlebox nybox">
                <h1 class="ny">LESSON & ACTIVITY</h1>
            </div>

            <div class="contentBox act_box">
                <!-- 活動 -->
                <div class="activity_list">
                    <div class="act">
                        <div class="act_photo">
                            <a href="#">
                                <img src="/images/archipelago.jpg" alt="">
                            </a>
                            <div class="act_title">
                                <p>台灣人工智慧實驗室（Taiwan AI Labs）sssssssssssssssss</p>
                            </div>
                        </div>
                        <div class="act_info">
                            <div class="art_text">報名截止日: 2023/5/17</div>
                            <div class="act_lavenum">剩餘人數 : 23</div>
                        </div>
                    </div>

                </div>
                <!-- 課程 -->
                <div class="lesson_list">
                    <div class="lesson_photo">
                        <a href="#">
                            <img src="/images/archipelago.jpg" alt="">
                        </a>
                    </div>
                    <div class="lesson">
                        <div class="lesson_title">
                            <p>台灣人工智慧實驗室（Taiwan AI Labs）</p>
                        </div>
                        <div class="lesson_info">
                            Nihonshu Sake Space店內提供兩款光榮菊清酒，一款為「雄町」，特色在於酒體表現雖具層次感，但酒體卻纖細透明，顛覆既有對雄町米調性的印象；另一款「愛山」瀰漫花果香調，口感也討喜，實際上因使用原料稀少且製程困難的米種，製作過程充滿挑戰。
                        </div>
                        <a href=""><div class="lesson_readmore">READMORE ></READMORE></div></a>
                    </div>
                </div>
            </div>

        </div>
    </section>
	    <section class="content_wrapper">
	        <div class="newArticle">
	            <div class="titlebox">
	                <h1>Product</h1>
	            </div>
	            <div class="contentBox">
	<jstl:forEach var="products" items="${products}">
	                <div class="product_list">
	                    <div class="product_photo">
	                        <a href="">
	                            <img src='<jstl:url value="/shop/getPicture/${products.productId}" />' alt="">
	                        </a>
	                    </div>
	                    <div class="product_title">
	                        <p>${products.productName}</p>
	                    </div>
	                    <div class="product_info">
	                        <div class="product_price">
	                            <span>NT${products.unitPrice}</span>
	                        </div>
	                    </div>
	                </div>
    </jstl:forEach>
	            </div>
	            <div class="readmore_btn">
	                <a href=""><div class="readmore">READ MORE</div></a>
	            </div>
	        </div>
	    </section>

    <section class="content_wrapper">
        <div class="newArticle">
            <div class="titlebox nybox">
                <h1 class="ny">News</h1>
            </div>

            <div class="contentBox act_box">
                <!-- 課程 -->
                <div class="lesson_list">
                    <div class="lesson_photo">
                        <a href="#">
                            <img src="/images/archipelago.jpg" alt="">
                        </a>
                    </div>
                    <div class="lesson">
                        <div class="lesson_title">
                            <p>台灣人工智慧實驗室（Taiwan AI Labs）</p>
                        </div>
                        <div class="lesson_info">
                            Nihonshu Sake Space店內提供兩款光榮菊清酒，一款為「雄町」，特色在於酒體表現雖具層次感，但酒體卻纖細透明，顛覆既有對雄町米調性的印象；另一款「愛山」瀰漫花果香調，口感也討喜，實際上因使用原料稀少且製程困難的米種，製作過程充滿挑戰。
                        </div>
                        <a href=""><div class="lesson_readmore"> READMORE></div></a>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <section class="content_wrapper">
        <div class="newArticle">
            <div class="titlebox">
                <h1>Article</h1>
            </div>
            <ul class="article_lists">
                <li class="art">
                    <a href="#">
                        <div class="art_img">
                            <img src="/images/archipelago.jpg" alt="">
                        </div>
                        <div class="art_content">
                            <div class="art_toptitle">
                                <p class="art_time">2023/5/17</p>
                                <p class="art theme">人物． 生活</p>
                            </div>
                            <div class="art_name">
                                <span>台灣人工智慧實驗室（Taiwan AI Labs）、交通部科技顧問室及觀光局一同打造「海陸漫行」</span>
                            </div>
                        </div>
                        <div class="art_arrow"></div>
                    </a>
                </li>
            </ul>

        </div>
    </section>



<jsp:include page="layout/footer.jsp"/>


<script src="${contextRoot}/js/vendors/index.js" type="text/javascript"></script>

<script src="${contextRoot}/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/popper.js" type="text/javascript"></script>
<script src="${contextRoot}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/stellar.js" type="text/javascript"></script>
<script src="${contextRoot}/js/jquery.ajaxchimp.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/waypoints.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/mail-script.js" type="text/javascript"></script>
<script src="${contextRoot}/js/contact.js" type="text/javascript"></script>
<script src="${contextRoot}/js/jquery.form.js" type="text/javascript"></script>
<script src="${contextRoot}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/mail-script.js" type="text/javascript"></script>
<script src="${contextRoot}/js/theme.js" type="text/javascript"></script>
</body>
</html>
