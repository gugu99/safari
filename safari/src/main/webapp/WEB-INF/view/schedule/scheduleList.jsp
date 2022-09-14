<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Index</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/icheck/icheck.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/icheck/custom.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/photo-swipe/photoswipe.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/photo-swipe/default-skin/default-skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/charts/leaflet.css">
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/pages/timeline.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
    <!-- END: Custom CSS-->
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern content-detached-right-sidebar   fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-right-sidebar">

    <%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->

     <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h2 class="content-header-title mb-0">Schedule</h2>
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
            <div class="content-body justify-content-center row mt-2">
                <section id="timeline" class="timeline-center col-md-8">
                    <div class="timeline-card card border-grey border-lighten-2">
                        <div class="card-content">
                        	 <div class="px-0 py-0 ml-1 mt-1">
	                       	 	<div class="avatar avatar-offline bg-info m-0 mr-50"></div>
	                             작성자
	                             <span class="blue-grey">2022-09-14 00:00:00</span>
	                       	 	<h3 class="card-text mt-2 mb-1 ml-1">일정 제목</h3>
                        	 </div>
                        	 	
                            
                            <div class="card-footer px-0 py-0">
                             <div class="card-content">
                                 <div class="card-body">
                                     <p class="card-text">가나다라마바사아자차카타파</p>
                                     <ul class="list-inline mb-0">
                                         <li class="pr-1"><a href="#" class=""><span class="fa fa-thumbs-o-up"></span> Like</a></li>
                                         <li class="pr-1"><a href="#" class=""><span class="fa fa-commenting-o"></span> Comment</a></li>
                                     </ul>
                                 </div>
                             </div>
                            </div>
                            
                            <!-- 댓글 -->
                            <div class="card-footer px-0 py-0">
                                <div class="card-body">
                                    <div class="media">
                                    	<!-- 프로필 이미지 -->
                                        <div class="media-left">
                                            <div class="avatar avatar-offline bg-info m-0 mr-50"></div>
                                        </div>
                                        
                                        <div class="media-body ml-1">
                                            <p class="text-bold-600 mb-0">Jason Ansley 
                                            	<a href="#" class=""><span class="fa fa-thumbs-o-up"></span> Like</a>
                                            </p>
                                            <p class="m-0">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante
                                                sollicitudin commodo.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- comment input -->
                            <div class="card-footer px-0 py-0">
                             <div class="card-body">
                                 <fieldset class="form-group position-relative has-icon-left mb-0">
                                     <input type="text" class="form-control" placeholder="입력 Enter입니다.">
                                     <div class="form-control-position">
                                         <i class="fa fa-dashcube"></i>
                                     </div>
                                 </fieldset>
                             </div>
                            </div>
                            <!-- comment input end -->
                        </div>
                    </div>
                    
                </section>
            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <%@ include file="/WEB-INF/view/inc/footer.jsp" %> <!-- footer -->


   <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/masonry/masonry.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/photo-swipe/photoswipe.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/photo-swipe/photoswipe-ui-default.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/charts/leaflet/leaflet.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/charts/apexcharts/apexcharts.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/gallery/photo-swipe/photoswipe-script.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/timeline.js"></script>
    <!-- END: Page JS-->


</body>
<!-- END: Body-->

</html>