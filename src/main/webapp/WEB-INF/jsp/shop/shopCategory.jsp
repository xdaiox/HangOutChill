<%-- Created by IntelliJ IDEA. User: iztuc Date: 2023/4/20 Time: 下午 03:12 To change this template use File | Settings |
    File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <html>

            <head>
                <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
                <!-- Required meta tags -->
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <link rel="icon" href="" type="image/png">
                <title>商城首頁</title>

                <title>首頁</title>
                <jsp:include page="layout/navbar.jsp" />


            </head>

            <body>
                <main>
                    <section class="header-top"></section>
                    <header id="header" class="header_area"> </header>

                    <section class="banner_area">
                        <div style="text-align: center;">
                            <h2>${category}</h2>
                        </div>
                    </section>
                    <section class="category-page area-padding">
                        <div class="container" style="max-width: 85%">
                            <div class="row">

                                <!-- 			商品陳列迴圈開始 -->
                               	
                                <c:forEach var="product" items="${cateProducts}">
                                    <div class="col-md-6 col-lg-3">
                                        <div class="single-category">
                                            <div class="thumb">
                                                <a class="d-block"
                                                    href="/hangoutchill/shop/productdetail?productid=${product.productId}">
                                                    <img class="img-fluid"
                                                        src='<c:url value="/shop/getPicture/${product.productId}" />'
                                                        alt="" style="width:95%; height:auto">
                                                </a>
                                            </div>
                                            <!-- Style 更改 -->
                                            <div class="short_details" style="padding:10px; margin-top: 0;">
                                                <h4>${product.productName}</h4>
                                                <div class="meta-top d-flex">
                                                    <!-- <a href="#">shoes </a>/ -->
                                                    <a href="#"> $ ${product.unitPrice}</a>
                                                </div>

                                                <div class="meta-bottom d-flex">

                                                    <!-- <a href="#"><i class="ti-comment">加入購物車</i></a> -->
                                                    <button id="submitBtn" class="submitBtn"
                                                        value="${product.productId}">加入購物車</button>
                                                    <input type="hidden" value="${product.productId}" id="productid">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- 		商品陳列迴圈結束 -->


                            </div>
                        </div>
                        <!-- 		分頁按鈕 -->
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </section>



                </main>




                <!-- 	<footer class="footer-area"> </footer> -->
                <jsp:include page="../layout/footer.jsp" />
                <%-- <script src="${contextRoot}/js/jquery-2.2.4.min.js"></script> --%>
                    <script src="${contextRoot}/js/jquery-3.6.4.min.js"></script>
                    <%-- <script src="${contextRoot}/js/theme.js"></script> --%>
                        <script>
                            $(document).ready(function () {
                            	
                            	// 購物車上的小圖示
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
                            	
                            	
                            	
                            	
                            	// 點擊新增購物車
                            	
                                $('.submitBtn').click(function (event) {
                                    console.log(this.value);
                                    event.preventDefault();
                                    let productId = this.value;
                                    let amount = 1;
                                    $.ajax({
                                        url: 'http://localhost:8080/hangoutchill/shop/addcart',
                                        type: 'POST',
                                        contentType: "application/json;charset=UTF-8",
                                        datatype: 'text',
                                        data: JSON.stringify({
                                            'productid': productId,
                                            'amount': amount
                                        }),
                                        success: function (result) {
                                            console.log(result);
                                            alert(result);
                                            
                                            // 同步更新購物車按鈕
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
                                            
                                            // 同步更新購物車按鈕結束
                                            
                                            
               
                                        },
                                        error: function (err) {
                                            console.log(err);
                                            alert(err);
                                        }
                                    });
                                    

                                })
                            })
                        </script>
                        <script>
                        	
                        </script>
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
            </body>

            </html>