<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class=" navigation-header"><span>General</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="General"></i>
            </li>
            <c:if test="${guestSidebar==null }">
            <li class=" nav-item"><a href="${pageContext.request.contextPath }/index"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="${pageContext.request.contextPath}/member/calendar" data-i18n="eCommerce"><i class="feather icon-calendar"></i>Calendar</a>
                    </li>
                    <li><a class="menu-item" href="${pageContext.request.contextPath}/member/projectSummary" data-i18n="eCommerce"><i class="feather icon-bar-chart-2"></i>Project Summary</a>
                    </li>
                </ul>
            </li>
            <li class=" navigation-header"><span>Apps</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="Apps"></i>
            </li>
            
            <li class=" nav-item"><a href="${pageContext.request.contextPath}/safari/project"><i class="feather icon-airplay"></i><span class="menu-title" data-i18n="Project Summary">Project Application</span></a>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath}/member/chat"><i class="feather icon-message-square"></i><span class="menu-title" data-i18n="Chat Application">Chat Application</span></a>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath}/member/workspaceMemberList"><i class="feather icon-users"></i><span class="menu-title" data-i18n="Contacts">Member</span></a>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath}/member/boardList"><i class="fa fa-pencil-square-o"></i><span class="menu-title" data-i18n="Contacts">board</span></a>
            </li>
            </c:if>
        </ul>
    </div>
</div>
<!-- END: Main Menu-->