<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Feedback</title>
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
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-body">
                <!-- Basic form layout section start -->
                <section id="basic-form-layouts">
                    <div class="row justify-content-center match-height">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2 class="card-title" id="basic-layout-tooltip">피드백 수정하기</h2>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">

                                         <form action="${pageContext.request.contextPath }/member/modifyFeedback" method="post" id="modifyFeedbackForm">
                                              	<input type="hidden" name="feedbackNo" value="${feedbackOne.feedbackNo }">
                                              	<input type="hidden" name="workMemberNo" value="${workMemberNo }">
                                                  <div class="row">
                                                  	 <div class="col-12">
                                                           <div class="form-group">
                                                               <label for="task"><span class="fa fa-map-marker mr-2"></span>업무(*)</label>
                                                               <input type="text" class="form-control"  id="task" value="${feedbackOne.taskTitle }" readonly>
                                                           </div>
                                                       </div>
                                                      
                                                      <div class="col-12">
                                                          <div class="form-group">
                                                              <label for="languageselect2"><span class="fa fa-users mr-2"></span>피드백 멤버(*)</label>
                                                              <select class="form-control memberSelect" id="feedbackReceiver" multiple="multiple" onChange="selectFeedbackReceiver(this)">
                                                           		 <c:forEach var="fr" items="${feedbackReceiverList }">
                                                           		 	<option value="${fr.workMemberEmail }" ${fr.feedbackReceiver ne null ? 'selected' : ''}>${fr.workMemberName }</option>
                                                           		 </c:forEach>
                                                              </select>
                                                          </div>
                                                      </div>
                                                      <input type="hidden" id="feedbackReceiverList" name="feedbackReceiverList" value="">
                                                      <div class="col-12">
                                                          <div class="form-group">
                                                              <label for="scheduleContent"><span class="fa fa-pencil-square-o mr-1"></span>내용(*)</label>
                                                              <textarea class="form-control" name="feedbackContent" id="feedbackContent" rows="5" placeholder="내용을 입력하세요.">${feedbackOne.feedbackContent }</textarea>
                                                          </div>
                                                      </div>
                                                      <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
                                                      	<div class="form-group mt-1">
                                                              <label for="scheduleAuth"><span class="fa fa-lock mr-1"></span>공개설정</label>
                                                              <select class="form-control" id="feedbackAuth" name="feedbackAuth">
                                                              	<c:choose>
		                                                    		<c:when test="${feedbackOne.feedbackAuth eq 'N' }">
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
	                                                <button type="reset" class="btn btn-outline-danger mr-1"><i class="feather icon-x"></i>취소</button>
	                                                <button type="button" onclick="location.href='${pageContext.request.contextPath }/safari/feedback?workMemberNo=${workMemberNo }'" class="btn btn-outline-warning mr-1"><i class="feather icon-rotate-ccw"></i>목록으로</button>
	                                                <button type="button" id="modifyFeedbackBtn" class="btn btn-outline-primary"><i class="fa fa-check-square-o"></i>수정하기</button>
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
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/toggle/switchery.min.js"></script>

    <%@ include file="/WEB-INF/view/inc/common-js.jsp" %> <!-- js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/modifyFeedback.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    
     <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/account-setting.js"></script>
    <!-- END: Page JS-->
    
</body>
<!-- END: Body-->

</html>