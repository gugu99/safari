<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/workspaceMemberOne.css">
 <!-- BEGIN: Header-->
    <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu fixed-top navbar-semi-dark navbar-shadow">
        <div class="navbar-wrapper">
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mobile-menu d-lg-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="feather icon-menu font-large-1"></i></a></li>
                    <li class="nav-item mr-auto"><a class="navbar-brand" href="${pageContext.request.contextPath }/safari/index"><img class="brand-logo" alt="stack admin logo" src="${pageContext.request.contextPath }/resources/app-assets/images/logo/stack-logo-light.png">
                            <h2 class="brand-text">Safari</h2>
                        </a></li>
                    <li class="nav-item d-none d-lg-block nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="toggle-icon feather icon-toggle-right font-medium-3 white" data-ticon="feather.icon-toggle-right"></i></a></li>
                    <li class="nav-item d-lg-none"><a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile"><i class="fa fa-ellipsis-v"></i></a></li>
                </ul>
            </div>
            <div class="navbar-container content">
                <div class="collapse navbar-collapse" id="navbar-mobile">
                    <ul class="nav navbar-nav mr-auto float-left">
                        
                        <li class="nav-item d-none d-md-block"><a class="nav-link nav-link-expand" href="#"><i class="ficon feather icon-maximize"></i></a></li>
                        
                    </ul>
                    <ul class="nav navbar-nav float-right">
                       
                        <li class="dropdown dropdown-notification nav-item"><a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon feather icon-mail"></i><span class="badge badge-pill badge-warning badge-up">3</span></a>
                            <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                                <li class="dropdown-menu-header">
                                    <h6 class="dropdown-header m-0"><span class="grey darken-2">Messages</span><span class="notification-tag badge badge-warning float-right m-0">4 New</span></h6>
                                </li>
                                <li class="scrollable-container media-list"><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="avatar avatar-online avatar-sm rounded-circle"><img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-1.png" alt="avatar"><i></i></div>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="media-heading">Margaret Govan</h6>
                                                <p class="notification-text font-small-3 text-muted">I like your portfolio, let's start.</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Today</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left"><span class="avatar avatar-sm avatar-busy rounded-circle"><img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-2.png" alt="avatar"><i></i></span></div>
                                            <div class="media-body">
                                                <h6 class="media-heading">Bret Lezama</h6>
                                                <p class="notification-text font-small-3 text-muted">I have seen your work, there is</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Tuesday</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="avatar avatar-online avatar-sm rounded-circle"><img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-3.png" alt="avatar"><i></i></div>
                                            </div>
                                            <div class="media-body">
                                                <h6 class="media-heading">Carie Berra</h6>
                                                <p class="notification-text font-small-3 text-muted">Can we have call in this week ?</p><small>
                                                    <time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Friday</time></small>
                                            </div>
                                        </div>
                                    </a><a href="javascript:void(0)">
                                        <div class="media">
s                                            <div class="media-left"><span class="avatar avatar-sm avatar-away rounded-circle"><img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-6.png" alt="avatar"><i></i></span></div>
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
                        <li class="dropdown dropdown-user nav-item" ><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown" >
                                
                                
								<c:if test="${profileImg.filename==null }">
								<div class="avatar avatar-offline bg-info m-0 mr-50">
                               		<img src="${pageContext.request.contextPath}/resources/upload/nomalprofile.png" alt="" class="users-avatar-shadow rounded-circle" height="64" width="64">
                               		</div>
                                </c:if>	
                                
                                <c:if test="${profileImg.filename!=null }">
                                <div class="avatar avatar-offline bg-info m-0 mr-50">
                              	 	<img src="${pageContext.request.contextPath}/resources/upload/${profileImg.filename}${profileImg.fileExt}" alt="" class="brand-logo" >
                              	 	</div>
                              	 	
                                </c:if>
                                <c:if test="${guest !=null }">
                                <span class="user-name">게스트</span>
                                </c:if>	
                                <span class="user-name">${workMemberName}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="${pageContext.request.contextPath }/safari/workspaceMemberOne"><i class="feather icon-user"></i>프로필 설정</a>
                                <div class="dropdown-divider"></div><a class="dropdown-item" href="${pageContext.request.contextPath }/safari/logout"><i class="feather icon-power"></i>로그아웃</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- END: Header-->