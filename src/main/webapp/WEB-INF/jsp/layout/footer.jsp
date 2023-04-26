<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/20
  Time: 下午 04:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<html>
<head>
</head>
<body>
<footer class="footer-area">
<div class="container">
  <div class="row">
    <div class="col-lg-3 col-sm-6 mb-4 mb-xl-0 single-footer-widget">
      <h4>About Us</h4>
      <p>Heaven fruitful doesn't over lesser days appear creeping seasons so behold bearing days open</p>
      <div class="footer-logo">
        <img src="${contextRoot}/img/picwish.png" alt="" style="height: 80px;">
      </div>
    </div>

    <div class="col-lg-3 col-sm-6 mb-4 mb-xl-0 single-footer-widget">
      <h4>Contact Info</h4>
      <div class="footer-address">
        <span>Phone : +8880 44338899</span>
        <span>Email : hangoutchill@gmail.com</span>
      </div>
    </div>

    <div class="col-lg-3 col-sm-6 mb-4 mb-xl-0 single-footer-widget">
      <h4>Important Link</h4>
      <ul>
        <li><a href="#">專欄</a></li>
        <li><a href="#">精選地點</a></li>
        <li><a href="#">討論區</a></li>
        <li><a href="#">活動與課程</a></li>
        <li><a href="#">商城</a></li>
      </ul>
    </div>

    <div class="col-lg-3 col-sm-6 col-md-6 mb-4 mb-xl-0 single-footer-widget">
      <h4>Newsletter</h4>
      <p>Heaven fruitful doesn't over lesser in days. Appear creeping seasons deve behold bearing days
        open</p>

      <div class="form-wrap" id="mc_embed_signup">
        <form target="_blank"
              action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
              method="get">
          <div class="input-group">
            <input type="email" class="form-control" name="EMAIL" placeholder="Your Email Address"
                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '">
            <div class="input-group-append">
              <button class="btn click-btn" type="submit">
                <i class="fab fa-telegram-plane"></i>
              </button>
            </div>
          </div>
          <div style="position: absolute; left: -5000px;">
            <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
          </div>

          <div class="info"></div>
        </form>
      </div>

    </div>
  </div>

</div>
</footer>
</body>
</html>
