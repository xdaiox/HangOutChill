<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/5/3
  Time: 下午 03:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <title>修改會員資料</title>
</head>
<body>
<div class="container-scroller">
    <jsp:include page="../dbLayout/top_navbar.jsp" />

    <div class="container-fluid page-body-wrapper">
        <jsp:include page="../dbLayout/left_navbar.jsp" />
        <div class="container content_view">
            <div class="content_box">

                <div class="col-8" style="margin:auto">
                    <div class="card">
                        <div class="card-header">
                            欲更改會員資料，請直接修改資料
                        </div>
                        <div class="card-body">
                            <form:form modelAttribute="updateMember" method="PUT" action="${contextRoot}/back/backUpdateMember">
                                <form:input path="id" value="${updateMember.id}" type="hidden" class="form-control"/>

                                <div class="mb-3 row">
                                    <label class="col-sm-3 col-form-label">會員信箱：</label>
                                    <div class="col-sm-9">
                                        <form:input path="account" value="${updateMember.account}" class="form-control"/>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label class="col-sm-3 col-form-label">會員真實姓名：</label>
                                    <div class="col-sm-9">
                                        <form:input path="reallName" value="${updateMember.reallName}" class="form-control"/>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label class="col-sm-3 col-form-label">會員生日：</label>
                                    <div class="col-sm-9">
                                        <form:input path="birthdate" value="${updateMember.birthdate}" class="form-control"
                                                    type="date"/>
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label class="col-sm-3 col-form-label">會員性別：</label>
                                    <div class="col-sm-9">
                                        <jstl:choose>
                                            <jstl:when test="${updateMember.gender == 'male'}">
                                                <div class="form-check form-check-inline">
                                                    <form:radiobutton
                                                            path="gender" value="male" checked="${updateMember.gender} == male" />
                                                    <label class="form-check-label "  style="display: inline-block; margin-left: 0px">男</label>

                                                    <form:radiobutton path="gender" value="female"/>
                                                    <label class="form-check-label " style="display: inline-block; margin-left: 0px">女</label>
                                                </div>

                                            </jstl:when>
                                            <jstl:otherwise>
                                                <div class="form-check form-check-inline">
                                                    <form:radiobutton
                                                            path="gender" value="male"  />
                                                    <label class="form-check-label" style="display: inline-block; margin-left: 0px">男</label>
                                                    <form:radiobutton path="gender" value="female" checked="${updateMember.gender} == female"/>
                                                    <label class="form-check-label" style="display: inline-block; margin-left: 0px">女</label>
                                                </div>
                                            </jstl:otherwise>
                                        </jstl:choose>
                                        <br>
                                        <button type="submit" class="btn btn-outline-primary btn-lg btn-block ">送出修改表單</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


</body>
</html>
