<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Board</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/icheck/icheck.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/icheck/custom.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/photo-swipe/photoswipe.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/photo-swipe/default-skin/default-skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/charts/leaflet.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/pages/timeline.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
    <!-- END: Custom CSS-->
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/boardList.css">
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern content-detached-right-sidebar   fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-right-sidebar">

    <%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->

     <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                
            </div>
            <div class="row" id="rowContent">
                    <div class="col-10">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">게시판</h4>
                                
                                <div class="heading-elements">
				                    <button class="btn btn-outline-primary ml-10" id="btnGroupDrop1" type="button" data-toggle="modal" data-target="#add-Board"><i class="feather icon-plus icon-left"></i>게시판추가하기</button>
                                </div>
                            </div>
                            
                            <!-- Modal -->
                                    <div class="modal fade text-left" id="add-Board" tabindex="-1" role="dialog" aria-labelledby="myModalLabel17" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h3 class="modal-title" id="myModalLabel17">일정 작성</h3>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
		                                                <form action="${pageContext.request.contextPath }/member/addScheduleList" method="post" id="addScheduleForm">
		                                               		<input type="hidden" name="scheduleWriter" value="${login }">
		                                                    <div class="row">
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="scheduleTitle"><span class="fa fa-pencil mr-1"></span>제목(*)</label>
		                                                                <input type="text" class="form-control" id="scheduleTitle" name="scheduleTitle" placeholder="제목을 입력하세요.">
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-6">
		                                                            <div class="form-group">
		                                                                <div class="controls">
		                                                                    <label for="startDateTime"><span class="fa fa-calendar mr-1"></span>시작일(*)</label>
		                                                                    <input type="datetime-local" class="form-control" id="startDateTime" >
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <input type="hidden" id="scheduleStart" name="scheduleStart" >
		                                                        <div class="col-6">
		                                                            <div class="form-group">
		                                                                <div class="controls">
		                                                                    <label for="endDateTime"><span class="fa fa-calendar mr-1"></span>마감일(*)</label>
		                                                                    <input type="datetime-local" class="form-control" id="endDateTime" >
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <input type="hidden" id="scheduleEnd" name="scheduleEnd" >
		                                                        
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="languageselect2"><span class="fa fa-users mr-2"></span>참석자(*)</label>
		                                                                <select class="form-control memberSelect" id="scheduleMember" multiple="multiple" onChange="selectScheduleMember(this)">
		                                                                	<c:forEach var="pm" items="${projectMemberList }">
		                                                                		 <option value="${pm.workMemberEmail }" ${login eq pm.workMemberEmail ? 'selected' : ''}>${pm.workMemberName }</option>
		                                                                	</c:forEach>
		                                                                </select>
		                                                            </div>
		                                                        </div>
		                                                        <input type="hidden" id="scheduleMemberList" name="scheduleMemberList" value="">
		                                                        <div class="col-10">
		                                                            <div class="form-group">
		                                                                <label for="account-website"><span class="fa fa-map-marker mr-2"></span>장소</label>
		                                                                <input type="text" class="form-control" name="scheduleLocation" id="addr" placeholder="주소를 입력하세요." readonly>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-2">
		                                                        	<div class="form-group">
		                                                            	<button type="button" id="addrBtn" class="btn btn-secondary pull-right mt-2">주소 찾기</button>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="detailAddr"><span class="fa fa-map-marker mr-2"></span>상세 장소</label>
		                                                                <input type="text" class="form-control" name="scheduleDetailLocation" id="detailAddr" placeholder="주소를 입력하세요.">
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="scheduleContent"><span class="fa fa-pencil-square-o mr-1"></span>내용</label>
		                                                                <textarea class="form-control" name="scheduleContent" id="scheduleContent" rows="5" placeholder="내용을 입력하세요."></textarea>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
		                                                        	<div class="form-group mt-1">
		                                                                <label for="scheduleAuth"><span class="fa fa-lock mr-1"></span>공개설정</label>
		                                                                <select class="form-control" id="scheduleAuth" name="scheduleAuth">
		                                                                    <option value="N" selected>전체공개</option>
		                                                                    <option value="Y">관리자, 작성자만 공개</option>
		                                                                </select>
		                                                            </div>
		                                                            <div class="form-group">
		                                                                <button type="reset" class="btn btn-light mt-3 ml-2">입력취소</button>
		                                                            </div>
		                                                            
		                                                        </div>
		                                                    </div>
		                                                </form>
	                                                <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
														<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
													</div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">닫기</button>
                                                    <button type="button" id="addScheduleBtn" class="btn btn-outline-primary">올리기</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                            
                            <div class="card-content collapse show">
                                <div class="card-body">
                                </div>
                                <div class="table-responsive">
                                
                                    <table class="table">
                                        <thead class="bg-primary">
                                            <tr id="thead">
                                                <th scope="col">번호</th>
                                                <th scope="col" >게시판 제목</th>
                                                <th scope="col" colspan="3">작성자</th>
                                                <th scope="col" id="createDateTd">작성일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="b" items="${boardList }">
                                            <tr>
                                                <th>${b.boardNo }</th>
                                                <td colspan="3">${b.boardTitle }</td>
                                                <td>${b.boardWriter }</td>
                                                <td >${b.createDate }</td>
                                            </tr>
                                        </c:forEach>    
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <%@ include file="/WEB-INF/view/inc/footer.jsp" %> <!-- footer -->


   <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/masonry/masonry.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/photo-swipe/photoswipe.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/gallery/photo-swipe/photoswipe-ui-default.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/charts/leaflet/leaflet.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/charts/apexcharts/apexcharts.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/gallery/photo-swipe/photoswipe-script.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/timeline.js"></script>
    <!-- END: Page JS-->

	<script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>
	 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad27b76fa5ac0f047058a257a052808&libraries=services"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/kakaomap.js"></script>
</body>
<!-- END: Body-->

</html>