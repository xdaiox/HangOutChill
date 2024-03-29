<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/20
  Time: 下午 03:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="" type="image/png">
  <title>HangoutChill Holiday</title>

  <title>首頁</title>
  <jsp:include page="layout/navbar.jsp"/>
  <jsp:include page="layout/content.jsp"/>
  <jsp:include page="layout/footer.jsp"/>

</head>
<body>
<section class="header-top">
</section>


<header id="header" class="header_area">
</header>



<footer class="footer-area">

</footer>

<script src="${contextRoot}/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/popper.js" type="text/javascript"></script>
<script src="${contextRoot}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/stellar.js" type="text/javascript"></script>
<script src="${contextRoot}/js/jquery.ajaxchimp.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/waypoints.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/mail-script.js" type="text/javascript"></script>
<script src="${contextRoot}/js/contact.js" type="text/javascript"></script>
<script src="${contextRoot}/js/jquery.form.js" type="text/javascript"></script>
<script src="${contextRoot}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/mail-script.js" type="text/javascript"></script>
<script src="${contextRoot}/js/theme.js" type="text/javascript"></script>
</body>
</html>
