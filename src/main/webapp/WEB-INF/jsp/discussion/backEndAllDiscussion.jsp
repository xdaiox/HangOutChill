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
        <div class="container">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">順序</th>
                    <th scope="col">作者</th>
                    <th scope="col">標題</th>
                    <th scope="col">內容</th>
                    <th scope="col">分類</th>
                    <th scope="col">收藏數</th>
                    <th scope="col">點閱數</th>
                    <th scope="col">分享次數</th>
                    <th scope="col">最後更新</th>
                    <th scope="col">功能</th>
                </tr>
                </thead>
                <tbody>

                <jstl:forEach var="allDiscussion" items="${page.content}">

                    <tr>
                        <th scope="row" class="align-middle">${page.content.indexOf(allDiscussion)+1}</th>
                        <td class="align-middle">${allDiscussion.normalMember.nickName}</td>
                        <td class="align-middle">${allDiscussion.title}</td>
                        <td class="align-middle">${allDiscussion.contents}</td>
                        <td class="align-middle">${allDiscussion.type}</td>
                        <td class="align-middle">${allDiscussion.favorite}</td>
                        <td class="align-middle">${allDiscussion.readCount}</td>
                        <td class="align-middle">${allDiscussion.shareCount}</td>
                        <td class="align-middle">${allDiscussion.updateDate}</td>
                        <td class="align-middle">
                            <div style="display: flex">
                                <form method="get" action="${contextRoot}/back/backCheckDiscussion/${allDiscussion.d_id}" >
                                    <input type="submit" class="btn btn-outline-primary btn-sm" value="編輯">
                                </form>
                                <form method="get" action="#">
                                    <input type="hidden" name="id" value="${allMember.id}">
                                    <input type="submit" class="btn btn-outline-secondary btn-sm" value="刪除">
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
                            <a href="${contextRoot}/back/allDiscussions?p=${pageNumber}">${pageNumber}</a>
                        </jstl:otherwise>
                    </jstl:choose>
                </jstl:forEach>
            </div>

    </div>
</div>


</div>



</body>
</html>
