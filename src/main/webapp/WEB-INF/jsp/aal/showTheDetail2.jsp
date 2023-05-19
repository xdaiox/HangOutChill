<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/4/23
  Time: 下午 02:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <jsp:include page="../layout/navbar.jsp"/>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <meta charset="UTF-8">
    <title>活動詳細</title>

    <style>
        figure {
            width: 300px;
            height: 200px;
            overflow: hidden;
            background-color: #000;
            float: left;
            display: inline-block;
            margin-bottom: 30px;
            margin-right: 30px;
        }

        figure img {
            width: 100%;
        }

    </style>


</head>

<body>

<!--================所有內容 開始 =================-->
<section class="blog_area area-padding">
    <div class="container">
        <div class="row justify-content-center">


            <!--================左區 開始 =================-->
            <div class="col-lg-6 mb-5 mb-lg-0">
                <div class="blog_left_sidebar">


                    <!--================左1 標題區 開始 =================-->
                    <article class="blog_item">
                        <div class="blog_details" style="background-color: white ; height:250px">
                            <figure style="height:180px">
                                <img width="300" height="178px"
                                     src="data:image/png;base64,${aal.base64image}" alt="預覽圖"/>
                            </figure>

                            <div>
                                <h1 style="color: black;">${aal.name}</h1>
                            </div>

                            <div>
                                <h4 style="display: inline; margin-right: 20px;">#<jstl:if
                                        test="${aal.topic=='act'}">活動</jstl:if> <jstl:if
                                        test="${aal.topic=='les'}">課程</jstl:if></h4>
                                <br>
                                <h4 style="display: inline; margin-right: 20px;">
                                    舉辦商家：${aal.normalMember.reallName}</h4>
                                <br>
                                <h5 style="display: inline; margin-right: 5px;">報名費用：NTD$ ${aal.fee}</h5>
                                <br>
                                <h5 style="display: inline; margin-right: 5px;">活動狀態：
                                    <jstl:if test="${aal.currentStatus=='approved'}">熱烈報名中!!!</jstl:if>
                                    <jstl:if test="${aal.currentStatus=='opened'}">熱烈報名中!!!</jstl:if>
                            </div>
                        </div>
                    </article>
                    <!--================左1 標題區 結束 =================-->


                    <!--================左2 簡介 開始=================-->
                    <article class="blog_item" style="background-color: white">


                        <div class="blog_details" style="background-color: white ;">
                            <div>
                                <h3 style="color: black;">活動簡介</h3>
                            </div>

                            <div>
                                <p>${aal.aalContent}</p>
                            </div>
                        </div>
                    </article>
                    <!--================左2 簡介 結束=================-->


                </div>
            </div>
            <!--================左區 結束 =================-->


            <!--================右區 開始 =================-->
            <div class="col-lg-3">
                <div class="blog_right_sidebar">


                    <!--================右1 收藏 開始=================-->
                    <aside class="single_sidebar_widget search_widget">
                        <div class="form-group">
                            <div class="input-group" style="margin-bottom: 0;" id="favorite">
                                <jstl:if test="${result.role.roleId !=2}">
                                    <form:form method="get" action="${contextRoot}/actandles/detail/lessignup">
                                        <jstl:choose>
                                            <jstl:when test="${(aal.quota-aal.registered)>0}">
                                                <input value="${aal.id}" type="hidden" name="id" />
                                                <button type="submit" id="submitBtnSearch"
                                                       class="button rounded-0 primary-bg text-white w-100"
                                                       style="border: 1px solid #744FC6; background:#744FC6 ;width: 200px; height: 60px;font-size: x-large">點我去報名</button>
                                            </jstl:when>
                                            <jstl:when test="${(aal.quota-aal.registered)==0}">
                                                <input type="button" id="submitBtnSearch"
                                                       class="button rounded-0 primary-bg text-white w-100"
                                                       value="已額滿"
                                                       style="border: 1px solid #744FC6; background:#744FC6 "/>
                                            </jstl:when>
                                        </jstl:choose>
                                    </form:form>
                                </jstl:if>
                            </div>
                        </div>

                    </aside>
                    <!--================右1 收藏 結束=================-->


                    <!--================右3 資訊 開始 =================-->
                    <aside class="single_sidebar_widget post_category_widget" STYLE="word-wrap: break-word;">
                        <h4 class="widget_title">資訊</h4>
                        <ul class="list cat-list">
                            <li><span class="d-flex">最低開辦人數：${aal.lowerLimit}  </span></li>
                            <li><span class="d-flex">預計名額： ${aal.quota}</span></li>
                            <li><span class="d-flex">舉辦日： <fmt:formatDate
                                    pattern="yyyy-MM-dd" value="${aal.theDayofStarts}"/></span></li>
                            <li><span class="d-flex">報名截止日： <fmt:formatDate
                                    pattern="yyyy-MM-dd" value="${aal.deadLine}"/></span></li>
                             <li><span class="d-flex"><jstl:choose>
								<jstl:when test="${(aal.quota-aal.registered)<5}">
									<p style="color: red; font-weight: bold;">剩餘名額：${aal.quota-aal.registered}人
								</jstl:when>
								<jstl:when test="${(aal.quota-aal.registered)>5}">
									<p>剩餘名額：${aal.quota-aal.registered}人
								</jstl:when>
							</jstl:choose></span></li>
                        </ul>
                    </aside>
                    <!--================右3 資訊 結束 =================-->


                    <!--================右4 營業時間 開始 =================-->
                    <%--                    <aside class="single_sidebar_widget post_category_widget">--%>
                    <%--                        <h4 class="widget_title">營業時間</h4>--%>
                    <%--                        <ul class="list cat-list">--%>
                    <%--                            <li><span class="d-flex">星期一：</span>--%>
                    <%--                            </li>--%>
                    <%--                            <li><span class="d-flex">星期二： </span>--%>
                    <%--                            </li>--%>
                    <%--                            <li><span class="d-flex">星期三： </span></li>--%>
                    <%--                            <li><span class="d-flex">星期四：</span>--%>
                    <%--                            </li>--%>
                    <%--                            <li><span class="d-flex">星期五： </span>--%>
                    <%--                            </li>--%>
                    <%--                            <li><span class="d-flex">星期六： </span>--%>
                    <%--                            </li>--%>
                    <%--                            <li><span class="d-flex">星期日：</span>--%>
                    <%--                            </li>--%>
                    <%--                        </ul>--%>
                    <%--                    </aside>--%>
                    <!--================右4 營業時間 結束 =================-->


                    <!--================右區 結束 =================-->


                </div>
            </div>
        </div>
    </div>
</section>
<!--================所有內容 結束=================-->


<jsp:include page="../layout/footer.jsp"/>


</body>
</html>
