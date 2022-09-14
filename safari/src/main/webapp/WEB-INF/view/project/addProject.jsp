<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>addProjectForm</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/selects/select2.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/colors/palette-gradient.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
    <!-- END: Custom CSS-->
    
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern 2-columns   fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">
	<%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->


    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h3 class="content-header-title mb-0">프로젝트 추가</h3>
                    <div class="row breadcrumbs-top">
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a>
                                </li>
                                <li class="breadcrumb-item active"><a href="#">Form Repeater</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="content-header-right col-md-6 col-12 mb-md-0 mb-2">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                        <div class="btn-group" role="group">
                            <button class="btn btn-outline-primary dropdown-toggle dropdown-menu-right" id="btnGroupDrop1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-settings icon-left"></i> Settings</button>
                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"><a class="dropdown-item" href="card-bootstrap.html">Bootstrap Cards</a><a class="dropdown-item" href="component-buttons-extended.html">Buttons Extended</a></div>
                        </div><a class="btn btn-outline-primary" href="full-calender-basic.html"><i class="feather icon-mail"></i></a><a class="btn btn-outline-primary" href="timeline-center.html"><i class="feather icon-pie-chart"></i></a>
                    </div>
                </div>
            </div>
            <div class="content-body">

                <!-- Form control repeater section start -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title" id="file-repeater">Project Info</h4>
                                <a class="heading-elements-toggle"><i class="icon-ellipsis font-medium-3"></i></a>
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
                                
                                	<!-- 프로젝트 그룹(옵션), 이름, 공개범위, 멤버(권한 설정 필요)를 입력할 수 있다. -->
                                    <form class="form row">
                                        <div class="form-group col-md-6 mb-2">
                                        	 <select name="projectGrouNo" class="form-control">
                                                <option value="none" selected="" disabled="">프로젝트 그룹</option>
                                                <option value="design">design</option>
                                                <option value="development">development</option>
                                                <option value="illustration">illustration</option>
                                                <option value="branding">branding</option>
                                                <option value="video">video</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6 mb-2">
                                        	 <select name="projectAuth" class="form-control">
												<option value="none" selected="" disabled="">공개범위</option>
                                                <option value="N">public</option>
                                                <option value="Y">private</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-12 mb-2">
                                            <input type="text" class="form-control" placeholder="프로젝트 이름" name="projectName">
                                        </div>

				                         <div class="form-group col-12 mb-2">
				                         	<div class="card-content collapse show">
			                                    <div class="card-body">
			                                           <div class="font-medium-2">
			                                               프로젝트 멤버
			                                           </div>
			                                           <select class="select2 form-control" multiple="multiple">
			                                               <optgroup label="Alaskan/Hawaiian Time Zone">
			                                                   <option value="AK">Alaska</option>
			                                                   <option value="HI">Hawaii</option>
			                                               </optgroup>
			                                               <optgroup label="Pacific Time Zone">
			                                                   <option value="CA" selected>California</option>
			                                                   <option value="NV">Nevada</option>
			                                                   <option value="OR">Oregon</option>
			                                                   <option value="WA">Washington</option>
			                                               </optgroup>
			                                           </select>
			                                     	 	</div>
			                                      </div>
			                              </div>
                        			   </form>
            	        		 </div><!-- class="card-body" -->
                      		 </div>
                   		</div>
                 	</div>
			  </div>
           </div> <!-- // Form control repeater section end -->
     	</div>
	</div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light navbar-border">
        <p class="clearfix blue-grey lighten-2 text-sm-center mb-0 px-2"><span class="float-md-left d-block d-md-inline-block">Copyright &copy; 2020 <a class="text-bold-800 grey darken-2" href="https://1.envato.market/pixinvent_portfolio" target="_blank">PIXINVENT </a></span><span class="float-md-right d-none d-lg-block">Hand-crafted & Made with <i class="feather icon-heart pink"></i></span></p>
    </footer>
    <!-- END: Footer-->

    <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/form-repeater.js"></script>
    <!-- END: Page JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/select/form-select2.js"></script>
    <!-- END: Page JS-->
	
</body>
<!-- END: Body-->

</html>