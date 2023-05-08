<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/5/6
  Time: 下午 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <title>密碼修改</title>
  <script>
    var countdownSeconds = 4;
    setInterval(function() {
      countdownSeconds--;
      document.getElementById("countdown").innerHTML = "密碼更新成功"+countdownSeconds+"秒後自動跳轉至登入頁面";
      if (countdownSeconds === 0) {
        window.location.href = "${contextRoot}/member/login";
      }
    }, 1000);
  </script>

</head>
<body>
<jsp:include page="../layout/navbar.jsp"/>


<div class="container text-center">
  <h5 id="countdown"></h5>
</div>


</body>
</html>
