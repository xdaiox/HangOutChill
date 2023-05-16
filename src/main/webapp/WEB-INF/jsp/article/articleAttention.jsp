<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<!DOCTYPE html>
<html>
<head>
  	<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
	
	<meta charset="UTF-8">
	<link rel="icon" href="" type="image/png">
	<link rel="stylesheet" href="${contextRoot}/css/article/articleAttention.css">
	
	<title>投稿專區</title>
	<jsp:include page="../layout/navbar.jsp"/>
</head>
<body>
    <div class="main">
        <section class="my profile">
            <div class="profile_container">
                <h1 class="my_title">我要投稿</h1>
                
				<div class="policy_list">
                    <h3 class="policy_listTitle">一、稿件主題</h3>
                    <div class="policy_line"></div>
                    <p class="policy_text">
                        夜晚是城市另一個迷人的面貌，散發出一種特別的魅力。
                        讓我們一同探索夜生活的精彩之處，領略那些令人心動的瞬間。<br>
                        當夜幕低垂，城市變得繽紛耀眼，燈光閃爍著繁華與喧囂。
                        夜店、酒吧和咖啡館成為人們尋求放鬆和獨特體驗的場所。<br>
                        在這片夜生活的璀璨世界裡，我們可以找到自己的位置，
                        追尋著夜晚的激情與融入感。不論是享受音樂的韻律，<br>
                        品味美食的滋味，還是沉浸在藝術的氛圍中，夜生活帶給我們無盡的樂趣和驚喜。
                    </p>
                </div>

                <div class="policy_list">
                    <h3 class="policy_listTitle">二、稿件呈現形式</h3>
                    <div class="policy_line"></div>
                    <p class="policy_text">
                        1. 建議字數: 1,000-2,000 字，除了以文字呈現之外，也歡迎投稿圖文創作。<br>
                        2. 未曾在其他刊物或電子媒體公開發表者，同一文稿請勿同時分投至其他刊物。<br>
                    </p>
                </div>

                <div class="policy_list">
                    <h3 class="policy_listTitle">三、投稿流程與注意事項</h3>
                    <div class="policy_line"></div>
                    <p class="policy_text">
                        選擇主題 → 撰寫稿件 → 格式和字數符合要求 → 提交稿件<br>
                        等待審核 → 接受後發布/刊登 → 拒絕後修改或投其他媒體
                    </p>
                </div>

                <button class="profile_enter" id="profileEnter">前往投稿</button>
            </div>
        </section>
    </div>
    <jsp:include page="../layout/footer.jsp"/>
</body>
<script>
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
	});
	
	$('#profileEnter').click(function() {
        if(userName === 'anonymousUser') {
        	alert('請登入會員')
        }
        else{
           window.location.href = 'http://localhost:8080/hangoutchill/article/articleForm';
        }
	});



</script>
</html>