<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="${contextRoot}/css/article/dbshowall.css">
  <title>HangOut趣</title>
</head>
<body>
  <div class="container-scroller">
  	<jsp:include page="../dbLayout/top_navbar.jsp" />

    <div class="container-fluid page-body-wrapper">
		<jsp:include page="../dbLayout/left_navbar.jsp" />
      	
      <div class="main-panel">
      	<div class="top_content d-flex">
    		<h3>專欄管理</h3>
    		<form class="d-flex searchbox">
	          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	          <button class="btn btn-outline-success" type="submit">Search</button>
	        </form>
      	</div> 
      	
        <div class="content-wrapper">
          <div class="row">
				<table class=" content table">
				  <thead>
				    <tr>
				      <th scope="col">ID</th>
				      <th scope="col">標題</th>
				      <th></th>
<!-- 				      <th scope="col">圖片</th> -->
				      <th scope="col">主題</th>
				      <th scope="col">狀態</th>
				      <th scope="col">作者</th>
				      <th></th>
				    </tr>
				  </thead>
				  <jstl:forEach var="article" items="${page.content}">
				  <tbody>
				    <tr>
				      <th scope="row">${article.article_id}</th>
				      <td width="30px">${article.article_name}</td>
				      <td></td>
				      <td>${article.article_theme}</td>
				      <td>${article.status}</td>
				      <td>${article.normal_Account}</td>
				      <td class="btn_group">
				      	<form action="${contextRoot}/article/status">
				      		<input type="hidden" name="article_id" value="${article.article_id}" />
				      		<input type="submit" class="btn btn-outline-success mr-2" value="上架" />
				      	</form>
   						<form action="${contextRoot}/article/edit">
						   <input type="hidden" name="article_id" value="${article.article_id}" />
						   <input type="submit" class="btn btn-outline-info mr-2" value="編輯" />
						</form>
						<form action="${contextRoot}/article/delete" method="post">
						   <input type="hidden" name="_method" value="delete" />
						   <input type="hidden" name="id" value="${article.article_id}" />
						   <input type="submit" class="btn btn-outline-danger mr-2" value="刪除" />
						</form>
				      </td>
				    </tr>
				  </tbody>
				  </jstl:forEach>
				</table>
				<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				  <jstl:choose>
				     <jstl:when test="${page.number != pageNumber-1 }">
				          <a href="${contextRoot}/article/dbShowAll?p=${pageNumber}">${pageNumber}</a>
				     </jstl:when>
				     <jstl:otherwise>
				            ${pageNumber}
				     </jstl:otherwise>
				  
				  </jstl:choose>
			
				  <jstl:if test="${pageNumber != page.totalPages }">
				    -
				  </jstl:if>
				</jstl:forEach>
			
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>