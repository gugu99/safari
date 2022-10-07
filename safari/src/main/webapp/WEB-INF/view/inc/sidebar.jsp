<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class=" navigation-header"><span>General</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="General"></i>
            </li>
            <c:if test="${guestSidebar==null }">
            
             <li class=" nav-item"><a href="${pageContext.request.contextPath}/member/calendar"><i class="feather icon-calendar"></i><span class="menu-title" data-i18n="Project Summary">캘린더</span></a>
            </li>
             <li class=" nav-item"><a href="${pageContext.request.contextPath}/member/projectSummary"><i class="feather icon-bar-chart-2"></i><span class="menu-title" data-i18n="Project Summary">프로젝트 통계</span></a>
            </li>
             
            <li class=" navigation-header"><span>Apps</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="Apps"></i>
            </li>
            
            <li class=" nav-item"><a href="${pageContext.request.contextPath}/safari/project"><i class="feather icon-airplay"></i><span class="menu-title" data-i18n="Project Summary">프로젝트</span></a>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath}/member/chat"><i class="feather icon-message-square"></i><span class="menu-title" data-i18n="Chat Application">채팅</span></a>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath}/member/boardList"><i class="feather icon-edit"></i><span class="menu-title" data-i18n="Contacts">게시판</span></a>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath}/member/workspaceMemberList"><i class="feather icon-users"></i><span class="menu-title" data-i18n="Contacts">멤버 관리</span></a>
            </li>
            </c:if>
        </ul>
    </div>
</div>
<!-- END: Main Menu-->