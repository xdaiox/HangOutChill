<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/5/1
  Time: 下午 03:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>所有地點</title>
    <jsp:include page="../layout/navbar.jsp"/>

</head>
<body>
<div class="container content_view" style="background-color: #ffffff00">
    <div class="content_box" style="width: 100%">
        <div class="content"
             style="background-color: #ffffff00; height: 100%;">
            <div class="row justify-content-center">
                <div class="" style="margin: auto;">
                    <h1 style="text-align: center;">地點管理</h1>
                    <form action="${contextRoot}/location/locationManager/addPage">
                        <input type="submit" class="btn btn-outline-info btn-sm"value="新增" /></form>
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
                                <td  class="align-middle">${locationInfo.locId}
                                <td  class="align-middle">${locationInfo.locName}
                                <td  class="align-middle">${locationInfo.locCat}
                                <td  class="align-middle">${locationInfo.locCity}
                                <td  class="align-middle"><span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${locationInfo.locInfoUpdateTime}"/></span>
                                <td class="align-middle">
                                    <div style="display: flex">
                                        <form action="${contextRoot}/location/locationManager/editPage">
                                            <input type="hidden" name="locId" value="${locationInfo.locId}" /> <input type="submit" class="btn btn-outline-info btn-sm" value="編輯" />
                                        </form>
                                        <form action="${contextRoot}/location/locationManager/delete" method="post">
                                            <input type="hidden" name="_method" value="delete" /> <input
                                                type="hidden" name="locId" value="${locationInfo.locId}" /> <input
                                                type="submit" class="btn btn-outline-danger btn-sm"
                                                value="刪除" onclick="return confirm('確定刪除?')" />
                                        </form>
                                    </div>
                            </jstl:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../layout/footer.jsp" />
</body>
</html>
