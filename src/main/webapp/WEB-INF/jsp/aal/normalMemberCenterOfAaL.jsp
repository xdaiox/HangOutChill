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
										<div class="col" style="margin: auto;">
											<h1 style="text-align: center;">開放報名項目查詢</h1>
											<div>
											<form method="GET" action="${contextRoot}/actandles/gotoMemberCenter">
											<span><select name="aalid"  >
													<option value="" selected disabled>選擇ID:</option>
												<jstl:forEach  var="aalid" items="${openedaal}">
													<option value="${aalid.id}" >${aalid.id}</option>
												</jstl:forEach>
											</select></span>
											<button type="submit" >提交</button>
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
														<jstl:forEach var="orderdetail" items="${orderdetail.content}">
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
																href="${contextRoot}/actandles/gotoMemberCenter?aalid=${orderdetail.aalId}&p=${pageNumber}">${pageNumber}</a>
														</jstl:otherwise>
													</jstl:choose>
												</jstl:forEach>
											</div>
										</div>
									</div>
								</jstl:when>
								<jstl:when test="${result.role.roleId==3}">管理員</jstl:when>
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
