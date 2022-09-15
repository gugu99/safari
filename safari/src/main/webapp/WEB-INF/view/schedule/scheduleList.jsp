<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Schedule</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/selects/select2.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/icheck/icheck.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/icheck/custom.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/toggle/switchery.min.css">
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
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/plugins/forms/validation/form-validation.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/plugins/pickers/daterange/daterange.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
    <!-- END: Custom CSS-->
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
                <div class="content-header-left col-md-2 mb-2 mt-1">
                    <h2 class="content-header-title ml-5 mb-0">Schedule</h2>
                </div>
                <div class="content-header-left col-md-10 col-12 mb-2 mt-1">
                    <button class="btn btn-outline-primary" type="button" data-toggle="modal" data-target="#add-schedule"><i class="feather icon-plus icon-left"></i> 일정 추가하기</button>
                </div>
            </div>
            <div class="content-body justify-content-center row mt-2">
                <section id="timeline" class="timeline-center col-md-8">
                    <div class="timeline-card card border-grey border-lighten-2">
                        <div class="card-content">
                        	 <div class="px-0 py-0 ml-1 mt-1">
	                       	 	<div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
	                             <span class="text-bold-600 mr-1">작성자</span>
	                             <span class="blue-grey date">2022-09-14 00:00:00</span>
	                       	 	<p class="h2 card-text mt-2 mb-1 ml-1">일정 제목</p>
                        	 </div>
                        	 	
                            <div class="card-footer px-0 py-0">
                             <div class="card-content">
                                 <div class="card-body">
                                     <p class="card-text">가나다라마바사아자차카타파</p>
                                     <p class="blue-grey addr" id="location"><span class="fa fa-map-marker mr-2"></span>서울특별시 금천구 가산로 99 (가산동, 두산위브아파트)</p>
                                     <div id="map" style="width:100%;height:300px;"></div>
                                     
                                     <ul class="list-inline mt-1 mb-0">
                                         <li class="pr-1"><a href="#" class=""><span class="fa fa-thumbs-o-up"></span> Like</a></li>
                                         <li class="pr-1"><span class="fa fa-commenting-o"></span> Comment</li>
                                     </ul>
                                 </div>
                             </div>
                            </div>
                            
                            
                            <!-- 댓글 -->
                            <div class="card-footer px-0 py-0">
                                <div class="card-body">
                                    <div class="media">
                                    	<!-- 프로필 이미지 -->
                                        <div class="media-left">
                                            <div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
                                        </div>
                                        
                                        <div class="media-body ml-1">
                                            <p class="text-bold-600 mb-0">Jason Ansley <span class="blue-grey date">2022-09-14 00:00:00</span>
                                            	<a href="#" class=""><span class="fa fa-thumbs-o-up"></span> Like</a>
                                            </p>
                                            <p class="m-0">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante
                                                sollicitudin commodo.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- comment input -->
                            <div class="card-footer px-0 py-0">
                             <div class="card-body">
                                 <fieldset class="form-group position-relative has-icon-left mb-0">
	                                <form action="#" method="post" id="commentForm">
	                                     <input type="text" class="form-control" name="scheduleComment" id="comment" onkeyup="insertComment()" placeholder="입력 Enter입니다.">
	                                     <div class="form-control-position">
	                                         <i class="fa fa-dashcube"></i>
	                                     </div>
	                                 </form>
                                 </fieldset>
                             </div>
                            </div>
                            <!-- comment input end -->
                        </div>
                    </div>
                    
                </section>
                <%@ include file="/WEB-INF/view/schedule/addSchedule.jsp" %>
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
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/charts/leaflet/leaflet.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/toggle/switchery.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/gallery/photo-swipe/photoswipe-script.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/timeline.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/modal/components-modal.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/account-setting.js"></script>
    <!-- END: Page JS-->

	<script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad27b76fa5ac0f047058a257a052808&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($('#location').text(), function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        /* var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker); */
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	</script>
</body>
<!-- END: Body-->

</html>