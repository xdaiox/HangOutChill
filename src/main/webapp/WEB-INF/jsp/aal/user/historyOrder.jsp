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
<div class="container">
	<h1 style="text-align: center;">訂單成立</h1>
		<div class="row justify-content-center">
		<div class="card" style="font-size: 20px;" >
					<div class="card-header" style="text-align: center;" >訂單編號:${detail.orderNumber}</div>
					<div class="card-body">
					<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">交易時間:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate pattern=" EEEE yyyy-MM-dd HH:mm:ss" value="${detail.orderTime}"/>">
					    </div>
				    </div>
					<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">報名人:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="${detail.memberName}">
					    </div>
				    </div>
					<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">報名項目:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="${detail.aalName}">
					    </div>
				    </div>
					<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">舉辦人:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="${detail.shopName}">
					    </div>
				    </div>
					
					<jstl:choose>
					<jstl:when test="${detail.aalTopic==les}">
						<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">報名類型:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="課程">
					    </div>
				    </div>
					</jstl:when>
					
					<jstl:when test="${detail.aalTopic==act}">
								<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">報名類型:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="活動">
					    </div>
				    </div>
					</jstl:when>					
					</jstl:choose>
					<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">報名人數:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="${detail.amount}">
					    </div>
				    </div>
					<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">總金額:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="${detail.paymentAmount}">
					    </div>
				    </div>
					<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">付款方式:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="${detail.payment}">
					    </div>
				    </div>
					<div class="mb-3 row">
					    <label  class="col-md-5 col-form-label">報名人電話:</label>
					    <div class="col">
					      <input type="text" readonly class="form-control-plaintext" value="${detail.tel}">
					    </div>
				    </div>
					

					</div>
					</div>
					</div>
					</div>

	<jsp:include page="../../layout/footer.jsp" />

</body>
</html>