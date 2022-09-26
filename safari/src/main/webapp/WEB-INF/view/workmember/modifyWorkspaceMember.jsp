<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Index</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/pages/page-users.css">
    <%@ include file="/WEB-INF/view/inc/common-css.jsp" %> <!-- css -->
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/modifyWorkspaceMember.css">
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
            <div class="content-body">
                <!-- users edit start -->
                <section class="users-edit">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs mb-2" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab" data-toggle="tab" href="#account" aria-controls="account" role="tab" aria-selected="true">
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Profile</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link d-flex align-items-center" id="information-tab" data-toggle="tab" href="#information" aria-controls="information" role="tab" aria-selected="false">
                                            <i class="feather icon-info mr-25"></i><span class="d-none d-sm-block">Information</span>
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="account" aria-labelledby="account-tab" role="tabpanel">
                                        <!-- users edit media object start -->
                                        <div class="media mb-2">
                                            <a class="mr-2" href="#">
                                            	<c:if test="${profileImg.filename==null }">
	                                            	<img src="${pageContext.request.contextPath}/resources/upload/nomalprofile.png" alt="" class="users-avatar-shadow rounded-circle" height="64" width="64">
	                                            </c:if>	
	                                            <c:if test="${profileImg.filename!=null }">
	                                           	 	<img src="${pageContext.request.contextPath}/resources/upload/${profileImg.filename}${profileImg.fileExt}" alt="" class="users-avatar-shadow rounded-circle" height="64" width="64">
	                                            </c:if>	
                                            </a>
                                           
                                            <div class="media-body">
                                                <h4 class="media-heading">${workspaceMemberOne.workMemberEmail}</h4>
                                                <div class="col-12 px-0 d-flex">
                                                    <a href="#" class="btn btn-sm btn-primary mr-25" data-toggle="modal" data-target="#inlineForm">사진변경</a>
                                                    <a href="${pageContext.request.contextPath}/safari/removeProfileImg" class="btn btn-sm btn-primary mr-25" >사진삭제</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- users edit media object ends -->
                                        <!-- users edit account form start -->
                                        <form action="${pageContext.request.contextPath}/safari/modifyWorkspaceMember" method="post">
                                            <div class="row">
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>멤버이름</label>
                                                            <input name="workMemberName" id="workMemberName" type="text" class="form-control"  placeholder="Username" value="${workspaceMemberOne.workMemberName}" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>생년월일</label>
                                                            <input name="workMemberBirth" id="workMemberBirth" type="date" class="form-control"  placeholder="생년월일" value="${workspaceMemberOne.workMemberBirth}" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>전화번호</label>
                                                            <input name="workMemberPhone" id="workMemberPhone" type="text" class="form-control"  placeholder="전화번호" value="${workspaceMemberOne.workMemberPhone }" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>부서</label>
                                                            <input name="workMemberDept" id="workMemberDept" type="text" class="form-control"  placeholder="부서" value="${workspaceMemberOne.workMemberDept }" >
                                                        </div>
                                                    </div>
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>직위</label>
                                                            <input name="workMemberPos" id="workMemberPos" type="text" class="form-control" placeholder="직위" value="${workspaceMemberOne.workMemberPos}" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>멤버이메일</label>
                                                            <input type="email" class="form-control" readonly placeholder="이메일" value="${workspaceMemberOne.workMemberEmail}">
                                                        </div>
                                                    </div>
                                                </div>
                                                 <div class="col-12 col-sm-6">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>멤버주소</label>
                                                            <input name="workMemberAddr" readonly id="workMemberAddr" type="text" class="form-control"  placeholder="클릭하여 주소를 조회하시오" value="${workspaceMemberOne.workMemberAddr}" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-1">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <button id="addrBtn" type="button" class="form-control btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">주소찾기</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>상세주소</label>
                                                            <input name="detailWorkMemeberAddr" id="detailWorkMemeberAddr" type="text" class="form-control"  placeholder="상세주소" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 d-flex flex-sm-row flex-column justify-content-end mt-1">
                                                    <button type="submit" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">정보변경</button>
                                                    <button type="reset" class="btn btn-light">Cancel</button>
                                                </div>
                                            </div>
                                        </form>
                                        <!-- users edit account form ends -->
                                    </div>
                                    <div class="tab-pane" id="information" aria-labelledby="information-tab" role="tabpanel">
                                        <!-- users edit Info form start -->
                                        <form novalidate>
                                            <div class="row">
                                                <div class="col-12 col-sm-6">
                                                    <h5 class="mb-1"><i class="feather icon-link mr-25"></i>Social Links</h5>
                                                    <div class="form-group">
                                                        <label>Twitter</label>
                                                        <input class="form-control" type="text" value="https://www.twitter.com/">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Facebook</label>
                                                        <input class="form-control" type="text" value="https://www.facebook.com/">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Google+</label>
                                                        <input class="form-control" type="text">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>LinkedIn</label>
                                                        <input class="form-control" type="text">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Instagram</label>
                                                        <input class="form-control" type="text" value="https://www.instagram.com/">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6 mt-1 mt-sm-0">
                                                    <h5 class="mb-1"><i class="feather icon-user mr-25"></i>Personal Info</h5>
                                                    <div class="form-group">
                                                        <div class="controls position-relative">
                                                            <label>Birth date</label>
                                                            <input type="text" class="form-control birthdate-picker" required placeholder="Birth date" data-validation-required-message="This birthdate field is required">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Country</label>
                                                        <select class="form-control" id="accountSelect">
                                                            <option>USA</option>
                                                            <option>India</option>
                                                            <option>Canada</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Languages</label>
                                                        <select class="form-control" id="users-language-select2" multiple="multiple">
                                                            <option value="English" selected>English</option>
                                                            <option value="Spanish">Spanish</option>
                                                            <option value="French">French</option>
                                                            <option value="Russian">Russian</option>
                                                            <option value="German">German</option>
                                                            <option value="Arabic" selected>Arabic</option>
                                                            <option value="Sanskrit">Sanskrit</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Phone</label>
                                                            <input type="text" class="form-control" required placeholder="Phone number" value="(+656) 254 2568" data-validation-required-message="This phone number field is required">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Address</label>
                                                            <input type="text" class="form-control" placeholder="Address" data-validation-required-message="This Address field is required">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Website</label>
                                                        <input type="text" class="form-control" placeholder="Website address">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Favourite Music</label>
                                                        <select class="form-control" id="users-music-select2" multiple="multiple">
                                                            <option value="Rock">Rock</option>
                                                            <option value="Jazz" selected>Jazz</option>
                                                            <option value="Disco">Disco</option>
                                                            <option value="Pop">Pop</option>
                                                            <option value="Techno">Techno</option>
                                                            <option value="Folk" selected>Folk</option>
                                                            <option value="Hip hop">Hip hop</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Favourite movies</label>
                                                        <select class="form-control" id="users-movies-select2" multiple="multiple">
                                                            <option value="The Dark Knight" selected>The Dark Knight
                                                            </option>
                                                            <option value="Harry Potter" selected>Harry Potter</option>
                                                            <option value="Airplane!">Airplane!</option>
                                                            <option value="Perl Harbour">Perl Harbour</option>
                                                            <option value="Spider Man">Spider Man</option>
                                                            <option value="Iron Man" selected>Iron Man</option>
                                                            <option value="Avatar">Avatar</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-12 d-flex flex-sm-row flex-column justify-content-end mt-1">
                                                    <button type="submit" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">Save
                                                        changes</button>
                                                    <button type="reset" class="btn btn-light">Cancel</button>
                                                </div>
                                            </div>
                                        </form>
                                        <!-- users edit Info form ends -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- users edit ends -->
            </div>
        </div>
    </div>
    <!-- END: Content-->
     <!--IMG Modal -->
	<div class="col-lg-4 col-md-6 col-sm-12">
        <div class="form-group">
            <div class="modal fade text-left" id="inlineForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <label class="modal-title text-text-bold-600" id="myModalLabel33">이미지파일업로드</label>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="profileImgForm"  method="post" action="${pageContext.request.contextPath}/safari/addProfileImg" enctype="multipart/form-data">
                            <div class="modal-body">
			                    <div class="col-12 px-0 d-flex flex-sm-row flex-column justify-content-start">
                                    <input class="btn btn-sm btn-primary ml-50" name="imgFile" type="file" id="imgFile"  accept="image/gif, image/jpeg, image/png">
                                </div>
                                <p class="text-muted ml-75 mt-50"><small>Allowed JPG, GIF or PNG. Max
                                 size of
                                 1MB</small></p>
                            </div>
                            <div class="modal-footer">
                                <input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" value="닫기">
                                <input id="uploadButton" type="button" class="btn btn-outline-primary btn-lg" value="업로드">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- IMG Modal END -->
    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <%@ include file="/WEB-INF/view/inc/footer.jsp" %> <!-- footer -->


    <%@ include file="/WEB-INF/view/inc/common-js.jsp" %> <!-- js -->


</body>
<!-- END: Body-->
<script type="text/javascript">


$(function(){
    $("#uploadButton").click(function(){
    	var fileNm = $("#imgFile").val();
    	var maxSize =  1024 * 1024;
    	var fileSize = document.getElementById("imgFile").files[0].size;
    		if (fileNm != "") {
    		    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
    		    if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
    		        alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
    		        return false;
    		    }else if(fileSize > maxSize){
    		    	alert("파일 사이즈는 1MB까지 가능");
    		        return;
    		    }else{
    		    	$("#profileImgForm").submit();
    		    }
    		}
    });
 });




</script>

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script>
	$('#addrBtn').click(function(){
		sample2_execDaumPostcode();
	});
</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script >

	
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
                    // document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    // document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // document.getElementById('sample2_postcode').value = data.zonecode;
                // document.getElementById("sample2_address").value = addr;
                
                // $('#addr').val(data.zonecode + ' ' + addr);
                document.getElementById('workMemberAddr').value = data.zonecode + ' ' + addr;
                
                
                // 커서를 상세주소 필드로 이동한다.
                // document.getElementById("sample2_detailAddress").focus();

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
</html>