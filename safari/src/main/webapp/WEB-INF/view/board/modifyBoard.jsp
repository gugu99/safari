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
                                    <h2 class="card-title" id="basic-layout-tooltip">게시글 수정하기</h2>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">

                                        <form action="${pageContext.request.contextPath }/member/modifyBoard" enctype="multipart/form-data" method="post" id="modifyBoardForm">
                                        	<input type="hidden" name="boardNo" value="${boardOne.boardNo }">
                                            <div class="row">
												<div class="col-12">
	                                                <div class="form-group">
	                                                    <label for="boardTitle"><span class="fa fa-pencil mr-1"></span>제목</label>
	                                                    <input type="text" id="boardTitle" class="form-control" name="boardTitle" value="${boardOne.boardTitle }">
	                                                </div>
												</div>
                                                <div class="col-10">
                                                    <div class="form-group">
                                                        <label for="addr"><span class="fa fa-map-marker mr-2"></span>장소<button type="button" class="btn btn-sm btn-light ml-1" id="deleteLocation"><i class="fa fa-times"></i></button></label>
                                                        <input type="text" class="form-control" name="boardLocation" id="addr" value="${boardOne.boardLocation }" readonly>
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
                                                        <input type="text" class="form-control" name="boardDetailLocation" id="detailAddr" value="${boardOne.boardDetailLocation }">
                                                    </div>
                                                </div>
												<div class="col-12">
	                                                <div class="form-group">
	                                                    <label for="boardContent"><span class="fa fa-pencil-square-o mr-1"></span>내용(*)</label>
	                                                    <textarea id="boardContent" rows="5" class="form-control" name="boardContent">${boardOne.boardContent }</textarea>
	                                                </div>
                                                </div>
                                                <c:if test="${fn:length(fileList) ne 0 }">
                                                	<div class="card-content pl-2">
					                                	 <span class="feather icon-file-plus mr-1">  파일목록</span>
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
	                                                    <label for="basicInputFile">파일 올리기</label>
	                                                    <div class="custom-file"> 
	                                                        <input type="file" class="custom-file-input multiList file" name="file" onchange="checkFile(this)" >
	                                                        <label class="custom-file-label" for="inputGroupFile01">파일 선택</label>
	                                                    </div>
	                                                    <div id="fileSection">      
														</div>
									                   	<br>
									                   <div class= "row"> 
									                   	 <div class="col-6">
											                   <input class="btn btn-sm btn-primary ml-50" id="addFile" name="" type="button" value="파일추가">
											                   <input class="btn btn-sm btn-danger ml-50" id="removeFile" name="" type="button" value="파일삭제">
									                  	 </div>
									                   </div>
	                                                </fieldset>
	                                            </div>
                                                <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
	                                                <div class="form-group">
	                                                    <label for="boardAuth"><span class="fa fa-lock mr-1"></span>공개설정</label>
	                                                    <select class="form-control" id="boardAuth" name="boardAuth">
	                                                    	<c:choose>
	                                                    		<c:when test="${boardOne.boardAuth eq 'N' }">
	                                                    			<option value="N" selected>전체공개</option>
	                                                      			<option value="Y">관리자, 작성자만 공개</option>
	                                                    		</c:when>
	                                                    		<c:otherwise>
	                                                    			<option value="N">전체공개</option>
	                                                      			<option value="Y" selected>관리자, 작성자만 공개</option>
	                                                    		</c:otherwise>
	                                                    	</c:choose>
	                                                        
	                                                    </select>
	                                                </div>
                                                </div>
                                            </div>

                                            <div class="form-actions text-right">
                                                <button type="reset" class="btn btn-outline-warning mr-1"><i class="feather icon-x"></i>취소</button>
                                                <button type="button" id="modifyBoardBtn" class="btn btn-outline-primary"><i class="fa fa-check-square-o"></i>수정하기</button>
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
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
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

</body>
<!-- END: Body-->

</html>