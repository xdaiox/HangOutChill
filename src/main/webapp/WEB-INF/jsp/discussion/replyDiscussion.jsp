<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<html>
<head>
    <jsp:include page="../layout/navbar.jsp" />
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${contextRoot}/css/all.min.css"
	integrity="sha256-46r060N2LrChLLb5zowXQ72/iKKNiw/lAmygmHExk/o="
	crossorigin="anonymous" />
<meta charset="UTF-8">
<title>回覆文章</title>

<style>
body {
	margin-top: 20px;
	color: #1a202c;
	text-align: left;
	background-color: #e2e8f0;
}

.inner-wrapper {
	position: relative;
	height: calc(100vh - 3.5rem);
	transition: transform 0.3s;
}

@media ( min-width : 992px) {
	.sticky-navbar .inner-wrapper {
		height: calc(100vh - 3.5rem - 48px);
	}
}

.inner-main, .inner-sidebar {
	position: absolute;
	top: 0;
	bottom: 0;
	display: flex;
	flex-direction: column;
}

.inner-sidebar {
	left: 0;
	width: 235px;
	border-right: 1px solid #cbd5e0;
	background-color: #fff;
	z-index: 1;
}

.inner-main {
	right: 0;
	left: 0px;
}

.inner-main-footer, .inner-main-header, .inner-main-header2, .inner-sidebar-footer,
	.inner-sidebar-header {
	height: 3.5rem;
	border-bottom: 1px solid #cbd5e0;
	display: flex;
	align-items: center;
	padding: 0 1rem;
	flex-shrink: 0;
}

.inner-main-body, .inner-sidebar-body {

	position: relative;
	flex: 1 1 auto;

}

.inner-main-body .sticky-top, .inner-sidebar-body .sticky-top {
	z-index: 999;
}

.inner-main-footer, .inner-main-header, .inner-main-header2{
	background-color: #fff;
}

.inner-main-footer, .inner-sidebar-footer {
	border-top: 1px solid #cbd5e0;
	border-bottom: 0;
	height: auto;
	min-height: 3.5rem;
}

@media ( max-width : 767.98px) {
	.inner-sidebar {
		left: -235px;
	}
	.inner-main {
		left: 0;
	}
	.inner-expand .main-body {
		overflow: hidden;
	}
	.inner-expand .inner-wrapper {
		transform: translate3d(235px, 0, 0);
	}
}

.nav .show>.nav-link.nav-link-faded, .nav-link.nav-link-faded.active,
	.nav-link.nav-link-faded:active, .nav-pills .nav-link.nav-link-faded.active,
	.navbar-nav .show>.nav-link.nav-link-faded {
	color: #3367b5;
	background-color: #c9d8f0;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #fff;
	background-color: #467bcb;
}

.nav-link.has-icon {
	display: flex;
	align-items: center;
}

.nav-link.active {
	color: #467bcb;
}

.nav-pills .nav-link {
	border-radius: .25rem;
}

.nav-link {
	color: #4a5568;
}

.card {
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0
		rgba(0, 0, 0, .06);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
	margin-top: 1PX;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1rem;
}
.btn.btn-primary {
   margin: 0 2px;
}

.inner-main-header2 {
	margin-top: 3px; /*分頁選單option*/
}

.custom-select.custom-select-sm.mr-1 {
   width: 150px; /*分頁選單option*/
   margin-left: 15px;
}

</style>

</head>
<div class="container">
    <div class="main-body p-0">
        <div class="inner-wrapper">
            <div class="inner-main">
                <div class="inner-main-body collapse forum-content show">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title text-center">回覆文章</h5>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="title">標題</label>
                                    <input type="text" class="form-control" id="title" placeholder="現撈標題" readonly>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="title" placeholder="現撈分類" readonly>
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" id="content" rows="5" placeholder="現撈内容"readonly></textarea>
                                </div>
								<div class="form-group">
                                    <label for="title">回覆內容</label>
                                    <textarea class="form-control" id="content" rows="5" placeholder="在此現撈回覆内容"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">回覆</button>
								<a href="${contextRoot}/discussion/allDiscussion" class="btn btn-primary">返回文章列</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</html>