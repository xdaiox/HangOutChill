<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/5/3
  Time: 下午 10:35
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
    <title>修改地點</title>
</head>

<body>

<div class="container content_view"
     style="background-color: #ffffff00;">
    <div class="content_box ">
        <div class="content"
             style="background-color: #ffffff00; height: 100%">
            <div class="col-8" style="margin:auto">
                <div class="card">
                    <div class="card-header">修改地點</div>
                    <div class="card-body">
                        <form:form class="" modelAttribute="locationInfo" enctype="multipart/form-data" method="put" action="${contextRoot}/location/locationManager/editPage">
                            <form:input type="hidden" value="${locationInfo.locId}" path="locId"/>
                            <p>地點名稱:</p>
                            <form:input path="locName" value="${locationInfo.locName}" class="form-control" type="text"></form:input>
                            <p>地點分類:</p>
                            <form:select path="locCat" value="${locationInfo.locCat}" Class="form-control">
                                <form:option value="-1" label="請選擇分類..."/>
                                <form:option value="分類1" label="分類1"/>
                                <form:option value="分類2" label="分類2"/>
                                <form:option value="分類3" label="分類3"/>
                            </form:select>
<%--                            &lt;%&ndash;                            <p>地點標籤:</p>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            <form:checkbox path="locTag" name="locTag"/>&ndash;%&gt;--%>
                            <p>消費水準:</p>
                            <form:select path="locPriceLevel" value="${locationInfo.locPriceLevel}" Class="form-control">
                                <form:option value="-1" label="請選擇分類..."/>
                                <form:option value="1" label="$"/>
                                <form:option value="2" label="$ $"/>
                                <form:option value="3" label="$ $ $"/>
                                <form:option value="3" label="$ $ $ $"/>
                                <form:option value="3" label="$ $ $ $ $"/>
                            </form:select>
                            <p>地點簡介:</p>
                            <form:textarea path="locDesc" value="${locationInfo.locDesc}" class="form-control" style="height:200px;" ></form:textarea>
                            <p>城市:</p>
                            <form:input path="locCity" value="${locationInfo.locCity}" class="form-control" type="text"></form:input>
                            <p>區域:</p>
                            <form:input path="locDist" value="${locationInfo.locDist}" class="form-control" type="text"></form:input>
                            <p>地址:</p>
                            <form:input path="locAdd" value="${locationInfo.locAdd}" class="form-control" type="text"></form:input>
                            <p>電話:</p>
                            <form:input path="locTel" value="${locationInfo.locTel}" class="form-control" type="text"></form:input>
                            <p>網址連結:</p>
                            <form:input path="locLink" value="${locationInfo.locLink}" class="form-control" type="text"></form:input>

                            <p>營業時間:</p>
                            <sapn>星期一 : </sapn>
                            <span>開始</span>
<%--                            <p><fmt:formatDate pattern="HH-mm" value="${locationInfo.locationOperationTime.mondayOpen}" /></p>--%>
                            <form:input path="locationOperationTime.mondayOpen" value="${locationOperationTime.mondayOpen}" type="time"></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.mondayClose" value="${locationOperationTime.mondayClose}" type="time" ></form:input>
                            <br>
                            <sapn>星期二 : </sapn>
                            <span>開始</span>
                            <form:input path="locationOperationTime.tuesdayOpen" value="${locationOperationTime.tuesdayOpen}" type="time" ></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.tuesdayClose" value="${locationOperationTime.tuesdayClose}" type="time" ></form:input>
                            <br>
                            <sapn>星期三 : </sapn>
                            <span>開始</span>
                            <form:input path="locationOperationTime.wednesdayOpen" value="${locationOperationTime.wednesdayOpen}" type="time" ></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.wednesdayClose" value="${locationOperationTime.wednesdayClose}" type="time" ></form:input>
                            <br>
                            <sapn>星期四 : </sapn>
                            <span>開始</span>
                            <form:input path="locationOperationTime.thursdayOpen" value="${locationOperationTime.thursdayOpen}" type="time" ></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.thursdayClose" value="${locationOperationTime.thursdayClose}" type="time" ></form:input>
                            <br>
                            <sapn>星期五 : </sapn>
                            <span>開始</span>
                            <form:input path="locationOperationTime.fridayOpen" value="${locationOperationTime.fridayOpen}" type="time" ></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.fridayClose" value="${locationOperationTime.fridayClose}" type="time" ></form:input>
                            <br>
                            <sapn>星期六 : </sapn>
                            <span>開始</span>
                            <form:input path="locationOperationTime.saturdayOpen" value="${locationOperationTime.saturdayOpen}" type="time" ></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.saturdayClose" value="${locationOperationTime.saturdayClose}" type="time" ></form:input>
                            <br>
                            <sapn>星期日 : </sapn>
                            <span>開始</span>
                            <form:input path="locationOperationTime.sundayOpen" value="${locationOperationTime.sundayOpen}" type="time" ></form:input>
                            <span>結束</span>
                            <form:input path="locationOperationTime.sundayClose" value="${locationOperationTime.sundayClose}" type="time" ></form:input>





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
