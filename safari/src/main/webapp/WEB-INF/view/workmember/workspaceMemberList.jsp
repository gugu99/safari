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
    
    <%@ include file="/WEB-INF/view/inc/common-css.jsp" %> <!-- css -->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern content-detached-right-sidebar   fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-right-sidebar">

    <%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->

    <!-- BEGIN: Content-->
        <div class="content-overlay"></div>
            <div class="content-header row">
            
            </div>
            <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-detached content-right">
                <div class="content-body">
                    <div class="content-overlay"></div>
                    <section class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="bug-list-search">
                                        <div class="bug-list-search-content">
                                            <div class="sidebar-toggle d-block d-lg-none"><i class="feather icon-menu font-large-1"></i></div>
                                            <form action="#">
                                                <div class="position-relative">
                                                    <input type="search" id="search-contacts" class="form-control" placeholder="Search contacts...">
                                                    <div class="form-control-position">
                                                        <i class="fa fa-search text-size-base text-muted la-rotate-270"></i>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="row all-contacts">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-head">
                                    <div class="card-header">
                                        <h4 class="card-title">All Contacts</h4>
                                        <div class="heading-elements mt-0">
                                            <button class="btn btn-primary btn-md" data-toggle="modal" data-target="#AddContactModal"><i class="d-md-none d-block feather icon-plus white"></i>
                                                <span class="d-md-block d-none">Add Contacts</span></button>
                                            <div class="modal fade" id="AddContactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <section class="contact-form">
                                                            <form id="form-add-contact" class="contact-input">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel1">Add New Contact</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <fieldset class="form-group col-12">
                                                                        <input type="text" id="contact-name" class="contact-name form-control" placeholder="Name">
                                                                    </fieldset>
                                                                    <fieldset class="form-group col-12">
                                                                        <input type="text" id="contact-email" class="contact-email form-control" placeholder="Email">
                                                                    </fieldset>
                                                                    <fieldset class="form-group col-12">
                                                                        <input type="text" id="contact-phone" class="contact-phone form-control" placeholder="Phone Number">
                                                                    </fieldset>
                                                                    <fieldset class="form-group col-12">
                                                                        <input type="checkbox" id="favorite" class="contact-fav input-chk"> Favorite
                                                                    </fieldset>
                                                                    <fieldset class="form-group col-12">
                                                                        <input type="file" class="form-control-file" id="user-image">
                                                                    </fieldset>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                                                        <button type="button" id="add-contact-item" class="btn btn-info add-contact-item" data-dismiss="modal"><i class="fa fa-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block">Add New</span></button>
                                                                    </fieldset>
                                                                </div>
                                                            </form>
                                                        </section>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal fade" id="EditContactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <section class="contact-form">
                                                            <form id="form-edit-contact" class="contact-input">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Edit Contact</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <fieldset class="form-group col-12">
                                                                        <input type="text" id="name" class="name form-control" placeholder="Name">
                                                                    </fieldset>
                                                                    <fieldset class="form-group col-12">
                                                                        <input type="text" id="email" class="email form-control" placeholder="Email">
                                                                    </fieldset>
                                                                    <fieldset class="form-group col-12">
                                                                        <input type="text" id="phone" class="phone form-control" placeholder="Phone Number">
                                                                    </fieldset>
                                                                    <span id="fav" class="d-none"></span>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                                                        <button type="button" id="edit-contact-item" class="btn btn-info edit-contact-item" data-dismiss="modal"><i class="fa fa-paper-plane-o d-lg-none"></i> <span class="d-none d-lg-block">Edit</span></button>
                                                                    </fieldset>
                                                                </div>
                                                            </form>
                                                        </section>
                                                    </div>
                                                </div>
                                            </div>
                                            <span class="dropdown">
                                                <button id="btnSearchDrop1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" class="btn btn-warning dropdown-menu-right dropdown-toggle btn-md">
                                                    <i class="feather icon-download-cloud white"></i></button>
                                                <span aria-labelledby="btnSearchDrop1" class="dropdown-menu dropdown-menu-right mt-1">
                                                    <a href="#" class="dropdown-item"><i class="feather icon-upload"></i> Import</a>
                                                    <a href="#" class="dropdown-item"><i class="feather icon-download"></i> Export</a>
                                                    <a href="#" class="dropdown-item"><i class="feather icon-shuffle"></i> Find Duplicate</a>
                                                </span>
                                            </span>
                                            <button class="btn btn-default btn-sm"><i class="feather icon-settings white"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <!-- Task List table -->
                                        <button type="button" class="btn btn-danger btn-sm delete-all mb-1">Delete All</button>
                                        <div class="table-responsive">
                                            <table id="users-contacts" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center">
                                                <thead>
                                                    <tr>
                                                        <th>position</th>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Phone</th>
                                                        <th>Favorite</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="r" items="${workspaceMemberList}">
                                                    <tr>
                                                   		 <td class="text-center">${r.workMemberPos }</td>
                                                        <td>
                                                            <div class="media">
                                                                <div class="media-body media-middle">
                                                                    <a class="media-heading name">${r.workMemberName }</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <a class="email" href="mailto:email@example.com">${r.workMemberEmail }</a>
                                                        </td>
                                                        <td class="phone">${r.workMemberPhone }</td>
                                                        <td class="text-center">
                                                            <div class="favorite active"><i class="feather icon-star"></i></div>
                                                        </td>
                                                        <td>
                                                            <a data-toggle="modal" data-target="#EditContactModal" class="primary edit mr-1"><i class="fa fa-pencil"></i></a>
                                                            <a class="danger delete mr-1"><i class="fa fa-trash-o"></i></a>
                                                            <span class="dropdown">
                                                                <a id="btnSearchDrop2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" class="dropdown-toggle dropdown-menu-right"><i class="fa fa-ellipsis-v"></i></a>
                                                                <span aria-labelledby="btnSearchDrop2" class="dropdown-menu mt-1 dropdown-menu-right">
                                                                    <a data-toggle="modal" data-target="#EditContactModal" class="dropdown-item edit"><i class="feather icon-edit-2"></i>
                                                                        Edit</a>
                                                                    <a href="#" class="dropdown-item delete"><i class="feather icon-trash-2"></i> Delete</a>
                                                                    <a href="#" class="dropdown-item"><i class="feather icon-plus-circle primary"></i> Projects</a>
                                                                    <a href="#" class="dropdown-item"><i class="feather icon-plus-circle info"></i> Team</a>
                                                                    <a href="#" class="dropdown-item"><i class="feather icon-plus-circle warning"></i> Clients</a>
                                                                    <a href="#" class="dropdown-item"><i class="feather icon-plus-circle success"></i> Friends</a>
                                                                </span>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>Position</th>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Phone</th>
                                                        <th>Favorite</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="sidebar-detached sidebar-left">
                <div class="sidebar">
                    <div class="bug-list-sidebar-content">
                        <!-- Predefined Views -->
                        <div class="card">
                            <div class="card-head">
                                <div class="media p-1">
                                    <div class="media-left pr-1"><span class="avatar avatar-online avatar-sm rounded-circle"><img src="../../../app-assets/images/portrait/small/avatar-s-1.png" alt="avatar"><i></i></span></div>
                                    <div class="media-body media-middle">
                                        <h5 class="media-heading">Margaret Govan</h5>
                                    </div>
                                </div>
                            </div>

                            <!-- contacts view -->
                            <div class="card-body border-top-blue-grey border-top-lighten-5">
                                <div class="list-group">
                                    <a href="#" class="list-group-item active">All Contacts</a>
                                    <a href="#" class="list-group-item list-group-item-action">Recently contacted</a>
                                    <a href="#" class="list-group-item list-group-item-action">Favorite contacts</a>
                                </div>
                            </div>

                            <!-- Groups-->
                            <div class="card-body">
                                <p class="lead">Groups</p>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <span class="badge badge-primary badge-pill float-right">14</span>
                                        <a href="#">Project</a>
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge badge-info badge-pill float-right">22</span>
                                        <a href="#">Team</a>
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge badge-warning badge-pill float-right">10</span>
                                        <a href="#">Clients</a>
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge badge-success badge-pill float-right">5</span>
                                        <a href="#">Friends</a>
                                    </li>
                                </ul>
                            </div>
                            <!--/ Groups-->

                            <!--More-->
                            <div class="card-body ">
                                <p class="lead">More</p>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <span class="badge badge-primary badge-pill float-right">14</span>
                                        <a href="#">Import</a>
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge badge-info badge-pill float-right">22</span>
                                        <a href="#">Export</a>
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge badge-warning badge-pill float-right">10</span>
                                        <a href="#">Print</a>
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge badge-success badge-pill float-right">5</span>
                                        <a href="#">Restore contacts</a>
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge badge-success badge-pill float-right">5</span>
                                        <a href="#">Find duplicate</a>
                                    </li>
                                </ul>
                            </div>
                            <!--/More-->

                        </div>
                        <!--/ Predefined Views -->

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END: Content-->
                                                    
                                                    
    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <%@ include file="/WEB-INF/view/inc/footer.jsp" %> <!-- footer -->


    <%@ include file="/WEB-INF/view/inc/common-js.jsp" %> <!-- js -->


</body>
<!-- END: Body-->

</html>