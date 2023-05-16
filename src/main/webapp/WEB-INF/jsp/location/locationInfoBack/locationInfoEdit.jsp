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

    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <meta charset="UTF-8">
    <title>修改地點</title>
</head>

<body>
<div class="container-scroller">
    <jsp:include page="../../dbLayout/top_navbar.jsp"/>
    <div class="container-fluid page-body-wrapper">
        <jsp:include page="../../dbLayout/left_navbar.jsp"/>
        <div class="container">
            <div class="content_box" style=" width: 100%">
            <h3 style="text-align: center;">地點管理</h3>
            <div class="content" style="background-color: #ffffff00; height: 100%">
                <div class="col-12" style="margin:auto">
                    <div class="card">
                        <div class="card-header">編輯地點</div>
                        <div class="card-body">
                            <form:form class="" modelAttribute="locationInfo" enctype="multipart/form-data"
                                       method="put"
                                       action="${contextRoot}/location/locationManager/editPage">
                                <form:input type="hidden" value="${locationInfo.locId}" path="locId"/>
                                <p>地點名稱:</p>
                                <form:input path="locName" value="${locationInfo.locName}" class="form-control"
                                            type="text"></form:input>
                                <br>
                                <p>地點分類:</p>
                                <form:select path="locCat" value="${locationInfo.locCat}" Class="form-control">
                                    <form:option value="未分類" label="請選擇分類..."/>
                                    <form:option value="酒吧" label="酒吧"/>
                                    <form:option value="燒烤" label="燒烤"/>
                                    <form:option value="咖啡廳" label="咖啡廳"/>
                                    <form:option value="餐館" label="餐館"/>
                                    <form:option value="宵夜" label="宵夜"/>
                                </form:select>
                                <%--                            <p>地點標籤:</p>--%>
                                <%--                            <form:checkbox path="locTag" label="標籤1" value="${locationInfo.locTag}"/>--%>
                                <%--                            <form:checkbox path="locTag" label="標籤2" value="${locationInfo.locTag}"/>--%>
                                <br>
                                <p>消費水準:</p>
                                <form:select path="locPriceLevel" value="${locationInfo.locPriceLevel}"
                                             Class="form-control">
                                    <form:option value="未分類" label="請選擇分類..."/>
                                    <form:option value="$" label="$"/>
                                    <form:option value="$ $" label="$ $"/>
                                    <form:option value="$ $ $" label="$ $ $"/>
                                    <form:option value="$ $ $ $" label="$ $ $ $"/>
                                    <form:option value="$ $ $ $ $" label="$ $ $ $ $"/>
                                </form:select>
                                <br>
                                <p>地點簡介:</p>
                                <form:textarea path="locDesc" value="${locationInfo.locDesc}" class="form-control"
                                               style="height:200px;"></form:textarea>
                                <br>
                                <p>城市:</p>
                                <form:input path="locCity" value="${locationInfo.locCity}" class="form-control"
                                            type="text"></form:input>
                                <br>
                                <p>區域:</p>
                                <form:input path="locDist" value="${locationInfo.locDist}" class="form-control"
                                            type="text"></form:input>
                                <br>
                                <p>地址:</p>
                                <form:input path="locAdd" value="${locationInfo.locAdd}" class="form-control"
                                            type="text"></form:input>
                                <br>
                                <p>電話:</p>
                                <form:input path="locTel" value="${locationInfo.locTel}" class="form-control"
                                            type="text"></form:input>
                                <br>
                                <p>網址連結:</p>
                                <form:input path="locLink" value="${locationInfo.locLink}" class="form-control"
                                            type="text"></form:input>

                                <br>
                                <p>營業時間:</p>
                                <sapn>星期一 :</sapn>
                                <span>開始</span>
                                <form:input path="locationOperationTime.mondayOpen"
                                            value="${locationOperationTime.mondayOpen}" type="time" ></form:input>
                                <span>結束</span>
                                <form:input path="locationOperationTime.mondayClose"
                                            value="${locationOperationTime.mondayClose}" type="time"></form:input>
                                <br>
                                <sapn>星期二 :</sapn>
                                <span>開始</span>
                                <form:input path="locationOperationTime.tuesdayOpen"
                                            value="${locationOperationTime.tuesdayOpen}" type="time"></form:input>
                                <span>結束</span>
                                <form:input path="locationOperationTime.tuesdayClose"
                                            value="${locationOperationTime.tuesdayClose}" type="time"></form:input>
                                <br>
                                <sapn>星期三 :</sapn>
                                <span>開始</span>
                                <form:input path="locationOperationTime.wednesdayOpen"
                                            value="${locationOperationTime.wednesdayOpen}" type="time"></form:input>
                                <span>結束</span>
                                <form:input path="locationOperationTime.wednesdayClose"
                                            value="${locationOperationTime.wednesdayClose}"
                                            type="time"></form:input>
                                <br>
                                <sapn>星期四 :</sapn>
                                <span>開始</span>
                                <form:input path="locationOperationTime.thursdayOpen"
                                            value="${locationOperationTime.thursdayOpen}" type="time"></form:input>
                                <span>結束</span>
                                <form:input path="locationOperationTime.thursdayClose"
                                            value="${locationOperationTime.thursdayClose}" type="time"></form:input>
                                <br>
                                <sapn>星期五 :</sapn>
                                <span>開始</span>
                                <form:input path="locationOperationTime.fridayOpen"
                                            value="${locationOperationTime.fridayOpen}" type="time"></form:input>
                                <span>結束</span>
                                <form:input path="locationOperationTime.fridayClose"
                                            value="${locationOperationTime.fridayClose}" type="time"></form:input>
                                <br>
                                <sapn>星期六 :</sapn>
                                <span>開始</span>
                                <form:input path="locationOperationTime.saturdayOpen"
                                            value="${locationOperationTime.saturdayOpen}" type="time"></form:input>
                                <span>結束</span>
                                <form:input path="locationOperationTime.saturdayClose"
                                            value="${locationOperationTime.saturdayClose}" type="time"></form:input>
                                <br>
                                <sapn>星期日 :</sapn>
                                <span>開始</span>
                                <form:input path="locationOperationTime.sundayOpen"
                                            value="${locationOperationTime.sundayOpen}" type="time"></form:input>
                                <span>結束</span>
                                <form:input path="locationOperationTime.sundayClose"
                                            value="${locationOperationTime.sundayClose}" type="time"></form:input>
                                <br>
                                <br>
                                <p>上傳圖片 : </p>

                                <span>封面照片 :</span>
                                <img width="300" height="auto"
                                     src='${contextRoot}/locationInfo/getImgCover/${locationInfo.locId}'/>
                                <form:input path="locationImage.imagCover"
                                            class="form-control" type="file" accept="image/png, image/jpeg"/>
                                <br>

                                <span>相簿照片1 :</span>
                                <img width="300" height="auto"
                                     src='${contextRoot}/locationInfo/getImgG1/${locationInfo.locId}'/>
                                <form:input path="locationImage.imagG1"
                                            class="form-control" type="file" accept="image/png, image/jpeg"/>
                                <br>

                                <span>相簿照片2 :</span>
                                <img width="300" height="auto"
                                     src='${contextRoot}/locationInfo/getImgG2/${locationInfo.locId}'/>
                                <form:input path="locationImage.imagG2"
                                            class="form-control" type="file" accept="image/png, image/jpeg"/>
                                <br>

                                <span>相簿照片3 :</span>
                                <img width="300" height="auto"
                                     src='${contextRoot}/locationInfo/getImgG3/${locationInfo.locId}'/>
                                <form:input path="locationImage.imagG3"
                                            class="form-control"
                                            type="file" accept="image/png, image/jpeg"/>
                                <br>

                                <span>相簿照片4 :</span>
                                <img width="300" height="auto"
                                     src='${contextRoot}/locationInfo/getImgG4/${locationInfo.locId}'/>
                                <form:input path="locationImage.imagG4"
                                            class="form-control"
                                            type="file" accept="image/png, image/jpeg"/>
                                <br>

                                <span>相簿照片5 :</span>
                                <img width="300" height="auto"
                                     src='${contextRoot}/locationInfo/getImgG5/${locationInfo.locId}'/>
                                <form:input path="locationImage.imagG5"
                                            class="form-control"
                                            type="file" accept="image/png, image/jpeg"/>
                                <br>

                                <span>相簿照片6 :</span>
                                <img width="300" height="auto"
                                     src='${contextRoot}/locationInfo/getImgG6/${locationInfo.locId}'/>
                                <form:input path="locationImage.imagG6"
                                            class="form-control"
                                            type="file" accept="image/png, image/jpeg"/>
                                <br>

                                <span>相簿照片7 :</span>
                                <img width="300" height="auto"
                                     src='${contextRoot}/locationInfo/getImgG7/${locationInfo.locId}'/>
                                <form:input path="locationImage.imagG7"
                                            class="form-control"
                                            type="file" accept="image/png, image/jpeg"/>
                                <br>

                                <span>相簿照片8 :</span>
                                <img width="300" height="auto"
                                     src='${contextRoot}/locationInfo/getImgG8/${locationInfo.locId}'/>
                                <form:input path="locationImage.imagG8"
                                            class="form-control"
                                            type="file" accept="image/png, image/jpeg"/>


                                <br>
                                <button type="submit" class="btn btn-primary">送出</button>
                                <a type="button" class="btn btn-primary"
                                   href='${pageContext.request.contextPath}/location/locationManager'>
                                    返回
                                </a>


                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


</body>
</html>
