<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/21
  Time: 下午 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<html>
<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextRoot}/css/member/register.css">
<title>一般會員中心</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp" />
	<section class="search">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<aside>
						<div class="aside-body">
							<div class=" btn-group-vertical my-3">
								<ul>
									<li class="btn btn-primary btn-lg"
										style="margin: 0px 0px 0px -1px; background: #9C84BC; border: #c8cbcf 0px; border-radius: 5px 5px 0px 0px"><a
										href="#" style="color: azure;">我的訂單</a></li>
									<li class="btn btn-secondary btn-lg"
										style="background: #E1E3E5; border: #c8cbcf 0px"><a
										href="#" style="color: #7455bb;">收藏文章</a></li>
									<li class="btn btn-primary btn-lg"
										style="background: #9C84BC; border: #c8cbcf 0px;"><a
										href="#" style="color: azure;">我的活動</a></li>
									<li class="btn btn-secondary btn-lg"
										style="background: #E1E3E5; border: #c8cbcf 0px;"><a
										href="#" style="color: #7455bb;">收藏地點</a></li>
									<li class="btn btn-primary btn-lg"
										style="background: #9C84BC; border: #c8cbcf 0px; border-radius: 0px 0px 5px 5px"><a
										href="#" style="color: azure;">收藏討論</a></li>
								</ul>
							</div>
						</div>
					</aside>
				</div>
				<div class="col-md-9">
					<div class="col-md-12">
						<div class="col-sm-12">
							<br>
							<jstl:choose>
								<jstl:when test="${result.role.roleId==1}">一般會員</jstl:when>
								<jstl:when test="${result.role.roleId==2}">
									<div class="row justify-content-center">
										<div class="" style="margin: auto;">
											<h1 style="text-align: center;">活動/課程管理</h1>
											<div class="table-responsive">
												<table class="table table-hover table-bordered table-light">
													<thead>
														<tr>
															<th>ID
															<th>名稱
															<th>分類
															<th>新增時間
															<th>舉辦日
															
															<th>報名截止日
														
															<th>預覽圖
															<th>
													</thead>
													<tbody>
														<jstl:forEach var="aal" items="${page.content}">
															<tr>
																<td class="align-middle">${aal.id}
																
																<td class="align-middle">${aal.name}
																
																<td class="align-middle"><jstl:if
																		test="${aal.topic=='act'}">活動</jstl:if> <jstl:if
																		test="${aal.topic=='les'}">課程</jstl:if>
																<td class="align-middle"><fmt:formatDate
																		pattern="yyyy-MM-dd HH:mm:ss"
																		value="${aal.theDayofSubmission}" />
																<td class="align-middle"><span><fmt:formatDate
																			pattern="yyyy-MM-dd" value="${aal.theDayofStarts}" /></span>
																
																<td class="align-middle"><span><fmt:formatDate
																			pattern="yyyy-MM-dd" value="${aal.deadLine}" /></span>

																<td class="align-middle"><img width="200px"
																	height="200px"
																	src="data:image/png;base64,${aal.base64image}"> <br />
																<td class="align-middle">
																	<div style="display: flex">
																		<form action="${contextRoot}/actandles/shop/edit">
																			<input type="hidden" name="id" value="${aal.id}" />
																			<input type="submit"
																				class="btn btn-outline-info btn-sm" value="編輯" />
																		</form>

																		<form action="${contextRoot}/actandles/shop/delete"
																			method="post">
																			<input type="hidden" name="_method" value="delete" />
																			<input type="hidden" name="id" value="${aal.id}" />
																			<input type="submit"
																				class="btn btn-outline-danger btn-sm" value="刪除"
																				onclick="return confirm('確定刪除?')" />
																		</form>
																	</div>
														</jstl:forEach>
													</tbody>
												</table>

											</div>
											<br />
											<div style="text-align: center;">
												<jstl:forEach var="pageNumber" begin="1"
													end="${page.totalPages}">
													<jstl:choose>
														<jstl:when test="${page.number == pageNumber-1}">
															<span>${pageNumber}</span>
														</jstl:when>
														<jstl:otherwise>
															<a
																href="${contextRoot}/actandles/shop/postall?p=${pageNumber}">${pageNumber}</a>
														</jstl:otherwise>
													</jstl:choose>
												</jstl:forEach>
											</div>
										</div>
									</div>
								</jstl:when>
								<jstl:when test="${result.role.roleId==3}">管理員</jstl:when>
							</jstl:choose>
							<div class="card">
								<div class="card-body">
									<h3 class="card-title">會員資訊</h3>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../layout/footer.jsp" />
	<script>
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
