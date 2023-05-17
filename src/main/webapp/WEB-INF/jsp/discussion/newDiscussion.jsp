<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<jsp:include page="../layout/navbar.jsp" />
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>發表討論</title>

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

.inner-main-footer, .inner-main-header, .inner-main-header2,
	.inner-sidebar-footer, .inner-sidebar-header {
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

.inner-main-footer, .inner-main-header, .inner-main-header2 {
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
@media (max-width: 1260px) {
	.container {
	max-width: 96%;
	} /* 當寬度1259px↓　寬度設定 */
}
.container {
	max-width: 69%;
}
</style>
					<!-- ================================== ck editor ================================== -->
					<!-- <script src="${contextRoot}/js/ckeditor/ckeditor.js"></script> -->
					<script src="${contextRoot}/js/ckeditor5-build-classic/ckeditor.js"></script>
					<!-- ================================== ck editor ================================== -->
</head>
<div class="container">
	<div class="main-body p-0">
		<div class="inner-wrapper">
			<div class="inner-main">
				<div class="inner-main-body collapse forum-content show">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title text-center">發表討論</h5>
						</div>
						<div class="card-body">
							<form:form modelAttribute="discussion" method="post" action="${contextRoot}/discussion/post">
								<div class="form-group">
									<!--  把member_id值設定至discussion的normalMember -->
									<form:hidden path="normalMember" value="${result.id}"></form:hidden>
									<label for="title">標題</label> <form:input id="titleInput" path="title" type="text"
										class="form-control" placeholder="輸入標題"></form:input>
								</div>
								<div class="form-group">
									<label for="category">分類</label> <form:select path="type" class="form-control"
										id="category">
										<option>生活</option>
										<option>吃喝</option>
										<option>玩樂</option>
									</form:select>
								</div>
								<div class="form-group">
									<label for="content">内容</label>
														<!-- ================================== ck editor ================================== -->
														<form:textarea path="contents" id="editor" name="content"
															placeholder="請在這裡填寫內容"></form:textarea>
														<!-- ================================== ck editor ================================== -->
								</div>
								<button type="submit" class="btn btn-primary">發表</button>
							</form:form>
							<a href="${contextRoot}/discussion/allDiscussion/10"
								class="btn btn-primary">返回討論列</a>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ================================== ck editor ================================== -->
<script>
	ClassicEditor
	.create(document.querySelector('#editor'), {
		extraPlugins: [CustomUploadAdapterPlugin],
	
	
		customUploadAdapter: {
			uploadUrl: '${contextRoot}/discussion/upload/image'
		}
	})
	.then(editor => {
		console.log(editor);
	})
	.catch(error => {
		console.error(error);
	});
	
	function CustomUploadAdapterPlugin(editor) {
	editor.plugins.get('FileRepository').createUploadAdapter = loader => {
		return new CustomUploadAdapter(loader, editor.config.get('customUploadAdapter.uploadUrl'));
	};
	}
	
	
	
	
	
	class CustomUploadAdapter {
		constructor(loader, uploadUrl) {
			this.loader = loader;
			this.uploadUrl = uploadUrl;
		}
	
		upload() {
			return this.loader.file
				.then(file => new Promise((resolve, reject) => {
					this._uploadFile(file).then(response => {
						if (response.url) {
							resolve({ default: response.url });
						} else {
							reject(`Upload failed: ${response.message}`);
						}
					});
				}));
		}
	
		_uploadFile(file) {
			const data = new FormData();
			data.append('file', file);
	
			return fetch(this.uploadUrl, {
				method: 'POST',
				body: data
			})
				.then(response => response.json())
				.catch(error => {
					console.error('Upload error:', error);
					throw error;
				});
		}
	}
	</script>
<!-- ================================== ck editor ================================== -->
</html>