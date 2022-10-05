<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Register</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/icheck/icheck.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/icheck/custom.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/pages/login-register.css">
    <!-- END: Page CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern 1-column  bg-cyan bg-lighten-2 blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="row flexbox-container">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                        <div class="col-lg-4 col-md-8 col-10 box-shadow-2 p-0">
                            <div class="card border-grey border-lighten-3 px-1 py-1 m-0">
                                <div class="card-header border-0 pb-0">
                                    <div class="card-title text-center">
                                        <img src="${pageContext.request.contextPath }/resources/app-assets/images/logo/stack-logo-dark.png" alt="branding logo">
                                    </div>
                                    <h6 class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2">
                                    	<span>소셜 회원가입</span>
                                    </h6>
                                </div>
                                <div class="card-content">
                                    <div class="card-body text-center">
                                        <a href="${pageContext.request.contextPath }/account/google/login" class="btn btn-social mb-1 btn-outline-google"><span class="fa fa-google-plus font-medium-4"></span> <span class="px-1">google</span> </a>
                                    </div>
                                    <p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1">
                                    	<span>Safari 회원가입</span>
                                    </p>
	                                <!-- BEGIN: 에러메세지 -->
	                               	<p class="card-subtitle text-muted text-center font-small-3 mx-2">
	                               		<c:if test="${errorMsg != null}"><strong class="text-center text-danger">${errorMsg}</strong></c:if>
	                               	</p>
	                               	<!-- END: 에러메세지 -->
                                    <div class="card-body pt-2">
                                        <form class="form-horizontal" action="${pageContext.request.contextPath}/account/register" method="post" id="form">
                                            <fieldset class="form-group floating-label-form-group">
                                                <label for="memberEmail">이메일</label>
                                                <input type="email" class="form-control" placeholder="이메일을 입력해주세요" name="memberEmail" id="memberEmail">
                                            </fieldset>
                                            <div class="card-body pt-0">
                                           	 	<button type="button" class="btn btn-outline-primary btn-block" id="checkBtn"><i class="feather icon-unlock"></i> 인증번호 발송</button>
                                            </div>
                                            <fieldset class="form-group floating-label-form-group mb-1">    
                                                <label for="mailconfirm" id="mailconfirmTxt">이메일 인증번호</label>
                                                <input type="text" class="form-control" placeholder="이메일 인증번호를 입력해주세요" id="mailconfirm">
                                            </fieldset>
                                            <fieldset class="form-group floating-label-form-group mb-1">
                                                <label for="memberPw">비밀번호</label>
                                                <input type="password" class="form-control" placeholder="비밀번호 (8자 이상, 대소문자, 숫자, 특수문자 포함)" name="memberPw" id="memberPw">
                                            </fieldset>
                                            <div class="form-group row">
                                                <div class="col-sm-6 col-12 text-center text-sm-left pr-0">
                                                </div>
                                                <div class="col-sm-6 col-12 float-sm-left text-center text-sm-right"><a href="${pageContext.request.contextPath }/account/recover-password" class="card-link">비밀번호 찾기</a></div>
                                            </div>
                                            <button type="button" class="btn btn-outline-primary btn-block" id="btn"><i class="feather icon-user"></i> 회원가입</button>
                                        </form>
                                    </div>
                                    <div class="card-body pt-0">
                                        <a href="${pageContext.request.contextPath }/account/login" class="btn btn-outline-danger btn-block"><i class="feather icon-unlock"></i> 로그인</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <!-- END: Content-->


    <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/form-login-register.js"></script>
    <!-- END: Page JS-->
	
	<!-- BEGIN: 회원가입 JS -->
	<script>
		// 이메일 정규식
		var reg_email = RegExp(/^[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\w+\.)+\w+$/);
		// 비밀번호 정규식
		var reg_pass = RegExp(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[^\w]).{8,}/);
	
		// 이메일 중복확인 후 이메일 인증번호 발송
		$('#checkBtn').click(function(){
			if ($('#memberEmail').val() == '') {
				alert('이메일칸이 빈칸입니다.');
				$('#memberEmail').focus();
			} else if (!reg_email.test($('#memberEmail').val())) {
				alert('이메일형식을 확인해주세요.\nexample@example.com');
				$('#memberEmail').focus();
			} else {
				$.ajax({
					url : '/account/duplicateEmail',
					type : 'POST',
					data : {memberEmail : $('#memberEmail').val()},
					success : function(json){
						if(json != 'memberEmail ok'){
							alert('이미 사용중이거나 탈퇴한 이메일입니다.');
							$('#memberEmail').focus();
							return;
						} else {
							$.ajax({
								type : 'POST',
								url : '/account/mailConfirmForRegister',
								data : {email : $('#memberEmail').val()},
								success : function(data){
									alert('해당 이메일로 인증번호 발송이 완료되었습니다. 확인부탁드립니다.');
									// console.log("data : " + data);
									chkEmailConfirm(data, $('#mailconfirm'), $('#mailconfirmTxt'));
								}
							});
						}
					}
				});
			}
		});
		
		// 이메일 인증번호 체크 함수
		function chkEmailConfirm(data, $mailconfirm, $mailconfirmTxt){
			$('#mailconfirm').on('keyup', function(){
				// 인증번호 틀린 경우
				if(data != $('#mailconfirm').val()){
					emconfirmchk = 'N';
					$('#mailconfirmTxt').html("<span id='emconfirmchk'>인증번호가 잘못되었습니다.</span>");
					$('#emconfirmchk').css({
						"color" : "#FA3E3E",
						"font-weight" : "bold",
						"font-size" : "10px"
					});
				// 인증번호 확인된 경우
				} else {
					emconfirmchk = 'Y';
					$('#mailconfirmTxt').html("<span id='emconfirmchk'>인증번호가 확인되었습니다.</span>");
					$('#emconfirmchk').css({
						"color" : "#0D6EFD",
						"font-weight" : "bold",
						"font-size" : "10px"
					});
				}
				
				console.log(emconfirmchk);
			});
		}
		
		$('#btn').click(function(){
			
			if ($('#mailconfirm').val() == ''){
				alert('이메일 인증번호칸이 빈칸입니다.');
				$('#mailconfirm').focus();
			} else if (emconfirmchk == 'N'){
				alert('인증번호가 잘못되었습니다.');
				$('#mailconfirm').focus();
			} else if ($('#memberPw').val() == '') {
				alert('비밀번호칸이 빈칸입니다.');
				$('#memberPw').focus();
			} else if (!reg_pass.test($('#memberPw').val())) {
				alert('비밀번호형식을 확인해주세요.\n최소한 8자 대소문자 1개이상 + 숫자 1개이상 + 특수문자 1개이상');
				$('#memberPw').focus();
			} else {
				$('#form').submit();
			}
		});
	</script>
	<!-- END: 회원가입 JS -->
</body>
<!-- END: Body-->

</html>