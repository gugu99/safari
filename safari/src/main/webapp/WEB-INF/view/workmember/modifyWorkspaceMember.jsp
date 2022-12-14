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
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">?????????</span>
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
                                                    <a href="#" class="btn btn-sm btn-primary mr-25" data-toggle="modal" data-target="#inlineForm">????????????</a>
                                                    <a href="${pageContext.request.contextPath}/member/removeProfileImg" class="btn btn-sm btn-primary mr-25" >????????????</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- users edit media object ends -->
                                        <!-- users edit account form start -->
                                        <form action="${pageContext.request.contextPath}/member/modifyWorkspaceMember" method="post">
                                            <div class="row">
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>????????????</label>
                                                            <input name="workMemberName" id="workMemberName" type="text" class="form-control"  placeholder="Username" value="${workspaceMemberOne.workMemberName}" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>????????????</label>
                                                            <input name="workMemberBirth" id="workMemberBirth" type="date" class="form-control"  placeholder="????????????" value="${workspaceMemberOne.workMemberBirth}" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>????????????</label>
                                                            <input name="workMemberPhone" id="workMemberPhone" type="text" class="form-control"  placeholder="????????????" value="${workspaceMemberOne.workMemberPhone }" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>??????</label>
                                                            <input name="workMemberDept" id="workMemberDept" type="text" class="form-control"  placeholder="??????" value="${workspaceMemberOne.workMemberDept }" >
                                                        </div>
                                                    </div>
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>??????</label>
                                                            <input name="workMemberPos" id="workMemberPos" type="text" class="form-control" placeholder="??????" value="${workspaceMemberOne.workMemberPos}" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>???????????????</label>
                                                            <input type="email" class="form-control" readonly placeholder="?????????" value="${workspaceMemberOne.workMemberEmail}">
                                                        </div>
                                                    </div>
                                                </div>
                                                 <div class="col-12 col-sm-6">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>????????????</label>
                                                            <input name="workMemberAddr" readonly id="workMemberAddr" type="text" class="form-control"  placeholder="???????????? ????????? ???????????????" value="${workspaceMemberOne.workMemberAddr}" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-1">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <button id="addrBtn" type="button" class="form-control btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">????????????</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                  <div class="col-sm-1">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <button id="removeAddr" type="button" class="form-control btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">????????????</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                
                                                <div class="col-12">
                                                     <div class="form-group">
                                                        <div class="controls">
                                                            <label>????????????</label>
                                                            <input name="detailWorkMemeberAddr" id="detailWorkMemeberAddr" type="text" class="form-control"  placeholder="????????????" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 d-flex flex-sm-row flex-column justify-content-end mt-1">
                                                    <button type="submit" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">????????????</button>
                                                    <button type="reset" class="btn btn-light">Cancel</button>
                                                </div>
                                            </div>
                                        </form>
                                        <!-- users edit account form ends -->
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
                            <label class="modal-title text-text-bold-600" id="myModalLabel33">????????????????????????</label>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="profileImgForm"  method="post" action="${pageContext.request.contextPath}/member/addProfileImg" enctype="multipart/form-data">
                            <div class="modal-body">
			                    <div class="col-12 px-0 d-flex flex-sm-row flex-column justify-content-start">
                                    <input class="btn btn-sm btn-primary ml-50" name="imgFile" type="file" id="imgFile"  accept="image/gif, image/jpeg, image/png">
                                </div>
                                <p class="text-muted ml-75 mt-50"><small>Allowed JPG, GIF or PNG. Max
                                 size of
                                 1MB</small></p>
                            </div>
                            <div class="modal-footer">
                                <input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" value="??????">
                                <input id="uploadButton" type="button" class="btn btn-outline-primary btn-lg" value="?????????">
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
    		        alert("??????????????? (.jpg, .png, .gif ) ??? ????????? ???????????????.");
    		        return false;
    		    }else if(fileSize > maxSize){
    		    	alert("?????? ???????????? 1MB?????? ??????");
    		        return;
    		    }else{
    		    	$("#profileImgForm").submit();
    		    }
    		}
    });
 });




</script>

<!-- iOS????????? position:fixed ????????? ??????, ???????????? ???????????? ?????? position:absolute ?????? ???????????? top,left??? ?????? ?????? -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="?????? ??????">
</div>

<script>
	$('#addrBtn').click(function(){
		sample2_execDaumPostcode();
	});
</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script >

	
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
                    // document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    // document.getElementById("sample2_extraAddress").value = '';
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                // document.getElementById('sample2_postcode').value = data.zonecode;
                // document.getElementById("sample2_address").value = addr;
                
                // $('#addr').val(data.zonecode + ' ' + addr);
                document.getElementById('workMemberAddr').value = data.zonecode + ' ' + addr;
                
                
                // ????????? ???????????? ????????? ????????????.
                // document.getElementById("sample2_detailAddress").focus();

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
$('#removeAddr').click(function(){
	$('#workMemberAddr').val('');
});

</script>
</html>