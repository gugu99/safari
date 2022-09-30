<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/css/plugins/forms/wizard.css">
<%@ include file="/WEB-INF/view/inc/common-css.jsp"%>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/addWorkspace.css">


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
		<div class="content-overlay"></div>
		<div class="row" class="container">
		<div class="content-wrapper">
			<div class="content-header row">
				<div class="content-header-left col-md-6 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-12">
						</div>
					</div>
					<h3 class="content-header-title mb-0">워크스페이스 게스트 코드인증</h3>
				</div>
				<div class="content-header-right col-md-6 col-12">
					<div class="btn-group float-md-right" role="group"
						aria-label="Button group with nested dropdown">
					</div>
				</div>
			</div>
			<div class="content-body">
				<div class="row match-height">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title" id="basic-layout-form-center">게스트 인증</h4>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                                            <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                            <li><a data-action="expand"><i class="feather icon-maximize"></i></a></li>
                                            <li><a data-action="close"><i class="feather icon-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">


                                        <form class="form">
                                            <div class="row justify-content-md-center">
                                                <div class="col-md-9">
                                                    <div class="form-body">

                                                        <div class="form-group">
                                                            <input type="tel" id="eventInput5" class="form-control" name="contact" placeholder="인증번호를 적어주세요">
                                                        </div>


                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                <button id="" type="button" class="btn btn-primary">
                                                    <i class="fa fa-check-square-o"></i> 인증하기
                                                </button>
                                           		 </div>
											</div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
			</div>
			
		</div>
	</div>
	</div>

	<!-- Form wizard with number tabs section end -
    <!-- END: Content-->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<%@ include file="/WEB-INF/view/inc/footer.jsp"%>
	<!-- footer -->


	<%@ include file="/WEB-INF/view/inc/common-js.jsp"%>
	<!-- js -->


</body>
<!-- END: Body-->

<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>



<!-- BEGIN: Vendor JS-->
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/extensions/jquery.steps.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/dateTime/moment-with-locales.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/daterange/daterangepicker.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script
	src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script
	src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/wizard-stepsMember.js"></script>
<!-- END: Page JS-->


<script>
$(document).ready(function() {
	// 사원 초대폼 유효성검사
	$('#inviteButton').click(function() {
		
		
		
	});
});
	

</script>


</html>