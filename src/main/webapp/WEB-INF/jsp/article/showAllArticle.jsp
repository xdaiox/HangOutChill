<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                    <h1>${article_theme}</h1>
                </div>
            </section>
            <section class="listbox">
                <div class="selectbox">
                    <ul>
                        <li>
                            <a href="/hangoutchill/article/AllArticle">全部專欄</a>
                        </li>
                        <li>
                            <a href="/hangoutchill/article/theme?article_theme=fun">消遣玩樂</a>
                        </li>
                        <li>
                            <a href="/hangoutchill/article/theme?article_theme=life">質感生活</a>    
                        </li>
                        <li>
                            <a href="/hangoutchill/article/theme?article_theme=eats">深夜美食</a>
                        </li>
                        <li>
                            
                        </li>
                    </ul>
                </div>
                <div class="searchbox">
                	<a href="${contextRoot}/article/articleAttention">我要投稿</a>
                </div>
            </section>

            <section class="contentbox">
                <div class="all_article">
                
				<c:forEach var="article" items="${article}">
                    <div class="article_box">
                        <article class="article_img">
                            <a href="/hangoutchill/article/articleContent?article_id=${article.article_id}">
                                <img src="${article.article_mainImg}" alt="">
                            </a>
                        </article>
                        <article class="article_textbox">
                            <h3 class="title">${article.article_name}</h3>
                            <div class="text">
                                <p>${article.article_excerpt}</p>
                            </div>
                            <a href="/hangoutchill/article/articleContent?article_id=${article.article_id}" class="read_more">READ MORE</a>
                        </article>
                    </div>
                   </c:forEach>
                   
                </div>
            </section>
        </div>
    </div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>