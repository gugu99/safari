<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Task Analytics</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/fonts/simple-line-icons/style.min.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/assets/css/taskAnalytics.css">
    <!-- link(rel='stylesheet', type='text/css', href=app_assets_path+'/css'+rtl+'/pages/users.css')-->
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
    <!-- END: Custom CSS-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->
<body class="vertical-layout vertical-menu-modern 2-columns  menu-collapsed fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

	 <%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	 <%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->

    <!-- BEGIN: Content-->
    <div class="app-content content">
    	<%@ include file="/WEB-INF/view/task/taskHeader.jsp" %> <!-- taskHeader -->
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
            
                <!-- Analytics spakline & chartjs  -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="row my-1">
                                        <div class="col-lg-2 col-12" id="taskAnalytics">
                                            <div class="text-center">
                                                <h6>시작일</h6>
                                                <p class="text-muted">${m.projectStart == null ? '-' : m.projectStart}<!-- <i class="feather icon-plus"></i> --></p>
                                                <div id="sp-tristate-bar-total-revenue"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-12" id="taskAnalytics">
                                            <div class="text-center">
                                                <h6>마감일</h6>
                                                <p class="text-muted">${m.projectDeadline == null ? '-' : m.projectDeadline}<!-- <i class="feather icon-plus"></i> --></p>
                                                <div id="sp-stacked-bar-total-sales"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-12" id="taskAnalytics">
                                            <div class="text-center">
                                                <h6>완료일</h6>
                                                <p class="text-muted">${m.projectEnd == null ? '-' : m.projectEnd}<!-- <i class="feather icon-plus"></i> --></p>
                                                <div id="sp-bar-total-cost"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-1 col-12" id="taskAnalytics">
                                            <div class="text-center">
                                                <h6>경과시간</h6>
                                                <p class="text-muted">${m.nowMinusStart == null ? '-' : m.nowMinusStart}일</p>
                                                <div id="sp-tristate-bar-total-revenue"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-1 col-12" id="taskAnalytics">
                                            <div class="text-center">
                                                <h6>남은시간</h6>
                                                <p class="text-muted">${m.deadlineMinusNow == null ? '-' : m.deadlineMinusNow}일</p>
                                                <div id="sp-stacked-bar-total-sales"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-12" id="taskAnalytics">
                                            <div class="text-center">
                                                <h6>완료됨</h6>
                                                <p class="text-muted">${m.endTaskCnt == null ? '-' : m.endTaskCnt}개 업무 (${m.endTaskPer == null ? '-' : m.endTaskPer}%)</p>
                                                <div id="sp-bar-total-cost"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-12">
                                            <div class="text-center">
                                                <h6>남은업무</h6>
                                                <p class="text-muted">${m.notEndTaskCnt == null ? '-' : m.notEndTaskCnt}개 업무 (${m.notEndTaskPer == null ? '-' : m.notEndTaskPer}%)</p>
                                                <div id="sp-bar-total-cost"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Analytics spakline & chartjs  -->
                
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-12">
                        <div class="card">
                            <div class="card-content">
                            	<div class="card-header">
                           			<h4>프로젝트 개요</h4>
                            	</div>
                                <div class="card-body">
	                                <div class="height-200">
	                                    <div class="chartjs-size-monitor">
                                    		<div class="chartjs-size-monitor-expand">
                                    			<div></div>
                                    		</div>
                                    		<div class="chartjs-size-monitor-shrink">
                                    			<div></div>
                                    		</div>
	                                   	</div>
                                        <canvas id="bar-stacked" width="1000" height="200" style="width:70%;max-width:1000px;margin:auto;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" class="chartjs-render-monitor" >
                                        </canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Audience by country & users visit -->
               	<section id="chartjs-pie-charts">
	                <div class="row match-height">
	                    <div class="col-xl-6 col-lg-12"> 
	                        <div class="card">
	                            <div class="card-header border-0">
	                                <h4 class="card-title">나에게 배정된 업무</h4>
	                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
	                            </div>
	                            <div class="card-content collapse show">
	                                <div class="card-body">
	                                    <div class="height-400">
	                                    	<div class="chartjs-size-monitor">
	                                    		<div class="chartjs-size-monitor-expand">
	                                    			<div></div>
	                                    		</div>
	                                    		<div class="chartjs-size-monitor-shrink">
	                                    			<div></div>
	                                    		</div>
	                                    	</div>
	                                    	<canvas id="simple-doughnut-chart1" width="844" height="800" style="width:100%;max-width:400px;margin:auto;" class="chartjs-render-monitor">
	                                    	</canvas>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-6 col-lg-12">
	                        <div class="card">
	                            <div class="card-header border-0">
	                                <h4 class="card-title">내가 작성한 업무</h4>
	                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
	                            </div>
	                            <div class="card-content collapse show">
	                                <div class="card-body">
	                                    <div class="height-400">
	                                    	<div class="chartjs-size-monitor">
	                                    		<div class="chartjs-size-monitor-expand">
	                                    			<div></div>
	                                    		</div>
	                                    		<div class="chartjs-size-monitor-shrink">
	                                    			<div></div>
	                                    		</div>
	                                    	</div>
	                                    	<canvas id="simple-doughnut-chart2" width="844" height="800" style="width:100%;max-width:400px;margin:auto;" class="chartjs-render-monitor">
	                                    	</canvas>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </section>
                <!--/ Audience by country  & users visit -->

                <!-- Analytics map based session -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-12">
                        <div class="card">
                            <div class="card-content">
                            	<div class="card-header">
                           			<h4>업무리스트 개요</h4>
                            	</div>
                                <div class="card-body">
	                                <div class="height-200">
	                                    <div class="chartjs-size-monitor">
                                    		<div class="chartjs-size-monitor-expand">
                                    			<div></div>
                                    		</div>
                                    		<div class="chartjs-size-monitor-shrink">
                                    			<div></div>
                                    		</div>
	                                   	</div>
                                        <canvas id="bar-stacked1" width="1000" height="200" style="width:70%;max-width:1000px;margin:auto;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" class="chartjs-render-monitor" >
                                        </canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Analytics map based session -->
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
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/extensions/jquery.knob.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/extensions/knob.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/charts/chart.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/charts/chartjs/bar/bar.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/charts/chartjs/bar/bar-stacked.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/charts/chartjs/bar/bar-multi-axis.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/charts/chartjs/bar/column.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/charts/chartjs/bar/column-stacked.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/charts/chartjs/bar/column-multi-axis.js"></script>-->
    <script src="${pageContext.request.contextPath }/resources/assets/js/taskAnalytics.js"></script>
    <!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>