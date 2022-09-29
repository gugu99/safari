<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>프로젝트 수정</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    
    <%@ include file="/WEB-INF/view/inc/common-css.jsp" %> <!-- css -->
    
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/dragula.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/forms/selects/select2.min.css">
    <!-- END: Vendor CSS-->
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern content-detached-right-sidebar   fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-right-sidebar">

    <%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->

    <!-- BEGIN: Content-->
    <div class="app-content content col-md-8">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            	<div class="content-header-left col-md-6 col-12 mb-2">
                    <h3 class="content-header-title mb-0">프로젝트 그룹 수정</h3>
                    <div class="row breadcrumbs-top">
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/safari/index">Home</a>
                                </li>
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/member/project">프로젝트</a>
                                </li>
                                <li class="breadcrumb-item active">프로젝트 수정
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
                <!-- Basic Elements start -->
                <section class="basic-elements">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">${projectGroup.projectGroupName} 수정하기</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-xl-8 col-lg-12 col-md-24 mb-1">
	                                            <form method="post" action="${pageContext.request.contextPath}/member/modifyProjectGroup">
	                                                <fieldset class="form-group">
	                                                    <label for="basicInput">프로젝트 그룹 이름</label>
	                                                    <input type="text" class="form-control" id="basicInput" value="${projectGroup.projectGroupName}" name="projectGroupName">
	                                                </fieldset>
	                                                
	                                                <!-- 프로젝트 리스트 -->
								                	 <div class="form-group">
								                         <label>프로젝트 리스트</label>
								                         <select class="form-control select2" multiple="multiple" name="projectList">
								                         	<c:forEach var="p" items="${projectList}">
							                         			<option value="${p.projectNo}" ${p.projectGroupNo ne null ? 'selected' : ''}>${p.projectName}</option>
								                         	</c:forEach>
								                         </select>
								                     </div>
	                                                
	                                                <!-- 수정된 projectMemberList -->
	                                                <input type="hidden" name="projectGroupNo" value="${projectGroup.projectGroupNo}">
	                                                
	                                                <div class="modal-footer">
								                       <a href="${pageContext.request.contextPath}/member/deleteProjectGroup?projectGroupNo=${projectGroup.projectGroupNo}" class="projectForm btn btn-outline-secondary btn-lg">삭제</a>
								                       <input type="submit" class="projectForm btn btn-outline-primary btn-lg" value="수정">
								                   </div>
								                </form>
	                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Basic Inputs end -->
            
            
            
            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <%@ include file="/WEB-INF/view/inc/footer.jsp" %> <!-- footer -->
    <%@ include file="/WEB-INF/view/inc/common-js.jsp" %> <!-- js -->
    
    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/forms/select/form-select2.js"></script>
    <!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>