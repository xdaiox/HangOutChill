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
    <jsp:include page="../dbLayout/top_navbar.jsp"/>

    <div class="container-fluid page-body-wrapper">
        <jsp:include page="../dbLayout/left_navbar.jsp"/>
        <div class="container">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col" style="font-size: large">順序</th>
                    <th scope="col"  style="font-size: large">會員身分</th>
                    <th scope="col"  style="font-size: large">會員Email</th>
                    <th scope="col"  style="font-size: large">會員姓名</th>
                    <th scope="col"  style="font-size: large">會員生日</th>
                    <th scope="col"  style="font-size: large">會員性別</th>
                    <th scope="col"  style="font-size: large">會員開通權限</th>
                    <th scope="col" style="font-size: large ; padding-top: 5px; padding-bottom: 5px;" >功能<div class="input-group input-group-sm p-0" style="display: inline-flex">
                        <input type="text"  class="form-control" placeholder="輸入會員信箱查詢" aria-label="Recipient's username" aria-describedby="button-addon2" >
                    </div></th>
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
                                <form method="post" action="${contextRoot}/back/authority">
                                    <input type="hidden" name="_method" value="PUT">
                                    <input type="hidden" name="id" value="${allMember.id}">
                                    <jstl:choose>
                                        <jstl:when test="${allMember.enabled == false}">
                                            <input type="submit" class="btn btn-outline-success" value="開啟">
                                        </jstl:when>
                                        <jstl:otherwise>
                                            <input type="submit" class="btn btn-outline-danger" value="關閉"
                                                   onclick="return confirm('確定關閉權限')">
                                        </jstl:otherwise>
                                    </jstl:choose>
                                </form>
                            </div>
                        </td>
                        <td class="align-middle">
                            <div style="display: flex">
                                <form method="get" action="${contextRoot}/back/backUpdateMember">
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
<%--            <nav aria-label="Page navigation example">--%>
<%--                <ul class="pagination justify-content-center">--%>
<%--                    <li class="page-item disabled">--%>
<%--                        <span class="page-link">Previous</span>--%>
<%--                    </li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--                    <li class="page-item active" aria-current="page">--%>
<%--                        <span class="page-link">2</span>--%>
<%--                    </li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                    <li class="page-item">--%>
<%--                        <a class="page-link" href="#">Next</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </nav>--%>

            <nav aria-label="Page navigation example" style="text-align: center">
                <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
                    <jstl:choose>
                        <jstl:when test="${page.number != pageNumber-1}">
                            <a href="${contextRoot}/back/members?p=${pageNumber}">${pageNumber}</a>
                        </jstl:when>
                        <jstl:otherwise>
                            <span >${pageNumber}</span>
                        </jstl:otherwise>
                    </jstl:choose>
                </jstl:forEach>
            </nav>

        </div>
    </div>
</div>


</body>
</html>
