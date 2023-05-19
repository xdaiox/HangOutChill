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
<jsp:include page="../../layout/navbar.jsp" />

</head>
<body>
	<div class="container content_view mb-3" style="background-color: #ffffff00">
		<div class="content_box" style="width: 100%">
			<div class="content"
				style="background-color: #ffffff00; height: 100%;">
				<div class="row justify-content-center">
					<div style="margin: auto;">
					<jstl:choose>
						<jstl:when test="${checksignup==1}">
							<h1 style="text-align: center;">結帳資訊確認</h1>
						</jstl:when>
						<jstl:otherwise>
							<h1 style="text-align: center;">報名資訊確認</h1>	
						</jstl:otherwise>
					</jstl:choose>
						<div style="font-size: 20px;">
							
							<div class="card"  >
								<div class="card-header" style="text-align: center;">報名活動資訊:</div>
									<div class="card-body">
										<div class="mb-3 row">
									    <label  class="col-md-5 col-form-label">商家名稱:</label>
										    <div class="col">
										      <input type="text" readonly class="form-control-plaintext" value="${aal.normalMember.nickName}">
								    	</div>
				    				</div>								
										<div class="mb-3 row">
									    <label  class="col-md-5 col-form-label">活動名稱:</label>
										    <div class="col">
										      <input type="text" readonly class="form-control-plaintext" value="${aal.name}">
								    	</div>
				    				</div>
										<div class="mb-3 row">
									    <label  class="col-md-5 col-form-label">分類:</label>
										    <div class="col">
										     <jstl:if test="${aal.topic=='act'}"><input type="text" readonly class="form-control-plaintext" value="活動"></jstl:if>
										     <jstl:if test="${aal.topic=='les'}"><input type="text" readonly class="form-control-plaintext" value="課程"></jstl:if>
								    	</div>
				    				</div>
										<div class="mb-3 row">
									    <label  class="col-md-5 col-form-label">舉辦日:</label>
										    <div class="col">
										      <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate
													pattern="yyyy-MM-dd" value="${aal.theDayofStarts}" />">
								    	</div>
				    				</div>
										<div class="mb-3 row">
									    <label  class="col-md-5 col-form-label">報名費用:</label>
										    <div class="col">
										      <input type="text" readonly class="form-control-plaintext" id="totalPreview" value="${aal.fee}">
								    	</div>
				    				</div>
			
							<form:form method="post"
								action="${contextRoot}/actandles/detail/lessignup">
								
								<jstl:if test="${checksignup==1}">
								<div class="card-header" style="text-align: center;">報名會員資訊:</div>
									<div class="mb-3 row">
									    <label  class="col-md-5 col-form-label">聯絡信箱:</label>
										    <div class="col">
										      <input type="text" readonly class="form-control-plaintext"  value="${result.account}">
								    	</div>
				    				</div>
									<div class="mb-3 row">
									    <label  class="col-md-5 col-form-label">姓名:</label>
										    <div class="col">
										      <input type="text" readonly class="form-control-plaintext"  value="${result.reallName}">
								    	</div>
				    				</div>
									<div class="mb-3 row">
									    <label  class="col-md-5 col-form-label">電話:</label>
										    <div class="col">
										      <input type="text" readonly class="form-control-plaintext"  value="${result.tel}">
								    	</div>
				    				</div>
				    			 <jstl:if test="${aal.topic=='act'}">
									<div class="mb-3 row">
									    <label  class="col-md-5 col-form-label">人數:</label>
										    <div class="col">
										      <input type="number" class="form-control-plaintext" name="numbersOfPeople"  id="totalTarget" value="1" min="1" max="${aal.quota-aal.registered}" onkeydown="return false">
								    	</div>
				    				</div>
								</jstl:if>	
								<jstl:if test="${aal.topic=='les'}">
										<input name="numbersOfPeople" value="1" type="hidden" />
									</jstl:if>
									
								</jstl:if>
								
							<div style="text-align: center;">	
								<jstl:choose>
									<jstl:when test="${checksignup==0}">
										<input value="${aal.id}" type="hidden" name="id" />
										<button type="submit" class="btn btn-primary">確定報名</button>
									</jstl:when>
									<jstl:when test="${checksignup==1}">
									</jstl:when>
								</jstl:choose>
							</div>
							</form:form>
							<div style="text-align: center;">
								<form:form method="post"
									action="${contextRoot}/actandles/detail/checkout">
									<jstl:if test="${checksignup==1}">
									<jstl:choose>
										<jstl:when test="${checkorder==1}">
											<a href="${contextRoot}/actandles/detail/showorder?aalid=${aal.id}">
											<button type="button" class="btn btn-primary">查看紀錄</button> </a>
											</jstl:when>
										<jstl:when test="${checkorder==0}">
											<input name="numbersOfPeople" id="target" type="hidden" />
											<input value="${aal.id}" type="hidden" name="id" />
											<button type="submit" onclick="getthenumber()" class="btn btn-primary">準備結帳</button>
										</jstl:when>
									</jstl:choose>
									</jstl:if>
								</form:form>
							</div>

						</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
	<jsp:include page="../../layout/footer.jsp" />

<script>
	function getthenumber(){
	const number=document.querySelectorAll('[name="numbersOfPeople"]')[0].value
	console.log(number)
	document.getElementById("target").value=number;

	}
	const unit_price = document.getElementById("totalPreview").value
	document.getElementById("totalTarget").addEventListener('change',function(){
		let multiplier = document.getElementById("totalTarget").value
		const totalpre =document.getElementById("totalPreview")
		let total = unit_price*multiplier
		totalpre.value=total
	})


</script>
</body>
</html>