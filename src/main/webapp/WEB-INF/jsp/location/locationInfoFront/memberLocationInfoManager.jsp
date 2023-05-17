<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/5/14
  Time: 下午 02:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<html>
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${contextRoot}/css/member/register.css">
    <title>一般會員中心</title>
</head>
<body>
<jsp:include page="../../layout/navbar.jsp"/>
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
                                    <a href="#" style="color: azure;">我的訂單</a>
                                </li>
                                <li class="btn btn-secondary btn-lg" style="background: #E1E3E5; border: #c8cbcf 0px"><a
                                        href="#" style="color: #7455bb;">收藏文章</a></li>
                                <li class="btn btn-primary btn-lg" style=" background: #9C84BC;border: #c8cbcf 0px;"><a
                                        href="#" style="color: azure;">我的活動</a></li>
                                <li class="btn btn-secondary btn-lg" style="background: #E1E3E5; border: #c8cbcf 0px ;">
                                    <a href="#" style="color: #7455bb;">收藏地點</a></li>
                                <li class="btn btn-primary btn-lg"
                                    style=" background: #9C84BC;border: #c8cbcf 0px;  border-radius: 0px 0px 5px 5px"><a
                                        href="#" style="color: azure;">收藏討論</a></li>
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
                                <h3 class="card-title">地點管理</h3>

                                <form action="${pageContext.request.contextPath}/location/memberLocationInfo/addPage">
                                    <input type="submit" id="" class="btn btn-outline-info btn-sm" value="新增"/></form>

                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered table-light">
                                        <thead>
                                        <tr>

                                            <th>地點名稱
                                            <th>地點分類
                                            <th>地點城市
                                            <th>狀態
                                            <th>操作
                                        </thead>
                                        <tbody>
                                        <jstl:forEach var="locationInfo" items="${locationInfo}">
                                        <tr>

                                            <td class="align-middle">
                                                <a href="${contextRoot}/location/locationList/single?locId=${locationInfo.locId}">${locationInfo.locName}</a></td>


                                            <td class="align-middle">${locationInfo.locCat}</td>
                                            <td class="align-middle">${locationInfo.locCity}</td>
                                            <td class="align-middle">
                                                <div style="display: flex">
                                                    <form action="${contextRoot}/location/memberLocationInfo/locationManager/status">
                                                        <input type="hidden" name="locId" value="${locationInfo.locId}"/>
                                                        <jstl:choose>
                                                            <jstl:when test="${locationInfo.locStatus == false}">
                                                                <input type="submit" class="btn btn-outline-danger"
                                                                       value="下架中"
                                                                       onclick="return confirm('確定上架您的地點?')">
                                                            </jstl:when>
                                                            <jstl:otherwise>
                                                                <input type="submit" class="btn btn-outline-success"
                                                                       value="上架中"
                                                                       onclick="return confirm('確定下架您的地點?')">
                                                            </jstl:otherwise>
                                                        </jstl:choose>
                                                    </form>
                                                </div>


                                            <td class="align-middle">
                                                <div style="display: flex">
                                                    <form action="${contextRoot}/location/memberLocationInfo/editPage">
                                                        <input type="hidden" name="locId"
                                                               value="${locationInfo.locId}"/> <input
                                                            type="submit" class="btn btn-outline-info btn-sm"
                                                            value="編輯"/>
                                                    </form>
                                                    <form action="${contextRoot}/location/memberLocationInfo/delete"
                                                          method="post">
                                                        <input type="hidden" name="_method" value="delete"/> <input
                                                            type="hidden" name="locId" value="${locationInfo.locId}"/>
                                                        <input
                                                                type="submit" class="btn btn-outline-danger btn-sm"
                                                                value="刪除" onclick="return confirm('確定刪除?')"/>
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
        </div>
    </div>
</section>
<jsp:include page="../../layout/footer.jsp"/>
<script>
    // //圖片上傳前預覽
    // const input = document.getElementById("target")
    // const preview = document.getElementById("preview")
    // input.addEventListener('change', () => {
    //     const file = input.files[0];
    //     const reader = new FileReader();
    //
    //     reader.addEventListener('load', () => {
    //         preview.src = reader.result;
    //     });
    //
    //     if (file) {
    //         reader.readAsDataURL(file);
    //     } else {
    //         // preview.src = "";
    //     }
    // });
</script>
</body>
</html>
