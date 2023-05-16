<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/4/22
  Time: 下午 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<jsp:include page="../../layout/navbar.jsp"/>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <title>精選地點</title>
    <style>
        figure {
            width: 300px;
            height: 200px;
            overflow: hidden;
            background-color: #000;
            float: left;
            display: inline-block;
            margin-bottom: 30px;
            margin-right: 30px;
        }

        figure img {
            width: 100%;
        }

    </style>
</head>
<body>
<div class="container">

    <!--================Blog Area =================-->
    <section class="blog_area area-padding">
        <div class="container">
            <div class="row justify-content-center">

                <!--================搜尋side bar =================-->

                <div class="col-lg-3">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <h2>篩選</h2>
                            <form id="searchForm" action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" id="name" name="name" class="form-control"
                                               placeholder="輸入地點名稱"/>
                                    </div>
                                    <div class="input-group mb-3">
                                        <select id="category" name="category" class="form-control">
                                            <option value="" label="請選擇分類..."></option>
                                            <option value="酒吧" label="酒吧"></option>
                                            <option value="燒烤" label="燒烤"></option>
                                            <option value="咖啡廳" label="咖啡廳"></option>
                                            <option value="餐館" label="餐館"></option>
                                            <option value="宵夜" label="宵夜"></option>
                                            <option value="未分類" label="未分類"></option>
                                        </select>
                                    </div>
                                    <div class="input-group mb-3">
                                        <select id="price" name="price" class="form-control">
                                            <option value="" label="請選擇消費水準..."></option>
                                            <option value="$" label="$"></option>
                                            <option value="$ $" label="$ $"></option>
                                            <option value="$ $ $" label="$ $ $"></option>
                                            <option value="$ $ $ $" label="$ $ $ $"></option>
                                            <option value="$ $ $ $ $" label="$ $ $ $ $"></option>
                                        </select>
                                    </div>
                                    <div class="input-group mb-3">
                                        <input type="text" id="city" name="city" class="form-control"
                                               placeholder="輸入地點城市"/>
                                    </div>
                                    <div class="input-group mb-3">
                                        <input type="text" id="dist" name="dist" class="form-control"
                                               placeholder="輸入地點區域"/>
                                    </div>
                                    <%--<input type="button" id="submitBtnSearch" class="button rounded-0 primary-bg text-white w-100" value="查詢" onclick="search()"/>--%>
                                    <div>
                                        <input type="button" id="submitBtnSearch"
                                               class="button rounded-0 primary-bg text-white w-100"
                                               onclick="search()" value="Search"/>
                                    </div>
                                </div>
                            </form>
                        </aside>
                    </div>
                </div>
                <!--================搜尋side bar 結束=================-->


                <!--================搜尋結果 =================-->
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar" id="searchResult-list">
                        <%--                        <article class="blog_item" >--%>
                        <%--                            <div class="blog_details" style="background-color: white" >--%>
                        <%--                                <figure>--%>
                        <%--                                    <img src="${contextRoot}/img/HangOutChill.png"/>--%>
                        <%--                                </figure>--%>
                        <%--                                <div>--%>
                        <%--                                    <a class="d-inline-block" href="single-blog.html">--%>
                        <%--                                        <h2>這裡放地點名稱</h2>--%>
                        <%--                                    </a>--%>
                        <%--                                </div>--%>
                        <%--                                <div>--%>
                        <%--                                    <p>That dominion stars lights dominion divide years for fourth have don't stars is--%>
                        <%--                                        that he earth it first without heaven in place seed it second morning--%>
                        <%--                                        saying.</p>--%>
                        <%--                                    <ul class="blog-info-link">--%>
                        <%--                                        <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>--%>
                        <%--                                        <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>--%>
                        <%--                                    </ul>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </article>--%>


                        <article class="blog_item">
                            <div class="blog_details" style="background-color: white">
                                <figure style="height:178px">
                                    <img width="300" height="100%" src="${contextRoot}/img/HangOutChill.png" />
                                </figure>
                                <div>
                                    <a class="d-inline-block" href="single-blog.html">
                                        <h2>這裡放地點名稱</h2>
                                    </a>
                                </div>
                                <div>
                                    <div>
                                        <h4 style="display: inline; margin-right: 20px;">這裡放分類</h4>
                                        <h4 style="display: inline;" >$ $ $</h4>
                                        <br>
                                        <h5 style="display: inline; margin-right: 20px;">台南市</h5>
                                        <h5 style="display: inline;" >永康區</h5>
                                    </div>
<%--                                    <br>--%>
                                    <div>
                                        <p class="mb-0">位於信義安和的「The Public House」，外觀為傳統的英式PUB風格，而PUB也就是Public House的縮寫，就像是「The Public House」給人的感覺一樣，比起傳統的專業、沉靜的酒吧，這裡的整體風格更貼近日常生活，有時會出現英式小酒館鬧哄哄的氣氛，美味的餐點加上各種專業性十足的調酒，打造出一個輕鬆的氛圍！</p>
                                    </div>
                                </div>
                            </div>
                        </article>

                            <!--================分頁功能 =================-->
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
                            <!--================分頁功能 =================-->

                    </div>
                </div>


            </div>
        </div>
    </section>
    <!--================Blog Area =================-->


    <jsp:include page="../../layout/footer.jsp"/>
    <script>
        window.addEventListener("load", () => {
            return loadLocationInfo(1, '', '', '', '', '')
        })


        async function loadLocationInfo(pageNumber, name, category, price, city, dist) {
            try {
                const response = await axios.get('${pageContext.request.contextPath}/location/locationList/search', {
                    params: {pageNumber, name, category, price, city, dist}
                });
                console.log(response.data)
                // displayLocationInfo(response.data.page.content);
                // setupPagination(response.data);
            } catch (error) {
                console.error('Error loading LocationInfo:', error);
            }
        }


        function displayLocationInfo(e) {
            let resultList = document.getElementById("searchResult-list")
            let result = '';
            let base64 = '';

            for (let i = 0; i < e.length; i++) {
                result += '  <article class="blog_item" ><div class="blog_details" style="background-color: white" >'
                result += '<figure style="height:178px">'
                if (e[i].locationImage !== null) {
                    if (e[i].locationImage.locImgCover !== null) {
                        base64 = '${contextRoot}/locationInfo/getImgCover/' + e[i].locId;
                        console.log(e[i].locId);
                    } else {
                        base64 = "${contextRoot}/img/HangOutChill.png"
                    }
                } else {
                    base64 = "${contextRoot}/img/HangOutChill.png"
                }

                result += '<img width="300" height="100%"  src="' + base64 + '"/>'

                result += '</figure>'
                result += ' <div> <a class="d-inline-block" href="#詳細地點controller">'
                result += ' <h2>' + e[i].locName + '</h2>'
                result += '</a></div>'
                result += '<div><p>' + e[i].locDesc + '</p>' + '<ul class="blog-info-link">'
                result += '<li><i class="far fa-user"></i>' + e[i].locCat + '</li>'
                result += '<li><i class="far fa-comments"></i>' + e[i].locPriceLevel + '</li> '
                result += '<li><i class="far fa-user"></i>' + e[i].locCity + '</li>'
                result += '<li><i class="far fa-comments"></i>' + e[i].locDist + '</li> '
                result += '</ul>' + '</div>'
                result += '</div></article>'
            }

            resultList.innerHTML = result
        }

        // function search(){
        //     getNameValue()
        //     getCategoryValue()
        //     getCityValue()
        //     getPriceValue()
        //     getDistValue()
        // }


        //獲取查詢值name
        function getNameValue() {
            const inputName = document.getElementById('name').value;
            console.log(inputName)
            return inputName
        }

        //獲取查詢值category
        function getCategoryValue() {
            const inputCategory = document.getElementById('category').value;
            console.log(inputCategory)
            return inputCategory
        }

        //獲取查詢值price(INTEGER)
        function getPriceValue() {
            const inputPrice = document.getElementById('price').value;
            console.log(inputPrice)
            return inputPrice
        }

        //獲取查詢值city
        function getCityValue() {
            const inputCity = document.getElementById('city').value;
            console.log(inputCity)
            return inputCity
        }

        //獲取查詢值dist
        function getDistValue() {
            const inputDist = document.getElementById('dist').value;
            console.log(inputDist)
            return inputDist
        }


    </script>
</body>
</html>
