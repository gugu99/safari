<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<title>Index</title>
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">

<%@ include file="/WEB-INF/view/inc/common-css.jsp"%>
<!-- css -->

<style>
body.vertical-layout.vertical-menu-modern .content, body.vertical-layout.vertical-menu-modern .footer
	{
	margin-left: 0px;
}

.fonticon-container>.fonticon-wrap {
	float: none;
	width: auto;
	height: auto;
	line-height: normal;
	text-align: center;
	border-radius: 0.1875rem;
	margin-right: 1rem;
	margin-bottom: 1.5rem;
}
</style>


</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern content-detached-right-sidebar   fixed-navbar"
	data-open="click" data-menu="vertical-menu-modern"
	data-col="content-detached-right-sidebar">

	<%@ include file="/WEB-INF/view/inc/header.jsp"%>
	<!-- header -->

	<!-- BEGIN: Content-->
	<div class="app-content content">

		<div class="app-content content">
			<div class="content-overlay"></div>
			<div class="content-wrapper">
				<div class="content-header row"></div>


				<div class="col-lg-4 col-md-6 col-sm-12">
					<div class="form-group">
						<!-- Modal -->
						<div class="modal fade text-left" id="iconForm" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel34" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="myModalLabel34">Workspace
											create</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="card-content">
										<div class="card-body pt-0">
											<form class="form-horizontal"
												action="${pageContext.request.contextPath }/safari/addWorkspace"
												method="post">
												<fieldset class="form-group floating-label-form-group">
													<label for="workName">Workspace name</label> <input
														name="workName" type="text" class="form-control"
														id="workName" placeholder="name">
												</fieldset>
												<fieldset class="form-group floating-label-form-group">
													<label for="workName">Admin name</label> <input
														name="workMemberName" type="text" class="form-control"
														id="workMemberName" placeholder="name">
												</fieldset>
												<div class="form-group row">
													<div class="col-sm-6 col-12 text-center text-sm-left">
													</div>
												</div>
												<button type="submit"
													class="btn btn-outline-primary btn-block">
													<i class="feather icon-unlock"></i>Create
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				
				<div class="container">
				<div class="row">
				<!-- 워크스페이스 목록-->
				<div class="col-lg-4 col-md-4">
						<div class="card text-center">
							<div class="card-content">
								<div class="card-body">
									<h4 class="card-title success">workspace</h4>
									<p class="card-text">
									<div class="col-md-12 col-sm-12 col-12 fonticon-container">
										<div class="fonticon-wrap">
											<i class="fa fa-plus"></i>
										</div>
									</div>
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-outline-success"
										data-toggle="modal" data-target="#iconForm">create
										workspace</button>
								</div>
							</div>
						</div>
					</div>
				
				
				
				<!--워크스페이스 추가 폼  -->
					<div class="col-lg-4 col-md-4">
						<div class="card text-center">
							<div class="card-content">
								<div class="card-body">
									<h4 class="card-title success">workspace</h4>
									<p class="card-text">
									<div class="col-md-12 col-sm-12 col-12 fonticon-container">
										<div class="fonticon-wrap">
											<i class="fa fa-plus"></i>
										</div>
									</div>
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-outline-success"
										data-toggle="modal" data-target="#iconForm">create
										workspace</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="content-body"></div>
				</div>
			</div>
		</div>

		<div class="content-overlay"></div>
	</div>
	<!-- END: Content-->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<%@ include file="/WEB-INF/view/inc/footer.jsp"%>
	<!-- footer -->


	<%@ include file="/WEB-INF/view/inc/common-js.jsp"%>
	<!-- js -->


</body>
<!-- END: Body-->

</html>