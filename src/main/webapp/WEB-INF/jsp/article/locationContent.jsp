<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="" type="image/png">
  <link rel="stylesheet" href="${contextRoot}/css/article/locationContent.css">

  <title></title>
  <jsp:include page="../layout/navbar.jsp"/>
</head>
<body>

    <div class="main">
        <section class="article">
            <div class="article_wrapper">

                <div class="artBox">
                    <div class="article_content">
                        <div class="location_list">
                            <div class="location_photo">
                                <a href="">
                                    <img src="/images/wcc-bar-01.jpg" alt="">
                                </a>
                            </div>
                            <h3 class="location_name">
                                <a href="">地點名稱</a>
                                <img src="/images/heart.png" alt="" class="favbtn">
                            </h3>
    
                            <div class="location_infoBox">
                                <div class="row1">
                                    <p class="category">地點分類</p>
                                    <p class="category">消費水準</p>
                                </div>
                                <div class="row2">
                                    <p class="city">
                                        <img src="/images/destination.png" alt="">
                                        城市
                                    </p>
                                    <p class="tel">
                                        <img src="/images/telephone.png" alt="">
                                        電話
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                

                <div class="article_form">
                    <h3>地點篩選</h3>
                    <form action="">
                        <div class="profile_form">
                            <div class="profile_item">
                                <div class="profile_different">
                                    <input type="text" class="profile_input" placeholder="輸入地點名稱" name="name">
                                </div>
                            </div>
                            <div class="profile_item">
                                <div class="profile_different">
                                    <select name="" id="">
                                        <option disabled selected value="">請選擇分類...</option>
                                        <option value=""></option>
                                        <option value=""></option>
                                    </select>
                                </div>
                            </div>
                            <div class="profile_item">
                                <div class="profile_different">
                                    <select name="" id="">
                                        <option disabled selected value="">請選擇消費水準...</option>
                                        <option value=""></option>
                                        <option value=""></option>
                                        <option value=""></option>
                                    </select>
                                </div>
                            </div>
                            <div class="profile_item">
                                <div class="profile_different">
                                    <input type="text" class="profile_input" placeholder="輸入地點城市" name="nickname">
                                </div>
                            </div>
                            <div class="profile_item">
                                <div class="profile_different">
                                    <input type="text" class="profile_input" placeholder="輸入地點區域" name="nickname">
                                </div>
                            </div>
                            <div class="profile_item">
                                <div class="profile_different">
                                    <button type="submit">SEARCH</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>


            </div>
        </section>
    </div>
  <jsp:include page="../layout/footer.jsp"/>

</body>





