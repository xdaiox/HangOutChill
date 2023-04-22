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
<title>論壇首頁</title>
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
<body>
	<div class="container">
		<div class="main-body p-0">
			<div class="inner-wrapper">

				<!-- /Inner sidebar -->

				<!-- Inner main -->
				<div class="inner-main">
					<!-- Inner main header -->
					<div class="inner-main-header">
						<button class="btn btn-primary" type="submit">最新</button>
						<button class="btn btn-primary" type="submit">精選</button>
						<button class="btn btn-primary" type="submit">熱門</button>
						<button type="button" class="btn btn-link ml-auto">分類1</button>
						<button type="button" class="btn btn-link ml-auto">分類2</button>
						<button type="button" class="btn btn-link ml-auto">分類3</button>
						<button type="button" class="btn btn-link ml-auto">分類4</button>
						<button type="button" class="btn btn-link ml-auto">分類5</button>
						<span class="input-icon input-icon-sm ml-auto w-auto"> <input
							type="text"
							class="form-control form-control-sm bg-gray-200 border-gray-200 shadow-none mb-4 mt-4"
							placeholder="Search forum" />
						</span>
					</div>
					<div class="inner-main-header2">
						<a href="${contextRoot}/discussion/newDiscussion"><button class="btn btn-primary" type="submit">新增文章</button></a>
						<select class="custom-select custom-select-sm mr-1">
							<option selected="">顯示10項結果</option>
							<option value="1">顯示20項結果</option>
							<option value="2">顯示50項結果</option>
						</select>
						<ul
						class="pagination pagination-sm pagination-circle justify-content-center mb-1 ml-auto">
						<li class="page-item disabled"><span
							class="page-link has-icon"><i class="material-icons">chevron_left</i></span>
						</li>
						<li class="page-item"><a class="page-link"
							href="javascript:void(0)">1</a></li>
						<li class="page-item active"><span class="page-link">2</span></li>
						<li class="page-item"><a class="page-link"
							href="javascript:void(0)">3</a></li>
						<li class="page-item"><a class="page-link has-icon"
							href="javascript:void(0)"><i class="material-icons">chevron_right</i></a>
						</li>
					</ul>
					</div>
					<div class="inner-main-header2">
						現撈
						<div class="d-flex justify-content-end"> <!--使用“justify-content-end”類將父元素的內容向右對齊-->
						<button class="btn btn-primary" type="submit">點閱</button>
						<button class="btn btn-primary" type="submit">按讚</button>
						<button class="btn btn-primary" type="submit">留言</button>
						<button class="btn btn-primary" type="submit">更新時間</button>
					</div>
					</div>
					<!-- /Inner main header -->

					<!-- Inner main body -->

					<!-- Forum List -->
					<div class="inner-main-body collapse forum-content show">

						<div class="card">
							<div class="card-body p-2 p-sm-3">
								<div class="media forum-item">
									<a href="#" data-toggle="collapse" data-target=".forum-content"><img
										src="https://bootdey.com/img/Content/avatar/avatar1.png"
										class="mr-3 rounded-circle" width="50" alt="User" /></a>
									<div class="media-body">
										<h6>
											<a href="#" data-toggle="collapse"
												data-target=".forum-content" class="text-body">Realtime
												fetching data</a>
										</h6>
										<p class="text-secondary">lorem ipsum dolor sit amet lorem
											ipsum dolor sit amet lorem ipsum dolor sit amet</p>
										<p class="text-muted">
											<a href="javascript:void(0)">drewdan</a> replied <span
												class="text-secondary font-weight-bold">13 minutes
												ago</span>
										</p>
									</div>
									<a href="${contextRoot}/discussion/replyDiscussion"><button class="btn btn-primary" type="submit">回覆</button></a>
									<div class="text-muted small text-center align-self-center">
										<span class="d-none d-sm-inline-block"><i
											class="far fa-eye"></i> 19</span> <span><i
											class="far fa-comment ml-2"></i> 3</span>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body p-2 p-sm-3">
								<div class="media forum-item">
									<a href="#" data-toggle="collapse" data-target=".forum-content"><img
										src="https://bootdey.com/img/Content/avatar/avatar2.png"
										class="mr-3 rounded-circle" width="50" alt="User" /></a>
									<div class="media-body">
										<h6>
											<a href="#" data-toggle="collapse"
												data-target=".forum-content" class="text-body">Laravel 7
												database backup</a>
										</h6>
										<p class="text-secondary">lorem ipsum dolor sit amet lorem
											ipsum dolor sit amet lorem ipsum dolor sit amet</p>
										<p class="text-muted">
											<a href="javascript:void(0)">jlrdw</a> replied <span
												class="text-secondary font-weight-bold">3 hours ago</span>
										</p>
									</div>
									<div class="text-muted small text-center align-self-center">
										<span class="d-none d-sm-inline-block"><i
											class="far fa-eye"></i> 18</span> <span><i
											class="far fa-comment ml-2"></i> 1</span>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body p-2 p-sm-3">
								<div class="media forum-item">
									<a href="#" data-toggle="collapse" data-target=".forum-content"><img
										src="https://bootdey.com/img/Content/avatar/avatar3.png"
										class="mr-3 rounded-circle" width="50" alt="User" /></a>
									<div class="media-body">
										<h6>
											<a href="#" data-toggle="collapse"
												data-target=".forum-content" class="text-body">Http
												client post raw content</a>
										</h6>
										<p class="text-secondary">lorem ipsum dolor sit amet lorem
											ipsum dolor sit amet lorem ipsum dolor sit amet</p>
										<p class="text-muted">
											<a href="javascript:void(0)">ciungulete</a> replied <span
												class="text-secondary font-weight-bold">7 hours ago</span>
										</p>
									</div>
									<div class="text-muted small text-center align-self-center">
										<span class="d-none d-sm-inline-block"><i
											class="far fa-eye"></i> 32</span> <span><i
											class="far fa-comment ml-2"></i> 2</span>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body p-2 p-sm-3">
								<div class="media forum-item">
									<a href="#" data-toggle="collapse" data-target=".forum-content"><img
										src="https://bootdey.com/img/Content/avatar/avatar4.png"
										class="mr-3 rounded-circle" width="50" alt="User" /></a>
									<div class="media-body">
										<h6>
											<a href="#" data-toggle="collapse"
												data-target=".forum-content" class="text-body">Top rated
												filter not working</a>
										</h6>
										<p class="text-secondary">lorem ipsum dolor sit amet lorem
											ipsum dolor sit amet lorem ipsum dolor sit amet</p>
										<p class="text-muted">
											<a href="javascript:void(0)">bugsysha</a> replied <span
												class="text-secondary font-weight-bold">11 hours ago</span>
										</p>
									</div>
									<div class="text-muted small text-center align-self-center">
										<span class="d-none d-sm-inline-block"><i
											class="far fa-eye"></i> 49</span> <span><i
											class="far fa-comment ml-2"></i> 9</span>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body p-2 p-sm-3">
								<div class="media forum-item">
									<a href="#" data-toggle="collapse" data-target=".forum-content"><img
										src="https://bootdey.com/img/Content/avatar/avatar5.png"
										class="mr-3 rounded-circle" width="50" alt="User" /></a>
									<div class="media-body">
										<h6>
											<a href="#" data-toggle="collapse"
												data-target=".forum-content" class="text-body">Create a
												delimiter field</a>
										</h6>
										<p class="text-secondary">lorem ipsum dolor sit amet lorem
											ipsum dolor sit amet lorem ipsum dolor sit amet</p>
										<p class="text-muted">
											<a href="javascript:void(0)">jackalds</a> replied <span
												class="text-secondary font-weight-bold">12 hours ago</span>
										</p>
									</div>
									<div class="text-muted small text-center align-self-center">
										<span class="d-none d-sm-inline-block"><i
											class="far fa-eye"></i> 65</span> <span><i
											class="far fa-comment ml-2"></i> 10</span>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body p-2 p-sm-3">
								<div class="media forum-item">
									<a href="#" data-toggle="collapse" data-target=".forum-content"><img
										src="https://bootdey.com/img/Content/avatar/avatar1.png"
										class="mr-3 rounded-circle" width="50" alt="User" /></a>
									<div class="media-body">
										<h6>
											<a href="#" data-toggle="collapse"
												data-target=".forum-content" class="text-body">One model
												4 tables</a>
										</h6>
										<p class="text-secondary">lorem ipsum dolor sit amet lorem
											ipsum dolor sit amet lorem ipsum dolor sit amet</p>
										<p class="text-muted">
											<a href="javascript:void(0)">bugsysha</a> replied <span
												class="text-secondary font-weight-bold">14 hours ago</span>
										</p>
									</div>
									<div class="text-muted small text-center align-self-center">
										<span class="d-none d-sm-inline-block"><i
											class="far fa-eye"></i> 45</span> <span><i
											class="far fa-comment ml-2"></i> 4</span>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body p-2 p-sm-3">
								<div class="media forum-item">
									<a href="#" data-toggle="collapse" data-target=".forum-content"><img
										src="https://bootdey.com/img/Content/avatar/avatar1.png"
										class="mr-3 rounded-circle" width="50" alt="User" /></a>
									<div class="media-body">
										<h6>
											<a href="#" data-toggle="collapse"
												data-target=".forum-content" class="text-body">Auth
												attempt returns false</a>
										</h6>
										<p class="text-secondary">lorem ipsum dolor sit amet lorem
											ipsum dolor sit amet lorem ipsum dolor sit amet</p>
										<p class="text-muted">
											<a href="javascript:void(0)">michaeloravec</a> replied <span
												class="text-secondary font-weight-bold">18 hours ago</span>
										</p>
									</div>
									<div class="text-muted small text-center align-self-center">
										<span class="d-none d-sm-inline-block"><i
											class="far fa-eye"></i> 70</span> <span><i
											class="far fa-comment ml-2"></i> 3</span>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<!-- /Forum List -->

					<!-- Forum Detail -->
					<div class="inner-main-body p-2 p-sm-3 collapse forum-content">
						<a href="#" class="btn btn-light btn-sm mb-3 has-icon"
							data-toggle="collapse" data-target=".forum-content"><i
							class="fa fa-arrow-left mr-2"></i>Back</a>
						<div class="card mb-2">
							<div class="card-body">
								<div class="media forum-item">
									<a href="javascript:void(0)" class="card-link"> <img
										src="https://bootdey.com/img/Content/avatar/avatar1.png"
										class="rounded-circle" width="50" alt="User" /> <small
										class="d-block text-center text-muted">Newbie</small>
									</a>
									<div class="media-body ml-3">
										<a href="javascript:void(0)" class="text-secondary">Mokrani</a>
										<small class="text-muted ml-2">1 hour ago</small>
										<h5 class="mt-1">Realtime fetching data</h5>
										<div class="mt-3 font-size-sm">
											<p>Hellooo :)</p>
											<p>I'm newbie with laravel and i want to fetch data from
												database in realtime for my dashboard anaytics and i found a
												solution with ajax but it dosen't work if any one have a
												simple solution it will be helpful</p>
											<p>Thank</p>
										</div>
									</div>
									<div class="text-muted small text-center">
										<span class="d-none d-sm-inline-block"><i
											class="far fa-eye"></i> 19</span> <span><i
											class="far fa-comment ml-2"></i> 3</span>
									</div>
								</div>
							</div>
						</div>
						<div class="card mb-2">
							<div class="card-body">
								<div class="media forum-item">
									<a href="javascript:void(0)" class="card-link"> <img
										src="https://bootdey.com/img/Content/avatar/avatar2.png"
										class="rounded-circle" width="50" alt="User" /> <small
										class="d-block text-center text-muted">Pro</small>
									</a>
									<div class="media-body ml-3">
										<a href="javascript:void(0)" class="text-secondary">drewdan</a>
										<small class="text-muted ml-2">1 hour ago</small>
										<div class="mt-3 font-size-sm">
											<p>What exactly doesn't work with your ajax calls?</p>
											<p>Also, WebSockets are a great solution for realtime
												data on a dashboard. Laravel offers this out of the box
												using broadcasting</p>
										</div>
										<button class="btn btn-xs text-muted has-icon">
											<i class="fa fa-heart" aria-hidden="true"></i>1
										</button>
										<a href="javascript:void(0)" class="text-muted small">Reply</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /Forum Detail -->

					<!-- /Inner main body -->
				</div>
				<!-- /Inner main -->
			</div>

			<!-- New Thread Modal -->
			<div class="modal fade" id="threadModal" tabindex="-1" role="dialog"
				aria-labelledby="threadModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<form>
							<div
								class="modal-header d-flex align-items-center bg-primary text-white">
								<h6 class="modal-title mb-0" id="threadModalLabel">New
									Discussion</h6>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label for="threadTitle">Title</label> <input type="text"
										class="form-control" id="threadTitle"
										placeholder="Enter title" autofocus="" />
								</div>
								<textarea class="form-control summernote" style="display: none;"></textarea>

								<div class="custom-file form-control-sm mt-3"
									style="max-width: 300px;">
									<input type="file" class="custom-file-input" id="customFile"
										multiple="" /> <label class="custom-file-label"
										for="customFile">Attachment</label>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
								<button type="button" class="btn btn-primary">Post</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>