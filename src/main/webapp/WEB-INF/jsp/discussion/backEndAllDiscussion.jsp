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
                            <td class="align-middle"><img src="${allDiscussion.normalMember.photoB64}" id="pfpimg"
                                class="mr-3 rounded-circle" width="50" alt="User"
                                style="max-width: 100%; height: auto; aspect-ratio: 1/1; margin : 10px;" />${allDiscussion.normalMember.nickName}</td>
                            <td class="align-middle">${allDiscussion.title}</td>
                            <td class="align-middle"><div class="content-wrapper">${allDiscussion.contents}</div></td>
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


<script>
    var contentWrappers = document.querySelectorAll('.content-wrapper');

contentWrappers.forEach(function (wrapper) {
    var content = wrapper.innerHTML;

    // 判断文本内容是否超过20个字符
    if (content.length > 20) {
        // 截取前20个字符
        var truncatedContent = content.substring(0, 20);

        // 检查是否在20个字符后存在闭合的<img>标签
        var closingImgIndex = truncatedContent.lastIndexOf('</img>');
        var closingImgExists = closingImgIndex > -1;

        // 获取处理后的文本内容
        var processedContent = closingImgExists
            ? truncatedContent.substring(0, closingImgIndex + 6) + '...' // 添加闭合的img标签并添加省略号
            : truncatedContent + '...'; // 直接添加省略号

        // 使用DOM解析器创建临时元素，将处理后的文本内容添加到其中
        var tempElement = document.createElement('div');
        tempElement.innerHTML = processedContent;

        // 检查临时元素中是否存在<img>标签
        var imgElement = tempElement.querySelector('img');

        // 如果存在<img>标签，则将其添加回处理后的文本中
        if (imgElement) {
            wrapper.innerHTML = tempElement.innerHTML;
        } else {
            wrapper.innerHTML = processedContent;
        }
    }
});
</script>
</body>
</html>
