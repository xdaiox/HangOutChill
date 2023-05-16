<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/5/7
  Time: 下午 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <title>地點清單管理</title>
</head>
<body>

<div class="container-scroller">
    <jsp:include page="../../dbLayout/top_navbar.jsp"/>
    <div class="container-fluid page-body-wrapper">
        <jsp:include page="../../dbLayout/left_navbar.jsp"/>

        <div class="content_box" style="width: 100%">
            <h3 style="text-align: center;">地點管理</h3>
            <%--                <form action="${pageContext.request.contextPath}/location/locationManager/addPage">--%>
            <%--                    <input type="submit" id="" class="btn btn-outline-info btn-sm" value="新增"/></form>--%>
            <br>
            <%--                <p>搜索功能</p>--%>
            <form id="searchForm" action="#">
                <input type="text" id="name" name="name" placeholder="輸入地點名稱"/>
                <select id="category" name="category">
                    <option value="" label="請選擇分類..."></option>
                    <option value="酒吧" label="酒吧"></option>
                    <option value="燒烤" label="燒烤"></option>
                    <option value="咖啡廳" label="咖啡廳"></option>
                    <option value="餐館" label="餐館"></option>
                    <option value="宵夜" label="宵夜"></option>
                    <option value="未分類" label="未分類"></option>
                </select>
                <select id="price" name="price">
                    <option value="" label="請選擇消費費水準..."></option>
                    <option value="$" label="$"></option>
                    <option value="$ $" label="$ $"></option>
                    <option value="$ $ $" label="$ $ $"></option>
                    <option value="$ $ $ $" label="$ $ $ $"></option>
                    <option value="$ $ $ $ $" label="$ $ $ $ $"></option>
                </select>
                <input type="text" id="city" name="city" placeholder="輸入地點城市"/>
                <input type="text" id="dist" name="dist" placeholder="輸入地點區域"/>
                <input type="button" id="submitBtnSearch" class="btn btn-outline-info btn-sm" value="查詢"
                       onclick="search()"/>
            </form>
            <br>
            <div class="table-responsive">
                <table id="locationInfo-table" class="table table-hover table-bordered table-light">
                    <thead>
                    <tr>
                        <th>地點編號</th>
                        <th>地點名稱</th>
                        <th>地點分類</th>
                        <th>消費水準</th>
                        <th>地點城市</th>
                        <th>最後更新時間</th>
                        <th>狀態</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="searchResult-list">
                    </tbody>
                </table>
            </div>
            <br>
            <div style="text-align:center;" id="page">
            </div>
        </div>

    </div>
</div>


<script>
    window.addEventListener("load", () => {
        return loadLocationInfo(1, '', '', '', '', '')
    })

    async function loadLocationInfo(pageNumber, name, category, price, city, dist) {
        try {
            const response = await axios.get('${pageContext.request.contextPath}/location/locationManager/search', {
                params: {pageNumber, name, category, price, city, dist}
            });
            console.log(response.data)
            displayLocationInfo(response.data.page.content, response.data);
            // setupPagination(response.data);
        } catch (error) {
            console.error('Error loading LocationInfo:', error);
        }
    }


    //內容渲染
    function displayLocationInfo(e, p) {
        let resultlist = document.getElementById("searchResult-list")
        let result = '';
        for (let i = 0; i < e.length; i++) {
            result += '<tr><td class= align-middle>' + e[i].locId + "</td>"
            result += "<td class= align-middle>" + e[i].locName + "</td>"
            result += "<td class= align-middle>" + e[i].locCat + "</td>"
            result += "<td class= align-middle>" + e[i].locPriceLevel + "</td>"
            result += "<td class= align-middle>" + e[i].locCity + "</td>"
            result += "<td class= align-middle>" + e[i].locInfoUpdateTime + "</td>"
            result += '<td class=align-middle>' + '<div style="display: flex">'
            result += '<form action="${contextRoot}/location/locationManager/status">'
            result += '<input type="hidden" name="locId" value="' + e[i].locId + '"/>'

            if(e[i].locStatus ==false){
                result += '<input type="submit" class="btn btn-outline-danger" value="下架中">'
            }else {
                result += '<input type="submit" class="btn btn-outline-success" value="上架中">'
            }
            // result += '<input id="toggleButton" type="submit" class="btn btn-outline-info btn-sm" value="' +e[i].locStatus +'"/></form>'
            result += '<td class=align-middle>' + '<div style="display: flex">'
            result += '<form action="${contextRoot}/location/locationManager/editPage">'
            result += '<input type="hidden" name="locId" value="' + e[i].locId + '"/>'
            result += '<input type="submit" class="btn btn-outline-info btn-sm" value="編輯"/></form>'
            result += '<form action="${contextRoot}/location/locationManager/delete" method="post">'
            result += '<input type="hidden" name="_method" value="delete"/>'
            result += '<input type="hidden" name="locId" value="' + e[i].locId + '"/>'
            result += '<input type="submit" class="btn btn-outline-danger btn-sm" value="刪除" onclick="return confirm("確定刪除?")"/>'
            result += '    </form></div>'
            result += "</tr>"
        }
        resultlist.innerHTML = result

        //分頁功能
        let page = document.getElementById("page")
        let pageNum = ""
        for (let i = 1; i <= p.page.totalPages; i++) {
            if (p.pageNumber == i) {
                pageNum += '<span>' + i + '</span>';
            } else {
                pageNum += '<a href="#" onclick="loadLocationInfo(' + i + ', \'\' ,\'\' ,\'\' ,\'\')">' + i + '</a>';
            }
        }
        page.innerHTML = pageNum

    }


    function search() {

        loadLocationInfo(1, getNameValue(), getCategoryValue(), getPriceValue(), getCityValue(), getDistValue())

    }


    //獲取查詢值name
    function getNameValue() {
        const inputName = document.getElementById('name').value;
        // console.log(inputName)
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
        // console.log(inputPrice)
        return inputPrice
    }

    //獲取查詢值city
    function getCityValue() {
        const inputCity = document.getElementById('city').value;
        // console.log(inputCity)
        return inputCity
    }

    //獲取查詢值dist
    function getDistValue() {
        const inputDist = document.getElementById('dist').value;
        // console.log(inputDist)
        return inputDist
    }







    <%--$(document).ready(function (){--%>

    <%--    $('#pageNumber').val(1);--%>

    <%--    $('#submitBtnSearch').click(function (event){--%>
    <%--        event.preventDefault();--%>
    <%--        let inputName = document.getElementById('name').value;--%>
    <%--        let inputCategory = document.getElementById('category').value;--%>
    <%--        let inputPrice = document.getElementById('price').value;--%>
    <%--        let inputCity = document.getElementById('city').value;--%>
    <%--        let inputDist = document.getElementById('dist').value;--%>
    <%--        let pageNumber = document.getElementById('pageNumber').value;--%>
    <%--        let dtoObject = {--%>
    <%--          "name" : inputName,--%>
    <%--          "category" : inputCategory,--%>
    <%--          "price" : inputPrice,--%>
    <%--          "city" : inputCity,--%>
    <%--          "dist" : inputDist,--%>
    <%--          "pageNumber" : pageNumber,--%>

    <%--        };--%>
    <%--        let dtoJsonString = JSON.stringify(dtoObject);--%>

    <%--      $.ajax({--%>
    <%--          &lt;%&ndash;url: '${pageContext.request.contextPath}/api/location/locationManager/search?',&ndash;%&gt;--%>
    <%--        url: '${pageContext.request.contextPath}/api/location/locationManager/search?name='--%>
    <%--                + inputName + '&category=' + inputCategory + '&price=' + inputPrice--%>
    <%--                + '&city=' + inputCity + '&dist=' + inputDist + '&pageNumber=' + pageNumber,--%>


    <%--          contentType: 'application/json;charset=UTF-8',--%>
    <%--          dataType: 'json',--%>
    <%--          method: 'GET',--%>
    <%--          data: dtoJsonString,--%>
    <%--            success: function(searchResult) {--%>
    <%--            console.log(searchResult);--%>
    <%--             let locationInfo = '';--%>
    <%--            $.each(searchResult.content,function (index,value) {--%>
    <%--              console.log(value)--%>
    <%--              locationInfo += '<tr>'--%>
    <%--              locationInfo += '<td>' + value.locId + '</td>'--%>
    <%--              locationInfo += '<td>' + value.locName + '</td>'--%>
    <%--              locationInfo += '<td>' + value.locCat + '</td>'--%>
    <%--              locationInfo += '<td>' + value.locPriceLevel + '</td>'--%>
    <%--              locationInfo += '<td>' + value.locCity + '</td>'--%>
    <%--              locationInfo += '<td>' + value.locDist + '</td>'--%>
    <%--              locationInfo += '</tr>';--%>
    <%--            })--%>
    <%--              // locationInfo = '</tbody>';--%>

    <%--            let  table = document.getElementById('searchResult-list');--%>
    <%--            table.innerHTML = locationInfo--%>
    <%--            },--%>
    <%--            error: function(searchError) {--%>
    <%--            console.log(searchError);--%>
    <%--              }--%>
    <%--          });--%>
    <%--    })--%>
    <%--})--%>


</script>


</body>
</html>
