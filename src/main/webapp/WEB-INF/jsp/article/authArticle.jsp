<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="" type="image/png">
  <link rel="stylesheet" href="${contextRoot}/css/article/authArticle.css">

  <title>${authName.reallName}--專欄</title>
  <jsp:include page="../layout/navbar.jsp"/>
</head>
<body>
      <div class="main">
        <section class="article">
            <div class="article_wrapper">
                <div class="article_content">

                    <!-- title -->
                    <c:forEach var="authart" items="${authart}">
	                    <div class="article_title">
	       	                <div class="article_list">
			                    <div class="article_photo">
			                        <a href="/hangoutchill/article/articleContent?article_id=${authart.article_id}">
			                            <img src="${authart.article_mainImg}" alt="">
			                        </a>
			                    </div>
			                    <div class="article_font">
			                        <p>${authart.article_name}</p>
			                    </div>
                                <div class="text">
                                	<p>${authart.article_excerpt}</p>
                            	</div>
			                </div>
	                	</div>
                   </c:forEach>
				</div>
				                <!-- information -->
                <div class="article_metadata">
                    <div class="metadataWrapper" style="height: 600px;">
                        <div class="interactive">
							<div class="UserImgBox">
								<a href="">
									<img alt="" src="${authName.photoB64}">
									<p>${authName.reallName}</p>
								</a>
							</div>
                        </div>
                    </div>
                </div>
                <!-- information -->
            </div>
        </section>
    </div>
  <jsp:include page="../layout/footer.jsp"/>
</body>





