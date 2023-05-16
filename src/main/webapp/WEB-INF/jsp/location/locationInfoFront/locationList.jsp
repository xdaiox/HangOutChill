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
                                               onclick="search()" value="Search" style="border: 1px solid #744FC6; background:#744FC6 "/>
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
                    </div>
                    <div class="blog_left_sidebar">
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination" id="page">

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
                displayLocationInfo(response.data.page.content,response.data);
                // setupPagination(response.data);
            } catch (error) {
                console.error('Error loading LocationInfo:', error);
            }
        }


        function displayLocationInfo(e,p) {
            let resultList = document.getElementById("searchResult-list")
            let result = '';
            let base64 = '';

            for (let i = 0; i < e.length; i++) {
                result += '<article class="blog_item" ><div class="blog_details" style="background-color: white; height: 238px; margin-bottom: 10px"  >'
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
                result += '<img src="' + base64 + '" width="300px" height="178px"/>'
                result += '</figure>'
                result += '<div> <a class="d-inline-block" href="${contextRoot}/location/locationList/single?locId='+e[i].locId+'">'
                result += '<h2>' + e[i].locName + '</h2>'
                result += '</a></div>'
                result += '<div>'
                result += '<div>'
                result += '<h5 style="display: inline; margin-right: 20px;">'+ e[i].locCat+'</h5>'
                result += '<h5 style="display: inline;" >'+ e[i].locPriceLevel+'</h5><br>'
                result += '<h6 style="display: inline; margin-right: 20px;">'+e[i].locCity+'</h6>'
                result += '<h6 style="display: inline;" >'+e[i].locDist+'</h6>'
                result += '</div>'
                result += '<div><p class="mb-0" id="my-paragraph">'+e[i].locDesc+'</p></div>'

                result += '</div>'
                result += '</div></article>'
            }

            resultList.innerHTML = result

            //分頁功能
            let page = document.getElementById("page")
            let pageNum = ""
            for (let i = 1; i <= p.page.totalPages; i++) {
                if (p.pageNumber == i) {
                    pageNum += '<li class="page-item"><span  class="page-link">' + i + '</span></li>';
                } else {
                    pageNum += '<li class="page-item"><a href="#" onclick="loadLocationInfo(' + i + ', \'\' ,\'\' ,\'\' ,\'\')"  class="page-link">' + i + '</a></li>';
                }
            }
            page.innerHTML = pageNum

            let paragraphs = document.querySelectorAll(".blog_item p");
            let maxLength = 90;

            paragraphs.forEach(function(paragraph) {
                let content = paragraph.textContent.trim();

                if (content.length > maxLength) {
                    let truncatedContent = content.substring(0, maxLength) + "...";
                    paragraph.textContent = truncatedContent;
                }
            })
        }

        function search(){
            getNameValue()
            getCategoryValue()
            getCityValue()
            getPriceValue()
            getDistValue()
        }

        function search() {

            loadLocationInfo(1, getNameValue(), getCategoryValue(), getPriceValue(), getCityValue(), getDistValue())

        }


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
