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
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新增地點</title>
</head>

<body>
<div class="container-scroller">
    <jsp:include page="../dbLayout/top_navbar.jsp" />
    <div class="container-fluid page-body-wrapper">
        <jsp:include page="../dbLayout/left_navbar.jsp" />
        <div class="container">
            <div class="content_box" style="width: 100%">
                <h3 style="text-align: center;">地點管理</h3>
                <div class="content" style="background-color: #ffffff00; height: 100%">
                    <div class="col-12" style="margin:auto">
                        <div class="card">
                            <div class="card-header">新增地點</div>
                            <div class="card-body">
                                <form:form class="" modelAttribute="locationInfo" enctype="multipart/form-data" method="POST" action="${contextRoot}/location/locationManager/addPage/post">
                                    <p>地點名稱 : </p>
                                    <form:input path="locName" class="form-control" type="text"></form:input>
                                    <br>
                                    <p>地點分類 : </p>
                                    <form:select path="locCat" Class="form-control">
                                        <form:option value="未分類" label="請選擇分類..."/>
                                        <form:option value="分類1" label="分類1"/>
                                        <form:option value="分類2" label="分類2"/>
                                        <form:option value="分類3" label="分類3"/>
                                    </form:select>

                                    <p>地點標籤:</p>
                                    <%--                            <form:checkbox path="locTag" label="標籤1" value="locTag1"/>--%>
                                    <%--                            <form:checkbox path="locTag" label="標籤2" value="locTag2"/>--%>
                                    <br>
                                    <p>消費水準 : </p>
                                    <form:select path="locPriceLevel" Class="form-control">
                                        <form:option value="0" label="請選擇分類..."/>
                                        <form:option value="1" label="$"/>
                                        <form:option value="2" label="$ $"/>
                                        <form:option value="3" label="$ $ $"/>
                                        <form:option value="4" label="$ $ $ $"/>
                                        <form:option value="5" label="$ $ $ $ $"/>
                                    </form:select>
                                    <br>
                                    <p>地點簡介 : </p>
                                    <form:textarea path="locDesc" class="form-control" style="height:200px;" ></form:textarea>
                                    <br>
                                    <p>城市 : </p>
                                    <form:input path="locCity" class="form-control" type="text"></form:input>
                                    <br>
                                    <p>區域 : </p>
                                    <form:input path="locDist" class="form-control" type="text"></form:input>
                                    <br>
                                    <p>地址 : </p>
                                    <form:input path="locAdd" class="form-control" type="text"></form:input>
                                    <br>
                                    <p>電話 : </p>
                                    <form:input path="locTel" class="form-control" type="text"></form:input>
                                    <br>
                                    <p>網址連結 : </p>
                                    <form:input path="locLink" class="form-control" type="text"></form:input>
                                    <br>
                                    <p>營業時間 : </p>
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
                                    <br>
                                    <sapn>星期四 : </sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.thursdayOpen" type="time" ></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.thursdayClose" type="time" ></form:input>
                                    <br>
                                    <sapn>星期五 : </sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.fridayOpen" type="time" ></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.fridayClose" type="time" ></form:input>
                                    <br>
                                    <sapn>星期六 : </sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.saturdayOpen" type="time" ></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.saturdayClose" type="time" ></form:input>
                                    <br>
                                    <sapn>星期日 : </sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.sundayOpen" type="time" ></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.sundayClose" type="time" ></form:input>
                                    <br>
                                    <br>
                                    <p>上傳圖片 : </p>
                                    <span>封面照片 :</span>
                                    <form:input path="locationImage.imagCover" class="form-control" type="file" accept="image/png, image/jpeg" />
                                    <span>相簿照片1 :</span>
                                    <form:input path="locationImage.imagG1" class="form-control" type="file" accept="image/png, image/jpeg" />
                                    <span>相簿照片2 :</span>
                                    <form:input path="locationImage.imagG2" class="form-control" type="file" accept="image/png, image/jpeg" />
                                    <span>相簿照片3 :</span>
                                    <form:input path="locationImage.imagG3" class="form-control" type="file" accept="image/png, image/jpeg" />
                                    <span>相簿照片4 :</span>
                                    <form:input path="locationImage.imagG4" class="form-control" type="file" accept="image/png, image/jpeg" />
                                    <span>相簿照片5 :</span>
                                    <form:input path="locationImage.imagG5" class="form-control" type="file" accept="image/png, image/jpeg" />
                                    <span>相簿照片6 :</span>
                                    <form:input path="locationImage.imagG6" class="form-control" type="file" accept="image/png, image/jpeg" />
                                    <span>相簿照片7 :</span>
                                    <form:input path="locationImage.imagG7" class="form-control" type="file" accept="image/png, image/jpeg" />
                                    <span>相簿照片8 :</span>
                                    <form:input path="locationImage.imagG8" class="form-control" type="file" accept="image/png, image/jpeg" />




                                    <br><button type="submit" class="btn btn-primary">送出</button>
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
