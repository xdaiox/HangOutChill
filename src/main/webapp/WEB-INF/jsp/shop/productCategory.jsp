<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${contextRoot}/css/shop/productlist.css">
<jsp:include page="../layout/navbar.jsp" />
<title>專欄</title>
</head>
<body>

    <div class="container" style="width: 80%; margin: auto">
        <div class=" article_content" >
            <section class="titlebox">
                <div class="title_en">
                    <h1>${category}</h1>
                </div>
            </section>
            <section class="listbox">
                <div class="selectbox">
                    <ul>
                        <li>
                            <a href="${contextRoot}/shop/productcategory?category=全部商品">全部商品</a>
                        </li>
                        <li>
                            <a href="${contextRoot}/shop/productcategory?category=美味嚐點">美味嚐點</a>
                        </li>
                        <li>
                            <a href="${contextRoot}/shop/productcategory?category=文創商品">文創商品</a>    
                        </li>
                        <li>
                            <a href="${contextRoot}/shop/productcategory?category=實用嚴選">實用嚴選</a>
                        </li>
                    </ul>
                </div>
                <div class="searchbox">
                	<form method="get" action="${contextRoot}/shop/productnamesearch" >
                    <input type="text" class="search_input" placeholder="商品搜尋" name="searchword">
                    <button class="search_submit" type="submit">
                        <a href="#"><i class="ti-search"></i></a>
                    </button>
                    </form>
                </div>
            </section>

            <section class="contentbox">
                <div class="all_article">
                
				<c:forEach var="product" items="${cateProducts.content}">
                    <div class="article_box">
                        <article class="article_img">
                            <a href="/hangoutchill/shop/productdetail?productid=${product.productId}">
                                <img src='<c:url value="/shop/getPicture/${product.productId}" />' alt="">
                            </a>
                        </article>
                        <article class="article_textbox">
                            <h4 class="title">${product.productName}</h4>
                            <c:if test="${product.discount != 1.0}">
                            <span style="text-decoration:line-through">NT $${ product.unitPrice}</span>
                            </c:if>
                            <div class="text">
                                <h5>NT $<fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${ product.unitPrice*product.discount }"/></h5>
                            </div>
<!--                             <a href="#" class="read_more">READ MORE</a> -->
						<button id="submitBtn" class="submitBtn" value="${product.productId}">加入購物車</button>
                        <input type="hidden" value="${product.productId}" id="productid">
                        </article>
                    </div>
                   </c:forEach>
                   
                </div>
            <nav class="blog-pagination justify-content-center d-flex">
            	<ul class="pagination">
                              <li class="page-item">
                                  <a href="#" class="page-link" aria-label="Previous">
                                      <i class="ti-angle-left"></i>
                                  </a>
                              </li>
                              <c:forEach var="pageNum" begin="1" end="${cateProducts.totalPages}">
                              <c:choose>
								<c:when test="${cateProducts.number+1 == pageNum}">
								<li class="page-item active">
                                  <a href="#" class="page-link">${pageNum}</a>
                              	</li>
								</c:when>
								<c:when test="${search}">
								<li class="page-item active">
									<a href="${contextRoot}/shop/productnamesearch?p=${pageNum}&searchword=${keyword}">${pageNum}</a>
								</li>
								</c:when>
								<c:otherwise>
								<li class="page-item">
                                  	<a href="${contextRoot}/shop/productcategory?p=${pageNum}" class="page-link">${pageNum}</a>
                              	</li>
								</c:otherwise>
								</c:choose>
                              </c:forEach>
                              
<!--                               <li class="page-item"> -->
<!--                                   <a href="#" class="page-link">1</a> -->
<!--                               </li> -->
<!--                               <li class="page-item active"> -->
<!--                                   <a href="#" class="page-link">2</a> -->
<!--                               </li> -->
                              <li class="page-item">
                                  <a href="#" class="page-link" aria-label="Next">
                                      <i class="ti-angle-right"></i>
                                  </a>
                              </li>
                          </ul>
            </nav>
            </section>
        </div>
    </div>
	<jsp:include page="../layout/footer.jsp"/>
	<script>
		$(document).ready(function () {
			
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
                        alert("請先登入會員");
                    }
                });
                

            })
			
		})
		
		
	</script>
</body>
</html>