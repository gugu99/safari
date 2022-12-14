<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/assets/css/boardList.css">
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
        <div class="content-overlay"></div>
        <div class="content-wrapper">
               <div class="content-header row">
                <div class="content-header-left col-md-8 mb-md-0 mb-2 mt-1">
                    <h2 class="content-header-title ml-5 mb-0">Board</h2>
                </div>
               	<div class="content-header-left col-md-4 col-12 mb-md-0 mb-2 mt-1">
                    <button class="btn btn-outline-primary ml-10" type="button" data-toggle="modal" data-target="#add-board"><i class="feather icon-plus icon-left"></i> ????????? ????????????</button>
                </div>
            </div>
            <div class="content-body justify-content-center row mt-2">
           	<c:choose>
           		<c:when test="${fn:length(boardList) == 0}">
           			<section id="timeline" class="timeline-center col-md-8">
	                    <div class="timeline-card card border-grey border-lighten-2">
	                        <div class="card-content">
	                        	 <div class="px-0 py-0 ml-1 mt-1 text-center">
	                        	 	<p>???????????? ????????????.</p>
	                        	 </div>
	                        </div>
	                    </div>
	                </section>
           		</c:when>
           		<c:otherwise>
            <c:forEach var="b" items="${ boardList}" varStatus="i">
            	<c:if test="${b.boardAuth eq 'N' || (b.boardAuth eq 'Y' && (b.boardWriter eq login || manager))}">
			          		<section id="timeline" class="timeline-center col-md-8">
			                   <div class="timeline-card card border-grey border-lighten-2">
			                       <div class="card-content">
			                       	 <div class="px-0 py-0 ml-1 mt-1">
			                     	 <!-- ????????? ????????? -->
			                     	 <c:choose>
	                        	 		<c:when test="${b.writerFilename eq null }">
	                        	 			<div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
	                        	 		</c:when>
	                        	 		<c:otherwise>
	                        	 			<div class="avatar avatar-md rounded-circle"><img src="${pageContext.request.contextPath }/resources/upload/${b.writerFilename}${b.writerFileExt}" alt="avatar"></div>
	                        	 		</c:otherwise>
	                        	 	</c:choose>
			                     	 	
			                           <span class="text-bold-600 mr-1">${b.writerName } </span>
			                           <span class="blue-grey date">${b.boardCreateDate }</span>
			                           <!-- ????????? ?????? -->
			                           <a href="${pageContext.request.contextPath }/member/modifyBoardFix?boardNo=${b.boardNo}&boardFix=${b.boardFix == 'Y' ? 'N' : 'Y'}" class="addr"><span class="fa ${b.boardFix == 'Y' ? 'fa-bookmark' : 'fa-bookmark-o' } ml-2"></span></a>
			                           <!-- ?????? ?????? ?????? -->
			                           <c:if test="${b.boardWriter eq login || manager}">
			                              <a href="${pageContext.request.contextPath }/member/modifyBoard?boardNo=${b.boardNo}" class="addr"><span class="fa fa-pencil-square-o ml-2"></span>??????</a>
			                       			<a href="${pageContext.request.contextPath }/member/removeBoard?boardNo=${b.boardNo}" class="addr"><span class="fa fa-trash-o ml-2"></span>??????</a>
			                       		</c:if>
			                       			
			                           <p class="h2 card-text mt-2 mb-1 ml-1">${b.boardTitle }</p>
			                     	 </div>
			
			                         <div class="card-footer px-0 py-0">
			                          <div class="card-content">
			                              <div class="card-body">
			                                  <p class="card-text ml-1 mt-2 mb-3">${ b.boardContent}</p>
			                                  <p class="card-text mb-2">
			                                  <p class="card-text mb-2">
			                                  <c:if test="${b.boardLocation ne null}">
			                                   <span class="blue-grey addr"><span class="fa fa-map-marker mr-1"></span>${b.boardLocation }</span>
			                                   <span class="blue-grey addr">${b.boardDetailLocation }</span>
			                                  	<div id="map${i.index }" style="width:100%;height:300px;" ></div>
			                                  	<script>
			                                  		locationMap('map${i.index }', '${b.boardLocation }');
			                                  	</script>
			                                  </c:if>
			                              </div>
			                          </div>
			                         </div>
			                         <c:forEach var="bf" items="${b.boardFiles}">
			                            <div class="card-content pl-2">
		                                	 <span class="feather icon-file-plus mr-1">  ????????????</span> <a href="${pageContext.request.contextPath}/resources/fileupload/${bf.filename}${bf.fileExt}"
			                                           download="${bf.originName}">${bf.originName}</a>
			                            </div>
			                        	</c:forEach>
			                         <ul class="list-inline mb-0">
			                         		<li class="pr-1 mt-1 ml-1"><a href="${pageContext.request.contextPath }/member/addBoardLike?boardNo=${b.boardNo}" class=""><span class="fa fa-thumbs-o-up ml-1"></span> Like ${b.boardLikeCnt }</a></li>
			                                <li class="pr-1 ml-1"><span class="fa fa-commenting-o"></span> Comment</li>
			                            </ul>
			                         
			                         <!-- ?????? -->
			                          <c:forEach var="bc" items="${b.boardComments }">
			                          	<c:if test="${bc.boardCmtWriter ne null }">
				                         <div class="card-footer px-0 py-0">
				                               <div class="card-body">
				                                   <div class="media">
				                                   	<!-- ????????? ????????? -->
				                                   	<c:choose>
				                                   		<c:when test="${bc.cmtWriterFilename eq null }">
					                        	 			<div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
					                        	 		</c:when>
					                        	 		<c:otherwise>
					                        	 			<div class="avatar avatar-md rounded-circle"><img src="${pageContext.request.contextPath }/resources/upload/${bc.cmtWriterFilename}${bc.cmtWriterFileExt}" alt="avatar" class="height-30 width-30"><i></i></div>
					                        	 		</c:otherwise>
				                                      	</c:choose>
				                                      	
				                                      	<div class="media-body ml-1">
				                                      		<p class="text-bold-600 mb-0">${bc.cmtWriterName } <span class="blue-grey date ml-1">${bc.cmtCreateDate }</span>
				                                      			<c:if test="${login eq bc.boardCmtWriter}">
			                                           				<a href="${pageContext.request.contextPath }/member/removeBoardComment?boardCmtNo=${bc.boardCmtNo}" class="addr"><span class="fa fa-trash-o ml-2"></span>??????</a>
			                                           			</c:if>
				                                           </p>
				                                           <p class="m-0">${bc.boardCmtContent } </p>
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
			                               <form action="${pageContext.request.contextPath }/member/addBoardComment" method="post" id="commentForm">
			                               	<input type="hidden" name="boardNo" value="${b.boardNo }">
			                               	<input type="hidden" name="boardCmtWriter" value="${login }">
			                                    <input type="text" class="form-control" name="boardCmtContent" id="comment" onkeyup="insertComment(this)" placeholder="?????? Enter?????????.">
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
			             </c:if>
           			 </c:forEach>
            	</c:otherwise>
           	</c:choose>
           	<%@ include file="/WEB-INF/view/board/addBoard.jsp" %>
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
<script>
$(document).ready(function(){
   $('#removeFile').click(function(){
      $('#fileSection').empty();
      $('.multiList').val(null);
      $('.custom-file-label').html('?????? ??????');
   });

   
   $('#addFile').on("click", function(){
      let isFileEmpty = false;
      
      // onchange="checkFile(this)"
      
      let html = '<div class="custom-file">'+
          '<input type="file" class="custom-file-input multiList" name="file" onchange="checkFile(this)">'+
          '<label class="custom-file-label" for="inputGroupFile01">????????????</label>'+
      '</div>';
      
      $('.multiList').each(function(index, item){
          // $(this) --> item
          if($(item).val() == '') {
             isFileEmpty = true;
             alert('????????? ?????????????????? ??????????????????.');
          }
      });
      
      if(isFileEmpty == false) {
      	$('#fileSection').append(html);
      }
      
   });
   
  /*  $('input[type="file"]').on('change', function(e){
	   console.log('change function');
	   
       var fileName = e.target.files[0].name;
       $('.custom-file-label').html(fileName);
   });  */
   
   $(document).on('change', '.custom-file-input', function (event) {
	    $(this).next('.custom-file-label').html(event.target.files[0].name);
	})
   
  /*  $('input[type="file"]').on('change', function(e){
	   console.log('change function');
	   
       var fileName = e.target.files[0].name;
       $('.custom-file-label').html(fileName);
   }); */
   
  /*  $('.custom-file-input').on("change", function (e) {
	   console.log(e);
	   
	   $(this).next('.custom-file-label').html(e.target.files[0].name);
  }); */
   
});
</script>

<script>
function checkFile(el){

	// files ??? ?????? ?????? ?????? ??????.
	var file = el.files;

	// file[0].size ??? ?????? ?????? ???????????????.
	if(file[0].size > 1024 * 1024 * 1){
		// ?????? ????????? ????????? ?????? ????????? ????????? ?????????
		alert('1MB ?????? ????????? ????????? ??? ????????????.');
		
		$(el).val('');
	}
}

</script>

<script>
$(document).ready(function() {
	$('#addBoardBtn').click(function() {
		if($('#boardContent').val() == '') {
			alert('????????? ??????????????????!');
			$('#boardContent').focus();
			return;
		}
		$('#addBoard').submit();
	});
});
</script>
<c:if test="${boardFixMsg ne null }">
	<script>
		alert('${boardFixMsg}');
	</script>
</c:if>
<c:if test="${boardLikeMsg ne null }">
	<script>
		alert('${boardLikeMsg}');
	</script>
</c:if>
<c:if test="${boardRemoveMsg ne null }">
	<script>
		alert('${boardRemoveMsg}');
	</script>
</c:if>

</html>