<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <jsp:include page="../layout/navbar.jsp" />
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <title>所有收藏</title>
    <style>
        tr[data-href] {
            cursor: pointer;
        }
        @media (max-width: 1260px) {
            .container-scroller {
            max-width: 96%;
            } /* 當寬度1259px↓　寬度設定 */
        }
        .container-scroller {
            max-width: 69%;
            margin-left: auto;
            margin-right: auto;
        }
        .image-wrapper img {
            max-width: 25%;
            max-height: 100px;
            margin: 3px;
            /* card裡的討論圖片大小限制 */
        }
        .parent-container {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper">
        <div class="container">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">作者</th>
                    <th scope="col">標題</th>
                    <th scope="col">內容</th>
                    <th scope="col">分類</th>
                    <!-- <th scope="col">收藏數</th> -->
                    <th scope="col">點閱數</th>
                    <!-- <th scope="col">分享次數</th> -->
                    <th scope="col">最後更新</th>
                    <!-- <th scope="col">功能</th> -->
                </tr>
                </thead>
                <tbody>
                <jstl:forEach var="fav" items="${favouriteDTO}">
                    <tr data-href="${contextRoot}/message/allMessages/${fav.discussions.d_id}">
                        <td class="align-middle">${fav.normalMember.nickName}</td>
                        <td class="align-middle">${fav.discussions.title}</td>
                        <!-- 把圖片用image-wrapper包起來 -->								
                        <td class="align-middle"><span class="image-wrapper"></span>${fav.discussions.contents}</span></td>
                        <td class="align-middle">${fav.discussions.type}</td>
                        <td class="align-middle">${fav.discussions.readCount}</td>
                        <td class="align-middle">${fav.postDate}</td>
                    </tr>
                </jstl:forEach>
                </tbody>
            </table>

    </div>
</div>


</div>


<script>
    $(document).ready(function(){
        $("tr").click(function(){
            window.location = $(this).data("href");
        });
    });
</script>
</body>
</html>
