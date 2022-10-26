<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="chat-area d-none">
    <div class="chat-header">
        <header class="d-flex justify-content-between align-items-center px-1 py-75">
            <div class="d-flex align-items-center">
                <div class="chat-sidebar-toggle d-block d-lg-none mr-1">
                    <i class="feather icon-menu font-large-1 cursor-pointer"></i>
                </div>
                <div class="avatar avatar-busy chat-profile-toggle m-0 mr-1">
                    <img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-26.png" alt="avatar" height="36" width="36" />
                    <i></i>
                </div>
                <!-- chatRoomName -->
                <h6 class="mb-0" id="chatRoomName"></h6>
            </div>
            <div class="chat-header-icons">
                <i class="chat-icon-favorite">
                    <i class="feather icon-star font-medium-4 cursor-pointer"></i>
                </i>
                <span class="dropdown">
                    <i class="feather icon-more-vertical font-medium-4 ml-25 cursor-pointer dropdown-toggle nav-hide-arrow cursor-pointer" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu">
                    </i>
                    <!-- bar -->
                    <!-- bar -->
                    <!-- bar -->
                    <span class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="JavaScript:void(0);"><i class="feather icon-tag mr-25"></i> Pin to top</a>
                        <a class="dropdown-item" href="JavaScript:void(0);"><i class="feather icon-trash-2 mr-25"></i> Delete
                            chat</a>
                        <a class="dropdown-item" href="JavaScript:void(0);"><i class="feather icon-x-circle mr-25"></i> Block</a>
                    </span>
                </span>
            </div>
        </header>
    </div>
    <!-- chat card start -->
    <div class="card chat-wrapper shadow-none mb-0">
        <div class="card-content">
            <div class="card-body chat-container">
                <div class="chat-content">
                    <div class="chat"><!-- 발신인이 나 자신인 경우 -->
                        <div class="chat-avatar">
                            <a class="avatar m-0">
                                <img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="avatar" height="36" width="36" />
                            </a>
                        </div>
                        <div class="chat-body">
                            <div class="chat-message">
                                <p>메시지 내용 영역</p>
                                <span class="chat-time" id="chat-time">7:45 AM</span>
                            </div>
                        </div>
                    </div><!-- 발신인이 나 자신인 경우 -->
                    <div class="chat chat-left"> <!-- 발신인이 내가 아닌 경우 -->
                        <div class="chat-avatar">
                            <a class="avatar m-0">
                                <img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-26.png" alt="avatar" height="36" width="36" />
                            </a>
                        </div>
                        <div class="chat-body">
                            <div class="chat-message">
                                <p>Hey John, I am looking for the best admin template.</p>
                                <p>Could you please help me to find it out? 🤔</p>
                                <span class="chat-time">7:50 AM</span>
                            </div>
                            <div class="chat-message">
                                <p>It should be Bootstrap 4 🤩 compatible.</p>
                                <span class="chat-time">7:58 AM</span>
                            </div>
                        </div>
                    </div> <!-- 발신인이 내가 아닌 경우 -->
                    
                    <!-- 중앙정렬으로 뜨는 것 -->
                    <div class="badge badge-pill badge-light-secondary my-1">Yesterday</div>
                    
                    <!-- APPEND -->
                    <!-- APPEND -->
                    <!-- APPEND -->
                    <div id="msgArea"></div>
                    <!-- APPEND -->                                            
                    <!-- APPEND -->                                            
                    <!-- APPEND -->

                    <!-- 가짜 데이터 -->
                    <input type="hidden" value="1" id="chatRoomNo">
					<input type="hidden" value="${sessionScope.login}" id="login">
                    <!-- 가짜 데이터 -->
                </div><!-- end for chat-content -->
            </div><!-- end for card-body chat-container -->
        </div><!-- end for card-content -->
        <div class="card-footer chat-footer px-2 py-1 pb-0">
                <i class="feather icon-user cursor-pointer"></i>
                <i class="feather icon-paperclip ml-1 cursor-pointer"></i>
                <input type="text" class="form-control chat-message-send mx-1" placeholder="Type your message here...">
                <button type="button" id="button-send" class="btn btn-primary glow send d-lg-flex"><i class="feather icon-play"></i>
                    <span class="d-none d-lg-block mx-50">Send</span>
                </button>
        </div>
    </div>
    <!-- chat card ends -->
    </div>
</section>
<!-- app chat window ends -->
<!-- app chat profile right sidebar start -->
<section class="chat-profile">
    <header class="chat-profile-header text-center border-bottom">
        <span class="chat-profile-close">
            <i class="feather icon-x"></i>
        </span>
        <div class="my-2">

            <img src="${pageContext.request.contextPath }/resources/app-assets/images/portrait/small/avatar-s-26.png" class="round mb-1" alt="chat avatar" height="100" width="100">

        <h5 class="app-chat-user-name mb-0">Elizabeth Elliott</h5>
        <span>Devloper</span>
    </div>
</header>
<div class="chat-profile-content p-2">
    <h6 class="mt-1">ABOUT</h6>
    <p>It is a long established fact that a reader will be distracted by the readable content.</p>
    <h6 class="mt-2">PERSONAL INFORMATION</h6>
    <ul class="list-unstyled">
        <li class="mb-25">email@gmail.com</li>
        <li>+1(789) 950-7654</li>
    </ul>
</div>
