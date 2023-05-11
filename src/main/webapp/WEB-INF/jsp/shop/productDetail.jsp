<%--
  Created by IntelliJ IDEA.
  User: iztuc
  Date: 2023/4/20
  Time: 下午 03:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="" type="image/png">
<link rel="stylesheet" href="${contextRoot}/css/shop/bootstrap.min.css">
<link rel="stylesheet" href="${contextRoot}/css/shop/templatemo.css">
<title>產品資訊頁</title>

<jsp:include page="layout/navbar.jsp" />


</head>
<body>
	<main>
		<section class="category-page area-padding">
			<div class="container" style="max-width: 70%">
				<div class="row">
					<div class="col-lg-5 mt-5">
						<div class="card mb-3">
							<img class="card-img img-fluid"
								style="height: 500px; width: 500px"
								src='<c:url value="/shop/getPicture/${product.productId}" />'
								alt="Card image cap" id="product-detail">
						</div>
						<div class="row">
							<!--Start Controls-->
							<div class="col-1 align-self-center">
								<a href="#multi-item-example" role="button" data-bs-slide="prev">
									<i class="text-dark fas fa-chevron-left"></i> <span
									class="sr-only">Previous</span>
								</a>
							</div>
							<!--End Controls-->
							<!--Start Carousel Wrapper-->
							<div id="multi-item-example"
								class="col-10 carousel slide carousel-multi-item"
								data-bs-ride="carousel">
								<!--Start Slides-->
								<div class="carousel-inner product-links-wap" role="listbox">

									<!--First slide-->
									<!-- 									<div class="carousel-item active"> -->
									<div class="row">
										<div class="col">
											<a href="#"> <img class="card-img img-fluid"
												style="height: 100px; width: 100px"
												src='<c:url value="/shop/getPicture/${product.productId}" />'
												alt="">
											</a>
										</div>
										<c:forEach var="photo" items="${product.photos}">
											<div class="col">
												<a href="#"> <img class="card-img img-fluid"
													style="height: 100px; width: 100px"
													src='<c:url value="/shop/getExtraPicture?photoid=${photo.photoId}" />'
													alt="">
												</a>
											</div>
										</c:forEach>
									</div>
									<!-- 									</div> -->
									<!--/.First slide-->
								</div>
								<!--End Slides-->
							</div>
							<!--End Carousel Wrapper-->
							<!--Start Controls-->
							<div class="col-1 align-self-center">
								<a href="#multi-item-example" role="button" data-bs-slide="next">
									<i class="text-dark fas fa-chevron-right"></i> <span
									class="sr-only">Next</span>
								</a>
							</div>
							<!--End Controls-->
						</div>
					</div>
					<!-- col end -->
					<div class="col-lg-7 mt-5">
						<div class="card">
							<div class="card-body">
								<h1 class="h2">${product.productName}</h1>
								<p class="h3 py-2">$ ${product.unitPrice}</p>
								<!-- <p class="py-2">
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-secondary"></i>
                                <span class="list-inline-item text-dark">Rating 4.8 | 36 Comments</span>
                            </p> -->
								<!-- <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Brand:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>Easy Wear</strong></p>
                                </li>
                            </ul> -->

								<h6>產品描述:</h6>
								<p>${product.productDesc}</p>
								<!-- <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Avaliable Color :</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>White / Black</strong></p>
                                </li>
                            </ul> -->

								<h6>產品規格:</h6>
								<ul class="list-unstyled pb-3">
									<li>${product.productSpec }</li>

								</ul>

									<input type="hidden" name="product-title" value="${product.productId}" id="productid">
									<div class="row">
										<div class="col-auto">
											<!-- 產品size -->
											<!-- <ul class="list-inline pb-3">
                                            <li class="list-inline-item">Size :
                                                <input type="hidden" name="product-size" id="product-size" value="S">
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">S</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">M</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">L</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">XL</span></li>
                                        </ul> -->
										</div>
										<div class="col-auto">
											<ul class="list-inline pb-3">
												<li class="list-inline-item text-right">購買數量： <input
													type="hidden" name="product-quanity"
													value="1">
												</li>
												<li class="list-inline-item"><span
													class="btn btn-outline-secondary" id="btn-minus">-</span></li>
												<li class="list-inline-item"><span
													class="form-control text-center" id="var-value">1</span></li>
												<li class="list-inline-item"><span
													class="btn btn-outline-secondary" id="btn-plus">+</span></li>
											</ul>
										</div>
									</div>
									<div class="row pb-3">
										<div class="col d-grid">
											<a class="btn btn-success btn-lg" href='<c:url value="/shop/shoppingCart" />'>立即購買</a>
										</div>
										<div class="col d-grid">
											<button type="submit" class="btn btn-success btn-lg"
												name="submit" value="addtocard" id="submitBtn">加入購物車</button>
										</div>
									</div>
								<h6>運送及付款方式:</h6>
								<ul class="list-unstyled pb-3">
									<li>運送方式：到府、超商取貨</li>
									<li></li>
									<li>付款方式：信用卡、LINEPay</li>
									<li></li>
								</ul>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>



	</main>




	<!-- 	<footer class="footer-area"> </footer> -->
	<jsp:include page="../layout/footer.jsp" />
	<script src="${contextRoot}/js/jquery-3.6.4.min.js"></script>
	<script>
	// 更新購物車小圖示標示
	updateCartItems();
	
    // 加入購物車
	$('#submitBtn').click(function(){
		let productId = document.getElementById('productid');
		let amount = document.getElementById('var-value');
		$.ajax({
			url: 'http://localhost:8080/hangoutchill/shop/addcart',
			type: 'POST',
			contentType: "application/json;charset=UTF-8",
			datatype: 'text',
			data: JSON.stringify({
                'productid': productId.value,
                'amount': amount.innerHTML
            }),
            success: function (result) {
            	console.log(result);
            	alert(result);
            	updateCartItems();
            },
            error: function (err) {
            	console.log(err);
            	alert(err);
            }
            
		})		
	})
	
	
	
	
	
	
	function updateCartItems(){
	$.ajax({
        url: 'http://localhost:8080/hangoutchill/shop/get/shoppingCartItemNum',
        type: 'GET',
        contentType: "application/json;charset=UTF-8",
        datatype: 'json',
        success: function (result) {
            console.log(result);
         	if(result == 0){
         		$('.count').hide();
         	}else{
            $('.count').text(result);
         	}
         	
        },
        error: function (err) {
            console.log(err);
            $('.count').hide();
        }
    })
	}
    
    
    
	</script>
	<script src="${contextRoot}/js/jquery-2.2.4.min.js"></script>
	<script src="${contextRoot}/js/popper.js"></script>
	<script src="${contextRoot}/js/bootstrap.min.js"></script>
	<script src="${contextRoot}/js/stellar.js"></script>
	<script src="${contextRoot}/js/jquery.ajaxchimp.min.js"></script>
	<script src="${contextRoot}/js/waypoints.min.js"></script>
	<script src="${contextRoot}/js/mail-script.js"></script>
	<script src="${contextRoot}/js/contact.js"></script>
	<script src="${contextRoot}/js/jquery.form.js"></script>
	<script src="${contextRoot}/js/jquery.validate.min.js"></script>
	<script src="${contextRoot}/js/mail-script.js"></script>
	<script src="${contextRoot}/js/shop/templatemo.js"></script>
	<script src="${contextRoot}/js/theme.js"></script>
</body>
</html>
