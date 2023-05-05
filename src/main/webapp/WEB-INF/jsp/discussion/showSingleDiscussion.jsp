<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

				<html>

				<head>
					<jsp:include page="../layout/navbar.jsp" />
					<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
					<meta charset="UTF-8">
					<title>文章</title>

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

						@media (min-width : 992px) {
							.sticky-navbar .inner-wrapper {
								height: calc(100vh - 3.5rem - 48px);
							}
						}

						.inner-main,
						.inner-sidebar {
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

						.inner-main-footer,
						.inner-main-header,
						.inner-main-header2,
						.inner-sidebar-footer,
						.inner-sidebar-header {
							height: 3.5rem;
							border-bottom: 1px solid #cbd5e0;
							display: flex;
							align-items: center;
							padding: 0 1rem;
							flex-shrink: 0;
						}

						.inner-main-body,
						.inner-sidebar-body {
							position: relative;
							flex: 1 1 auto;
						}

						.inner-main-body .sticky-top,
						.inner-sidebar-body .sticky-top {
							z-index: 999;
						}

						.inner-main-footer,
						.inner-main-header,
						.inner-main-header2 {
							background-color: #fff;
						}

						.inner-main-footer,
						.inner-sidebar-footer {
							border-top: 1px solid #cbd5e0;
							border-bottom: 0;
							height: auto;
							min-height: 3.5rem;
						}

						@media (max-width : 767.98px) {
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

						.nav .show>.nav-link.nav-link-faded,
						.nav-link.nav-link-faded.active,
						.nav-link.nav-link-faded:active,
						.nav-pills .nav-link.nav-link-faded.active,
						.navbar-nav .show>.nav-link.nav-link-faded {
							color: #3367b5;
							background-color: #c9d8f0;
						}

						.nav-pills .nav-link.active,
						.nav-pills .show>.nav-link {
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
							box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
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
							margin-top: 3px;
							/*分頁選單option*/
						}

						.custom-select.custom-select-sm.mr-1 {
							width: 150px;
							/*分頁選單option*/
							margin-left: 15px;
						}
					</style>
					<!-- ================================== ck editor ================================== -->
					<script src="${contextRoot}/js/ckeditor/ckeditor.js"></script>
					<!-- ================================== ck editor ================================== -->
				</head>
				<div class="container">
					<div class="main-body p-0">
						<div class="inner-wrapper">

							<div class="inner-main">
								<div class="inner-main-header">
									<ul
										class="pagination pagination-sm pagination-circle justify-content-center mb-1 ml-auto">
										<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
											<jstl:choose>
												<jstl:when test="${page.number+1 != pageNumber }">
													<li class="page-item"><a class="page-link"
															href="${contextRoot}/message/allMessages/${discussion.d_id}?p=${pageNumber}">${pageNumber}</a>
													</li>
													<!-- p 是DiscussionsController,toShowAllDiscussion內的p -->
												</jstl:when>
												<jstl:otherwise>
													<li class="page-item"><a class="page-link">${pageNumber}</a></li>

												</jstl:otherwise>
											</jstl:choose>

										</jstl:forEach>
										<!-- <li class="page-item active"><span class="page-link">G</span></li>
											<li class="page-item"><a class="page-link"
												href="javascript:void(0)">G</a></li>
											<li class="page-item"><a class="page-link has-icon"
												href="javascript:void(0)"><i class="material-icons">chevron_right</i></a>
											</li> -->
									</ul>
								</div>
								<div class="inner-main-body collapse forum-content show">
									<div class="card">
										<div class="card-header">
											<h5 class="card-title text-center">文章</h5>
										</div>
										<div class="card-body">
											<form:form modelAttribute="discussion" method="post"
												action="${contextRoot}/discussion/post">
												<div class="form-group">
													<label for="title">標題</label>
													<p>${discussion.title}</p>
												</div>
												<div class="form-group">
													<label for="category">分類</label>
													<p>${discussion.type}</p>
												</div>
												<div class="form-group">
													<label for="content">内容</label>
													<p>${discussion.contents}</p>
												</div>
											</form:form>
										</div>
										<div class="inner-main-header">
											<a href="${contextRoot}/discussion/editDiscussion/${discussion.d_id}"><button
													class="btn btn-primary" type="submit">編輯</button></a>

											<form action="${contextRoot}/discussion/deleteDiscussion/${discussion.d_id}"
												method="post">
												<input type="hidden" name="_method" value="delete">
												<button class="btn btn-primary danger" type="submit">刪除</button>
											</form>
										</div>
									</div>
									<div class="card">
										<div class="card-header">
											<h5 class="card-title text-center">回覆</h5>
										</div>

										<!-- ========================顯示回覆訊息======================== -->
										<jstl:forEach var="message" items="${page.content}">
											<div class="card">
												<div class="card-body p-2 p-sm-3">
													<div class="media forum-item">
														<a href="#" data-toggle="collapse"
															data-target=".forum-content"><img
																src="https://bootdey.com/img/Content/avatar/avatar1.png"
																class="mr-3 rounded-circle" width="50" alt="User" /></a>
														<div class="media-body">
															<h3>${message.contents}</h3>
															<p class="text-muted">
															<h5>Author:
																<a href="#">${discussion.normalMmeber.nickName}</a>
																posted
															</h5><span class="text-secondary font-weight-bold">
																<fmt:formatDate pattern="EEEE yyyy-MM-dd HH:mm:ss"
																	value="${message.postDate}" />
															</span>
															</p>
														</div>
														<div>
															<a
																href="${contextRoot}/message/editMessage/${message.dm_id}"><button
																	class="btn btn-primary"
																	type="submit">編輯</button></a>

															<form
																action="${contextRoot}/message/deleteMessage/${discussion.d_id}/${message.dm_id}"
																method="post">
																<input type="hidden" name="_method" value="delete">
																<button class="btn btn-primary danger"
																	type="submit">刪除</button>
															</form>
														</div>
														<div class="text-muted small text-center align-self-center">
															<span class="d-none d-sm-inline-block"><i
																	class="far fa-eye"></i> 19</span> <span><i
																	class="far fa-comment ml-2"></i> 3</span>
														</div>
													</div>
												</div>
											</div>
										</jstl:forEach>

										<div class="card">
											<form:form modelAttribute="replyDiscussion" method="post"
												action="${contextRoot}/message/post/${discussion.d_id}">

												<form:input type="hidden" path="discussions"
													value="${discussion.d_id}" />
												<div class="form-group">

													<!-- ================================== ck editor ================================== -->
													<form:textarea path="contents" id="editor" placeholder="請在這裡填寫內容" />
													<!-- ================================== ck editor ================================== -->

													<!-- <form:textarea path="contents" class="form-control" id="content" rows="5"
											placeholder="輸入内容" ></form:textarea> -->
												</div>
												<button type="submit" class="btn btn-primary">發表回覆</button>
											</form:form>

											<a href="${contextRoot}/discussion/allDiscussion"
												class="btn btn-primary">返回文章列</a>
										</div>




									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ================================== ck editor ================================== -->
					<script>
						CKEDITOR.replace("editor");
						ClassicEditor.create(document.querySelector('#editor'), {
							plugins: [Essentials, Paragraph, Bold, Italic],
							toolbar: ['bold', 'italic']
						})
					</script>
					<!-- ================================== ck editor ================================== -->

				</html>