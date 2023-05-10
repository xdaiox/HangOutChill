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
                                <li class="btn btn-primary btn-lg" style=" background: #9C84BC;border: #c8cbcf 0px;"><a href="#"  style="color: azure;" >我的活動</a></li>
                                <li class="btn btn-secondary btn-lg" style="background: #E1E3E5; border: #c8cbcf 0px ;" ><a href="#" style="color: #7455bb;">收藏地點</a></li>
                                <li class="btn btn-primary btn-lg" style=" background: #9C84BC;border: #c8cbcf 0px;  border-radius: 0px 0px 5px 5px"><a href="#"  style="color: azure;" >收藏討論</a></li>
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
                                        <h3 class="card-title">會員資訊</h3>
                                        <table class="table table-borderless" >
                                            <form:form modelAttribute="result" method="PUT" action="${contextRoot}/member/updateInfo" enctype="multipart/form-data">
                                                <form:input path="id" value="${result.id}" type="hidden"/>
                                            <thead>
                                            <tr>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col" class="col-6"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <th scope="row" style="width: 160px">會員註冊信箱：</th>
                                                <td style=" text-align: left; "><form:input path="account" value="${result.account}" readonly="true"/></td>
                                                <td style="font-weight: bold">大頭貼</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="width: 160px">會員真實姓名：</th>
                                                <td style=" text-align: left; "><form:input path="reallName" value="${result.reallName}"/></td>
                                                <td rowspan="5"><img src="${result.photoB64}" id="preview"><form:input path="file" type="file" id="target"/></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="width: 160px">會員暱稱：</th>
                                                <td style=" text-align: left; "><form:input path="nickName" value="${result.nickName}"/></td>

                                            </tr>
                                            <tr>
                                                <th scope="row" style="width: 160px">會員出生年月日：</th>
                                                <td style=" text-align: left; "><form:input path="birthdate" value="${result.birthdate}" type="date"/></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="width: 160px">會員手機：</th>
                                                <td style=" text-align: left; "><form:input path="tel" value="${result.tel}" /></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="width: 160px">會員性別：</th>
                                                <td style=" text-align: left; ">
                                                    <jstl:choose><jstl:when test="${result.gender =='male'}"><form:radiobutton
                                                        path="gender" value="male" checked="${result.gender} == male"/>
                                                    <label class="form-check-label">男</label>
                                                    <form:radiobutton path="gender" value="female"/>
                                                    <label class="form-check-label">女</label>
                                                    </jstl:when><jstl:otherwise>
                                                        <form:radiobutton
                                                                path="gender" value="male" />
                                                        <label class="form-check-label">男</label>
                                                        <form:radiobutton path="gender" value="female" checked="${result.gender} == female"/>
                                                        <label class="form-check-label">女</label>
                                                    </jstl:otherwise>
                                                    </jstl:choose></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="width: 160px"></th>
                                                <td style=" text-align: left; "><button type="submit" class="btn btn-primary">送出修改</button></td>
                                                <td><a href="${contextRoot}/member/resetPwd?id=${result.id}" class="link">修改密碼</a></td>
                                            </tr>
                                            </tbody>
                                            </form:form>
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
<script >
    //圖片上傳前預覽
    const input = document.getElementById("target")
    const preview = document.getElementById("preview")
    input.addEventListener('change', () => {
        const file = input.files[0];
        const reader = new FileReader();

        reader.addEventListener('load', () => {
            preview.src = reader.result;
        });

        if (file) {
            reader.readAsDataURL(file);
        } else {
            // preview.src = "";
        }
    });
</script>
</body>
</html>
