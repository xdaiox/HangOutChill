<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${contextRoot}/css/shop/productlist.css">
<jsp:include page="../layout/navbar.jsp" />
<title>專欄</title>
</head>
<body>

    <div class="container">
        <div class=" article_content">
            <section class="titlebox">
                <div class="title_en">
                    <h1>${category}</h1>
                </div>
            </section>
            <section class="listbox">
                <div class="selectbox">
                    <ul>
                        <li>
                            <a href="/hangoutchill/article/theme?article_theme=life">全部商品</a>
                        </li>
                        <li>
                            <a href="/hangoutchill/article/theme?article_theme=fun">美味嘗點</a>
                        </li>
                        <li>
                            <a href="/hangoutchill/article/theme?article_theme=life">文創商品</a>    
                        </li>
                        <li>
                            <a href="/hangoutchill/article/theme?article_theme=eats">實用嚴選</a>
                        </li>
                    </ul>
                </div>
                <div class="searchbox">
                    <input type="text" class="search_input" placeholder="商品搜尋">
                    <button class="search_submit" type="submit">
                        <a href="#"><i class="ti-search"></i></a>
                    </button>
                </div>
            </section>

            <section class="contentbox">
                <div class="all_article">
                
				<c:forEach var="product" items="${cateProducts}">
                    <div class="article_box">
                        <article class="article_img">
                            <a href="/hangoutchill/shop/productdetail?productid=${product.productId}">
                                <img src='<c:url value="/shop/getPicture/${product.productId}" />' alt="">
                            </a>
                        </article>
                        <article class="article_textbox">
                            <h3 class="title">${product.productName}</h3>
                            <div class="text">
                                <p>$ ${product.unitPrice}</p>
                            </div>
                            <a href="#" class="read_more">READ MORE</a>
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