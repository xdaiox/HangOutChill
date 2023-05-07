<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/5/1
  Time: 下午 03:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>所有地點</title>
</head>
<body>
<div class="container-scroller">
    <jsp:include page="../dbLayout/top_navbar.jsp"/>
    <div class="container-fluid page-body-wrapper">
        <jsp:include page="../dbLayout/left_navbar.jsp"/>
        <div class="container">
            <div class="content_box" style="width: 100%">
                <h1 style="text-align: center;">地點管理</h1>
                <form action="${contextRoot}/location/locationManager/addPage">
                    <input type="submit" class="btn btn-outline-info btn-sm" value="新增"/></form>
                <br>
                <p>搜索功能</p>
                <form action="${contextRoot}/location/locationManager/search">
                    <label>
                        <input type="text" name="name" placeholder="輸入地點名稱"/>
                    </label><br>
                    <label>
                        <select>
                            <option value="" label="請選擇分類..."></option>
                            <option value="分類1" label="分類1"></option>
                            <option value="分類2" label="分類2"></option>
                            <option value="分類3" label="分類3"></option>
                        </select>
                    </label><br>
                    <label>
                        <input type="text" name="city" placeholder="輸入地點城市"/>
                    </label><br>
                    <label>
                        <input type="text" name="dist" placeholder="輸入地點區域"/>
                    </label><br>
                </form>
                <br>
                <div class="table-responsive">
                    <table class="table table-hover table-bordered table-light">
                        <thead>
                        <tr>
                            <th>地點編號ID
                            <th>地點名稱
                            <th>地點分類
                            <th>地點城市
                            <th>最後更新時間
                            <th>操作
                        </thead>
                        <tbody>
                        <jstl:forEach var="locationInfo" items="${page.content}">
                        <tr>
                            <td class="align-middle">${locationInfo.locId}
                            <td class="align-middle">${locationInfo.locName}
                            <td class="align-middle">${locationInfo.locCat}
                            <td class="align-middle">${locationInfo.locCity}
                            <td class="align-middle"><span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                           value="${locationInfo.locInfoUpdateTime}"/></span>
                            <td class="align-middle">
                                <div style="display: flex">
                                    <form action="${contextRoot}/location/locationManager/editPage">
                                        <input type="hidden" name="locId" value="${locationInfo.locId}"/> <input
                                            type="submit" class="btn btn-outline-info btn-sm" value="編輯"/>
                                    </form>
                                    <form action="${contextRoot}/location/locationManager/delete" method="post">
                                        <input type="hidden" name="_method" value="delete"/> <input
                                            type="hidden" name="locId" value="${locationInfo.locId}"/> <input
                                            type="submit" class="btn btn-outline-danger btn-sm"
                                            value="刪除" onclick="return confirm('確定刪除?')"/>
                                    </form>
                                </div>
                                </jstl:forEach>
                        </tbody>
                    </table>
                </div>
                <br>
                <div style="text-align:center;">
                    <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
                        <%-- 					<jstl:if test="${page.number == pageNumber-1}"><span>${pageNumber}</span></jstl:if> --%>
                        <%-- 					<jstl:if test="${page.number != pageNumber-1}"><a href="${contextRoot}/messages?p=${pageNumber}">${pageNumber}</a></jstl:if> --%>
                        <jstl:choose>
                            <jstl:when test="${page.number == pageNumber-1}">
                                <span>${pageNumber}</span>
                            </jstl:when>
                            <jstl:otherwise>
                                <a href="${contextRoot}/location/locationManager?p=${pageNumber}">${pageNumber}</a>
                            </jstl:otherwise>
                        </jstl:choose>
                    </jstl:forEach>
                </div>
            </div>
        </div>
    </div>

</body>
</html>