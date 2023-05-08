<%--@elvariable id="member" type="org.hibernate.engine.profile.Association"--%>
<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/5/3
  Time: 上午 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <title>所有會員</title>
</head>
<body>
<div class="container-scroller">
    <jsp:include page="../dbLayout/top_navbar.jsp" />

    <div class="container-fluid page-body-wrapper">
        <jsp:include page="../dbLayout/left_navbar.jsp" />
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">順序</th>
                    <th scope="col">會員身分</th>
                    <th scope="col">會員Email</th>
                    <th scope="col">會員姓名</th>
                    <th scope="col">會員生日</th>
                    <th scope="col">會員性別</th>
                    <th scope="col">會員開通權限</th>
                    <th scope="col">功能</th>
                </tr>
                </thead>
                <tbody>
                <jstl:forEach var="allMember" items="${members}">
                    <tr>
                        <th scope="row" class="align-middle">${members.indexOf(allMember)+1}</th>
                        <td class="align-middle">${allMember.identity}</td>
                        <td class="align-middle">${allMember.account}</td>
                        <td class="align-middle">${allMember.reallName}</td>
                        <td class="align-middle">${allMember.birthdate}</td>
                        <td class="align-middle">${allMember.gender}</td>
                        <td class="align-middle">
                            <div style="display: flex">
                                <form method="post" action="${contextRoot}/back/authority" >
                                    <input type="hidden" name="_method" value="PUT">
                                    <input type="hidden" name="id" value="${allMember.id}">
                                    <jstl:choose>
                                        <jstl:when test="${allMember.enabled == false}">
                                            <input type="submit" class="btn btn-outline-success" value="開啟" >
                                        </jstl:when>
                                        <jstl:otherwise >
                                            <input type="submit" class="btn btn-outline-danger" value="關閉" onclick="return confirm('確定關閉權限')">
                                        </jstl:otherwise>
                                    </jstl:choose>
                                </form>
                            </div>
                        </td>
                        <td class="align-middle">
                            <div style="display: flex">
                                <form method="get" action="${contextRoot}/back/backUpdateMember" >
                                    <input type="hidden" name="id" value="${allMember.id}">
                                    <input type="submit" class="btn btn-outline-primary btn-sm" value="編輯資料">
                                </form>
                                <form method="get" action="#">
                                    <input type="hidden" name="id" value="${allMember.id}">
                                    <input type="submit" class="btn btn-outline-secondary btn-sm" value="重寄驗證信">
                                </form>
                            </div>
                        </td>
                    </tr>
                </jstl:forEach>
                </tbody>
            </table>

            <br/>
            <div style="text-align:center;">
                <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
                    <jstl:choose>
                        <jstl:when test="${page.number == pageNumber-1}">
                            <span>${pageNumber}</span>
                        </jstl:when>
                        <jstl:otherwise>
                            <a href="${contextRoot}/back/members?p=${pageNumber}">${pageNumber}</a>
                        </jstl:otherwise>
                    </jstl:choose>
                </jstl:forEach>
            </div>
    </div>
</div>





</body>
</html>
