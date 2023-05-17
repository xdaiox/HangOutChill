<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<!DOCTYPE html>
<html>
<head>
  	<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
	
	<meta charset="UTF-8">
	<link rel="icon" href="" type="image/png">
	<link rel="stylesheet" href="${contextRoot}/css/article/articleFav.css">
	
	<title>我的書籤</title>
	<jsp:include page="../layout/navbar.jsp"/>
</head>
<body>
    <div class="main">
        <div class="pickers">
            <ul class="pickers_ul">
                <li class="pickers_li"><a href="">訂單管理</a></li>
                <li class="pickers_li"><a>我的書籤</a></li>
                <li class="pickers_li"><a>活動管理</a></li>
                <li class="pickers_li"><a>地點收藏</a></li>
                <li class="pickers_li"><a>討論收藏</a></li>
            </ul>
        </div>
        <section class="my profile">
            <div class="profile_container">
                <h1 class="my_title">我的書籤</h1>

                <div class="favs_container">
                	
                	<jstl:forEach var="allfavs" items="${article}">
                		<input type="hidden" id="article_id" value="${allfavs.article_id}">
	                    <div class="favs_list">
	                        <div class="favs_photo">
	                            <a href="/hangoutchill/article/articleContent?article_id=${allfavs.article_id}">
	                                <img src="${allfavs.article_mainImg}" alt="">
	                            </a>
	                        </div>
	                        <div class="favs_info">
	                            <h3 class="listTitle"><a href="/hangoutchill/article/articleContent?article_id=${allfavs.article_id}">${allfavs.article_name}</a></h3>
	                            <p class="listText"><a href="/hangoutchill/article/articleContent?article_id=${allfavs.article_id}">${allfavs.article_excerpt}</a></p>
	                        </div>
	                        <div class="favs_btn" ><p id="favs_btn"></p></div>
	                    </div>
					</jstl:forEach>
					
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="../layout/footer.jsp"/>
</body>

<script>


var articleId = $('#article_id').val();
console.log(articleId);

//取消收藏
$('#favs_btn').click(function() {
    $.ajax({
        url: 'http://localhost:8080/hangoutchill/article/deletefav',
        type: 'DELETE',
        data: {article_id: articleId},
        success: function(response) {
        	$('.favs_list').remove();
            
        },
        error: function(error) {
            alert(error);
        }
    })
});

</script>

</html>