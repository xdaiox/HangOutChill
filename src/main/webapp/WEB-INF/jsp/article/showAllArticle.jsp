<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${contextRoot}/css/article/articlelist.css">
<jsp:include page="../layout/navbar.jsp" />
<title>專欄</title>
</head>
<body>

    <div class="container">
        <div class=" article_content">
            <section class="titlebox">
                <div class="title_en">
                    <h1>Latest Article</h1>
                </div>
                <div class="title_ch">
                    <h3>全部專欄</h3>
                </div>
            </section>
            <section class="listbox">
                <div class="selectbox">
                    <ul>
                        <li>
                            <a href="#">全部專欄</a>
                        </li>
                        <li>
                            <a href="#">獨家採訪</a>
                        </li>
                        <li>
                            <a href="#">質感生活</a>    
                        </li>
                        <li>
                            <a href="#">深夜美食</a>
                        </li>
                    </ul>
                </div>
                <div class="searchbox">
                    <input type="text" class="search_input" placeholder="專欄搜尋">
                    <button class="search_submit" type="submit">
                        <a href="#"><i class="ti-search"></i></a>
                    </button>
                </div>
            </section>

            <section class="contentbox">
                <div class="all_article">
                    <div class="article_box">
                        <article class="article_img">
                            <a href="">
                                <img src="${contextRoot}/img/article/drizzle116.jpg" alt="">
                            </a>
                        </article>
                        <article class="article_textbox">
                            <h3 class="title">永續概念酒吧 Drizzle by Fourplay：大自然的聲音，像山濛在耳邊</h3>
                            <div class="text">
                                <p>日本清酒在台灣掀起流行，出現許多專門供應單杯清酒的Sake Bar（清酒酒吧）。台北信義區新開幕的Nihonshu Sake Space即是一個專屬於清酒的空間，提倡即時立飲，主打「你外帶我配酒」，以具有季節性、稀有性與趣味性的新派清酒搭台式小吃，讓喝清酒變成一件很潮的事。</p>
                            </div>
                            <a href="#" class="read_more">READ MORE</a>
                        </article>
                    </div>
                    <div class="article_box">
                        <article class="article_img">
                            <a href="">
                                <img src="${contextRoot}/img/article/drizzle116.jpg" alt="">
                            </a>
                        </article>
                        <article class="article_textbox">
                            <h3 class="title">永續概念酒吧 Drizzle by Fourplay：大自然的聲音，像山濛在耳邊</h3>
                            <div class="text">
                                <p>日本清酒在台灣掀起流行，出現許多專門供應單杯清酒的Sake Bar（清酒酒吧）。台北信義區新開幕的Nihonshu Sake Space即是一個專屬於清酒的空間，提倡即時立飲，主打「你外帶我配酒」，以具有季節性、稀有性與趣味性的新派清酒搭台式小吃，讓喝清酒變成一件很潮的事。</p>
                            </div>
                            <a href="#" class="read_more">READ MORE</a>
                        </article>
                    </div>
                    <div class="article_box">
                        <article class="article_img">
                            <a href="">
                                <img src="${contextRoot}/img/article/drizzle116.jpg" alt="">
                            </a>
                        </article>
                        <article class="article_textbox">
                            <h3 class="title">永續概念酒吧 Drizzle by Fourplay：大自然的聲音，像山濛在耳邊</h3>
                            <div class="text">
                                <p>日本清酒在台灣掀起流行，出現許多專門供應單杯清酒的Sake Bar（清酒酒吧）。台北信義區新開幕的Nihonshu Sake Space即是一個專屬於清酒的空間，提倡即時立飲，主打「你外帶我配酒」，以具有季節性、稀有性與趣味性的新派清酒搭台式小吃，讓喝清酒變成一件很潮的事。</p>
                            </div>
                            <a href="#" class="read_more">READ MORE</a>
                        </article>
                    </div>
                    <div class="article_box">
                        <article class="article_img">
                            <a href="">
                                <img src="${contextRoot}/img/article/drizzle116.jpg" alt="">
                            </a>
                        </article>
                        <article class="article_textbox">
                            <h3 class="title">永續概念酒吧 Drizzle by Fourplay：大自然的聲音，像山濛在耳邊</h3>
                            <div class="text">
                                <p>日本清酒在台灣掀起流行，出現許多專門供應單杯清酒的Sake Bar（清酒酒吧）。台北信義區新開幕的Nihonshu Sake Space即是一個專屬於清酒的空間，提倡即時立飲，主打「你外帶我配酒」，以具有季節性、稀有性與趣味性的新派清酒搭台式小吃，讓喝清酒變成一件很潮的事。</p>
                            </div>
                            <a href="#" class="read_more">READ MORE</a>
                        </article>
                    </div>
                    <div class="article_box">
                        <article class="article_img">
                            <a href="">
                                <img src="${contextRoot}/img/article/drizzle116.jpg" alt="">
                            </a>
                        </article>
                        <article class="article_textbox">
                            <h3 class="title">永續概念酒吧 Drizzle by Fourplay：大自然的聲音，像山濛在耳邊</h3>
                            <div class="text">
                                <p>日本清酒在台灣掀起流行，出現許多專門供應單杯清酒的Sake Bar（清酒酒吧）。台北信義區新開幕的Nihonshu Sake Space即是一個專屬於清酒的空間，提倡即時立飲，主打「你外帶我配酒」，以具有季節性、稀有性與趣味性的新派清酒搭台式小吃，讓喝清酒變成一件很潮的事。</p>
                            </div>
                            <a href="#" class="read_more">READ MORE</a>
                        </article>
                    </div>
                    <div class="article_box">
                        <article class="article_img">
                            <a href="">
                                <img src="${contextRoot}/img/article/drizzle116.jpg" alt="">
                            </a>
                        </article>
                        <article class="article_textbox">
                            <h3 class="title">永續概念酒吧 Drizzle by Fourplay：大自然的聲音，像山濛在耳邊</h3>
                            <div class="text">
                                <p>日本清酒在台灣掀起流行，出現許多專門供應單杯清酒的Sake Bar（清酒酒吧）。台北信義區新開幕的Nihonshu Sake Space即是一個專屬於清酒的空間，提倡即時立飲，主打「你外帶我配酒」，以具有季節性、稀有性與趣味性的新派清酒搭台式小吃，讓喝清酒變成一件很潮的事。</p>
                            </div>
                            <a href="#" class="read_more">READ MORE</a>
                        </article>
                    </div>
                </div>
            </section>
        </div>
    </div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>