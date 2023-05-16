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
    <title>一般會員中心</title>
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
                                <li class="btn btn-primary btn-lg" style="margin: 0px 0px 0px -1px; background: #9C84BC;border: #c8cbcf 0px; border-radius: 5px 5px 0px 0px"><a href="#" style="color: azure;">我的訂單</a>
                                </li>
                                <li class="btn btn-secondary btn-lg" style="background: #E1E3E5; border: #c8cbcf 0px"><a href="#" style="color: #7455bb;">收藏文章</a></li>
                                <li class="btn btn-primary btn-lg" style=" background: #9C84BC;border: #c8cbcf 0px;"><a href="${contextRoot}/actandles/detail/gotoMemberCenter"  style="color: azure;" >我的活動</a></li>
                                <li class="btn btn-secondary btn-lg" style="background: #E1E3E5; border: #c8cbcf 0px ;" ><a href="#" style="color: #7455bb;">我的地點</a></li>
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
                                        <h3 class="card-title">訂單資訊</h3>
                                        <table class="table table-borderless" >
                                            <thead>
                                            <tr>
                                                <th scope="col" style="font-size: large">順序</th>
                                                <th scope="col" style="font-size: large">訂單編號</th>
                                                <th scope="col" style="font-size: large">訂購日期</th>
                                                <th scope="col" style="font-size: large">付款方式</th>
                                                <th scope="col" style="font-size: large">付款狀態</th>
                                                <th scope="col" style="font-size: large">送貨方式</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <jstl:forEach var="order" items="${orders}">
                                                <tr>
                                                    <th scope="row">${orders.indexOf(order)+1}</th>
                                                    <td>${order.orderNo}</td>
                                                    <td>${order.orderDate}</td>
                                                    <td>${order.paymentVia}</td>
                                                    <td><jstl:choose>
                                                        <jstl:when test="${order.paymentState == true}">已付款成功</jstl:when>
                                                        <jstl:otherwise>未付款成功</jstl:otherwise>
                                                    </jstl:choose>
                                                            </td>
                                                    <td>${order.shipVia}</td>
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
</script>
</body>
</html>
