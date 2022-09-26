<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Project Summary</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/project.css">
    <!-- END: Page CSS-->

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
                    <h3 class="content-header-title mb-0">Project Summary</h3>
                    <div class="row breadcrumbs-top">
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/safari/index">Home</a>
                                </li>
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/safari/project">프로젝트</a>
                                </li>
                                <li class="breadcrumb-item active">프로젝트 요약
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
            <div class="content-detached content-left">
                <div class="content-body">
                    <section class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-head">
                                    <div class="card-header">
                                        <h4 class="card-title">iOS APP Development</h4>
                                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                        <div class="heading-elements">
                                            <span class="badge badge-warning">Mobile</span>
                                            <span class="badge badge-success">New</span>
                                            <span class="badge badge-info">iOS</span>
                                        </div>
                                    </div>
                                    <div class="px-1">
                                        <ul class="list-inline list-inline-pipe text-center p-1 border-bottom-grey border-bottom-lighten-3">
                                            <li>Project Owner: <span class="text-muted">Margaret Govan</span></li>
                                            <li>Start: <span class="text-muted">01/Feb/2016</span></li>
                                            <li>Due on: <span class="text-muted">01/Oct/2016</span></li>
                                            <li><a href="#" class="text-muted" data-toggle="tooltip" data-placement="bottom" title="Export as PDF"><i class="fa fa-file-pdf-o"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- project-info -->
                                <div id="project-info" class="card-body row">
                                    <div class="project-info-count col-lg-4 col-md-12">
                                        <div class="project-info-icon">
                                            <h2>12</h2>
                                            <div class="project-info-sub-icon">
                                                <span class="fa fa-user-o"></span>
                                            </div>
                                        </div>
                                        <div class="project-info-text pt-1">
                                            <h5>Project Users</h5>
                                        </div>
                                    </div>
                                    <div class="project-info-count col-lg-4 col-md-12">
                                        <div class="project-info-icon">
                                            <h2>160</h2>
                                            <div class="project-info-sub-icon">
                                                <span class="fa fa-calendar-check-o"></span>
                                            </div>
                                        </div>
                                        <div class="project-info-text pt-1">
                                            <h5>Project Task</h5>
                                        </div>
                                    </div>
                                    <div class="project-info-count col-lg-4 col-md-12">
                                        <div class="project-info-icon">
                                            <h2>20</h2>
                                            <div class="project-info-sub-icon">
                                                <span class="fa fa-bug"></span>
                                            </div>
                                        </div>
                                        <div class="project-info-text pt-1">
                                            <h5>Project Bug</h5>
                                        </div>
                                    </div>
                                </div>
                                <!-- project-info -->
                                <div class="card-body">
                                    <div class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1">
                                        <span>Egal's Eye View Of Project Status</span>
                                    </div>
                                    <div class="row py-2">
                                        <div class="col-lg-6 col-md-12">
                                            <div class="insights px-2">
                                                <div><span class="text-info h3">82%</span> <span class="float-right">Tasks</span></div>
                                                <div class="progress progress-md mt-1 mb-0">
                                                    <div class="progress-bar bg-info" role="progressbar" style="width: 82%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12">
                                            <div class="insights px-2">
                                                <div><span class="text-success h3">78%</span> <span class="float-right">TaskLists</span></div>
                                                <div class="progress progress-md mt-1 mb-0">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 78%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row py-2">
                                        <div class="col-lg-6 col-md-12">
                                            <div class="insights px-2">
                                                <div><span class="text-warning h3">68%</span> <span class="float-right">Milestones</span></div>
                                                <div class="progress progress-md mt-1 mb-0">
                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 68%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12">
                                            <div class="insights px-2">
                                                <div><span class="text-danger h3">62%</span> <span class="float-right">Bugs</span></div>
                                                <div class="progress progress-md mt-1 mb-0">
                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 62%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Task Progress -->
                    <section class="row">
                        <div class="col-xl-6 col-lg-12 col-md-12">
                            <div class="card">
                                <div class="card-head">
                                    <div class="card-header">
                                        <h4 class="card-title">Task Progress</h4>
                                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                        <div class="heading-elements">
                                            <ul class="list-inline mb-0">
                                                <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div id="task-pie-chart" class="height-400"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Task Progress -->
                        <!-- Bug Progress -->
                        <div class="col-xl-6 col-lg-12 col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Bug Progress</h4>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div id="bug-pie-chart" class="height-400"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Bug Progress -->
                    </section>
                </div>
            </div>
            <div class="sidebar-detached sidebar-right">
                <div class="sidebar">
                    <div class="project-sidebar-content">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Project Details</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                                        <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                        <li><a data-action="close"><i class="feather icon-x"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <!-- project search -->
                                <div class="card-body border-top-blue-grey border-top-lighten-5">
                                    <div class="project-search">
                                        <div class="project-search-content">
                                            <form action="#">
                                                <div class="position-relative">
                                                    <input type="search" class="form-control" placeholder="Search project task, bug, users...">
                                                    <div class="form-control-position">
                                                        <i class="fa fa-search text-size-base text-muted"></i>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- /project search -->

                                <!-- project progress -->
                                <div class="card-body">
                                    <div class="insights">
                                        <p>Project Overall Progress <span class="float-right text-warning h3">72%</span></p>
                                        <div class="progress progress-sm mt-1 mb-0">
                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 72%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- project progress -->
                            </div>
                        </div>
                        <!-- Project Overview -->
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Project Overview</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                                        <li><a data-action="close"><i class="feather icon-x"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a>.</p>
                                    <p><strong>Lorem ipsum dolor sit</strong></p>
                                    <ol>
                                        <li>Consectetuer adipiscing</li>
                                        <li>Aliquam tincidunt mauris</li>
                                        <li>Consectetur adipiscing</li>
                                        <li>Vivamus pretium ornare</li>
                                        <li>Curabitur massa</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <!--/ Project Overview -->
                        
                        <!-- 워크스페이스 멤버리스트 -->
                        <div class="card">
                            <div class="card-header mb-0">
                                <h4 class="card-title">Project Users</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                                        <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                        <li><a data-action="close"><i class="feather icon-x"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content collapse show">
                                <div class="card-content">
                                    <div class="card-body  py-0 px-0">
                                        <div class="list-group">
                                            <a href="javascript:void(0)" class="list-group-item">
                                                <div class="media">
                                                    <div class="media-left pr-1"><span class="avatar avatar-sm avatar-online rounded-circle"><img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-1.png" alt="avatar"><i></i></span></div>
                                                    <div class="media-body w-100">
                                                        <h6 class="media-heading mb-0">Margaret Govan</h6>
                                                        <p class="font-small-2 mb-0 text-muted">Project Owner</p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0)" class="list-group-item">
                                                <div class="media">
                                                    <div class="media-left pr-1"><span class="avatar avatar-sm avatar-busy rounded-circle"><img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-2.png" alt="avatar"><i></i></span></div>
                                                    <div class="media-body w-100">
                                                        <h6 class="media-heading mb-0">Bret Lezama</h6>
                                                        <p class="font-small-2 mb-0 text-muted">Project Manager</p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0)" class="list-group-item">
                                                <div class="media">
                                                    <div class="media-left pr-1"><span class="avatar avatar-sm avatar-online rounded-circle"><img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-3.png" alt="avatar"><i></i></span></div>
                                                    <div class="media-body w-100">
                                                        <h6 class="media-heading mb-0">Carie Berra</h6>
                                                        <p class="font-small-2 mb-0 text-muted">Senior Developer</p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0)" class="list-group-item">
                                                <div class="media">
                                                    <div class="media-left pr-1"><span class="avatar avatar-sm avatar-away rounded-circle"><img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-6.png" alt="avatar"><i></i></span></div>
                                                    <div class="media-body w-100">
                                                        <h6 class="media-heading mb-0">Eric Alsobrook</h6>
                                                        <p class="font-small-2 mb-0 text-muted">UI Developer</p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0)" class="list-group-item">
                                                <div class="media">
                                                    <div class="media-left pr-1"><span class="avatar avatar-sm avatar-busy rounded-circle"><img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-7.png" alt="avatar"><i></i></span></div>
                                                    <div class="media-body w-100">
                                                        <h6 class="media-heading mb-0">Berra Eric</h6>
                                                        <p class="font-small-2 mb-0 text-muted">UI Developer</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Project Users -->
                    </div>

                </div>
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
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/charts/apexcharts/apexcharts.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/project-summary.js"></script>
    <!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>