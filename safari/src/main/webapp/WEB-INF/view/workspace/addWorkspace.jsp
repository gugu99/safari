<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<title>Index</title>
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/app-assets/css/plugins/forms/wizard.css">
<%@ include file="/WEB-INF/view/inc/common-css.jsp"%>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/addWorkspace.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/index.css">

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	
	data-open="click" data-menu="vertical-menu-modern"
	data-col="content-detached-right-sidebar">

	<!-- header -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top" id="navbar">
	  <ul class="navbar-nav">
	  <li><a class="navbar-brand" id="logo" href="${pageContext.request.contextPath }/safari/index" class="navbar-brand nav-link"><img src="${pageContext.request.contextPath }/resources/app-assets/images/logo/stack-logo-light.png" alt="branding logo"> Safari</a>
	  </li>
	  </ul>
	  <div id="logtap" class="row">
	 <h4 id="textEmail">${login }님</h4>
	 <div id="logout">
	 <div>
	      <a id="logout" href="${pageContext.request.contextPath }/safari/logout" class="navbar-brand nav-link"><i class="feather icon-log-out">로그아웃</i></a>
	    </div>
	 </div>
	</div>
	</nav>


	<!-- BEGIN: Content-->
	<div class="app-content content">
		<div class="content-overlay"></div>
		<div class="row" class="container">
		<div class="content-wrapper">
			<div class="content-header row">
				<div class="content-header-left col-md-6 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="breadcrumb-wrapper col-12">
						</div>
					</div>
					<h3 class="content-header-title mb-0">워크스페이스 멤버가입</h3>
				</div>
				<div class="content-header-right col-md-6 col-12">
					<div class="btn-group float-md-right" role="group"
						aria-label="Button group with nested dropdown">
					</div>
				</div>
			</div>
			<div class="content-body">
				<!-- Form wizard with number tabs section start -->
				<section id="number-tabs">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">워크스페이스멤버 가입폼</h4>
									<a class="heading-elements-toggle"><i
										class="fa fa-ellipsis-h font-medium-3"></i></a>
								</div>
								<div class="card-content collapse show">
									<div class="card-body">
										<form id="addWorkspaceForm" action="${pageContext.request.contextPath }/safari/addWorkspace" class="number-tab-steps wizard-circle" method="post">
											
											<!-- Step 1 -->
											<h6>Step 1</h6>
											<fieldset>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label for="firstName1">워크스페이스 제목</label> <input
																type="text" name="workName" class="form-control" id="workName">
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group">
															<label for="lastName1">관리자 이름</label> <input
																name="workMemberName" type="text" class="form-control" id="workMemberName">
														</div>
													</div>
												</div>


											</fieldset>

											<!-- Step 2 -->
											<h6>Step 2</h6>
											<fieldset>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label for="proposalTitle1">주소</label> <input readonly
																type="text" class="form-control" id="workMemberAddr" name="workMemberAddr">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label for="proposalTitle1">주소검색</label>  <button id="addrBtn"  type="button" class="form-control btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">주소찾기</button>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label for="proposalTitle1">상세주소</label> <input
																type="text" class="form-control" id="detailWorkMemeberAddr" name="detailWorkMemeberAddr">
														</div>
													</div>
													
													<div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="date1">생년월일</label>
                                                            <input type="date" class="form-control" id="workMemberBirth" name="workMemberBirth">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="date1">전화번호</label>
                                                            <input type="text" class="form-control" id="workMemberPhone" name="workMemberPhone">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                    </div>
												</div>
											</fieldset>

											<!-- Step 3 -->
											<h6>Step 3</h6>
											<fieldset>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label for="eventName1">부서</label> <input
																type="text" class="form-control" id="workMemberDept" name="workMemberDept">
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group">
															<label for="eventName1">직급</label> <input
																type="text" class="form-control" id="workMemberPos" name="workMemberPos">
														</div>
													</div>
												</div>
											</fieldset>

											<!-- Step 4 -->
											<h6>Step 4</h6>
											<fieldset class="add">
											<p>
											</p>
												<div class="row">
													<div class="col-md-9">
														<div class="form-group">
															<label for="meetingName1">초대멤버이메일</label> <input
																 type="text"  class="form-control workMemberEmail" id="workMemberEmail" name="workMemberEmail">
														</div>
											        
													</div>
													
													<div class="col-md-3">
														<div class="form-group">
														<label for="meetingName1">멤버추가</label>
														 <input value="추가" type="button" class="btn btn danger form-control" id="btn_add">
														</div>
											        	<input id="workEmail" type="hidden" value="${login }">
													</div>
												</div>
											</fieldset>
											
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	</div>

	<!-- Form wizard with number tabs section end -
    <!-- END: Content-->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<%@ include file="/WEB-INF/view/inc/footer.jsp"%>
	<!-- footer -->


	<%@ include file="/WEB-INF/view/inc/common-js.jsp"%>
	<!-- js -->


</body>
<!-- END: Body-->

<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>



<!-- BEGIN: Vendor JS-->
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/extensions/jquery.steps.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/dateTime/moment-with-locales.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/daterange/daterangepicker.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script
	src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script
	src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/wizard-steps.js"></script>
<!-- END: Page JS-->

<script>            
$(document).ready(function(){ 
		var cnt = 1; 
	$("#btn_add").on('click',function(){ 
		cnt=cnt+1;
		console.log(cnt);
		
		var tmpHtml =
		"<div id='remove1' name='remove' class='row addInput'>"+
				"<div class='col-md-9'>"+
				"<div class='form-group'>"+
					"<input type='text' class='form-control workMemberEmail' name='workMemberEmail' id='meetingName1'>"+
				"</div>"+
			"</div>"+
				"<div class='col-md-3'>"+
					"<div class='form-group'>"+
						 "<button type='button' class='btn btn danger form-control' name='remove1' id='btn_mi'>멤버삭제</button>"+
				"</div>"+
			"</div>"+
		"</div>"
		  $(".add").append(tmpHtml);
		
		}); 
		var trHtml = $( "div[name=remove]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
		$(document).on('click','button[name=remove1]',function(){   
			
			$('#remove1').remove();
			cnt=cnt-1;
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
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/1.3 - borderWidth) + 'px';
    }
</script>

</html>