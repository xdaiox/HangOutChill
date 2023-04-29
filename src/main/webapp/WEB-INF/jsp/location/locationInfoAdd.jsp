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
    <body>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-3 mt-3">
    <div class="table-responsive shadow-sm">
        <h2>請輸入地點資料：</h2>
        <form:form method="post" action="${contextRoot}/locationManager/addLocationInfo/post" modelAttribute="locationInfo"
                   enctype="multipart/form-data">
            <table class="table">

                <tr>
                    <td><span>*</span> <form:label path="locName">地點名稱 :</form:label></td>
                    <td><form:input name="locName" id="locNmae" path="locName"/><span
                            id="nerror" class="error"></span><span
                            id="ncorrect" class="correct"></span></td>
                </tr>
                <tr>
                    <td><span>*</span> <form:label path="locCat">地點分類 :</form:label></td>
                    <td><form:select name="locCat" id="locCat" path="locCat">
                        <form:option value="-1" label="請選擇..."/>
                        <form:option value="分類1" label="分類1"/>
                        <form:option value="分類2" label="分類1"/>
                        <form:option value="分類3" label="分類1"/>
                    </form:select><span id="catgerror" class="error"></span><span id="catgcorrect" class="correct"></span>
                    </td>
                </tr>
                <tr>
                    <td><span>*</span> <form:label path="locTag">地點標籤 :</form:label></td>
                    <td>
                        <form:checkbox path="locTag" value="標籤1" label="標籤1" />
                        <form:checkbox path="locTag" value="標籤2" label="標籤2" />
                        <form:checkbox path="locTag" value="標籤3" label="標籤3" />
                        <form:checkbox path="locTag" value="標籤4" label="標籤4" />
                        <form:checkbox path="locTag" value="標籤5" label="標籤5" />
                    </td>
                </tr>
                <tr>
                    <td><span>* </span><form:label path="locPriceLevel">消費水準:</form:label></td>
                    <td>
                        <form:radiobutton path="locPriceLevel" value="1" label="$" />
                        <form:radiobutton path="locPriceLevel" value="2" label="$$" />
                        <form:radiobutton path="locPriceLevel" value="3" label="$$$" />
                        <form:radiobutton path="locPriceLevel" value="4" label="$$$$" />
                        <form:radiobutton path="locPriceLevel" value="5" label="$$$$$" />
                    </td>
                </tr>
                <tr>
                    <td><span>* </span><form:label path="locDesc">地點簡介 :</form:label></td>
                    <td><form:textarea type="text" name="locDesc" id="locDesc" cols="30" rows="10"
                                       path="locDesc"/><span
                            id="contenterror" class="error"></span><span
                            id="contentcorrect" class="correct"></span></td>
                </tr>
                <tr>
                    <td><span>*</span> <form:label path="locCity">地點城市 :</form:label></td>
                    <td><form:input name="locCity" id="locCity" path="locCity"/><span
                            id="nerror" class="error"></span><span
                            id="ncorrect" class="correct"></span></td>
                </tr>
                <tr>
                    <td><span>*</span> <form:label path="locDist">地點區域 :</form:label></td>
                    <td><form:input name="locDist" id="locDist" path="locDist"/><span
                            id="nerror" class="error"></span><span
                            id="ncorrect" class="correct"></span></td>
                </tr>
                <tr>
                    <td><span>*</span> <form:label path="locAdd">地點地址 :</form:label></td>
                    <td><form:input name="locAdd" id="locAdd" path="locAdd"/><span
                            id="nerror" class="error"></span><span
                            id="ncorrect" class="correct"></span></td>
                </tr>
                <tr>
                    <td><span>*</span> <form:label path="locTel">地點電話 :</form:label></td>
                    <td><form:input name="locTel" id="locTel" path="locTel"/><span
                            id="nerror" class="error"></span><span
                            id="ncorrect" class="correct"></span></td>
                </tr>
                <tr>
                    <td><span>*</span> <form:label path="locLink">網址連結 :</form:label></td>
                    <td><form:input name="locLink" id="locLink" path="locLink"/><span
                            id="nerror" class="error"></span><span
                            id="ncorrect" class="correct"></span></td>
                </tr>
                <tr>
                    <td><span>*</span> <form:label path="locOpt">營業時間 :</form:label></td>

                </tr>
            </table>
        </form:form>
    </div>
</main>
</body>
</html>
