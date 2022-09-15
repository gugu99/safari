<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class=" navigation-header"><span>General</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="General"></i>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath }/index"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-primary badge-pill float-right mr-2">3</span></a>
                <ul class="menu-content">
                    <li><a class="menu-item" href="dashboard-ecommerce.html" data-i18n="eCommerce">eCommerce</a>
                    </li>
                    <li><a class="menu-item" href="dashboard-analytics.html" data-i18n="Analytics">Analytics</a>
                    </li>
                    <li><a class="menu-item" href="dashboard-fitness.html" data-i18n="Fitness">Fitness</a>
                    </li>
                    <li><a class="menu-item" href="dashboard-crm.html" data-i18n="CRM">CRM</a>
                    </li>
                </ul>
            </li>
            <li class=" navigation-header"><span>Apps</span><i class=" feather icon-minus" data-toggle="tooltip" data-placement="right" data-original-title="Apps"></i>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath }/safari/project"><i class="feather icon-airplay"></i><span class="menu-title" data-i18n="Project Summary">Project Application</span></a>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath }/safari/chat"><i class="feather icon-message-square"></i><span class="menu-title" data-i18n="Chat Application">Chat Application</span></a>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath }/safari/todoList"><i class="feather icon-check-square"></i><span class="menu-title" data-i18n="Todo Application">Todo Application</span></a>
            </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath }/safari/taskList"><i class="feather icon-file-plus"></i><span class="menu-title" data-i18n="Kanban Application">Kanban Application</span></a>
            </li>
             <li class=" nav-item"><a href="${pageContext.request.contextPath }/safari/scheduleList"><i class="feather icon-watch"></i><span class="menu-title" data-i18n="Coming Soon">Schedule</span></a>
             </li>
            <li class=" nav-item"><a href="${pageContext.request.contextPath }/safari/workspaceMemberList"><i class="feather icon-users"></i><span class="menu-title" data-i18n="Contacts">Member</span></a>
            </li>
        </ul>
    </div>
</div>
<!-- END: Main Menu-->