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
    <title>地點清單管理</title>
</head>
<body>
<div class="container-scroller">

</div>
  <jsp:include page="../dbLayout/top_navbar.jsp"/>
  <div class="container-fluid page-body-wrapper">
  <jsp:include page="../dbLayout/left_navbar.jsp"/>
  <div class="container">
    <div class="content_box" style="width: 100%">
      <h3 style="text-align: center;">地點管理</h3>
      <form action="${pageContext.request.contextPath}/location/locationManager/addPage">
        <input type="submit" id="" class="btn btn-outline-info btn-sm" value="新增"/></form>
      <br>
      <p>搜索功能</p>
      <form id="searchForm" action="#">
        <input type="text" id="name" name="name" placeholder="輸入地點名稱"/>
        <select id="category" name="category">
          <option value="" label="請選擇分類..."></option>
          <option value="分類1" label="分類1"></option>
          <option value="分類2" label="分類2"></option>
          <option value="分類3" label="分類3"></option>
        </select>
        <select id="price" name="price">
          <option value="" label="請選擇消費費水準..."></option>
          <option value="1" label="$"></option>
          <option value="2" label="$ $"></option>
          <option value="3" label="$ $ $"></option>
          <option value="4" label="$ $ $ $"></option>
          <option value="5" label="$ $ $ $ $"></option>
        </select>
        <input type="text" id="city" name="city" placeholder="輸入地點城市"/>
        <input type="text" id="dist" name="dist" placeholder="輸入地點區域"/>
        <input type="submit" id="submitBtnSearch" class="btn btn-outline-info btn-sm" value="查詢"/>
      </form>
      <br>
      <div class="table-responsive">
        <table>
          <thead>
            <tr>
              <th>地點編號</th>
              <th>地點名稱</th>
              <th>地點分類</th>
              <th>消費水準</th>
              <th>地點城市</th>
              <th>最後更新時間</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody id="searchResult-list">
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>



<script>
  $(document).ready(function (){

      $('#submitBtnSearch').click(function (event){
          event.preventDefault();
          let inputName = document.getElementById('name').value;
          let inputCategory = document.getElementById('category').value;
          let inputPrice = document.getElementById('price').value;
          let inputCity = document.getElementById('city').value;
          let inputDist = document.getElementById('dist').value;
          let pageNumber = document.getElementById('pageNumber').value;
          let dtoObject = {
            "name" : inputName,
            "category" : inputCategory,
            "price" : inputPrice,
            "city" : inputCity,
            "dist" : inputDist,
            "pageNumber" : pageNumber,

          };
          let dtoJsonString = JSON.stringify(dtoObject);

        $.ajax({
            url: '${pageContext.request.contextPath}/api/location/locationManager/search?',



            contentType: 'application/json;charset=UTF-8',
            dataType: 'json',
            method: 'GET',
            data: dtoJsonString,
              success: function(searchResult) {
              console.log(searchResult);
               let locationInfo = '';
              $.each(searchResult.content,function (index,value) {
                console.log(value)
                locationInfo += '<tr>'
                locationInfo += '<td>' + value.locId + '</td>'
                locationInfo += '<td>' + value.locName + '</td>'
                locationInfo += '<td>' + value.locCat + '</td>'
                locationInfo += '<td>' + value.locPriceLevel + '</td>'
                locationInfo += '<td>' + value.locCity + '</td>'
                locationInfo += '<td>' + value.locDist + '</td>'
                locationInfo += '</tr>';
              })
                // locationInfo = '</tbody>';

              let  table = document.getElementById('searchResult-list');
              table.innerHTML = locationInfo
              },
              error: function(searchError) {
              console.log(searchError);
                }
            });
      })
  })


</script>


</body>
</html>
