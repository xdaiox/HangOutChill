<%--
  Created by IntelliJ IDEA.
  User: willi
  Date: 2023/5/16
  Time: 下午 01:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<jsp:include page="../../layout/navbar.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${contextRoot}/css/location/locationContent.css">
  <title>Document</title>
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
                <input type="text" id="name" name="name" class="profile_input" placeholder="輸入地點名稱"/>
              </div>
            </div>
            <div class="profile_item">
              <div class="profile_different">
                <select id="category" name="category">
                  <option value="" label="請選擇分類..."></option>
                  <option value="酒吧" label="酒吧"></option>
                  <option value="燒烤" label="燒烤"></option>
                  <option value="咖啡廳" label="咖啡廳"></option>
                  <option value="餐館" label="餐館"></option>
                  <option value="宵夜" label="宵夜"></option>
                </select>
              </div>
            </div>
            <div class="profile_item">
              <div class="profile_different">
                <select id="price" name="price">
                  <option value="" label="請選擇消費費水準..."></option>
                  <option value="$" label="$"></option>
                  <option value="$ $" label="$ $"></option>
                  <option value="$ $ $" label="$ $ $"></option>
                  <option value="$ $ $ $" label="$ $ $ $"></option>
                  <option value="$ $ $ $ $" label="$ $ $ $ $"></option>
                </select>
              </div>
            </div>
            <div class="profile_item">
              <div class="profile_different">
                <input type="text" id="city" name="city" class="profile_input" placeholder="輸入地點城市"/>
              </div>
            </div>
            <div class="profile_item">
              <div class="profile_different">
                <input type="text" id="dist" name="dist" class="profile_input" placeholder="輸入地點區域"/>
              </div>
            </div>
            <div class="profile_item">
              <div class="profile_different">
                <button type="submit">SEARCH</button>
<%--                <input type="button" id="submitBtnSearch" class="btn btn-outline-info btn-sm" value="查詢"--%>
<%--                       onclick="search()"/>--%>
              </div>
            </div>
          </div>
        </form>
      </div>


    </div>
  </section>
</div>

</body>
<jsp:include page="../../layout/footer.jsp"/>
</html>
