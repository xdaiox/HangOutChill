<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
                <html>

                <head>
                    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
                    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
                    <title>所有收藏</title>
                    <style>
                        tr[data-href] {
                            cursor: pointer;
                        }

                        @media (max-width: 1260px) {
                            .container-scroller {
                                max-width: 96%;
                            }

                            /* 當寬度1259px↓　寬度設定 */
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
                    <jsp:include page="../layout/navbar.jsp" />
                    <section class="search">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
                                    <aside>
                                        <div class="aside-body">
                                            <div class=" btn-group-vertical my-3">
                                                <ul>
                                                    <li class="btn btn-primary btn-lg"
                                                        style="margin: 0px 0px 0px -1px; background: #9C84BC;border: #c8cbcf 0px; border-radius: 5px 5px 0px 0px">
                                                        <a href="#" style="color: azure;">我的訂單</a></li>
                                                    <li class="btn btn-secondary btn-lg"
                                                        style="background: #E1E3E5; border: #c8cbcf 0px"><a href=""
                                                            style="color: #7455bb;">收藏文章</a></li>
                                                    <li class="btn btn-primary btn-lg"
                                                        style=" background: #9C84BC;border: #c8cbcf 0px;"><a href="#"
                                                            style="color: azure;">我的活動</a></li>
                                                    <li class="btn btn-secondary btn-lg"
                                                        style="background: #E1E3E5; border: #c8cbcf 0px ;"><a href="#"
                                                            style="color: #7455bb;">收藏地點</a></li>
                                                    <a href="${contextRoot}/discussion/allFavourite"
                                                        style="color: azure;">
                                                        <li class="btn btn-primary btn-lg"
                                                            style=" background: #9C84BC;border: #c8cbcf 0px;  border-radius: 0px 0px 5px 5px">
                                                            收藏討論</li>
                                                    </a>
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
                                                    <table class="table table-hover" id="favoriteTable">
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
                                                                <tr class="favoriteRow" data-href="${contextRoot}/message/allMessages/${fav.discussions.d_id}">
                                                                    <td class="align-middle">
                                                                        ${fav.normalMember.nickName}</td>
                                                                    <td class="align-middle">${fav.discussions.title}
                                                                    </td>
                                                                    <!-- 把圖片用image-wrapper包起來 -->
                                                                    <td class="align-middle"><span
                                                                            class="image-wrapper">${fav.discussions.contents}</span>
                                                                    </td>
                                                                    <td class="align-middle">${fav.discussions.type}
                                                                    </td>
                                                                    <!-- <td class="align-middle">${fav.discussions.readCount}</td> -->
                                                                    <td class="align-middle">
                                                                        <fmt:formatDate
                                                                            pattern="EEEE yyyy-MM-dd HH:mm:ss"
                                                                            value="${fav.postDate}" />
                                                                    </td>

                                                                    </span>
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
                    <jsp:include page="../layout/footer.jsp" />

                    <script>
                        $(document).ready(function () {
                            $("tr").click(function () {
                                window.location = $(this).data("href");
                            });
                        });
                         // 获取收藏表格元素
                            var favoriteTable = document.getElementById("favoriteTable");

                        // 判断表格是否为空
                        if (favoriteTable && favoriteTable.rows.length === 0) {
                            // 创建一行作为提示信息
                            var emptyRow = document.createElement("tr");

                            // 创建一个单元格作为提示文本
                            var emptyCell = document.createElement("td");
                            emptyCell.setAttribute("colspan", "6"); // 根据表格的列数进行调整
                            emptyCell.innerText = "還沒有任何收藏喔";

                            // 将单元格添加到行中
                            emptyRow.appendChild(emptyCell);

                            // 将空行添加到表格的tbody中
                            favoriteTable.querySelector("tbody").appendChild(emptyRow);
                        }
                    </script>
                </body>

                </html>