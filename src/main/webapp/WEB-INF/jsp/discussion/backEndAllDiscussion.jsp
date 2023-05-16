<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <title>後台所有討論</title>

</head>
<body>
<div class="container-scroller" max-width="80%">
    <jsp:include page="../dbLayout/top_navbar.jsp" />

    <div class="container-fluid page-body-wrapper">
        <jsp:include page="../dbLayout/left_navbar.jsp" />

            <div class="content_box" style="width: 100%">
                <h3 style="text-align: center;">討論管理</h3>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">順序</th>
                        <th scope="col">作者</th>
                        <th scope="col">標題</th>
                        <th scope="col">內容</th>
                        <th scope="col">分類</th>
                        <!-- <th scope="col">收藏數</th>
                        <th scope="col">點閱數</th>
                        <th scope="col">分享次數</th> -->
                        <!-- <th scope="col">被檢舉次數</th> -->
                        <th scope="col">最後更新</th>
                        <th scope="col">功能</th>
                    </tr>
                    </thead>

                    <tbody id="table">
                    <jstl:forEach var="allDiscussion" items="${page.content}">

                        <tr>
                            <th scope="row" class="align-middle">${page.content.indexOf(allDiscussion)+1}</th>
                            <td class="align-middle">${allDiscussion.normalMember.nickName}</td>
                            <td class="align-middle">${allDiscussion.title}</td>
                            <td class="align-middle">${allDiscussion.contents}</td>
                            <td class="align-middle">${allDiscussion.type}</td>
                            <!-- <td class="align-middle">${allDiscussion.favorite}</td>
                            <td class="align-middle">${allDiscussion.readCount}</td>
                            <td class="align-middle">${allDiscussion.shareCount}</td> -->
                            <!-- <td class="align-middle">${allDiscussion.rportCount}</td> -->
                            <td class="align-middle">${allDiscussion.postDate}</td>
                            
                            <td class="align-middle">
                                <div style="display: flex">
                                    <form method="get" action="${contextRoot}/back/backCheckDiscussion/${allDiscussion.d_id}" >
                                        <input type="submit" class="btn btn-outline-primary btn-sm" value="查看">
                                    </form>
                                    <form method="post" action="${contextRoot}/back/visiable">
                                        <input type="hidden" name="_method" value="PUT">
                                        <input type="hidden" name="id" value="${allDiscussion.d_id}">
                                        <jstl:choose>
                                            <jstl:when test="${allDiscussion.visible == false}">
                                                <input type="submit" class="btn btn-outline-success" value="顯示討論" >
                                            </jstl:when>
                                            <jstl:otherwise >
                                                <input type="submit" class="btn btn-outline-danger" value="隱藏討論" onclick="return confirm('確定隱藏討論')">
                                            </jstl:otherwise>
                                        </jstl:choose>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </jstl:forEach>
                    </tbody>
                </table>
            </div>  <!-- class="content_box" style="width: 100%" -->
            <br/>
            
    </div>
</div>


</div>



</body>
</html>
