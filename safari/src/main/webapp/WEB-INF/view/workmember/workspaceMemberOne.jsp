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
                                                    <a href="${pageContext.request.contextPath}/member/removeProfileImg" class="btn btn-sm btn-primary mr-25" >사진삭제</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- users edit media object ends -->
                                        <!-- users edit account form start -->
                                        <form novalidate>
                                            <div class="row">
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>멤버이름</label>
                                                            <input type="text" class="form-control" readonly placeholder="Username" value="${workspaceMemberOne.workMemberName}" required data-validation-required-message="This username field is required">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>생년월일</label>
                                                            <input type="text" class="form-control" readonly placeholder="생년월일" value="${workspaceMemberOne.workMemberBirth}" required data-validation-required-message="This name field is required">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>전화번호</label>
                                                            <input type="text" class="form-control" readonly placeholder="전화번호" value="${workspaceMemberOne.workMemberPhone }" required data-validation-required-message="This email field is required">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>부서</label>
                                                            <input type="text" class="form-control" readonly placeholder="부서" value="${workspaceMemberOne.workMemberDept }" required data-validation-required-message="This email field is required">
                                                        </div>
                                                    </div>
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>직위</label>
                                                            <input type="text" class="form-control" readonly placeholder="직위" value="${workspaceMemberOne.workMemberPos}" required data-validation-required-message="This email field is required">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>멤버이메일</label>
                                                            <input type="email" class="form-control" readonly placeholder="이메일" value="${workspaceMemberOne.workMemberEmail}" required data-validation-required-message="This email field is required">
                                                        </div>
                                                    </div>
                                                </div>
                                                 <div class="col-12">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>멤버주소</label>
                                                            <input type="text" class="form-control" readonly placeholder="주소" value="${workspaceMemberOne.workMemberAddr}" required data-validation-required-message="This email field is required">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 d-flex flex-sm-row flex-column justify-content-end mt-1">
                                                    <a href="${pageContext.request.contextPath}/member/modifyWorkspaceMember"><button  type="button" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">정보수정
                                                       </button></a>
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
                                                    <button type="button" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">정보수정
                                                        </button>
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
                        <form id="profileImgForm"  method="post" action="${pageContext.request.contextPath}/member/addProfileImg" enctype="multipart/form-data">
                            <div class="modal-body">
			                    <div class="col-12 px-0 d-flex flex-sm-row flex-column justify-content-start">
                                    <input class="btn btn-sm btn-primary ml-50" name="imgFile" type="file" id="imgFile"  accept="image/gif,image/jpg,image/jpeg, image/png">
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
    		    if (!(ext == "gif" || ext == "jpg" || ext == "png"|| ext == "jpeg")) {
    		        alert("이미지파일 (.jpg, .png, .gif .jpeg) 만 업로드 가능합니다.");
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

</html>