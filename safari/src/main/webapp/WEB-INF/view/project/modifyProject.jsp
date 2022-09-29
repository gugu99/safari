<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>프로젝트 수정</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    
    <%@ include file="/WEB-INF/view/inc/common-css.jsp" %> <!-- css -->
    
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/extensions/dragula.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/selects/select2.min.css">
    <!-- END: Vendor CSS-->
	
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                    <h3 class="content-header-title mb-0">프로젝트 수정</h3>
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
                                    <h4 class="card-title">${project.projectName} 프로젝트 수정하기</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-xl-8 col-lg-12 col-md-24 mb-1">
	                                                <fieldset class="form-group">
	                                                    <label for="basicInput">프로젝트 이름</label>
	                                                    <input type="text" class="form-control" id="projectName" value="${project.projectName}" name="projectName">
	                                                </fieldset>
	                                                
	                                                <fieldset class="form-group">
	                                                    <label for="basicTextarea">프로젝트 설명</label>
	                                                    <textarea class="form-control" id="projectExpl" rows="3" name="projectExpl">${project.projectExpl}</textarea>
	                                                </fieldset>
	                                                
							                        <fieldset class="form-group">
	                                                    <label for="customSelect">공개 범위</label>
	                                                    <select class="custom-select block projectAuth" id="projectAuth" name="projectAuth">
	                                                       	<option value="N">공개</option>
									                     	<option value="Y">비공개</option>
	                                                    </select>
	                                                </fieldset>
	                                                
	                                                <div class="form-group">
	                                                    <label for="date1">프로젝트 시작일</label>
	                                                    <input type="date" class="form-control" id="date1" name="projectStart">
	                                                </div>
	                                                
	                                                <div class="form-group">
	                                                    <label for="date2">프로젝트 마감일</label>
	                                                    <input type="date" class="form-control" id="date2" name="projectDeadline">
	                                                </div>
	                                                
	                                                <div class="form-group">
	                                                    <label for="date3">프로젝트 종료일</label>
	                                                    <input type="date" class="form-control" id="date3" name="projectEnd">
	                                                </div>
	                                                
	                                                 <!-- 관리자 -->
								                	 <div class="form-group">
								                         <label>프로젝트 관리자</label>
								                         <select class="form-control select2" multiple="multiple" id="projectManagerList" name="projectManagerList">
								                         	<!-- 관리자 리스트 -->
								                         </select>
								                     </div>
	                                                
	                                                <!-- 멤버 -->
								                	 <div class="form-group">
								                         <label>프로젝트 멤버</label>
								                         <select class="form-control select2" multiple="multiple" id="projectMemberList" name="projectMemberList">
								                         	<!-- 멤버 리스트 -->
								                         </select>
								                     </div>
	                                                
	                                                <input type="hidden" id="projectNo" name="projectNo" value="${projectNo}">

	                                                <div class="modal-footer">
	                                                	<div id="projectKeep"></div>
								                    	<a href="${pageContext.request.contextPath}/safari/project"><button type="button" class="projectForm btn btn-outline-primary btn-lg">프로젝트 목록으로</button></a>
								                   </div>
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
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/select/form-select2.js"></script>
    <!-- END: Page JS-->
    
    <!-- BEGIN: AJAX JS-->
    <script src="${pageContext.request.contextPath }/resources/assets/js/modifyProject.js"></script>
    <!-- END: AJAX JS-->
     
</body>
<!-- END: Body-->

</html>