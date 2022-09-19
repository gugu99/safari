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
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item"><a href="#">Page</a></li>
							</ol>
						</div>
					</div>
					<h3 class="content-header-title mb-0">워크스페이스 멤버가입</h3>
				</div>
				<div class="content-header-right col-md-6 col-12">
					<div class="btn-group float-md-right" role="group"
						aria-label="Button group with nested dropdown">
						<div class="btn-group" role="group">
							<button
								class="btn btn-outline-primary dropdown-toggle dropdown-menu-right"
								id="btnGroupDrop1" type="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								<i class="feather icon-settings icon-left"></i> Settings
							</button>
							<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
								<a class="dropdown-item" href="card-bootstrap.html">Bootstrap
									Cards</a><a class="dropdown-item"
									href="component-buttons-extended.html">Buttons Extended</a>
							</div>
						</div>
						<a class="btn btn-outline-primary" href="full-calender-basic.html"><i
							class="feather icon-mail"></i></a><a class="btn btn-outline-primary"
							href="timeline-center.html"><i class="feather icon-pie-chart"></i></a>
					</div>
				</div>
			</div>
			<div class="content-body">
				<!-- Form wizard with number tabs section start -->
				<section id="number-tabs">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">워크스페이스멤버 가입폼</h4>
									<a class="heading-elements-toggle"><i
										class="fa fa-ellipsis-h font-medium-3"></i></a>
									<div class="heading-elements">
										<ul class="list-inline mb-0">
											<li><a data-action="collapse"><i
													class="feather icon-minus"></i></a></li>
											<li><a data-action="reload"><i
													class="feather icon-rotate-cw"></i></a></li>
											<li><a data-action="expand"><i
													class="feather icon-maximize"></i></a></li>
											<li><a data-action="close"><i class="feather icon-x"></i></a></li>
										</ul>
									</div>
								</div>
								<div class="card-content collapse show">
									<div class="card-body">
										<form id="addWorkspaceForm" action="${pageContext.request.contextPath }/safari/addWorkspace" class="number-tab-steps wizard-circle" method="post">
											
											<!-- Step 1 -->
											<h6>Step 1</h6>
											<fieldset>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label for="firstName1">워크스페이스 제목</label> <input
																type="text" name="workName" class="form-control" id="firstName1">
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group">
															<label for="lastName1">관리자 이름</label> <input
																name="workMemberName" type="text" class="form-control" id="lastName1">
														</div>
													</div>
												</div>


											</fieldset>

											<!-- Step 2 -->
											<h6>Step 2</h6>
											<fieldset>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label for="proposalTitle1">주소</label> <input
																type="text" class="form-control" id="proposalTitle1">
														</div>
													</div>
													<div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="date1">생년월일</label>
                                                            <input type="date" class="form-control" id="date1">
                                                        </div>
                                                    </div>
												</div>
											</fieldset>

											<!-- Step 3 -->
											<h6>Step 3</h6>
											<fieldset>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label for="eventName1">부서</label> <input
																type="text" class="form-control" id="eventName1">
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group">
															<label for="eventName1">직급</label> <input
																type="text" class="form-control" id="eventName1">
														</div>
													</div>
												</div>
											</fieldset>

											<!-- Step 4 -->
											<h6>Step 4</h6>
											<fieldset class="add">
											<p>
											</p>
												<div class="row">
												
													<div class="col-md-3">
														<div class="form-group">
															<label for="meetingName1">초대멤버이메일</label> <input
																type="text" class="form-control" id="meetingName1">
														</div>
											        
													</div>
													<div class="col-md-3">
														<div class="form-group">
														<label for="meetingName1">이메일</label>
														 <input
																type="text" class="form-control" id="meetingName1">
														</div>
											        
													</div>
													
													<div class="col-md-3">
														<div class="email_form">
											            <label for="meetingName2" >메일 선택</label>
											            <select id="meetingName2" name="email3" title="이메일 주소 선택" class="form-control">
											                <option value="">  이메일주소 직접입력  </option>
											                <option value="naver.com">naver.com</option>
											                <option value="nate.com">nate.com</option>
											                <option value="gmail.com">gmail.com</option>
											                <option value="yahoo.com">yahoo.com</option>
											                <option value="hanmail.net">hanmail.net</option>
											            </select>
											        </div>
											       
													</div>
													<div class="col-md-3">
														<div class="form-group">
														<label for="meetingName1">멤버추가</label>
														 <button type="button" class="btn btn danger form-control" id="btn_add">
																추가</button>
														</div>
											        
													</div>
												</div>
											</fieldset>
											
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
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
	src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/wizard-steps.js"></script>
<!-- END: Page JS-->

<script>            
$(document).ready(function(){  
	$("#btn_add").on('click',function(){ 
		
		var tmpHtml =
		"<div id='remove1' name='remove' class='row addInput'>"+
				"<div class='col-md-3'>"+
				"<div class='form-group'>"+
					"<input type='text' class='form-control' id='meetingName1'>"+
				"</div>"+
			"</div>"+
			"<div class='col-md-3'>"+
				"<div class='form-group'>"+
					 "<input type='text' class='form-control' id='meetingName1'>"+
				"</div>"+
			"</div>"+
			"<div class='col-md-3'>"+
				"<div class='email_form'>"+
		    	"<select id='meetingName2' name='email3' title='이메일 주소 선택' class='form-control'>"+
		            "<option value=''>  이메일주소 직접입력  </option>"+
		            "<option value='naver.com'>naver.com</option>"+
		            "<option value='nate.com'>nate.com</option>"+
		            "<option value='gmail.com'>gmail.com</option>"+
		            "<option value='yahoo.com'>yahoo.com</option>"+
		            "<option value='hanmail.net'>hanmail.net</option>"+
		        "</select>"+
			 	"</div>"+
			"</div>"+
				"<div class='col-md-3'>"+
					"<div class='form-group'>"+
						 "<button type='button' class='btn btn danger form-control' name='remove1' id='btn_mi'>멤버삭제</button>"+
				"</div>"+
			"</div>"+
		"</div>"
		  $(".add").append(tmpHtml);}); 
		
		var trHtml = $( "div[name=remove]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
		$(document).on('click','button[name=remove1]',function(){   
			
			$('#remove1').remove();
			
			 }); 
});

</script>





</html>