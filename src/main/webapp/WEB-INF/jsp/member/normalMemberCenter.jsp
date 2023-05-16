<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/21
  Time: 下午 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
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
<jsp:include page="../layout/navbar.jsp"/>
<section class="search">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <aside>
                    <div class="aside-body">
                        <div class=" btn-group-vertical my-3" >
                            <ul>
                                <li class="btn btn-primary btn-lg" style="margin: 0px 0px 0px -1px; background: #9C84BC;border: #c8cbcf 0px; border-radius: 5px 5px 0px 0px"><a href="#" style="color: azure;">我的訂單</a></li>
                                <li class="btn btn-secondary btn-lg" style="background: #E1E3E5; border: #c8cbcf 0px"><a href="" style="color: #7455bb;">收藏文章</a></li>
                                <li class="btn btn-primary btn-lg" style=" background: #9C84BC;border: #c8cbcf 0px;"><a href="#"  style="color: azure;" >我的活動</a></li>
                                <li class="btn btn-secondary btn-lg" style="background: #E1E3E5; border: #c8cbcf 0px ;" ><a href="#" style="color: #7455bb;">收藏地點</a></li>
                                <a href="${contextRoot}/discussion/allFavourite"  style="color: azure;" ><li class="btn btn-primary btn-lg" style=" background: #9C84BC;border: #c8cbcf 0px;  border-radius: 0px 0px 5px 5px">收藏討論</li></a>
                            </ul>
                        </div>
                    </div>
                </aside>
            </div>
                <div class="col-md-9">
                    <div class="col-md-12">
                            <div class="col-sm-12">
                                    <br>
                                <div class="card">
                                    <div class="card-body">
                                        <h3 class="card-title">收藏討論</h3>
                                        <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">作者</th>
                    <th scope="col">標題</th>
                    <th scope="col">內容</th>
                    <th scope="col">分類</th>
                    <!-- <th scope="col">收藏數</th> -->
                    <!-- <th scope="col">點閱數</th> -->
                    <!-- <th scope="col">分享次數</th> -->
                    <th scope="col">收藏時間</th>
                    <!-- <th scope="col">功能</th> -->
                </tr>
                </thead>
                <tbody>
                <jstl:forEach var="fav" items="${favouriteDTO}">
                    <tr data-href="${contextRoot}/message/allMessages/${fav.discussions.d_id}">
                        <td class="align-middle">${fav.normalMember.nickName}</td>
                        <td class="align-middle">${fav.discussions.title}</td>
                        <!-- 把圖片用image-wrapper包起來 -->								
                        <td class="align-middle"><span class="image-wrapper">${fav.discussions.contents}</span></td>
                        <td class="align-middle">${fav.discussions.type}</td>
                        <!-- <td class="align-middle">${fav.discussions.readCount}</td> -->
                        <td class="align-middle">${fav.postDate}</td>
                    </tr>
                </jstl:forEach>
                </tbody>
            </table>

                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
        </div>
    </div>
</section>
<jsp:include page="../layout/footer.jsp"/>

</body>
</html>
