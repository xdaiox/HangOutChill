<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/21
  Time: 下午 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
										href="${contextRoot}/member/orders" style="color: azure;">我的訂單</a>
									</li>
									<li class="btn btn-secondary btn-lg"
										style="background: #E1E3E5; border: #c8cbcf 0px"><a
										href="${contextRoot}/article/allfavs" style="color: #7455bb;">收藏文章</a></li>
									<li class="btn btn-primary btn-lg"
										style="background: #9C84BC; border: #c8cbcf 0px;"><a
										href="${contextRoot}/actandles/MemberCenter"
										style="color: azure;">我的活動</a></li>
									<li class="btn btn-secondary btn-lg"
										style="background: #E1E3E5; border: #c8cbcf 0px;"><a
										href="${contextRoot}/normalMember/showFavoriteLocation"
										style="color: #7455bb;">我的地點</a></li>
									<a href="${contextRoot}/discussion/allFavourite"
										style="color: azure;"><li class="btn btn-primary btn-lg"
										style="background: #9C84BC; border: #c8cbcf 0px; border-radius: 0px 0px 5px 5px">收藏討論</li></a>
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
								<jstl:when test="${result.role.roleId==1}">
										<div class="card">
										<div class="card-header" style="text-align: center;font-size: 20px;">報名紀錄</div>
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-hover table-bordered table-light">
													<thead>
														<tr>
															<th>名稱
															<th>分類
															<th>新增時間
															<th>舉辦日
															<th>報名費用
															<th>報名截止日
															<th>連絡電話
															<th>Email
															<th>
													</thead>
													<tbody>
														<jstl:forEach var="signup" items="${signup.content}">
															<tr>

																<td class="align-middle">${signup.name}
																<td class="align-middle"><jstl:if
																		test="${signup.topic=='act'}">活動</jstl:if> <jstl:if
																		test="${signup.topic=='les'}">課程</jstl:if>
																<td class="align-middle"><fmt:formatDate
																		pattern="yyyy-MM-dd HH:mm:ss"
																		value="${signup.theDayofSubmission}" />
																<td class="align-middle"><span><fmt:formatDate
																			pattern="yyyy-MM-dd" value="${signup.theDayofStarts}" /></span>
																<td class="align-middle">${signup.fee}
																<td class="align-middle"><span><fmt:formatDate
																			pattern="yyyy-MM-dd" value="${signup.deadLine}" /></span>
																<td class="align-middle">${signup.normalMember.tel}
																<td class="align-middle">${signup.normalMember.account}
																<td class="align-middle" style="display: flex;">
																	
																	
																
																<jstl:forEach var="checkout" items="${checkout.content}" >
																	<jstl:if test="${checkout.aalId==signup.id}">
																	<button disabled class="btn btn-primary">已完成付款</button>
																	<a href="${contextRoot}/actandles/detail/showorder?aalid=${signup.id}">
																	<button type="button" class="btn btn-primary">查看紀錄</button> </a>
																	</jstl:if>
																	
																	
																<jstl:if test="${checkout.aalId!=signup.id}">
																	<form action="${contextRoot}/actandles/detail/cancal"
																		method="post">
																		<input type="hidden" name="_method" value="delete" />
																		<input type="hidden" name="id" value="${signup.id}" />
																		<input type="submit"
																			class="btn btn-primary" value="取消報名"
																			onclick="return confirm('確定取消?')" /></form>												
																	<jstl:choose>
																		<jstl:when test="${signup.currentStatus=='opened'}">
																		 <form:form method="get"
																			action="${contextRoot}/actandles/detail/lessignup">
																			<input value="${signup.id}" type="hidden" name="id" />
																			<button type="submit" class="btn btn-primary">前往結帳</button>
																		</form:form>
																		</jstl:when>
																		<jstl:when test="${signup.currentStatus!='opened'}">
																		<button disabled class="btn btn-primary">尚未開放</button>
																		</jstl:when>
																	</jstl:choose>
																</jstl:if>
																</jstl:forEach>
																
																
														</jstl:forEach>
													</tbody>
												</table>

											</div>
											<br />
											<div style="text-align: center;">
												<jstl:forEach var="pageNumber" begin="1"
													end="${signup.totalPages}">
													<jstl:choose>
														<jstl:when test="${signup.number == pageNumber-1}">
															<span>${pageNumber}</span>
														</jstl:when>
														<jstl:otherwise>
															<a
																href="${contextRoot}/actandles/MemberCenter?p=${pageNumber}">${pageNumber}</a>
														</jstl:otherwise>
													</jstl:choose>
												</jstl:forEach>
											</div>

										</div>
									</div>
									<div class="card">
										<div class="card-header" style="text-align: center;font-size: 20px;">交易紀錄</div>
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-hover table-bordered table-light">
													<thead>
														<tr>
															<th>訂單編號
															<th>交易時間
															<th>報名人
															<th>報名項目
															<th>舉辦人
															<th>報名類型
															<th>報名人數
															<th>總金額
															<th>付款方式
															<th>報名人電話
													</thead>
													<tbody>
														<jstl:forEach var="checkout" items="${checkout.content}">
															<tr>

																<td class="align-middle">${checkout.orderNumber}
																<td class="align-middle"><fmt:formatDate
																		pattern=" EEEE yyyy-MM-dd HH:mm:ss"
																		value="${checkout.orderTime}" />
																<td class="align-middle">${checkout.memberName}
																<td class="align-middle">${checkout.aalName}
																<td class="align-middle">${checkout.shopName}
																<td class="align-middle">${checkout.aalTopic}<jstl:choose>
																		<jstl:when test="${detail.aalTopic==les}">課程</jstl:when>
																		<jstl:when test="${detail.aalTopic==act}">活動</jstl:when>
																	</jstl:choose>
																<td class="align-middle">${checkout.amount}
																<td class="align-middle">${checkout.paymentAmount}
																<td class="align-middle">${checkout.payment}
																<td class="align-middle">${checkout.tel}
														</jstl:forEach>
													</tbody>
												</table>

											</div>
											<br />
											<div style="text-align: center;">
												<jstl:forEach var="pageNumber" begin="1"
													end="${checkout.totalPages}">
													<jstl:choose>
														<jstl:when test="${checkout.number == pageNumber-1}">
															<span>${pageNumber}</span>
														</jstl:when>
														<jstl:otherwise>
															<a
																href="${contextRoot}/actandles/MemberCenter?pd=${pageNumber}">${pageNumber}</a>
														</jstl:otherwise>
													</jstl:choose>
												</jstl:forEach>
											</div>

										</div>
									</div>
								</jstl:when>

								<jstl:when test="${result.role.roleId==2}">
									<div class="row justify-content-center">
										<div class="col" style="margin: auto;">
											<h1 style="text-align: center;">報名訂單查詢</h1>
											<div class="d-flex justify-content-between">
												<form method="GET"
													action="${contextRoot}/actandles/MemberCenter">
													<span><select name="aalid">
															<option value="" selected disabled>選擇ID:</option>
															<jstl:forEach var="aalid" items="${openedaal}">
																<option value="${aalid.id}">${aalid.id}</option>
															</jstl:forEach>
													</select></span>
													<button type="submit">提交</button>
												</form>

												<form method="GET"
													action="${contextRoot}/actandles/shop/postall">
													<button type="submit">前往活動管理</button>
												</form>

											</div>
										</div>
										<div class="table-responsive">
											<table class="table table-hover table-bordered table-light">
												<thead>
													<tr>
														<th>活動名稱
														<th>活動類別
														<th>報名會員
														<th>報名人數
														<th>付款方式
														<th>付款金額
														<th>連絡電話
														<th>Email
												</thead>
												<tbody>
													<jstl:forEach var="orderdetail"
														items="${orderdetail.content}">
														<tr>
															<td class="align-middle">${orderdetail.aalName}
															<td class="align-middle">${orderdetail.aalTopic}
															<td class="align-middle">${orderdetail.memberName}
															<td class="align-middle">${orderdetail.amount}
															<td class="align-middle">${orderdetail.payment}
															<td class="align-middle">${orderdetail.paymentAmount}
															<td class="align-middle">${orderdetail.tel}
															<td class="align-middle">${orderdetail.email}
													</jstl:forEach>
												</tbody>
											</table>
										</div>
										<br />
										<div style="text-align: center;">
											<jstl:forEach var="pageNumber" begin="1"
												end="${orderdetail.totalPages}">
												<jstl:choose>
													<jstl:when test="${orderdetail.number == pageNumber-1}">
														<span>${pageNumber}</span>
													</jstl:when>
													<jstl:otherwise>
														<a
															href="${contextRoot}/actandles/MemberCenter?aalid=${orderdetail.aalId}&p=${pageNumber}">${pageNumber}</a>
													</jstl:otherwise>
												</jstl:choose>
											</jstl:forEach>
										</div>
									</div>
						</div>
						</jstl:when>
						<jstl:when test="${result.role.roleId==3}"><p style="text-align: center;font-size: 25px;">請前往後臺管理↑</jstl:when>
						</jstl:choose>

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
