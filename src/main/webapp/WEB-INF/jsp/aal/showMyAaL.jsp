<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>個人活動管理</title>
<jsp:include page="../layout/navbar.jsp" />

<style>

th{ width: 150px; }
</style>


</head>
<body>
	<div class="container content_view" style="background-color: #ffffff00">
		<div class="content_box" style="width: 100%">
			<div class="content"
				style="background-color: #ffffff00; height: 100%;">
				<div class="row justify-content-center">
					<div class="" style="margin: auto;">
						<h1 style="text-align: center;">活動/課程管理</h1>


						<div class="d-flex justify-content-between">
							<form method="GET" action="${contextRoot}/actandles/shop/postall" class="mb-3">
								<select name="currentStatus" id="status" class="form-control form-select form-select-lg">
										<option value="" selected disabled>
											<jstl:if test="${currentStatus=='approved'}">當前篩選：上架中</jstl:if>
											<jstl:if test="${currentStatus=='opened'}">當前篩選：開放付款</jstl:if>
											<jstl:if test="${currentStatus=='overruled'}">當前篩選：提案駁回</jstl:if>
											<jstl:if test="${currentStatus=='unreviewed'}">當前篩選：審核中</jstl:if>
										</option>
										<option value="approved">上架中</option>
										<option value="opened" >開放付款</option>
										<option value="overruled" >提案駁回</option>
										<option value="unreviewed" >審核中</option>			
								</select>
								
								
							</form>
							<form action="${contextRoot}/actandles/shop/add">
							<input type="submit" class="btn btn-primary" value="新增方案" />
							</form>	
						</div>

						<div class="table-responsive">
							<table class="table table-hover table-bordered table-light">
								<thead>
									<tr>
										<th>項目ID
										<th>商家ID
										<th>名稱
										<th>分類
										<th>新增時間
										<th>舉辦日
										<th>報名費用
										<th>預計名額
										<th>最低開辦人數
										<th>報名截止日
										<th>預覽圖
										<th>
								</thead>
								<tbody>
									<jstl:forEach var="aal" items="${page.content}">
										<tr>
											<td class="align-middle">${aal.id}
											<td class="align-middle">${aal.normalMember.id}
											<td class="align-middle">${aal.name}
											<td class="align-middle"><jstl:if
													test="${aal.topic=='act'}">活動</jstl:if> <jstl:if
													test="${aal.topic=='les'}">課程</jstl:if>
											<td class="align-middle"><fmt:formatDate
													pattern="yyyy/MM/dd HH:mm:ss"
													value="${aal.theDayofSubmission}" />
											<td class="align-middle"><span><fmt:formatDate
														pattern="yyyy/MM/dd" value="${aal.theDayofStarts}" /></span>
											<td class="align-middle">${aal.fee}
											<td class="align-middle">${aal.quota}
											<td class="align-middle">${aal.lowerLimit}
											<td class="align-middle"><span><fmt:formatDate
														pattern="yyyy-MM-dd" value="${aal.deadLine}" /></span>
											<td class="align-middle"><img width="100%"
												src="data:image/png;base64,${aal.base64image}"> <br />
											<td class="align-middle">
												<div>
													<form action="${contextRoot}/actandles/shop/edit">
														<input type="hidden" name="id" value="${aal.id}" /> <input
															type="submit" class="btn btn-primary mb-1" value="編輯"
															onclick="return confirm('啟用編輯將重新審核，確定繼續?')" />
													</form>

													<form action="${contextRoot}/actandles/shop/delete"
														method="post">
														<input type="hidden" name="_method" value="delete" /> <input
															type="hidden" name="id" value="${aal.id}" /> <input
															type="submit" class="btn btn-primary mb-1" value="刪除"
															onclick="return confirm('確定刪除?')" />
													</form>

													<jstl:if test="${aal.currentStatus=='approved'}">
														<form:form method="PUT"
															action="${contextRoot}/actandles/shop/postall">
															<input value="${aal.id}" type="hidden" name="id" />
															<input value="opened" type="hidden" name="currentStatus" />
															<button type="submit" class="btn btn-primary mb-1"
																onclick="return confirm('確定開放?')">開放付款</button>
														</form:form>
													</jstl:if>
												</div>
									</jstl:forEach>
								</tbody>
							</table>

						</div>
						<br />
						<div style="text-align: center;">
							<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
								<jstl:choose>
									<jstl:when test="${page.number == pageNumber-1}">
										<span>${pageNumber}</span>
									</jstl:when>
									<jstl:otherwise>
										<a
											href="${contextRoot}/actandles/shop/postall?p=${pageNumber}&currentStatus=${aal.currentStatus}">${pageNumber}</a>
									</jstl:otherwise>
								</jstl:choose>
							</jstl:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp" />

</body>

<script>
     document.getElementById('status').addEventListener('change', function() {
        // 提交表單
        this.form.submit();
    });
</script>
</html>