<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<body class="vertical-layout vertical-menu-modern content-detached-right-sidebar  fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-right-sidebar">

    <%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->
		
     <!-- BEGIN: Content-->
    <div class="app-content content">
    	<%@ include file="/WEB-INF/view/task/taskHeader.jsp" %> <!-- taskHeader -->
        <div class="content-overlay"></div>
        <div class="content-wrapper">
        	<div class="col-12">
        		<div class="col-2  mr-1 ml-1 mb-1">
        			<form action="${pageContext.request.contextPath }/safari/scheduleList" method="get" id="searchForm">
	                	<input type="text" class="form-control" onkeyup="insertSearch(this)" placeholder="?????? ?????? ?????? ??? Enter" name="search" id="search">
	                </form>
	            </div>
        	</div>
            <div class="content-header row">
                <div class="content-header-left col-md-8 mb-md-0 mb-2 mt-1">
                    <h2 class="content-header-title ml-5 mb-0">Schedule ${projectKeep }</h2>
                </div>
                <c:if test="${guest eq null && projectKeep eq null}">
                	<div class="content-header-left col-md-4 col-12 mb-md-0 mb-2 mt-1">
	                    <button class="btn btn-outline-primary ml-10" type="button" data-toggle="modal" data-target="#add-schedule"><i class="feather icon-plus icon-left"></i> ?????? ????????????</button>
	                </div>
                </c:if>
            </div>
            <div class="content-body justify-content-center row mt-2">
            	<c:choose>
            		<c:when test="${fn:length(scheduleList) == 0}">
            			<section id="timeline" class="timeline-center col-md-8">
		                    <div class="timeline-card card border-grey border-lighten-2">
		                        <div class="card-content">
		                        	 <div class="px-0 py-0 ml-1 mt-1 text-center">
		                        	 	<p>????????? ????????????.</p>
		                        	 </div>
		                        </div>
		                    </div>
		                </section>
            		</c:when>
            		<c:otherwise>
            	<c:forEach var="s" items="${scheduleList }" varStatus="i">
            		<!-- ????????? ??????????????????, ?????????&???????????? ???????????? ?????? ??? ????????? ?????? -->
            		<c:if test="${s.scheduleAuth eq 'N'|| (s.scheduleAuth eq 'Y' && (s.scheduleWriter eq login || manager)) }">
            		<section id="timeline" class="timeline-center col-md-8">
	                    <div class="timeline-card card border-grey border-lighten-2">
	                        <div class="card-content">
	                        	 <div class="px-0 py-0 ml-1 mt-1">
	                        	 <!-- ????????? ????????? -->
	                        	 	<c:choose>
	                        	 		<c:when test="${s.writerFilename eq null }">
	                        	 			<div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
	                        	 		</c:when>
	                        	 		<c:otherwise>
	                        	 			<div class="avatar avatar-md rounded-circle"><img src="${pageContext.request.contextPath }/resources/upload/${s.writerFilename}${s.writerFileExt}" alt="avatar"></div>
	                        	 		</c:otherwise>
	                        	 	</c:choose>
		                       	 	
		                             <span class="text-bold-600 mr-1">${s.workMemberName }</span>
		                             <span class="blue-grey date">${s.createDate }</span>
		                             <!-- ?????? ?????? ?????? -->
		                             <c:if test="${s.scheduleWriter eq login || manager && (guest eq null && projectKeep eq null)}">
		                                <a href="${pageContext.request.contextPath }/member/modifySchedule?scheduleNo=${s.scheduleNo }" class="addr"><span class="fa fa-pencil-square-o ml-2"></span>??????</a>
	                          			<a href="${pageContext.request.contextPath }/member/removeSchedule?scheduleNo=${s.scheduleNo }" class="addr"><span class="fa fa-trash-o ml-2"></span>??????</a>
	                          		</c:if>	
		                             
		                       	 	<p class="h2 card-text mt-2 mb-1 ml-1">${s.scheduleTitle }</p>
		                       	 	<span class="blue-grey addr ml-1 mr-1">${s.scheduleStart } ??????</span>
		                       	 	<span class="blue-grey addr">${s.scheduleEnd } ??????</span>
	                        	 </div>
	                        	 	
	                            <div class="card-footer px-0 py-0">
	                             <div class="card-content">
	                                 <div class="card-body">
	                                     <p class="card-text ml-1 mt-2 mb-3">${s.scheduleContent }</p>
	                                     <p class="card-text mb-2">
	                                     <!-- ?????? ?????? ????????? -->
	                                     <c:forEach var="sm" items="${s.scheduleMembers}">
		                                     <c:choose>
			                        	 		<c:when test="${sm.filename eq null }">
			                        	 			<div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
			                        	 			<span class="text-bold-600 mr-1">${sm.workMemberName }</span>
			                        	 		</c:when>
			                        	 		<c:otherwise>
			                        	 			<div class="avatar avatar-md rounded-circle"><img src="${pageContext.request.contextPath }/resources/upload/${sm.filename}${sm.fileExt}" alt="avatar"></div>
			                        	 			<span class="text-bold-600 mr-1">${sm.workMemberName }</span>
			                        	 		</c:otherwise>
			                        	 	</c:choose>
	                                     </c:forEach>
	                                     </p>
	                                     <!-- ?????? ?????? cnt -->
	                                     <p class="card-text mb-3">
	                                     <c:if test="${guest eq null && projectKeep eq null}">
		                                     <c:forEach var="a" items="${s.scheduleAttendances }">
		                                 		<c:if test="${a.scheduleAttendance eq 'Y' }">
		                                 			<span class="text-primary mr-1">?????? : ${a.attendCnt}</span>
	                                 			</c:if>
	                                 			<c:if test="${a.scheduleAttendance eq 'U' }">
	                                 				<span class="text-secindary mr-1">?????? : ${a.attendCnt}</span>
	                                 			</c:if>
	                                 			<c:if test="${a.scheduleAttendance eq 'N' }">
	                                 				<span class="text-danger mr-1">?????? : ${a.attendCnt}</span>
	                                 			</c:if>
		                                     </c:forEach>
	                                     </c:if>
		                                 </p>
	                                     <p class="card-text mb-2">
	                                     <c:if test="${s.scheduleLocation ne null}">
		                                     <span class="blue-grey addr"><span class="fa fa-map-marker mr-1"></span>${s.scheduleLocation }</span>
		                                     <span class="blue-grey addr">${s.scheduleDetailLocation }</span>
	                                     	<div id="map${i.index }" style="width:100%;height:300px;" ></div>
	                                     	<script>
	                                     		locationMap('map${i.index }', '${s.scheduleLocation }');
	                                     	</script>
	                                     </c:if>
	                                 </div>
	                             </div>
	                            </div>
	                            
	                            <c:forEach var="sm" items="${s.scheduleMembers}">
                                  	<c:if test="${sm.scheduleMemberEmail eq login && (guest eq null && projectKeep eq null)}">
	                           		 <div class="card-footer px-0 py-0">
			                             <div class="card-content">
			                                 <div class="card-body text-center">
			                                 	<div class="form-group mt-1">
	                                 				<button type="button" onclick="location.href='${pageContext.request.contextPath }/member/modifyScheduleAttend?scheduleNo=${s.scheduleNo }&scheduleAttend=Y&workMemberName=${sm.workMemberName}'" class="btn btn-primary round btn-min-width ml-1 mr-1">??????</button>
	                                 				<button type="button" onclick="location.href='${pageContext.request.contextPath }/member/modifyScheduleAttend?scheduleNo=${s.scheduleNo }&scheduleAttend=N&workMemberName=${sm.workMemberName}'" class="btn btn-danger round btn-min-width ml-1 mr-1">??????</button>
			                                     </div>
			                                 </div>
			                             </div>
	                           		 </div>
	                          	 	</c:if>
	                             </c:forEach>
	                            <ul class="list-inline mb-0">
	                            	<c:if test="${guest eq null && projectKeep eq null}">
                                    	<li class="pr-1 ml-1"><a href="${pageContext.request.contextPath }/member/addScheduleLike?scheduleNo=${s.scheduleNo}" class=""><span class="fa fa-thumbs-o-up ml-1"></span> Like ${s.scheduleLikeCnt }</a></li>
                                    </c:if>
                                    <li class="pr-1 ml-1"><span class="fa fa-commenting-o"></span> Comment</li>
                                </ul>
	                            
	                            <!-- ?????? -->
	                            <c:forEach var="c" items="${s.scheduleComments }">
		                            <c:if test="${c.cmtMemberEmail ne null }">
			                            <div class="card-footer px-0 py-0">
			                                <div class="card-body">
			                                    <div class="media">
			                                    	<!-- ????????? ????????? -->
			                                        <c:choose>
					                        	 		<c:when test="${c.cmtFilename eq null }">
					                        	 			<div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
					                        	 		</c:when>
					                        	 		<c:otherwise>
					                        	 			<div class="avatar avatar-md rounded-circle"><img src="${pageContext.request.contextPath }/resources/upload/${c.cmtFilename}${c.cmtFileExt}" alt="avatar"></div>
					                        	 		</c:otherwise>
					                        	 	</c:choose>
		                                        
		                                        	<div class="media-body ml-1">
		                                        		<p class="text-bold-600 mb-0">${c.cmtWorkMemberName } <span class="blue-grey date ml-1">${c.cmtCreateDate }</span>
		                                        			<c:if test="${guest eq null && projectKeep eq null}">
			                                            		<a href="${pageContext.request.contextPath }/member/addScheduleCommentLike?scheduleCmtNo=${c.scheduleCmtNo}" class="addr"><span class="fa fa-thumbs-o-up ml-1 addr"></span> Like ${c.cmtLikeCnt }</a>
			                                            		<c:if test="${login eq  c.cmtMemberEmail}">
			                                            			<a href="${pageContext.request.contextPath }/member/removeScheduleComment?scheduleCmtNo=${c.scheduleCmtNo }" class="addr"><span class="fa fa-trash-o ml-2"></span>??????</a>
			                                            		</c:if>
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
	                            <c:if test="${guest eq null && projectKeep eq null}">
		                            <div class="card-footer px-0 py-0">
		                             <div class="card-body">
		                                 <fieldset class="form-group position-relative has-icon-left mb-0">
			                                <form action="${pageContext.request.contextPath }/member/addScheduleComment" method="post" id="commentForm">
			                                	<input type="hidden" name="scheduleNo" value="${s.scheduleNo }">
			                                	<input type="hidden" name="cmtMemberEmail" value="${login }">
			                                     <input type="text" class="form-control" name="scheduleCmtContent" id="comment" onkeyup="insertComment(this)" placeholder="?????? Enter?????????.">
			                                     <div class="form-control-position">
			                                         <i class="fa fa-dashcube"></i>
			                                     </div>
			                                 </form>
		                                 </fieldset>
		                             </div>
		                            </div>
	                            </c:if>
	                            <!-- comment input end -->
	                        </div>
	                    </div>
	                </section>
	                </c:if>
            	</c:forEach>
            	</c:otherwise>
            	</c:choose>
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
    // ???????????? ?????? ????????? ?????? element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe??? ?????? element??? ???????????? ??????.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var addr = ''; // ?????? ??????
                var extraAddr = ''; // ???????????? ??????

                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                    addr = data.roadAddress;
                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                    addr = data.jibunAddress;
                }

                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
                if(data.userSelectedType === 'R'){
                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // ???????????? ??????, ??????????????? ?????? ????????????.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ????????? ??????????????? ?????? ????????? ?????????.
                    //document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample2_extraAddress").value = '';
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
               /*  document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr; */
                
                // $('#') ///////////////////////////////////////////////////////////////////////
                document.getElementById('addr').value = addr;
                
                // ????????? ???????????? ????????? ????????????.
                document.getElementById("detailAddr").focus();

                // iframe??? ?????? element??? ???????????? ??????.
                // (autoClose:false ????????? ???????????????, ?????? ????????? ???????????? ???????????? ???????????? ?????????.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe??? ?????? element??? ????????? ??????.
        element_layer.style.display = 'block';

        // iframe??? ?????? element??? ????????? ????????? ???????????? ???????????????.
        initLayerPosition();
    }

     // ??????????????? ?????? ????????? ?????? ???????????? ???????????? ?????????????????? ???????????????
    // resize????????????, orientationchange???????????? ???????????? ?????? ?????????????????? ?????? ????????? ?????? ?????? ????????????,
    // ?????? element_layer??? top,left?????? ????????? ????????? ?????????.
    function initLayerPosition(){
        var width = 300; //???????????????????????? ????????? element??? width
        var height = 400; //???????????????????????? ????????? element??? height
        var borderWidth = 5; //???????????? ???????????? border??? ??????

        // ????????? ????????? ????????? ?????? element??? ?????????.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // ???????????? ????????? ?????? ????????? ?????? ?????? ???????????? ????????? ??? ??? ????????? ????????? ????????????.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<c:if test="${scheduleModifyMsg ne null }">
	<script>
		alert('${scheduleModifyMsg}');
	</script>
</c:if>
<c:if test="${scheduleLikeMsg ne null }">
	<script>
		alert('${scheduleLikeMsg}');
	</script>
</c:if>
<c:if test="${scheduleCmtLikeMsg ne null }">
	<script>
		alert('${scheduleCmtLikeMsg}');
	</script>
</c:if>
<c:if test="${scheduleAttendMsg ne null }">
	<script>
		alert('${scheduleAttendMsg}');
	</script>
</c:if>
</body>
<!-- END: Body-->

</html>