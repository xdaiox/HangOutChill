<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/5/14
  Time: 下午 02:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<jsp:include page="../../layout/navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.4.js"
            integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
            crossorigin="anonymous"></script>


    <meta charset="UTF-8">
    <title>新增地點</title>
</head>

<body>
<div class="container-scroller">
<%--    <jsp:include page="../../dbLayout/top_navbar.jsp"/>--%>
    <div class="container-fluid page-body-wrapper">
<%--        <jsp:include page="../../dbLayout/left_navbar.jsp"/>--%>
        <div class="container">
            <div class="content_box" style="width: 100%">
                <h3 style="text-align: center;">地點管理</h3>
                <div class="content" style="background-color: #ffffff00; height: 100%">
                    <div class="col-12" style="margin:auto">
                        <div class="card">
                            <div class="card-header">新增地點</div>
                            <div class="card-body">
                                <form:form class="" modelAttribute="locationInfo" enctype="multipart/form-data"
                                           method="POST" action="${contextRoot}/location/memberLocationInfo/addPage/post">
                                    <form:hidden path="normalMember" value="${result.id}"></form:hidden>
                                    <p>地點名稱 : </p>
                                    <form:input path="locName" class="form-control" type="text"></form:input>
                                    <br>
                                    <p>地點分類 : </p>
                                    <form:select path="locCat" Class="form-control">
                                        <form:option value="未分類" label="請選擇分類..."/>
                                        <form:option value="酒吧" label="酒吧"/>
                                        <form:option value="燒烤" label="燒烤"/>
                                        <form:option value="咖啡廳" label="咖啡廳"/>
                                        <form:option value="餐館" label="餐館"/>
                                        <form:option value="宵夜" label="宵夜"/>
                                    </form:select>

                                    <%--                                    <p>地點標籤:</p>--%>
                                    <%--                            <form:checkbox path="locTag" label="標籤1" value="locTag1"/>--%>
                                    <%--                            <form:checkbox path="locTag" label="標籤2" value="locTag2"/>--%>
                                    <br>
                                    <p>消費水準 : </p>
                                    <form:select path="locPriceLevel" Class="form-control">
                                        <form:option value="未分類" label="請選擇分類..."/>
                                        <form:option value="$" label="$"/>
                                        <form:option value="$ $" label="$ $"/>
                                        <form:option value="$ $ $" label="$ $ $"/>
                                        <form:option value="$ $ $ $" label="$ $ $ $"/>
                                        <form:option value="$ $ $ $ $" label="$ $ $ $ $"/>
                                    </form:select>
                                    <br>
                                    <p>地點簡介 : </p>
                                    <form:textarea path="locDesc" class="form-control"
                                                   style="height:200px;"></form:textarea>
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
                                    <sapn>星期一 :</sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.mondayOpen" type="time"></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.mondayClose" type="time"></form:input>
                                    <br>
                                    <sapn>星期二 :</sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.tuesdayOpen" type="time"></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.tuesdayClose" type="time"></form:input>
                                    <br>
                                    <sapn>星期三 :</sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.wednesdayOpen" type="time"></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.wednesdayClose" type="time"></form:input>
                                    <br>
                                    <sapn>星期四 :</sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.thursdayOpen" type="time"></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.thursdayClose" type="time"></form:input>
                                    <br>
                                    <sapn>星期五 :</sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.fridayOpen" type="time"></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.fridayClose" type="time"></form:input>
                                    <br>
                                    <sapn>星期六 :</sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.saturdayOpen" type="time"></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.saturdayClose" type="time"></form:input>
                                    <br>
                                    <sapn>星期日 :</sapn>
                                    <span>開始</span>
                                    <form:input path="locationOperationTime.sundayOpen" type="time"></form:input>
                                    <span>結束</span>
                                    <form:input path="locationOperationTime.sundayClose" type="time"></form:input>
                                    <br>
                                    <br>

                                    <p>上傳圖片 : </p>
                                    <br>

                                    <span>封面照片 :</span>
                                    <form:input path="locationImage.imagCover" class="form-control" id="targetCover"
                                                type="file" accept="image/png, image/jpeg"/>
                                    <span><img id="previewCover" src=""></span>
                                    <br>
                                    <br>

                                    <span>相簿照片1 :</span>
                                    <form:input path="locationImage.imagG1" class="form-control" id="targetG1"
                                                type="file" accept="image/png, image/jpeg"/>
                                    <span><img id="previewG1" src=""></span>
                                    <br>
                                    <br>


                                    <span>相簿照片2 :</span>
                                    <form:input path="locationImage.imagG2" class="form-control" type="file"
                                                id="targetG2"
                                                accept="image/png, image/jpeg"/>
                                    <span><img id="previewG2" src=""></span>
                                    <br>
                                    <br>

                                    <span>相簿照片3 :</span>
                                    <form:input path="locationImage.imagG3" class="form-control" type="file"
                                                id="targetG3"
                                                accept="image/png, image/jpeg"/>
                                    <span><img id="previewG3" src=""></span>
                                    <br>
                                    <br>

                                    <span>相簿照片4 :</span>
                                    <form:input path="locationImage.imagG4" class="form-control" type="file"
                                                id="targetG4"
                                                accept="image/png, image/jpeg"/>
                                    <span><img id="previewG4" src=""></span>
                                    <br>
                                    <br>

                                    <span>相簿照片5 :</span>
                                    <form:input path="locationImage.imagG5" class="form-control" type="file"
                                                id="targetG5"
                                                accept="image/png, image/jpeg"/>
                                    <span><img id="previewG5" src=""></span>
                                    <br>
                                    <br>

                                    <span>相簿照片6 :</span>
                                    <form:input path="locationImage.imagG6" class="form-control" type="file"
                                                id="targetG6"
                                                accept="image/png, image/jpeg"/>
                                    <span><img id="previewG6" src=""></span>
                                    <br>
                                    <br>

                                    <span>相簿照片7 :</span>
                                    <form:input path="locationImage.imagG7" class="form-control" type="file"
                                                id="targetG7"
                                                accept="image/png, image/jpeg"/>
                                    <span><img id="previewG7" src=""></span>
                                    <br>
                                    <br>

                                    <span>相簿照片8 :</span>
                                    <form:input path="locationImage.imagG8" class="form-control" type="file"
                                                id="targetG8"
                                                accept="image/png, image/jpeg"/>
                                    <span><img id="previewG8" src=""></span>
                                    <br>
                                    <br>

                                    <%--                                    審核狀態--%>
                                    <form:input path="locStatus" class="form-control" type="hidden" value="false" />

                                    <br>
                                    <button type="submit" class="btn btn-primary">送出</button>


                                    <a type="button" class="btn btn-primary"
                                            href='${pageContext.request.contextPath}/location/memberLocationInfo/locationManager'>
                                        返回
                                    </a>
                                    <br>


                                </form:form>


                                <br>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>

</script>
<script>

    //處圖片上傳預覽
    function previewImage(input, preview) {
        input.addEventListener('change', () => {
            const file = input.files[0];
            const reader = new FileReader();

            reader.addEventListener('load', () => {
                preview.src = reader.result;
            });

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        });
    }
    // 函數處理預覽
    const inputCover = document.getElementById("targetCover");
    const previewCover = document.getElementById("previewCover");
    previewImage(inputCover, previewCover);

    const inputG1 = document.getElementById("targetG1");
    const previewG1 = document.getElementById("previewG1");
    previewImage(inputG1, previewG1);

    const inputG2 = document.getElementById("targetG2");
    const previewG2 = document.getElementById("previewG2");
    previewImage(inputG2, previewG2);

    const inputG3 = document.getElementById("targetG3");
    const previewG3 = document.getElementById("previewG3");
    previewImage(inputG1, previewG3);

    const inputG4 = document.getElementById("targetG4");
    const previewG4 = document.getElementById("previewG4");
    previewImage(inputG4, previewG4);

    const inputG5 = document.getElementById("targetG5");
    const previewG5 = document.getElementById("previewG5");
    previewImage(inputG5, previewG5);

    const inputG6 = document.getElementById("targetG6");
    const previewG6 = document.getElementById("previewG6");
    previewImage(inputG6, previewG6);

    const inputG7 = document.getElementById("targetG7");
    const previewG7 = document.getElementById("previewG7");
    previewImage(inputG7, previewG7);

    const inputG8 = document.getElementById("targetG8");
    const previewG8 = document.getElementById("previewG8");
    previewImage(inputG8, previewG8);

</script>


</body>
</html>
