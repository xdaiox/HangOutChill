<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="" type="image/png">
  <link rel="stylesheet" href="${contextRoot}/css/article/articleContent.css">

  <title>${article.article_name}</title>
  <jsp:include page="../layout/navbar.jsp"/>
</head>
<body>
      <div class="main">
        <section class="article">
            <div class="article_wrapper">
                <div class="article_content">

                    <!-- title -->
                    <div class="article_title">
                        <div class="h2Box">
                            <h2>HANGOUT News</h2>
                            <a href=""><h3>+ 加入書籤</h3></a>
                        </div>
                        <h1>${article.article_name}</h1>
                    </div>
                    <!-- title -->

                    <!-- content -->
                    <div class="article_template">
                        <div class="templateBox">
                            <img src="${article.article_mainImg}" alt="">
                        </div>
                        <div class="excerptBox">
                            <div class="excerpt">
                                <p>${article.article_excerpt}</p>
                            </div>
                        </div>
                        <div class="contentBox">
                        	${modifiedHtml}
                        </div>
                    </div>
                    <!-- content -->
                </div>

                <!-- information -->
                <div class="article_metadata">
                    <div class="metadataWrapper" style="height: 600px;">
                        <div class="article_info">
                            <div class="article_list">
                                <div class="article_type"><a href="/hangoutchill/article/theme?article_theme=${article.article_theme}">${article.article_theme}</a></div>
                                <div class="article_date"> 日期 ${article.createtime}</div>
                            </div>
                            <div class="article_list article_author">
                                <div class="article_infoText">
                                    圖片/
                                    <span class="article_color"></span>
                                    提供
                                </div>
                                <div class="article_infoText">
                                    核稿/
                                    <span class="article_color"></span>
                                </div>
                            </div>
                            <div class="article_list article_hashtag">
                                <a href="">#酒吧</a>
                            </div>
                        </div>
                        <div class="interactive">

                        </div>
                    </div>
                </div>
                <!-- information -->

            </div>
        </section>
    </div>
  <jsp:include page="../layout/footer.jsp"/>
</body>