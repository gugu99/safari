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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/toggle/switchery.min.css">
    <!-- END: Vendor CSS-->
    
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/plugins/forms/validation/form-validation.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/plugins/pickers/daterange/daterange.css"> 
    
    <%@ include file="/WEB-INF/view/inc/common-css.jsp" %> <!-- css -->

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
            <div class="content-body">
                <!-- Basic form layout section start -->
                <section id="basic-form-layouts">
                    <div class="row justify-content-center match-height">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2 class="card-title" id="basic-layout-tooltip">????????? ????????????</h2>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">

                                        <form action="${pageContext.request.contextPath }/member/modifyBoard" enctype="multipart/form-data" method="post" id="modifyBoardForm">
                                        	<input type="hidden" name="boardNo" value="${boardOne.boardNo }">
                                            <div class="row">
												<div class="col-12">
	                                                <div class="form-group">
	                                                    <label for="boardTitle"><span class="fa fa-pencil mr-1"></span>??????</label>
	                                                    <input type="text" id="boardTitle" class="form-control" name="boardTitle" value="${boardOne.boardTitle }">
	                                                </div>
												</div>
                                                <div class="col-10">
                                                    <div class="form-group">
                                                        <label for="addr"><span class="fa fa-map-marker mr-2"></span>??????<button type="button" class="btn btn-sm btn-light ml-1" id="deleteLocation"><i class="fa fa-times"></i></button></label>
                                                        <input type="text" class="form-control" name="boardLocation" id="addr" value="${boardOne.boardLocation }" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                	<div class="form-group">
                                                    	<button type="button" id="addrBtn" class="btn btn-secondary pull-right mt-2">?????? ??????</button>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="detailAddr"><span class="fa fa-map-marker mr-2"></span>?????? ??????</label>
                                                        <input type="text" class="form-control" name="boardDetailLocation" id="detailAddr" value="${boardOne.boardDetailLocation }">
                                                    </div>
                                                </div>
												<div class="col-12">
	                                                <div class="form-group">
	                                                    <label for="boardContent"><span class="fa fa-pencil-square-o mr-1"></span>??????(*)</label>
	                                                    <textarea id="boardContent" rows="5" class="form-control" name="boardContent">${boardOne.boardContent }</textarea>
	                                                </div>
                                                </div>
                                                <c:if test="${fn:length(fileList) ne 0 }">
                                                	<div class="card-content pl-2">
					                                	 <span class="feather icon-file-plus mr-1">  ????????????</span>
                                                <c:forEach var="f" items="${fileList}" varStatus="i">
                                                	<div id="deletefile${i.index }">
							                             <a href="${pageContext.request.contextPath}/resources/fileupload/${f.filename}${f.fileExt}" download="${f.originName}">${f.originName}</a>
							                             <button type="button" class="btn btn-sm  ml-1" id="${f.boardFileNo }" onclick="deleteFile(${f.boardFileNo}, 'deletefile${i.index }')"><i class="fa fa-times"></i></button>
						                             </div>
					                        	</c:forEach>
					                        	<div id="fileList">
					                        		
					                        	</div>
					                        	</div>
					                        	</c:if>
                                                <div class="col-12 mt-1">
	                                                <fieldset class="form-group">
	                                                    <label for="basicInputFile">?????? ?????????</label>
	                                                    <div class="custom-file"> 
	                                                        <input type="file" class="custom-file-input multiList file" name="file" onchange="checkFile(this)" >
	                                                        <label class="custom-file-label" for="inputGroupFile01">?????? ??????</label>
	                                                    </div>
	                                                    <div id="fileSection">      
														</div>
									                   	<br>
									                   <div class= "row"> 
									                   	 <div class="col-6">
											                   <input class="btn btn-sm btn-primary ml-50" id="addFile" name="" type="button" value="????????????">
											                   <input class="btn btn-sm btn-danger ml-50" id="removeFile" name="" type="button" value="????????????">
									                  	 </div>
									                   </div>
	                                                </fieldset>
	                                            </div>
                                                <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
	                                                <div class="form-group">
	                                                    <label for="boardAuth"><span class="fa fa-lock mr-1"></span>????????????</label>
	                                                    <select class="form-control" id="boardAuth" name="boardAuth">
	                                                    	<c:choose>
	                                                    		<c:when test="${boardOne.boardAuth eq 'N' }">
	                                                    			<option value="N" selected>????????????</option>
	                                                      			<option value="Y">?????????, ???????????? ??????</option>
	                                                    		</c:when>
	                                                    		<c:otherwise>
	                                                    			<option value="N">????????????</option>
	                                                      			<option value="Y" selected>?????????, ???????????? ??????</option>
	                                                    		</c:otherwise>
	                                                    	</c:choose>
	                                                        
	                                                    </select>
	                                                </div>
                                                </div>
                                            </div>

                                            <div class="form-actions text-right">
                                                <button type="reset" class="btn btn-outline-warning mr-1"><i class="feather icon-x"></i>??????</button>
                                                <button type="button" id="modifyBoardBtn" class="btn btn-outline-primary"><i class="fa fa-check-square-o"></i>????????????</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // Basic form layout section end -->
            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <%@ include file="/WEB-INF/view/inc/footer.jsp" %> <!-- footer -->


	<script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>

    <%@ include file="/WEB-INF/view/inc/common-js.jsp" %> <!-- js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/modifyBoard.js"></script>
    
     <!-- BEGIN: Page JS-->
    <!-- END: Page JS-->
    
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="?????? ??????">
</div>
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

</body>
<!-- END: Body-->

</html>