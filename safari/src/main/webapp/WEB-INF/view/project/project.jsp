<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>PROJECT</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/fonts/simple-line-icons/style.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/pages/app-chat.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/colors/palette-gradient.css">
    <!-- END: Page CSS-->
    
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/extensions/dragula.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/selects/select2.min.css">
    
    <!-- END: Vendor CSS-->
    
    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
    <!-- END: Custom CSS-->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern chat-application 2-columns  menu-collapsed  fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

	<%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="sidebar-left">
            <div class="sidebar">
                <!-- app chat sidebar start -->
                <div class="chat-sidebar card">
                    <span class="chat-sidebar-close">
                        <i class="feather icon-x"></i>
                    </span>
                    <div class="chat-sidebar-search">
                        <div class="d-flex align-items-center">
                            <fieldset class="form-group position-relative has-icon-left mx-75 mb-0">
                                <input type="text" class="form-control round" id="chat-search" placeholder="Search">
                                <div class="form-control-position">
                                    <i class="feather icon-search text-dark"></i>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="chat-sidebar-list-wrapper pt-2">
                    	<!-- Button trigger modal -->
                        <h6 class="px-2 pb-25 mb-0">PROJECT<button type="button" data-toggle="modal" data-target="#bootstrap" class="float-right"><i class="feather icon-plus cursor-pointer"></i></button></h6>
                            <div class="form-group">
                                
                                <!-- Modal -->
                                <!-- Modal -->
                                <!-- Modal -->
                        
                                <div class="modal fade text-left" id="bootstrap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel35" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="myModalLabel35">프로젝트 추가</h3>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div><!-- modal header -->
                                            <form method="post" action="${pageContext.request.contextPath}/safari/project">
                                                <div class="modal-body">
                                                    <fieldset class="form-group floating-label-form-group">
                                                    	<label for="projectGroup">프로젝트 그룹</label>
                                                       <select name="projectGroupNo" class="form-control" id="projectGroup">
			                                                <option value="none" selected="" disabled="">프로젝트 그룹</option>
			                                                <!-- TODO 프로젝트 그룹 리스트를 받아와서 띄울 자리 -->
			                                                <!-- projectGroupNo는 null 허용 -->
			                                                <option value="design">design</option>
			                                                <option value="development">development</option>
			                                                <option value="illustration">illustration</option>
			                                                <option value="branding">branding</option>
			                                                <option value="video">video</option>
			                                            </select>
                                                    </fieldset>
                                                    <br>
                                                    <fieldset class="form-group floating-label-form-group">
                                                       <label for="projectAuth">공개범위</label>
                                                       <select name="projectAuth" class="form-control" id="projectAuth">
			                                                <option value="N">public</option>
			                                                <option value="Y">private</option>
			                                            </select>
                                                    </fieldset>
                                                    <br>
                                                    <fieldset class="form-group floating-label-form-group">
                                                        <label for="projectName">프로젝트 이름</label>
                                                        <input type="text" class="form-control" id="projectName" name="projectName">
                                                    </fieldset>
                                                </div>
		                                        <div class="form-group col-12 mb-2">
		                                        <div class="card-content collapse show">
		                                            <label for="projectMember">프로젝트 멤버</label>
		                                            <select class="select2 form-control" multiple="multiple" id="projectMember" onChange="selectProjectMember(this)">
	                                                    <option value="1">Alaska</option>
	                                                    <option value="2">Hawaii</option>
	                                                    <option value="3">California</option>
	                                                    <option value="4">Nevada</option>
	                                                    <option value="5">Oregon</option>
	                                                    <option value="6">Washington</option>
		                                            </select>
		                                        </div>
		                                        <input type="hidden" id="projectMemberList" name="projectMemberList" value="">
                                           </div>
                                          
                                           <div class="modal-footer">
                                               <input type="reset" class="projectForm btn btn-outline-secondary btn-lg" data-dismiss="modal" value="닫기">
                                               <input type="submit" class="projectForm btn btn-outline-primary btn-lg" value="프로젝트 생성">
                                           </div>
                                         </form>
                                    </div>
                                </div>
                        </div>
                        </div>
                        
                        
                        
                        <ul class="chat-sidebar-list">
                            <li>
                                <h6 class="mb-0">내가 속한 프로젝트</h6>
                            </li>
                             <li>
                                <h6 class="mb-0">중요 프로젝트</h6>
                            </li>
                            <li>
                                <h6 class="mb-0">전체 프로젝트</h6>
                            </li>
                            <li>
                                <h6 class="mb-0">보관된 프로젝트</h6>
                            </li>
                        </ul>
                        
                        <h6 class="px-2 pt-2 pb-25 mb-0">PROJECT GROUP<button type="button" class="float-right" onclick="addProjectGroup()"><i class="feather icon-plus float-right cursor-pointer"></i></button></h6>                        
                        
                        <ul class="chat-sidebar-list">
                        	<li id="addProjectGroup"></li>
                            <li>
                                <h6 class="mb-0">프로젝트 그룹</h6>
                            </li>
                        </ul>
                      </div>
  				  </div>
    		</div> <!-- END: side bar -->
    		
    		
    		
    		<div class="content-right">
            <div class="content-overlay"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
    		
    		<!-- Card drag area section start -->
                <section id="drag-area">
                    <div class="row" id="card-drag-area">
                        <div class="col-md-3 col-sm-12 pl-3 pt-3">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Card Heading 1</h4>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                                            <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                            <li><a data-action="close"><i class="feather icon-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <h4 class="card-title">Content title</h4>
                                        <p class="card-text">Jelly beans sugar plum cheesecake cookie oat cake soufflÃ©.Tootsie roll bonbon liquorice tiramisu pie powder.Donut sweet roll marzipan pastry cookie cake tootsie roll oat cake cookie.</p>
                                        <p class="card-text">Sweet roll marzipan pastry halvah. Cake bear claw sweet. Tootsie roll pie marshmallow lollipop chupa chups donut fruitcake cake.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Card Heading 2</h4>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                                            <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                            <li><a data-action="close"><i class="feather icon-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <h4 class="card-title">Content title</h4>
                                        <p class="card-text">Jelly beans sugar plum cheesecake cookie oat cake soufflÃ©.Tootsie roll bonbon liquorice tiramisu pie powder.Donut sweet roll marzipan pastry cookie cake tootsie roll oat cake cookie.</p>
                                        <p class="card-text">Sweet roll marzipan pastry halvah. Cake bear claw sweet. Tootsie roll pie marshmallow lollipop chupa chups donut fruitcake cake.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Card Heading 3</h4>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                                            <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                            <li><a data-action="close"><i class="feather icon-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <h4 class="card-title">Content title</h4>
                                        <p class="card-text">Jelly beans sugar plum cheesecake cookie oat cake soufflÃ©.Tootsie roll bonbon liquorice tiramisu pie powder.Donut sweet roll marzipan pastry cookie cake tootsie roll oat cake cookie.</p>
                                        <p class="card-text">Sweet roll marzipan pastry halvah. Cake bear claw sweet. Tootsie roll pie marshmallow lollipop chupa chups donut fruitcake cake.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Card Heading 4</h4>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                                            <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                                            <li><a data-action="close"><i class="feather icon-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <h4 class="card-title">Content title</h4>
                                        <p class="card-text">Jelly beans sugar plum cheesecake cookie oat cake soufflÃ©.Tootsie roll bonbon liquorice tiramisu pie powder.Donut sweet roll marzipan pastry cookie cake tootsie roll oat cake cookie.</p>
                                        <p class="card-text">Sweet roll marzipan pastry halvah. Cake bear claw sweet. Tootsie roll pie marshmallow lollipop chupa chups donut fruitcake cake.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // Card drag area section end -->
    		
    		</div>
    		</div>
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

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->
    
   <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/extensions/dragula.min.js"></script>
    <!-- END: Page Vendor JS-->
    

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/app-chat.js"></script>
    <!-- END: Page JS-->
    
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/cards/draggable.js"></script>
    
    
    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light navbar-border">
        <p class="clearfix blue-grey lighten-2 text-sm-center mb-0 px-2"><span class="float-md-left d-block d-md-inline-block">Copyright &copy; 2020 <a class="text-bold-800 grey darken-2" href="https://1.envato.market/pixinvent_portfolio" target="_blank">PIXINVENT </a></span><span class="float-md-right d-none d-lg-block">Hand-crafted & Made with <i class="feather icon-heart pink"></i></span></p>
    </footer>
    <!-- END: Footer-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
    <!-- END: Page Vendor JS-->

	<div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

 	<!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/modal/components-modal.js"></script>
    <!-- END: Page JS-->
    
    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/forms/select/form-select2.js"></script>
    <!-- END: Page JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/assets/js/projectMember.js"></script>
    <!-- END: Page JS-->
    
</body>
<!-- END: Body-->

</html>