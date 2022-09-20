<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad27b76fa5ac0f047058a257a052808&libraries=services"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/kakaomap.js"></script>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern content-detached-right-sidebar   fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-right-sidebar">

    <%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->
		
     <!-- BEGIN: Content-->
    <div class="app-content content">
    	<%@ include file="/WEB-INF/view/task/taskHeader.jsp" %> <!-- taskHeader -->
        <div class="content-overlay"></div>
        <div class="content-wrapper">
        	
            <div class="content-header row">
                <div class="content-header-left col-md-8 mb-md-0 mb-2 mt-1">
                    <h2 class="content-header-title ml-5 mb-0">Schedule</h2>
                </div>
                <div class="content-header-left col-md-4 col-12 mb-md-0 mb-2 mt-1">
                    <button class="btn btn-outline-primary ml-10" type="button" data-toggle="modal" data-target="#add-schedule"><i class="feather icon-plus icon-left"></i> 일정 추가하기</button>
                </div>
            </div>
            <div class="content-body justify-content-center row mt-2">
            	<c:forEach var="s" items="${scheduleList }" varStatus="i">
            		<section id="timeline" class="timeline-center col-md-8">
	                    <div class="timeline-card card border-grey border-lighten-2">
	                        <div class="card-content">
	                        	 <div class="px-0 py-0 ml-1 mt-1">
		                       	 	<div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
		                             <span class="text-bold-600 mr-1">${s.workMemberName }</span>
		                             <span class="blue-grey date">${createDate }</span>
		                       	 	<p class="h2 card-text mt-2 mb-1 ml-1">${s.scheduleTitle }</p>
	                        	 </div>
	                        	 	
	                            <div class="card-footer px-0 py-0">
	                             <div class="card-content">
	                                 <div class="card-body">
	                                     <p class="card-text mb-3">${s.scheduleContent }</p>
	                                     <c:if test="${s.scheduleLocation ne ''}">
		                                     <span class="blue-grey addr"><span class="fa fa-map-marker mr-2"></span>${s.scheduleLocation }</span>
		                                     <span class="blue-grey addr">${s.scheduleDetailLocation }</span>
	                                     	<div id="map${i.index }" style="width:100%;height:300px;" ></div>
	                                     	<script>
	                                     		locationMap('map${i.index }', '${s.scheduleLocation }');
	                                     	</script>
	                                     </c:if>
	                                     
	                                     <ul class="list-inline mt-1 mb-0">
	                                         <li class="pr-1"><a href="${pageContext.request.contextPath }/safari/addScheduleLike?scheduleNo=${s.scheduleNo}" class=""><span class="fa fa-thumbs-o-up ml-1"></span> Like ${s.scheduleLikeCnt }</a></li>
	                                         <li class="pr-1"><span class="fa fa-commenting-o"></span> Comment</li>
	                                     </ul>
	                                 </div>
	                             </div>
	                            </div>
	                            
	                            <!-- 댓글 -->
	                            <c:forEach var="c" items="${s.scheduleComments }">
		                            <c:if test="${c.cmtMemberEmail ne null }">
			                            <div class="card-footer px-0 py-0">
			                                <div class="card-body">
			                                    <div class="media">
			                                    	<!-- 프로필 이미지 -->
			                                        <div class="media-left">
			                                            <div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
			                                        </div>
		                                        
		                                        	<div class="media-body ml-1">
		                                        		<p class="text-bold-600 mb-0">${c.cmtWorkMemberName } <span class="blue-grey date ml-1">${c.cmtCreateDate }</span>
		                                            		<a href="${pageContext.request.contextPath }/" class="addr"><span class="fa fa-thumbs-o-up ml-1 addr"></span> Like ${c.cmtLikeCnt }</a>
		                                            		<c:if test="${login eq  c.cmtMemberEmail}">
		                                            			<a href="${pageContext.request.contextPath }/safari/removeScheduleComment?scheduleCmtNo=${c.scheduleCmtNo }" class="addr"><span class="fa fa-trash-o ml-2"></span></a>
		                                            		</c:if>
			                                            </p>
			                                            <p class="m-0">${c.scheduleCmtContent }</p>
			                                       </div>
			                                    </div>
			                                </div>
			                            </div>
		                            </c:if>
	                            </c:forEach>
	                            
	                            <!-- comment input -->
	                            <div class="card-footer px-0 py-0">
	                             <div class="card-body">
	                                 <fieldset class="form-group position-relative has-icon-left mb-0">
		                                <form action="${pageContext.request.contextPath }/safari/addScheduleComment" method="post" id="commentForm">
		                                	<input type="hidden" name="scheduleNo" value="${s.scheduleNo }">
		                                	<input type="hidden" name="cmtMemberEmail" value="${login }">
		                                     <input type="text" class="form-control" name="scheduleCmtContent" id="comment" onkeyup="insertComment()" placeholder="입력 Enter입니다.">
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
            	</c:forEach>
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
	<script src="${pageContext.request.contextPath }/resources/assets/js/addSchedule.js"></script>
	

<script>
	$('#addrBtn').click(function(){
		sample2_execDaumPostcode();
	});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               /*  document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr; */
                
                // $('#') ///////////////////////////////////////////////////////////////////////
                document.getElementById('addr').value = addr;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

     // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<c:if test="${scheduleLikeMsg ne null }">
	<script>
		alert('${scheduleLikeMsg}');
	</script>
</c:if>
</body>
<!-- END: Body-->

</html>