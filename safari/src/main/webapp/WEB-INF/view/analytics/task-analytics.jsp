<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Analytics Dashboard - Stack Responsive Bootstrap 4 Admin Template</title>
    <link rel="apple-touch-icon" href="../../../app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="../../../app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/charts/jquery-jvectormap-2.0.3.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/charts/morris.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/extensions/unslider.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/weather-icons/climacons.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/colors/palette-gradient.css">
    <!-- link(rel='stylesheet', type='text/css', href=app_assets_path+'/css'+rtl+'/pages/users.css')-->
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu 2-columns   fixed-navbar" data-open="click" data-menu="vertical-menu" data-col="2-columns">

    <!-- BEGIN: Header-->
    <nav class="header-navbar navbar-expand-md navbar navbar-with-menu fixed-top navbar-semi-dark navbar-shadow">
        <div class="navbar-wrapper">
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mobile-menu d-md-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="feather icon-menu font-large-1"></i></a></li>
                    <li class="nav-item"><a class="navbar-brand" href="../../../html/ltr/vertical-menu-template-semi-dark/index.html"><img class="brand-logo" alt="stack admin logo" src="../../../app-assets/images/logo/stack-logo-light.png">
                            <h2 class="brand-text">Stack</h2>
                        </a></li>
                    <li class="nav-item d-md-none"><a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile"><i class="fa fa-ellipsis-v"></i></a></li>
                </ul>
            </div>
            <div class="navbar-container content">
                <div class="collapse navbar-collapse" id="navbar-mobile">
                    <ul class="nav navbar-nav mr-auto float-left">
                        <li class="nav-item d-none d-md-block"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="feather icon-menu"></i></a></li>
                        <li class="dropdown nav-item mega-dropdown d-none d-lg-block"><a class="dropdown-toggle nav-link" href="#" data-toggle="dropdown">Mega</a>
                            <ul class="mega-dropdown-menu dropdown-menu row p-1">
                                <li class="col-md-4 bg-mega p-2">
                                    <h3 class="text-white mb-1 font-weight-bold">Mega Menu Sidebar</h3>
                                    <p class="text-white line-height-2">Candy canes bonbon toffee. Cheesecake dragÃ©e gummi bears chupa chups powder bonbon. Apple pie cookie sweet.</p>
                                    <button class="btn btn-outline-white">Learn More</button>
                                </li>
                                <li class="col-md-5 px-2">
                                    <h6 class="font-weight-bold font-medium-2 ml-1">Apps</h6>
                                    <ul class="row mt-2">
                                        <li class="col-6 col-xl-4"><a class="text-center mb-2 mb-xl-3" href="app-email.html" target="_blank"><i class="feather icon-mail font-large-1 mr-0"></i>
                                                <p class="font-medium-2 mt-25 mb-0">Email</p>
                                            </a></li>
                                        <li class="col-6 col-xl-4"><a class="text-center mb-2 mb-xl-3" href="app-chat.html" target="_blank"><i class="feather icon-message-square font-large-1 mr-0"></i>
                                                <p class="font-medium-2 mt-25 mb-0">Chat</p>
                                            </a></li>
                                        <li class="col-6 col-xl-4"><a class="text-center mb-2 mb-xl-3 mt-75 mt-xl-0" href="app-todo.html" target="_blank"><i class="feather icon-check-square font-large-1 mr-0"></i>
                                                <p class="font-medium-2 mt-25 mb-0">Todo</p>
                                            </a></li>
                                        <li class="col-6 col-xl-4"><a class="text-center mb-2 mt-75 mt-xl-0" href="app-kanban.html" target="_blank"><i class="feather icon-file-plus font-large-1 mr-0"></i>
                                                <p class="font-medium-2 mt-25 mb-50">Kanban</p>
                                            </a></li>
                                        <li class="col-6 col-xl-4"><a class="text-center mb-2 mt-75 mt-xl-0" href="app-contacts.html" target="_blank"><i class="feather icon-users font-large-1 mr-0"></i>
                                                <p class="font-medium-2 mt-25 mb-50">Contacts</p>
                                            </a></li>
                                        <li class="col-6 col-xl-4"><a class="text-center mb-2 mt-75 mt-xl-0" href="invoice-template.html" target="_blank"><i class="feather icon-printer font-large-1 mr-0"></i>
                                                <p class="font-medium-2 mt-25 mb-50">Invoice</p>
                                            </a></li>
                                    </ul>
                                </li>
                                <li class="col-md-3">
                                    <h6 class="font-weight-bold font-medium-2">Components</h6>
                                    <ul class="row mt-1 mt-xl-2">
                                        <li class="col-12 col-xl-6 pl-0">
                                            <ul class="mega-component-list">
                                                <li class="mega-component-item"><a class="mb-1 mb-xl-2" href="component-alerts.html" target="_blank">Alert</a></li>
                                                <li class="mega-component-item"><a class="mb-1 mb-xl-2" href="component-callout.html" target="_blank">Callout</a></li>
                                                <li class="mega-component-item"><a class="mb-1 mb-xl-2" href="component-buttons-basic.html" target="_blank">Buttons</a></li>
                                                <li class="mega-component-item"><a class="mb-1 mb-xl-2" href="component-carousel.html" target="_blank">Carousel</a></li>
                                            </ul>
                                        </li>
                                        <li class="col-12 col-xl-6 pl-0">
                                            <ul class="mega-component-list">
                                                <li class="mega-component-item"><a class="mb-1 mb-xl-2" href="component-dropdowns.html" target="_blank">Drop Down</a></li>
                                                <li class="mega-component-item"><a class="mb-1 mb-xl-2" href="component-list-group.html" target="_blank">List Group</a></li>
                                                <li class="mega-component-item"><a class="mb-1 mb-xl-2" href="component-modals.html" target="_blank">Modals</a></li>
                                                <li class="mega-component-item"><a class="mb-1 mb-xl-2" href="component-pagination.html" target="_blank">Pagination</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item d-none d-md-block"><a class="nav-link nav-link-expand" href="#"><i class="ficon feather icon-maximize"></i></a></li>
                        <li class="nav-item nav-search"><a class="nav-link nav-link-search" href="#"><i class="ficon feather icon-search"></i></a>
                            <div class="search-input">
                                <input class="input" type="text" placeholder="Explore Stack..." tabindex="0" data-search="template-search">
                                <div class="search-input-close"><i class="feather icon-x"></i></div>
                                <ul class="search-list"></ul>
                            </div>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav float-right">
                        <li class="dropdown dropdown-language nav-item"><a class="dropdown-toggle nav-link" id="dropdown-flag" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="flag-icon flag-icon-us"></i><span class="selected-language"></span></a>
                            <div class="dropdown-menu" aria-labelledby="dropdown-flag"><a class="dropdown-item" href="#" data-language="en"><i class="flag-icon flag-icon-us"></i> English</a><a class="dropdown-item" href="#" data-language="fr"><i class="flag-icon flag-icon-fr"></i> French</a><a class="dropdown-item" href="#" data-language="pt"><i class="flag-icon flag-icon-pt"></i> Portuguese</a><a class="dropdown-item" href="#" data-language="de"><i class="flag-icon flag-icon-de"></i> German</a></div>
                        </li>
                        <li class="dropdown dropdown-notification nav-item"><a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon feather icon-bell"></i><span class="badge badge-pill badge-danger badge-up">5</span></a>
                            <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                                <li class="dropdown-menu-header">
                                    <h6 class="dropdown-header m-0"><span class="grey darken-2">Notifications</span><span class="notification-tag badge badge-danger float-right m-0">5 New</span></h6>
                                </li>
                                <li class="scrollable-container media-list"><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left align-self-center"><i class="feather icon-plus-square icon-bg-circle bg-cyan"></i></div>
                                            <div class="media-body">
                                                <h6 class="media-heading">You have new order!</h6>
                                                <p class="notification-text font-small-3 text-muted">Lorem ipsum dolor sit amet, consectetuer elit.</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">30 minutes ago</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left align-self-center"><i class="feather icon-download-cloud icon-bg-circle bg-red bg-darken-1"></i></div>
                                            <div class="media-body">
                                                <h6 class="media-heading red darken-1">99% Server load</h6>
                                                <p class="notification-text font-small-3 text-muted">Aliquam tincidunt mauris eu risus.</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Five hour ago</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left align-self-center"><i class="feather icon-alert-triangle icon-bg-circle bg-yellow bg-darken-3"></i></div>
                                            <div class="media-body">
                                                <h6 class="media-heading yellow darken-3">Warning notifixation</h6>
                                                <p class="notification-text font-small-3 text-muted">Vestibulum auctor dapibus neque.</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Today</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left align-self-center"><i class="feather icon-check-circle icon-bg-circle bg-cyan"></i></div>
                                            <div class="media-body">
                                                <h6 class="media-heading">Complete the task</h6><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Last week</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left align-self-center"><i class="feather icon-file icon-bg-circle bg-teal"></i></div>
                                            <div class="media-body">
                                                <h6 class="media-heading">Generate monthly report</h6><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Last month</time></small>
                                            </div>
                                        </div>
                                    </a></li>
                                <li class="dropdown-menu-footer"><a class="dropdown-item text-muted text-center" href="javascript:void(0)">Read all notifications</a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-notification nav-item"><a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon feather icon-mail"></i><span class="badge badge-pill badge-warning badge-up">3</span></a>
                            <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                                <li class="dropdown-menu-header">
                                    <h6 class="dropdown-header m-0"><span class="grey darken-2">Messages</span><span class="notification-tag badge badge-warning float-right m-0">4 New</span></h6>
                                </li>
                                <li class="scrollable-container media-list"><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="avatar avatar-online avatar-sm rounded-circle"><img src="../../../app-assets/images/portrait/small/avatar-s-1.png" alt="avatar"><i></i></div>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="media-heading">Margaret Govan</h6>
                                                <p class="notification-text font-small-3 text-muted">I like your portfolio, let's start.</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Today</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left"><span class="avatar avatar-sm avatar-busy rounded-circle"><img src="../../../app-assets/images/portrait/small/avatar-s-2.png" alt="avatar"><i></i></span></div>
                                            <div class="media-body">
                                                <h6 class="media-heading">Bret Lezama</h6>
                                                <p class="notification-text font-small-3 text-muted">I have seen your work, there is</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Tuesday</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="avatar avatar-online avatar-sm rounded-circle"><img src="../../../app-assets/images/portrait/small/avatar-s-3.png" alt="avatar"><i></i></div>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="media-heading">Carie Berra</h6>
                                                <p class="notification-text font-small-3 text-muted">Can we have call in this week ?</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Friday</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left"><span class="avatar avatar-sm avatar-away rounded-circle"><img src="../../../app-assets/images/portrait/small/avatar-s-6.png" alt="avatar"><i></i></span></div>
                                            <div class="media-body">
                                                <h6 class="media-heading">Eric Alsobrook</h6>
                                                <p class="notification-text font-small-3 text-muted">We have project party this saturday.</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">last month</time></small>
                                            </div>
                                        </div>
                                    </a></li>
                                <li class="dropdown-menu-footer"><a class="dropdown-item text-muted text-center" href="javascript:void(0)">Read all messages</a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                <div class="avatar avatar-online"><img src="../../../app-assets/images/portrait/small/avatar-s-1.png" alt="avatar"><i></i></div><span class="user-name">John Doe</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="user-profile.html"><i class="feather icon-user"></i> Edit Profile</a><a class="dropdown-item" href="app-email.html"><i class="feather icon-mail"></i> My Inbox</a><a class="dropdown-item" href="user-cards.html"><i class="feather icon-check-square"></i> Task</a><a class="dropdown-item" href="app-chat.html"><i class="feather icon-message-square"></i> Chats</a>
                                <div class="dropdown-divider"></div><a class="dropdown-item" href="login-with-bg-image.html"><i class="feather icon-power"></i> Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- END: Header-->


    <!-- BEGIN: Main Menu-->
    <div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
        <div class="main-menu-content">
            <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                <li class=" navigation-header"><span>General</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="General"></i>
                </li>
                <li class=" nav-item"><a href="index.html"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-primary badge-pill float-right mr-2">3</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="dashboard-ecommerce.html" data-i18n="eCommerce">eCommerce</a>
                        </li>
                        <li class="active"><a class="menu-item" href="dashboard-analytics.html" data-i18n="Analytics">Analytics</a>
                        </li>
                        <li><a class="menu-item" href="dashboard-fitness.html" data-i18n="Fitness">Fitness</a>
                        </li>
                        <li><a class="menu-item" href="dashboard-crm.html" data-i18n="CRM">CRM</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-monitor"></i><span class="menu-title" data-i18n="Templates">Templates</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="#" data-i18n="Vertical">Vertical</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="../vertical-modern-menu-template" data-i18n="Modern Menu">Modern Menu</a>
                                </li>
                                <li><a class="menu-item" href="../vertical-collapsed-menu-template" data-i18n="Collapsed Menu">Collapsed Menu</a>
                                </li>
                                <li><a class="menu-item" href="../vertical-menu-template" data-i18n="Semi Light">Semi Light</a>
                                </li>
                                <li><a class="menu-item" href="../vertical-menu-template-semi-dark" data-i18n="Semi Dark">Semi Dark</a>
                                </li>
                                <li><a class="menu-item" href="../vertical-menu-template-nav-dark" data-i18n="Nav Dark">Nav Dark</a>
                                </li>
                                <li><a class="menu-item" href="../vertical-menu-template-light" data-i18n="Light">Light</a>
                                </li>
                                <li><a class="menu-item" href="../vertical-overlay-menu-template" data-i18n="Overlay Menu">Overlay Menu</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Horizontal">Horizontal</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="../horizontal-menu-template" data-i18n="Classic">Classic</a>
                                </li>
                                <li><a class="menu-item" href="../horizontal-menu-template-nav" data-i18n="Nav Dark">Nav Dark</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-layout"></i><span class="menu-title" data-i18n="Layouts">Layouts</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="#" data-i18n="Page Layouts">Page Layouts</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="layout-1-column.html" data-i18n="1 column">1 column</a>
                                </li>
                                <li><a class="menu-item" href="layout-2-columns.html" data-i18n="2 columns">2 columns</a>
                                </li>
                                <li><a class="menu-item" href="#" data-i18n="Sidebar">Sidebar</a>
                                    <ul class="menu-content">
                                        <li><a class="menu-item" href="layout-content-detached-left-sidebar.html" data-i18n="Detached left sidebar">Detached left sidebar</a>
                                        </li>
                                        <li><a class="menu-item" href="layout-content-detached-left-sticky-sidebar.html" data-i18n="Detached sticky left sidebar">Detached sticky left sidebar</a>
                                        </li>
                                        <li><a class="menu-item" href="layout-content-detached-right-sidebar.html" data-i18n="Detached right sidebar">Detached right sidebar</a>
                                        </li>
                                        <li><a class="menu-item" href="layout-content-detached-right-sticky-sidebar.html" data-i18n="Detached sticky right sidebar">Detached sticky right sidebar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="navigation-divider"></li>
                                <li><a class="menu-item" href="layout-fixed-navbar.html" data-i18n="Fixed navbar">Fixed navbar</a>
                                </li>
                                <li><a class="menu-item" href="layout-fixed-navigation.html" data-i18n="Fixed navigation">Fixed navigation</a>
                                </li>
                                <li><a class="menu-item" href="layout-fixed-navbar-navigation.html" data-i18n="Fixed navbar &amp; navigation">Fixed navbar &amp; navigation</a>
                                </li>
                                <li><a class="menu-item" href="layout-fixed-navbar-footer.html" data-i18n="Fixed navbar &amp; footer">Fixed navbar &amp; footer</a>
                                </li>
                                <li class="navigation-divider"></li>
                                <li><a class="menu-item" href="layout-fixed.html" data-i18n="Fixed layout">Fixed layout</a>
                                </li>
                                <li><a class="menu-item" href="layout-boxed.html" data-i18n="Boxed layout">Boxed layout</a>
                                </li>
                                <li><a class="menu-item" href="layout-static.html" data-i18n="Static layout">Static layout</a>
                                </li>
                                <li class="navigation-divider"></li>
                                <li><a class="menu-item" href="layout-light.html" data-i18n="Light layout">Light layout</a>
                                </li>
                                <li><a class="menu-item" href="layout-dark.html" data-i18n="Dark layout">Dark layout</a>
                                </li>
                                <li><a class="menu-item" href="layout-semi-dark.html" data-i18n="Semi dark layout">Semi dark layout</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Navbars">Navbars</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="navbar-light.html" data-i18n="Navbar Light">Navbar Light</a>
                                </li>
                                <li><a class="menu-item" href="navbar-dark.html" data-i18n="Navbar Dark">Navbar Dark</a>
                                </li>
                                <li><a class="menu-item" href="navbar-semi-dark.html" data-i18n="Navbar Semi Dark">Navbar Semi Dark</a>
                                </li>
                                <li><a class="menu-item" href="navbar-brand-center.html" data-i18n="Brand Center">Brand Center</a>
                                </li>
                                <li><a class="menu-item" href="navbar-fixed-top.html" data-i18n="Fixed Top">Fixed Top</a>
                                </li>
                                <li><a class="menu-item" href="#" data-i18n="Hide on Scroll">Hide on Scroll</a>
                                    <ul class="menu-content">
                                        <li><a class="menu-item" href="navbar-hide-on-scroll-top.html" data-i18n="Hide on Scroll Top">Hide on Scroll Top</a>
                                        </li>
                                        <li><a class="menu-item" href="navbar-hide-on-scroll-bottom.html" data-i18n="Hide on Scroll Bottom">Hide on Scroll Bottom</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a class="menu-item" href="navbar-components.html" data-i18n="Navbar Components">Navbar Components</a>
                                </li>
                                <li><a class="menu-item" href="navbar-styling.html" data-i18n="Navbar Styling">Navbar Styling</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Vertical Nav">Vertical Nav</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="#" data-i18n="Navigation Types">Navigation Types</a>
                                    <ul class="menu-content">
                                        <li><a class="menu-item" href="../vertical-menu-template" data-i18n="Vertical Menu">Vertical Menu</a>
                                        </li>
                                        <li><a class="menu-item" href="../vertical-overlay-menu-template" data-i18n="Vertical Overlay">Vertical Overlay</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-compact-menu.html" data-i18n="Compact Menu">Compact Menu</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-fixed.html" data-i18n="Fixed Navigation">Fixed Navigation</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-static.html" data-i18n="Static Navigation">Static Navigation</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-light.html" data-i18n="Navigation Light">Navigation Light</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-dark.html" data-i18n="Navigation Dark">Navigation Dark</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-accordion.html" data-i18n="Accordion Navigation">Accordion Navigation</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-collapsible.html" data-i18n="Collapsible Navigation">Collapsible Navigation</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-flipped.html" data-i18n="Flipped Navigation">Flipped Navigation</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-native-scroll.html" data-i18n="Native scroll">Native scroll</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-right-side-icon.html" data-i18n="Right side icons">Right side icons</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-bordered.html" data-i18n="Bordered Navigation">Bordered Navigation</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-disabled-link.html" data-i18n="Disabled Navigation">Disabled Navigation</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-styling.html" data-i18n="Navigation Styling">Navigation Styling</a>
                                </li>
                                <li><a class="menu-item" href="vertical-nav-tags-pills.html" data-i18n="Tags &amp; Pills">Tags &amp; Pills</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Horizontal Nav">Horizontal Nav</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="#" data-i18n="Navigation Types">Navigation Types</a>
                                    <ul class="menu-content">
                                        <li><a class="menu-item" href="../horizontal-menu-template" data-i18n="Classic">Classic</a>
                                        </li>
                                        <li><a class="menu-item" href="../horizontal-menu-template-nav" data-i18n="Nav Dark">Nav Dark</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Dashboard">Page Headers</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="headers-breadcrumbs-basic.html" data-i18n="Breadcrumbs basic">Breadcrumbs basic</a>
                                </li>
                                <li><a class="menu-item" href="headers-breadcrumbs-top.html" data-i18n="Breadcrumbs top">Breadcrumbs top</a>
                                </li>
                                <li><a class="menu-item" href="headers-breadcrumbs-bottom.html" data-i18n="Breadcrumbs bottom">Breadcrumbs bottom</a>
                                </li>
                                <li><a class="menu-item" href="headers-breadcrumbs-with-button.html" data-i18n="Breadcrumbs with button">Breadcrumbs with button</a>
                                </li>
                                <li><a class="menu-item" href="headers-breadcrumbs-with-round-button.html" data-i18n="Breadcrumbs with round button 2">Breadcrumbs with round button 2</a>
                                </li>
                                <li><a class="menu-item" href="headers-breadcrumbs-with-stats.html" data-i18n="Breadcrumbs with stats">Breadcrumbs with stats</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Footers">Footers</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="footer-light.html" data-i18n="Footer Light">Footer Light</a>
                                </li>
                                <li><a class="menu-item" href="footer-dark.html" data-i18n="Footer Dark">Footer Dark</a>
                                </li>
                                <li><a class="menu-item" href="footer-transparent.html" data-i18n="Footer Transparent">Footer Transparent</a>
                                </li>
                                <li><a class="menu-item" href="footer-fixed.html" data-i18n="Footer Fixed">Footer Fixed</a>
                                </li>
                                <li><a class="menu-item" href="footer-components.html" data-i18n="Footer Components">Footer Components</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-zap"></i><span class="menu-title" data-i18n="Starter kit">Starter kit</span><span class="badge badge badge-danger badge-pill float-right mr-2">New</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-1-column.html" data-i18n="1 column">1 column</a>
                        </li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-2-columns.html" data-i18n="2 columns">2 columns</a>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Content Detached Sidebar">Content Detached Sidebar</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-content-detached-left-sidebar.html" data-i18n="Detached left sidebar">Detached left sidebar</a>
                                </li>
                                <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-content-detached-left-sticky-sidebar.html" data-i18n="Detached sticky left sidebar">Detached sticky left sidebar</a>
                                </li>
                                <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-content-detached-right-sidebar.html" data-i18n="Detached right sidebar">Detached right sidebar</a>
                                </li>
                                <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-content-detached-right-sticky-sidebar.html" data-i18n="Detached sticky right sidebar">Detached sticky right sidebar</a>
                                </li>
                            </ul>
                        </li>
                        <li class="navigation-divider"></li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-fixed-navbar.html" data-i18n="Fixed navbar">Fixed navbar</a>
                        </li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-fixed-navigation.html" data-i18n="Fixed navigation">Fixed navigation</a>
                        </li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-fixed-navbar-navigation.html" data-i18n="Fixed navbar &amp; navigation">Fixed navbar &amp; navigation</a>
                        </li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-fixed-navbar-footer.html" data-i18n="Fixed navbar &amp; footer">Fixed navbar &amp; footer</a>
                        </li>
                        <li class="navigation-divider"></li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-fixed.html" data-i18n="Fixed layout">Fixed layout</a>
                        </li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-boxed.html" data-i18n="Boxed layout">Boxed layout</a>
                        </li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-static.html" data-i18n="Static layout">Static layout</a>
                        </li>
                        <li class="navigation-divider"></li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-light.html" data-i18n="Light layout">Light layout</a>
                        </li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-dark.html" data-i18n="Dark layout">Dark layout</a>
                        </li>
                        <li><a class="menu-item" href="../../../starter-kit/ltr/vertical-menu-template-semi-dark/layout-semi-dark.html" data-i18n="Semi dark layout">Semi dark layout</a>
                        </li>
                    </ul>
                </li>
                <li class=" navigation-header"><span>Apps</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="Apps"></i>
                </li>
                <li class=" nav-item"><a href="app-email.html"><i class="feather icon-mail"></i><span class="menu-title" data-i18n="Email Application">Email Application</span></a>
                </li>
                <li class=" nav-item"><a href="app-chat.html"><i class="feather icon-message-square"></i><span class="menu-title" data-i18n="Chat Application">Chat Application</span></a>
                </li>
                <li class=" nav-item"><a href="app-todo.html"><i class="feather icon-check-square"></i><span class="menu-title" data-i18n="Todo Application">Todo Application</span></a>
                </li>
                <li class=" nav-item"><a href="app-kanban.html"><i class="feather icon-file-plus"></i><span class="menu-title" data-i18n="Kanban Application">Kanban Application</span></a>
                </li>
                <li class=" nav-item"><a href="app-contacts.html"><i class="feather icon-users"></i><span class="menu-title" data-i18n="Contacts">Contacts</span></a>
                </li>
                <li class=" nav-item"><a href="project-summary.html"><i class="feather icon-airplay"></i><span class="menu-title" data-i18n="Project Summary">Project Summary</span></a>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-plus-square"></i><span class="menu-title" data-i18n="Calender">Calender</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="full-calender-basic.html" data-i18n="Full Calender Basic">Full Calender Basic</a>
                        </li>
                        <li><a class="menu-item" href="full-calender-events.html" data-i18n="Full Calender Events">Full Calender Events</a>
                        </li>
                        <li><a class="menu-item" href="full-calender-advance.html" data-i18n="Full Calender Advance">Full Calender Advance</a>
                        </li>
                        <li><a class="menu-item" href="full-calender-extra.html" data-i18n="Full Calender Extra">Full Calender Extra</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-file-text"></i><span class="menu-title" data-i18n="Invoice">Invoice</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="invoice-list.html" data-i18n="Invoice List">Invoice List</a>
                        </li>
                        <li><a class="menu-item" href="invoice-view.html" data-i18n="Invoice View">Invoice View</a>
                        </li>
                        <li><a class="menu-item" href="invoice-edit.html" data-i18n="Invoice Edit">invoice Edit</a>
                        </li>
                        <li><a class="menu-item" href="invoice-add.html" data-i18n="Invoice Add">invoice Add</a>
                        </li>
                    </ul>
                </li>
                <li class=" navigation-header"><span>Pages</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="Pages"></i>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-share"></i><span class="menu-title" data-i18n="Timelines">Timelines</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="timeline-center.html" data-i18n="Timelines Center">Timelines Center</a>
                        </li>
                        <li><a class="menu-item" href="timeline-horizontal.html" data-i18n="Timelines Horizontal">Timelines Horizontal</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="account-setting.html"><i class="feather icon-user-plus"></i><span class="menu-title" data-i18n="Account setting">Account setting</span></a>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-user"></i><span class="menu-title" data-i18n="Users">Users</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="page-users-list.html" data-i18n="Users List">Users List</a>
                        </li>
                        <li><a class="menu-item" href="page-users-view.html" data-i18n="Users View">Users View</a>
                        </li>
                        <li><a class="menu-item" href="page-users-edit.html" data-i18n="Users Edit">Users Edit</a>
                        </li>
                        <li><a class="menu-item" href="user-profile.html" data-i18n="Users Profile">Users Profile</a>
                        </li>
                        <li><a class="menu-item" href="user-cards.html" data-i18n="Users Cards">Users Cards</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-image"></i><span class="menu-title" data-i18n="Gallery">Gallery</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="gallery-grid.html" data-i18n="Gallery Grid">Gallery Grid</a>
                        </li>
                        <li><a class="menu-item" href="gallery-grid-with-desc.html" data-i18n="Gallery Grid with Desc">Gallery Grid with Desc</a>
                        </li>
                        <li><a class="menu-item" href="gallery-masonry.html" data-i18n="Masonry Gallery">Masonry Gallery</a>
                        </li>
                        <li><a class="menu-item" href="gallery-masonry-with-desc.html" data-i18n="Masonry Gallery with Desc">Masonry Gallery with Desc</a>
                        </li>
                        <li><a class="menu-item" href="gallery-hover-effects.html" data-i18n="Hover Effects">Hover Effects</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-search"></i><span class="menu-title" data-i18n="Search">Search</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="search-page.html" data-i18n="Search Page">Search Page</a>
                        </li>
                        <li><a class="menu-item" href="search-website.html" data-i18n="Search Website">Search Website</a>
                        </li>
                        <li><a class="menu-item" href="search-images.html" data-i18n="Search Images">Search Images</a>
                        </li>
                        <li><a class="menu-item" href="search-videos.html" data-i18n="Search Videos">Search Videos</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-unlock"></i><span class="menu-title" data-i18n="Authentication">Authentication</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="login-simple.html" data-i18n="Login Simple">Login Simple</a>
                        </li>
                        <li><a class="menu-item" href="login-with-bg.html" data-i18n="Login with Bg">Login with Bg</a>
                        </li>
                        <li><a class="menu-item" href="login-with-bg-image.html" data-i18n="Login with Bg Image">Login with Bg Image</a>
                        </li>
                        <li><a class="menu-item" href="register-simple.html" data-i18n="Register Simple">Register Simple</a>
                        </li>
                        <li><a class="menu-item" href="register-with-bg.html" data-i18n="Register with Bg">Register with Bg</a>
                        </li>
                        <li><a class="menu-item" href="register-with-bg-image.html" data-i18n="Register with Bg Image">Register with Bg Image</a>
                        </li>
                        <li><a class="menu-item" href="unlock-user.html" data-i18n="Unlock User">Unlock User</a>
                        </li>
                        <li><a class="menu-item" href="recover-password.html" data-i18n="Recover Password">Recover Password</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-alert-triangle"></i><span class="menu-title" data-i18n="Error">Error</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="error-400.html" data-i18n="Error 400">Error 400</a>
                        </li>
                        <li><a class="menu-item" href="error-401.html" data-i18n="Error 401">Error 401</a>
                        </li>
                        <li><a class="menu-item" href="error-403.html" data-i18n="Error 403">Error 403</a>
                        </li>
                        <li><a class="menu-item" href="error-404.html" data-i18n="Error 404">Error 404</a>
                        </li>
                        <li><a class="menu-item" href="error-500.html" data-i18n="Error 500">Error 500</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-watch"></i><span class="menu-title" data-i18n="Coming Soon">Coming Soon</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="coming-soon-flat.html" data-i18n="Flat">Flat</a>
                        </li>
                        <li><a class="menu-item" href="coming-soon-bg-image.html" data-i18n="Bg image">Bg image</a>
                        </li>
                        <li><a class="menu-item" href="coming-soon-bg-video.html" data-i18n="Bg video">Bg video</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="under-maintenance.html"><i class="feather icon-cloud-off"></i><span class="menu-title" data-i18n="Maintenance">Maintenance</span></a>
                </li>
                <li class=" navigation-header"><span>UI</span><i class="feather icon-droplet feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="UI"></i>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-globe"></i><span class="menu-title" data-i18n="Content">Content</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="content-grid.html" data-i18n="Grid">Grid</a>
                        </li>
                        <li><a class="menu-item" href="content-typography.html" data-i18n="Typography">Typography</a>
                        </li>
                        <li><a class="menu-item" href="content-text-utilities.html" data-i18n="Text utilities">Text utilities</a>
                        </li>
                        <li><a class="menu-item" href="content-syntax-highlighter.html" data-i18n="Syntax highlighter">Syntax highlighter</a>
                        </li>
                        <li><a class="menu-item" href="content-helper-classes.html" data-i18n="Helper classes">Helper classes</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-square"></i><span class="menu-title" data-i18n="Cards">Cards</span><span class="badge badge badge-pill badge-success float-right mr-2">Hot</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="card-bootstrap.html" data-i18n="Bootstrap">Bootstrap</a>
                        </li>
                        <li><a class="menu-item" href="card-headings.html" data-i18n="Headings">Headings</a>
                        </li>
                        <li><a class="menu-item" href="card-options.html" data-i18n="Options">Options</a>
                        </li>
                        <li><a class="menu-item" href="card-actions.html" data-i18n="Action">Action</a>
                        </li>
                        <li><a class="menu-item" href="card-draggable.html" data-i18n="Draggable">Draggable</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-layers"></i><span class="menu-title" data-i18n="Advance Cards">Advance Cards</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="card-statistics.html" data-i18n="Statistics">Statistics</a>
                        </li>
                        <li><a class="menu-item" href="card-weather.html" data-i18n="Weather">Weather</a>
                        </li>
                        <li><a class="menu-item" href="card-charts.html" data-i18n="Charts">Charts</a>
                        </li>
                        <li><a class="menu-item" href="card-maps.html" data-i18n="Maps">Maps</a>
                        </li>
                        <li><a class="menu-item" href="card-social.html" data-i18n="Social">Social</a>
                        </li>
                        <li><a class="menu-item" href="card-ecommerce.html" data-i18n="E-Commerce">E-Commerce</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-droplet"></i><span class="menu-title" data-i18n="Color Palette">Color Palette</span><span class="badge badge badge-warning badge-pill float-right mr-2">14</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="color-palette-primary.html" data-i18n="Primary palette">Primary palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-danger.html" data-i18n="Danger palette">Danger palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-success.html" data-i18n="Success palette">Success palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-warning.html" data-i18n="Warning palette">Warning palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-info.html" data-i18n="Info palette">Info palette</a>
                        </li>
                        <li class="navigation-divider"></li>
                        <li><a class="menu-item" href="color-palette-red.html" data-i18n="Red palette">Red palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-pink.html" data-i18n="Pink palette">Pink palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-purple.html" data-i18n="Purple palette">Purple palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-blue.html" data-i18n="Blue palette">Blue palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-cyan.html" data-i18n="Cyan palette">Cyan palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-teal.html" data-i18n="Teal palette">Teal palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-yellow.html" data-i18n="Yellow palette">Yellow palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-amber.html" data-i18n="Amber palette">Amber palette</a>
                        </li>
                        <li><a class="menu-item" href="color-palette-blue-grey.html" data-i18n="Blue Grey palette">Blue Grey palette</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-eye"></i><span class="menu-title" data-i18n="Icons">Icons</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="icons-feather.html" data-i18n="Feather">Feather</a>
                        </li>
                        <li><a class="menu-item" href="icons-font-awesome.html" data-i18n="Font Awesome">Font Awesome</a>
                        </li>
                        <li><a class="menu-item" href="icons-simple-line-icons.html" data-i18n="Simple Line Icons">Simple Line Icons</a>
                        </li>
                        <li><a class="menu-item" href="icons-meteocons.html" data-i18n="Meteocons">Meteocons</a>
                        </li>
                    </ul>
                </li>
                <li class=" navigation-header"><span>Components</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="Components"></i>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-briefcase"></i><span class="menu-title" data-i18n="Bootstrap Components">Bootstrap Components</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="component-alerts.html" data-i18n="Alerts">Alerts</a>
                        </li>
                        <li><a class="menu-item" href="component-callout.html" data-i18n="Callout">Callout</a>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Buttons">Buttons</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="component-buttons-basic.html" data-i18n="Basic Buttons">Basic Buttons</a>
                                </li>
                                <li><a class="menu-item" href="component-buttons-extended.html" data-i18n="Extended Buttons">Extended Buttons</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="component-carousel.html" data-i18n="Carousel">Carousel</a>
                        </li>
                        <li><a class="menu-item" href="component-collapse.html" data-i18n="Collapse">Collapse</a>
                        </li>
                        <li><a class="menu-item" href="component-dropdowns.html" data-i18n="Dropdowns">Dropdowns</a>
                        </li>
                        <li><a class="menu-item" href="component-list-group.html" data-i18n="List Group">List Group</a>
                        </li>
                        <li><a class="menu-item" href="component-modals.html" data-i18n="Modals">Modals</a>
                        </li>
                        <li><a class="menu-item" href="component-pagination.html" data-i18n="Pagination">Pagination</a>
                        </li>
                        <li><a class="menu-item" href="component-navs-component.html" data-i18n="Navs Component">Navs Component</a>
                        </li>
                        <li><a class="menu-item" href="component-tabs-component.html" data-i18n="Tabs Component">Tabs Component</a>
                        </li>
                        <li><a class="menu-item" href="component-pills-component.html" data-i18n="Pills Component">Pills Component</a>
                        </li>
                        <li><a class="menu-item" href="component-tooltips.html" data-i18n="Tooltips">Tooltips</a>
                        </li>
                        <li><a class="menu-item" href="component-popovers.html" data-i18n="Popovers">Popovers</a>
                        </li>
                        <li><a class="menu-item" href="component-badges.html" data-i18n="Badges">Badges</a>
                        </li>
                        <li><a class="menu-item" href="component-pill-badges.html" data-i18n="Pill Badges">Pill Badges</a>
                        </li>
                        <li><a class="menu-item" href="component-progress.html" data-i18n="Progress">Progress</a>
                        </li>
                        <li><a class="menu-item" href="component-media-objects.html" data-i18n="Media Objects">Media Objects</a>
                        </li>
                        <li><a class="menu-item" href="component-scrollable.html" data-i18n="Scrollable">Scrollable</a>
                        </li>
                        <li><a class="menu-item" href="component-bs-spinner.html" data-i18n="Spinner">Spinner</a>
                        </li>
                        <li><a class="menu-item" href="component-bs-toast.html" data-i18n="Toasts">Toasts</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-box"></i><span class="menu-title" data-i18n="Extra Components">Extra Components</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="ex-component-avatar.html" data-i18n="Avatar">Avatar</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-sweet-alerts.html" data-i18n="Sweet Alerts">Sweet Alerts</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-ratings.html" data-i18n="Ratings">Ratings</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-toastr.html" data-i18n="Toastr">Toastr</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-noui-slider.html" data-i18n="NoUI Slider">NoUI Slider</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-knob.html" data-i18n="Knob">Knob</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-block-ui.html" data-i18n="Block UI">Block UI</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-date-time-picker.html" data-i18n="DateTime Picker">DateTime Picker</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-file-uploader-dropzone.html" data-i18n="File Uploader">File Uploader</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-image-cropper.html" data-i18n="Image Cropper">Image Cropper</a>
                        </li>
                        <li><a class="menu-item" href="component-spinners.html" data-i18n="Spinners">Spinners</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-tour.html" data-i18n="Tour">Tour</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-swiper.html" data-i18n="Swiper">Swiper</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-treeview.html" data-i18n="TreeView">TreeView</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-drag-drop.html" data-i18n="Drag &amp; Drop">Drag &amp; Drop</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-media-player.html" data-i18n="Media player">Media player</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-i18n.html" data-i18n="i18n">i18n</a>
                        </li>
                        <li><a class="menu-item" href="ex-component-miscellaneous.html" data-i18n="Miscellaneous">Miscellaneous</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-edit"></i><span class="menu-title" data-i18n="Forms">Forms</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="#" data-i18n="Form Elements">Form Elements</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="form-inputs.html" data-i18n="Form Inputs">Form Inputs</a>
                                </li>
                                <li><a class="menu-item" href="form-input-groups.html" data-i18n="Input Groups">Input Groups</a>
                                </li>
                                <li><a class="menu-item" href="form-input-grid.html" data-i18n="Input Grid">Input Grid</a>
                                </li>
                                <li><a class="menu-item" href="form-extended-inputs.html" data-i18n="Extended Inputs">Extended Inputs</a>
                                </li>
                                <li><a class="menu-item" href="form-checkboxes-radios.html" data-i18n="Checkboxes &amp; Radios">Checkboxes &amp; Radios</a>
                                </li>
                                <li><a class="menu-item" href="form-switch.html" data-i18n="Switch">Switch</a>
                                </li>
                                <li><a class="menu-item" href="form-select2.html" data-i18n="Select2">Select2</a>
                                </li>
                                <li><a class="menu-item" href="form-tags-input.html" data-i18n="Tags Input">Tags Input</a>
                                </li>
                                <li><a class="menu-item" href="form-validation.html" data-i18n="Validation">Validation</a>
                                </li>
                                <li><a class="menu-item" href="form-text-editor.html" data-i18n="Text editor">Text editor</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Form Layouts">Form Layouts</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="form-layout-basic.html" data-i18n="Basic Forms">Basic Forms</a>
                                </li>
                                <li><a class="menu-item" href="form-layout-horizontal.html" data-i18n="Horizontal Forms">Horizontal Forms</a>
                                </li>
                                <li><a class="menu-item" href="form-layout-hidden-labels.html" data-i18n="Hidden Labels">Hidden Labels</a>
                                </li>
                                <li><a class="menu-item" href="form-layout-form-actions.html" data-i18n="Form Actions">Form Actions</a>
                                </li>
                                <li><a class="menu-item" href="form-layout-bordered.html" data-i18n="Bordered">Bordered</a>
                                </li>
                                <li><a class="menu-item" href="form-layout-striped-rows.html" data-i18n="Striped Rows">Striped Rows</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="form-dual-listbox.html" data-i18n="Dual Listbox">Dual Listbox</a>
                        </li>
                        <li><a class="menu-item" href="form-wizard.html" data-i18n="Form Wizard">Form Wizard</a>
                        </li>
                        <li><a class="menu-item" href="form-repeater.html" data-i18n="Form Repeater">Form Repeater</a>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-grid"></i><span class="menu-title" data-i18n="Tables">Tables</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="#" data-i18n="Bootstrap Tables">Bootstrap Tables</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="table-basic.html" data-i18n="Basic Tables">Basic Tables</a>
                                </li>
                                <li><a class="menu-item" href="table-border.html" data-i18n="Table Border">Table Border</a>
                                </li>
                                <li><a class="menu-item" href="table-sizing.html" data-i18n="Table Sizing">Table Sizing</a>
                                </li>
                                <li><a class="menu-item" href="table-styling.html" data-i18n="Table Styling">Table Styling</a>
                                </li>
                                <li><a class="menu-item" href="table-components.html" data-i18n="Table Components">Table Components</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="DataTables">DataTables</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="dt-basic-initialization.html" data-i18n="Basic Initialisation">Basic Initialisation</a>
                                </li>
                                <li><a class="menu-item" href="dt-advanced-initialization.html" data-i18n="Advanced initialisation">Advanced initialisation</a>
                                </li>
                                <li><a class="menu-item" href="dt-styling.html" data-i18n="Styling">Styling</a>
                                </li>
                                <li><a class="menu-item" href="dt-data-sources.html" data-i18n="Data Sources">Data Sources</a>
                                </li>
                                <li><a class="menu-item" href="dt-api.html" data-i18n="API">API</a>
                                </li>
                                <li><a class="menu-item" href="#" data-i18n="DataTables Ext">DataTables Ext</a>
                                    <ul class="menu-content">
                                        <li><a class="menu-item" href="dt-extensions-autofill.html" data-i18n="AutoFill">AutoFill</a>
                                        </li>
                                        <li><a class="menu-item" href="#" data-i18n="Buttons">Buttons</a>
                                            <ul class="menu-content">
                                                <li><a class="menu-item" href="dt-extensions-buttons-basic.html" data-i18n="Basic Buttons">Basic Buttons</a>
                                                </li>
                                                <li><a class="menu-item" href="dt-extensions-buttons-html-5-data-export.html" data-i18n="HTML 5 Data Export">HTML 5 Data Export</a>
                                                </li>
                                                <li><a class="menu-item" href="dt-extensions-buttons-flash-data-export.html" data-i18n="Flash Data Export">Flash Data Export</a>
                                                </li>
                                                <li><a class="menu-item" href="dt-extensions-buttons-column-visibility.html" data-i18n="Column Visibility">Column Visibility</a>
                                                </li>
                                                <li><a class="menu-item" href="dt-extensions-buttons-print.html" data-i18n="Print">Print</a>
                                                </li>
                                                <li><a class="menu-item" href="dt-extensions-buttons-api.html" data-i18n="API">API</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="menu-item" href="dt-extensions-column-reorder.html" data-i18n="Column Reorder">Column Reorder</a>
                                        </li>
                                        <li><a class="menu-item" href="dt-extensions-fixed-columns.html" data-i18n="Fixed Columns">Fixed Columns</a>
                                        </li>
                                        <li><a class="menu-item" href="dt-extensions-key-table.html" data-i18n="Key Table">Key Table</a>
                                        </li>
                                        <li><a class="menu-item" href="dt-extensions-row-reorder.html" data-i18n="Row Reorder">Row Reorder</a>
                                        </li>
                                        <li><a class="menu-item" href="dt-extensions-select.html" data-i18n="Select">Select</a>
                                        </li>
                                        <li><a class="menu-item" href="dt-extensions-fix-header.html" data-i18n="Fix Header">Fix Header</a>
                                        </li>
                                        <li><a class="menu-item" href="dt-extensions-responsive.html" data-i18n="Responsive">Responsive</a>
                                        </li>
                                        <li><a class="menu-item" href="dt-extensions-column-visibility.html" data-i18n="Column Visibility">Column Visibility</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-bar-chart-2"></i><span class="menu-title" data-i18n="Charts">Charts</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="charts-apexcharts.html" data-i18n="Apex Charts">Apex Charts</a>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Chartjs">Chartjs</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="chartjs-line-charts.html" data-i18n="Line charts">Line charts</a>
                                </li>
                                <li><a class="menu-item" href="chartjs-bar-charts.html" data-i18n="Bar charts">Bar charts</a>
                                </li>
                                <li><a class="menu-item" href="chartjs-pie-doughnut-charts.html" data-i18n="Pie &amp; Doughnut charts">Pie &amp; Doughnut charts</a>
                                </li>
                                <li><a class="menu-item" href="chartjs-scatter-charts.html" data-i18n="Scatter charts">Scatter charts</a>
                                </li>
                                <li><a class="menu-item" href="chartjs-polar-radar-charts.html" data-i18n="Polar &amp; Radar charts">Polar &amp; Radar charts</a>
                                </li>
                                <li><a class="menu-item" href="chartjs-advance-charts.html" data-i18n="Advance charts">Advance charts</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="menu-item" href="morris-charts.html" data-i18n="Morris Charts">Morris Charts</a>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Chartist">Chartist</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="chartist-line-charts.html" data-i18n="Line charts">Line charts</a>
                                </li>
                                <li><a class="menu-item" href="chartist-bar-charts.html" data-i18n="Bar charts">Bar charts</a>
                                </li>
                                <li><a class="menu-item" href="chartist-pie-charts.html" data-i18n="Pie charts">Pie charts</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-map"></i><span class="menu-title" data-i18n="Maps">Maps</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="maps-leaflet.html" data-i18n="Leaflet Maps">Leaflet Maps</a>
                        </li>
                        <li><a class="menu-item" href="vector-maps-jvector.html" data-i18n="jVector Map">jVector Map</a>
                        </li>
                    </ul>
                </li>
                <li class=" navigation-header"><span>Others</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="Others"></i>
                </li>
                <li class=" nav-item"><a href="#"><i class="feather icon-align-left"></i><span class="menu-title" data-i18n="Menu levels">Menu levels</span></a>
                    <ul class="menu-content">
                        <li><a class="menu-item" href="#" data-i18n="Second level">Second level</a>
                        </li>
                        <li><a class="menu-item" href="#" data-i18n="Second level child">Second level child</a>
                            <ul class="menu-content">
                                <li><a class="menu-item" href="#" data-i18n="Third level">Third level</a>
                                </li>
                                <li><a class="menu-item" href="#" data-i18n="Third level child">Third level child</a>
                                    <ul class="menu-content">
                                        <li><a class="menu-item" href="#" data-i18n="Fourth level">Fourth level</a>
                                        </li>
                                        <li><a class="menu-item" href="#" data-i18n="Fourth level">Fourth level</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="disabled nav-item"><a href="#"><i class="feather icon-slash"></i><span class="menu-title" data-i18n="Disabled Menu">Disabled Menu</span></a>
                </li>
                <li class=" nav-item"><a href="https://pixinvent.ticksy.com/" target="_blank"><i class="feather icon-life-buoy"></i><span class="menu-title" data-i18n="Raise Support">Raise Support</span></a>
                </li>
                <li class=" nav-item"><a href="https://pixinvent.com/stack-bootstrap-admin-template/documentation" target="_blank"><i class="feather icon-folder"></i><span class="menu-title" data-i18n="Documentation">Documentation</span></a>
                </li>
            </ul>
        </div>
    </div>
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- Analytics spakline & chartjs  -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-12">
                        <div class="card">
                            <div class="card-header border-0-bottom">
                                <h4 class="card-title">Visitors Overview</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="expand"><i class="feather icon-maximize"></i></a></li>
                                        <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="row my-1">
                                        <div class="col-lg-4 col-12">
                                            <div class="text-center">
                                                <h3>23,454</h3>
                                                <p class="text-muted">Page Views <span class="success"><i class="feather icon-arrow-up"></i> 8.16%</span></p>
                                                <div id="sp-tristate-bar-total-revenue"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-12">
                                            <div class="text-center">
                                                <h3>6,630</h3>
                                                <p class="text-muted">Unique Visitor <span class="danger"><i class="feather icon-arrow-down"></i> 2.30%</span></p>
                                                <div id="sp-stacked-bar-total-sales"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-12">
                                            <div class="text-center">
                                                <h3>86,578</h3>
                                                <p class="text-muted">Total Visits <span class="warning"><i class="feather icon-arrow-up"></i> 4.27%</span></p>
                                                <div id="sp-bar-total-cost"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="chartjs">
                                                <canvas id="line-stacked-area" height="300"></canvas>
                                            </div>
                                            <ul class="list-inline text-center mt-1">
                                                <li class="mr-1">
                                                    <h6><i class="fa fa-circle success"></i> <span>Page Views</span></h6>
                                                </li>
                                                <li class="mr-1">
                                                    <h6><i class="fa fa-circle warning"></i> <span>Total Visits</span></h6>
                                                </li>
                                                <li class="mr-1">
                                                    <h6><i class="fa fa-circle danger"></i> <span>Unique Visitor</span></h6>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Analytics spakline & chartjs  -->

                <!--stats-->
                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media">
                                        <div class="media-body text-left w-100">
                                            <h3 class="primary">78%</h3>
                                            <span>New Session</span>
                                        </div>
                                        <div class="media-right media-middle">
                                            <i class="icon-user-follow primary font-large-2 float-right"></i>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm mt-1 mb-0">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media">
                                        <div class="media-body text-left w-100">
                                            <h3 class="danger">423</h3>
                                            <span>Total Visits</span>
                                        </div>
                                        <div class="media-right media-middle">
                                            <i class="icon-social-dropbox danger font-large-2 float-right"></i>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm mt-1 mb-0">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 40%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media">
                                        <div class="media-body text-left w-100">
                                            <h3 class="success">64.89 %</h3>
                                            <span>Bounce Rate</span>
                                        </div>
                                        <div class="media-right media-middle">
                                            <i class="icon-layers success font-large-2 float-right"></i>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm mt-1 mb-0">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 60%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="media">
                                        <div class="media-body text-left w-100">
                                            <h3 class="warning">02.12</h3>
                                            <span>Session Duration</span>
                                        </div>
                                        <div class="media-right media-middle">
                                            <i class="icon-globe warning font-large-2 float-right"></i>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm mt-1 mb-0">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 35%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/stats-->

                <!-- Audience by country & users visit-->
                <div class="row match-height">
                    <div class="col-xl-6 col-lg-12">
                        <div class="card">
                            <div class="card-header border-0">
                                <h4 class="card-title">Avg. Session Duration & Pages/Session</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <div id="area-chart" class="height-250"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-12">
                        <div class="card">
                            <div class="card-header border-0">
                                <h4 class="card-title">Goals Complition</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content">
                                <div id="goal-list-scroll" class="table-responsive height-250 position-relative">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th>Goals</th>
                                                <th>Goal Value</th>
                                                <th>Conversion rate</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Account</td>
                                                <td>$0.18</td>
                                                <td class="text-center font-small-2">85%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 95%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Subscribe</td>
                                                <td>$0.12</td>
                                                <td class="text-center font-small-2">75%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 85%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Mobile</td>
                                                <td>$220</td>
                                                <td class="text-center font-small-2">65%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 55%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Laptop</td>
                                                <td>$880</td>
                                                <td class="text-center font-small-2">35%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 45%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>LED TV</td>
                                                <td>$1002</td>
                                                <td class="text-center font-small-2">25%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>AC</td>
                                                <td>$1200</td>
                                                <td class="text-center font-small-2">15%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 15%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
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
                <!--/ Audience by country  & users visit -->

                <!-- Analytics map based session -->
                <div class="row">
                    <div class="col-12">
                        <div class="card box-shadow-0">
                            <div class="card-content">
                                <div class="row">
                                    <div class="col-xl-9 col-lg-12">
                                        <div id="world-map-markers" class="height-450"></div>
                                    </div>
                                    <div class="col-xl-3 col-lg-12">
                                        <div class="card-body">
                                            <h4 class="card-title mb-0">Visitors Sessions</h4>
                                            <div class="row">
                                                <div class="col-xl-12 col-lg-6 col-sm-12">
                                                    <p class="pb-1">Sessions by Browser</p>
                                                    <div id="sessions-browser-donut-chart" class="height-200"></div>
                                                </div>
                                                <div class="col-xl-12 col-lg-6 col-sm-12">
                                                    <div class="sales pr-2 pt-2">
                                                        <div class="sales-today mb-2">
                                                            <p class="m-0">Today's <span class="primary float-right"><i class="feather icon-arrow-up primary"></i> 6.89%</span></p>
                                                            <div class="progress progress-sm mt-1 mb-0">
                                                                <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                        </div>
                                                        <div class="sales-yesterday">
                                                            <p class="m-0">Yesterday's <span class="danger float-right"><i class="feather icon-arrow-down danger"></i> 4.18%</span></p>
                                                            <div class="progress progress-sm mt-1 mb-0">
                                                                <div class="progress-bar bg-danger" role="progressbar" style="width: 65%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Analytics map based session -->

                <!-- Bounce Rate & List -->
                <div class="row match-height">
                    <div class="col-xl-4 col-lg-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body sales-growth-chart">
                                    <div class="chart-title">
                                        <h1 class="display-4">32%</h1>
                                        <span class="text-muted">Bounce Rate</span>
                                    </div>
                                    <div id="bounce-rate" class="height-250"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-12">
                        <div class="card">
                            <div class="card-header border-0">
                                <h4 class="card-title">Audience by Country</h4>
                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-content">
                                <div id="audience-list-scroll" class="table-responsive height-300 position-relative">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th>Country</th>
                                                <th>Page views</th>
                                                <th>Device</th>
                                                <th>% Bounce rate</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><i class="flag-icon flag-icon-gb"></i> United State</td>
                                                <td>18</td>
                                                <td>Desktop</td>
                                                <td class="text-center font-small-2">85%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 85%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><i class="flag-icon flag-icon-au"></i> Australia</td>
                                                <td>12</td>
                                                <td>Mobile</td>
                                                <td class="text-center font-small-2">75%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><i class="flag-icon flag-icon-br"></i> Brazil</td>
                                                <td>25</td>
                                                <td>Tablet</td>
                                                <td class="text-center font-small-2">66%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 66%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><i class="flag-icon flag-icon-gb"></i> Great Britain (UK)</td>
                                                <td>8</td>
                                                <td>Mobile</td>
                                                <td class="text-center font-small-2">58%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 85%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><i class="flag-icon flag-icon-hk"></i> Hong Kong</td>
                                                <td>18</td>
                                                <td>Desktop</td>
                                                <td class="text-center font-small-2">45%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 45%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><i class="flag-icon flag-icon-in"></i> India</td>
                                                <td>10</td>
                                                <td>Desktop</td>
                                                <td class="text-center font-small-2">38%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 38%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><i class="flag-icon flag-icon-jp"></i> Japan</td>
                                                <td>11</td>
                                                <td>Moblie</td>
                                                <td class="text-center font-small-2">25%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><i class="flag-icon flag-icon-mx"></i> Mexico</td>
                                                <td>15</td>
                                                <td>Tablet</td>
                                                <td class="text-center font-small-2">22%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 22%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><i class="flag-icon flag-icon-ma"></i> Morocco</td>
                                                <td>14</td>
                                                <td>Moblie</td>
                                                <td class="text-center font-small-2">18%
                                                    <div class="progress progress-sm mt-1 mb-0">
                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 18%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
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
                <!--/ Bounce Rate & List -->
            </div>
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
    <script src="../../../app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="../../../app-assets/vendors/js/extensions/jquery.knob.min.js"></script>
    <script src="../../../app-assets/js/scripts/extensions/knob.js"></script>
    <script src="../../../app-assets/vendors/js/charts/raphael-min.js"></script>
    <script src="../../../app-assets/vendors/js/charts/morris.min.js"></script>
    <script src="../../../app-assets/vendors/js/charts/jvector/jquery-jvectormap-2.0.3.min.js"></script>
    <script src="../../../app-assets/vendors/js/charts/jvector/jquery-jvectormap-world-mill.js"></script>
    <script src="../../../app-assets/data/jvector/visitor-data.js"></script>
    <script src="../../../app-assets/vendors/js/charts/chart.min.js"></script>
    <script src="../../../app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
    <script src="../../../app-assets/vendors/js/extensions/unslider-min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/colors/palette-climacon.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/fonts/simple-line-icons/style.min.css">
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="../../../app-assets/js/core/app-menu.js"></script>
    <script src="../../../app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="../../../app-assets/js/scripts/pages/dashboard-analytics.js"></script>
    <!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>