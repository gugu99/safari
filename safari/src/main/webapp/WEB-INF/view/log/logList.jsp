<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Task</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
	<!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/jkanban/jkanban.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/pages/app-kanban.css">
    <!-- END: Page CSS-->
	<!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/tables/datatable/datatables.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/pages/app-invoice.css">
    <!-- END: Page CSS-->
	
	
	
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
        <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="breadcrumb-wrapper col-12">
                        </div>
                    </div>
                    <h3 class="content-header-title mb-0">활동로그 리스트</h3>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                        <div class="btn-group" role="group">
                            <button class="btn btn-outline-primary dropdown-toggle dropdown-menu-right" id="btnGroupDrop1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-settings icon-left"></i> Settings</button>
                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"><a class="dropdown-item" href="card-bootstrap.html">Bootstrap Cards</a><a class="dropdown-item" href="component-buttons-extended.html">Buttons Extended</a></div>
                        </div><a class="btn btn-outline-primary" href="full-calender-basic.html"><i class="feather icon-mail"></i></a><a class="btn btn-outline-primary" href="timeline-center.html"><i class="feather icon-pie-chart"></i></a>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <div class="row mb-1 mt-1 mt-md-0">
                    <div class="col-12">
                        <a href="invoice-add.html" class="btn btn-primary">Create Invoice</a>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <!-- datatable started -->
                        <div id="app-invoice-wrapper" class="">
                            <table id="app-invoice-table" class="table" style="width: 100%;">
                                <thead class="border-bottom border-dark">
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th>
                                            <span class="align-middle">Invoice#</span>
                                        </th>
                                        <th>Amount</th>
                                        <th>Date</th>
                                        <th>Customer</th>
                                        <th>Tags</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="l" items="${logList }">
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">${l.logNo }</a>
                                        </td>
                                        <td><span class="invoice-amount">${l.taskNo }</span></td>
                                        <td><span class="invoice-date">${l.logMember }</span></td>
                                        <td><span class="invoice-customer">${l.logContent}</span></td>
                                        <td>
                                            <span class="bullet bullet-success bullet-sm"></span>
                                            Technology
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">${l.createDate }</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00349</a>
                                        </td>
                                        <td><span class="invoice-amount">$125.00</span></td>
                                        <td><span class="invoice-date">08-08-19</span></td>
                                        <td><span class="invoice-customer">Volkswagen</span></td>
                                        <td>
                                            <span class="bullet bullet-primary bullet-sm"></span>
                                            Car
                                        </td>
                                        <td><span class="badge badge-success badge-pill">PAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00853</a>
                                        </td>
                                        <td><span class="invoice-amount">$10,503</span></td>
                                        <td><span class="invoice-date">02-08-19</span></td>
                                        <td><span class="invoice-customer">Chevron Corporation</span></td>
                                        <td>
                                            <span class="bullet bullet-secondary bullet-sm"></span>
                                            Corporation
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00452</a>
                                        </td>
                                        <td><span class="invoice-amount">$90</span></td>
                                        <td><span class="invoice-date">28-07-19</span></td>
                                        <td><span class="invoice-customer">Alphabet</span></td>
                                        <td>
                                            <span class="bullet bullet-info bullet-sm"></span>
                                            Electronic
                                        </td>
                                        <td><span class="badge badge-warning badge-pill">Partially Paid</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00123</a>
                                        </td>
                                        <td><span class="invoice-amount">$15,900</span></td>
                                        <td><span class="invoice-date">23-07-19</span></td>
                                        <td><span class="invoice-customer">Toyota Motor</span></td>
                                        <td>
                                            <span class="bullet bullet-primary bullet-sm"></span>
                                            Car
                                        </td>
                                        <td><span class="badge badge-success badge-pill">PAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00853</a>
                                        </td>
                                        <td><span class="invoice-amount">$115.06</span></td>
                                        <td><span class="invoice-date">24-06-19</span></td>
                                        <td><span class="invoice-customer">Samsung Electronics</span></td>
                                        <td>
                                            <span class="bullet bullet-info bullet-sm"></span>
                                            Electronic
                                        </td>
                                        <td><span class="badge badge-success badge-pill">PAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00153</a>
                                        </td>
                                        <td><span class="invoice-amount">$1,090</span></td>
                                        <td><span class="invoice-date">23-05-19</span></td>
                                        <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                        <td>
                                            <span class="bullet bullet-secondary bullet-sm"></span>
                                            Corporation
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00326</a>
                                        </td>
                                        <td><span class="invoice-amount">$8,563</span></td>
                                        <td><span class="invoice-date">06-01-19</span></td>
                                        <td><span class="invoice-customer">Wells Fargo</span></td>
                                        <td>
                                            <span class="bullet bullet-danger bullet-sm"></span>
                                            Food
                                        </td>
                                        <td><span class="badge badge-success badge-pill">PAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00788</a>
                                        </td>
                                        <td><span class="invoice-amount">$555.50</span></td>
                                        <td><span class="invoice-date">10-06-19</span></td>
                                        <td><span class="invoice-customer">ExxonMobil</span></td>
                                        <td>
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                            Mobile
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00759</a>
                                        </td>
                                        <td><span class="invoice-amount">$10,960.20</span></td>
                                        <td><span class="invoice-date">22-05-19</span></td>
                                        <td><span class="invoice-customer">Ping An Insurance</span></td>
                                        <td>
                                            <span class="bullet bullet-secondary bullet-sm"></span>
                                            Corporation
                                        </td>
                                        <td><span class="badge badge-warning badge-pill">Partially Paid</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00999</a>
                                        </td>
                                        <td><span class="invoice-amount">$886.90</span></td>
                                        <td><span class="invoice-date">12-05-19</span></td>
                                        <td><span class="invoice-customer">Apple</span></td>
                                        <td>
                                            <span class="bullet bullet-success bullet-sm"></span>
                                            Electronic
                                        </td>
                                        <td><span class="badge badge-danger badge-pill">UNPAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="invoice-view.html">INV-00223</a>
                                        </td>
                                        <td><span class="invoice-amount">$459.30</span></td>
                                        <td><span class="invoice-date">28-04-19</span></td>
                                        <td><span class="invoice-customer">Communications</span></td>
                                        <td>
                                            <span class="bullet bullet-success bullet-sm"></span>
                                            Technology
                                        </td>
                                        <td><span class="badge badge-success badge-pill">PAID</span></td>
                                        <td>
                                            <div class="invoice-action">
                                                <a href="invoice-view.html" class="invoice-action-view mr-1">
                                                    <i class="feather icon-eye"></i>
                                                </a>
                                                <a href="invoice-edit.html" class="invoice-action-edit cursor-pointer">
                                                    <i class="feather icon-edit-1"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END: Content-->

    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

	 <%@ include file="/WEB-INF/view/inc/footer.jsp" %> <!-- footer -->

    <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/jkanban/jkanban.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/quill/quill.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/app-kanban.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/taskLocation.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/taskListLocation.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/copyTaskList.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/copyTask.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/lowerTask.js"></script>
    <!-- END: Page JS-->

	<script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/tables/datatable/datatables.checkboxes.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/app-invoice.js"></script>


</body>
<!-- END: Body-->

</html>