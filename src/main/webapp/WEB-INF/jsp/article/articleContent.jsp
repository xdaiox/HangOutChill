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
                            <div class="btnBox">
                                <h3 id="favorBtn">+ 加入書籤</h3>
                                <h3 id="removeBtn" style="display: none;">– 移除書籤</h3>
                            </div>
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
							<div class="UserImgBox">
								<img alt="" src="${article.normalmember.photoB64}">
								<p>${article.normalmember.reallName}</p>
							</div>
                        </div>
                    </div>
                </div>
                <!-- information -->

            </div>
        </section>
    </div>
  <jsp:include page="../layout/footer.jsp"/>


  <script>

    function getArticleIdFromCurrentURL() {
        var urlParams = new URLSearchParams(window.location.search);
        return urlParams.get('article_id');
    }

    var articleId = getArticleIdFromCurrentURL();
    
    //取得userName
    $(document).ready(function() {
		$.ajax({
			url: 'http://localhost:8080/hangoutchill/article/getUserName',
			type: 'GET',
			success: function(response) {
			  userName = response;
			  // 在此處設定 userName 的值
			},
			error: function(error) {
			  console.log(error);
			}
		});
		  
		//重載時判斷是否收藏
		$.ajax({
			url: 'http://localhost:8080/hangoutchill/article/checkFavorite',
	        type: 'GET',
	        data: {article_id: articleId},
	        success: function(exist) {
	        	console.log(exist);
	            if (exist === '已收藏') {
	              $('#favorBtn').hide();
	              $('#removeBtn').show();
	            } else {
	              $('#favorBtn').show();
	              $('#removeBtn').hide();
	            }
	        },
	        error: function(error) {
            
	        }
		})	
    	  
   	});

	//加入收藏
    $('#favorBtn').click(function() {
        if(userName === 'anonymousUser') {
        	alert('請登入會員')

        }
        else{
	    	$.ajax({
	            url: 'http://localhost:8080/hangoutchill/article/addfav',
	            type: 'POST',
	            data: {article_id: articleId},
	            success: function(response) {
	                $('#favorBtn').hide();
	                $('#removeBtn').show();
	                alert(response);
	            },
	            error: function(error) {
	                alert(error);
	            }
	        })
        }
    	
    });
    
	//取消收藏
    $('#removeBtn').click(function() {
        $.ajax({
            url: 'http://localhost:8080/hangoutchill/article/deletefav',
            type: 'DELETE',
            data: {article_id: articleId},
            success: function(response) {
                $('#removeBtn').hide();
                $('#favorBtn').show();
                alert(response);
                console.log(response);
            },
            error: function(error) {
                alert(error);
            }
        })
    });
	
    
  </script>


</body>





