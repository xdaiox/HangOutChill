<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>HangOut趣</title>

<link rel="stylesheet" href="${contextRoot}/css/vendors/feather/feather.css">
<link rel="stylesheet" href="${contextRoot}/css/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="${contextRoot}/css/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet" type="text/css" href="${contextRoot}/css/vendors/select.dataTables.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<link rel="stylesheet" href="${contextRoot}/css/vendors/vertical-layout-light/style.css">
<link rel="stylesheet" href="${contextRoot}/css/vendors/vertical-layout-light/define.css">

<link rel="shortcut icon" href="${contextRoot}/img/dashboard/picwish.png" />
</head>
<body>
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="index.html"><img src="${contextRoot}/img/picwish.png" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="${contextRoot}/img/picwish.png" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item userName">
            <span>管理者您好!</span>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="${contextRoot}/img/OSLO-12.png" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="${contextRoot}/logout">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
	<script src="${contextRoot}/js/vendors/js/vendor.bundle.base.js"></script>
	<script src="${contextRoot}/js/vendors/datatables.net/jquery.dataTables.js"></script>
	<script src="${contextRoot}/js/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="${contextRoot}/js/vendors/dataTables.select.min.js"></script>
	<script src="${contextRoot}/js/vendors/off-canvas.js"></script>
	<script src="${contextRoot}/js/vendors/hoverable-collapse.js"></script>
	<script src="${contextRoot}/js/vendors/template.js"></script>
	<script src="${contextRoot}/js/vendors/settings.js"></script>
	<script src="${contextRoot}/js/vendors/dashboard.js"></script>
</body>
</html>