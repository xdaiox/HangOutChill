<%--
  Created by IntelliJ IDEA.
  User: willi
  Date: 2023/4/24
  Time: 下午 01:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <jsp:include page="../layout/navbar.jsp"/>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <meta charset="UTF-8">
    <title>發表文章</title>
</head>

<body>

<div class="container content_view"
     style="background-color: #ffffff00;">
    <div class="content_box ">
        <div class="content"
             style="background-color: #ffffff00; height: 100%">
            <div class="col-8" style="margin:auto">
                <div class="card">
                    <div class="card-header">新增地點</div>
                    <div class="card-body">
                        <form:form class="" modelAttribute="locationInfo" enctype="multipart/form-data" method="POST" action="${contextRoot}/location/locationManager/addLocationInfo/post">
                            <p>地點名稱:</p>
                            <form:input path="locName" class="form-control" type="text"></form:input>
                            <p>地點名稱:</p>
                            <form:select path="locCat" Class="form-control">
                                <form:option value="-1" label="請選擇分類..."/>
                                <form:option value="分類1" label="分類1"/>
                                <form:option value="分類2" label="分類2"/>
                                <form:option value="分類3" label="分類3"/>
                            </form:select>
<%--                            <p>地點標籤:</p>--%>
<%--                            <form:checkbox path="locTag" name="locTag"/>--%>
                            <p>消費水準:</p>
                            <form:select path="locPriceLevel" Class="form-control">
                                <form:option value="-1" label="請選擇分類..."/>
                                <form:option value="1" label="$"/>
                                <form:option value="2" label="$ $"/>
                                <form:option value="3" label="$ $ $"/>
                                <form:option value="3" label="$ $ $ $"/>
                                <form:option value="3" label="$ $ $ $ $"/>
                            </form:select>
                            <p>地點簡介:</p>
                            <form:textarea path="locDesc" class="form-control" style="height:200px;" ></form:textarea>
                            <p>城市:</p>
                            <form:input path="locCity" class="form-control" type="text"></form:input>
                            <p>區域:</p>
                            <form:input path="locDist" class="form-control" type="text"></form:input>
                            <p>地址:</p>
                            <form:input path="locAdd" class="form-control" type="text"></form:input>
                            <p>電話:</p>
                            <form:input path="locTel" class="form-control" type="text"></form:input>
                            <p>網址連結:</p>
                            <form:input path="locLink" class="form-control" type="text"></form:input>

                            <p>營業時間:</p>
<%--                            <form:input path="locationOperationTime.locationInfo" type="hidden" value="${locId}"></form:input>--%>
                            <sapn>星期一 : </sapn>
                            <span>開始</span>
                            <form:input path="locationOperationTime.mondayOpen" type="time" ></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.mondayClose" type="time" ></form:input>
                            <br>
                            <sapn>星期二 : </sapn>
                            <span>開始</span>
                            <form:input path="locationOperationTime.tuesdayOpen" type="time" ></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.tuesdayClose" type="time" ></form:input>
                            <br>
                            <sapn>星期三 : </sapn>
                            <span>開始</span>
                            <form:input path="locationOperationTime.wednesdayOpen" type="time" ></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.wednesdayClose" type="time" ></form:input>


<%--                            <form:input path="locationOperationTime.openTime" type="date" ></form:input>--%>
<%--                            <input type="time" name="MonOpt">--%>


                            <br><button type="submit" class="btn btn-primary">送出</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" />


</body>
</html>
