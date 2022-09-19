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
	href="${pageContext.request.contextPath }/resources/assets/css/index.css">


</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern content-detached-right-sidebar   fixed-navbar"
	data-open="click" data-menu="vertical-menu-modern"
	data-col="content-detached-right-sidebar">

	<!-- header -->

	<!-- BEGIN: Content-->
	<div class="app-content content">

		<div class="app-content content">
			<div class="content-overlay"></div>
			<div class="content-wrapper">
				<div class="content-header row"></div>


				<div class="col-lg-4 col-md-6 col-sm-12">
					<div class="form-group">
						<!-- Add Modal -->
					</div>
				</div>


				<div class="container">
					<div class="row">
						<!-- 워크스페이스 목록-->
						<c:forEach var="r" items="${workspaceList}">
							<c:set var="i" value="${i+1 }" />
							<div class="col-lg-4 col-md-4">
								<div class="card text-center">
									<div class="card-content">
										<div class="card-body">
											<!--  modal -->
											<!-- 아이콘 -->
											<c:if test="${login eq r.adminEmail }">
											<div class="col-md-12 col-sm-12 col-12 fonticon-container">
												<ul class="list-inline" class="align-end">
												<li>
													<a data-toggle="modal" data-target="#inlineForm${i }"
														class="fa fa-times"></a> </li>
                                                  <li><a data-toggle="modal" data-target="#updateForm${i }" class="feather icon-edit">
                                                  </a></li>
                                             
                                                </ul>
											</div>
											  </c:if>
											<!-- 아이콘 end -->
											<!-- update폼 모달 start-->
											<div class="modal fade text-left" id="updateForm${i }"
												tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<label class="modal-title text-text-bold-600"
																id="myModalLabel33">워크스페이스 수정</label>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<form
															action="${pageContext.request.contextPath}/safari/modifyWorkspace"
															method="post">
															<div class="modal-body">

																<label>워크스페이스제목</label>
																<div class="form-group">
																	<input name="workName" type="text"
																		placeholder="Workspace Title" class="form-control">
																</div>
															</div>
															<div class="modal-footer">
																<input name="workNo" type="hidden"
																	class="btn btn-outline-primary btn-lg"
																	value="${r.workNo }"> <input type="reset"
																	class="btn btn-outline-secondary btn-lg"
																	data-dismiss="modal" value="닫기"> <input
																	type="submit" class="btn btn-outline-primary btn-lg"
																	value="수정">
															</div>
														</form>
													</div>
												</div>
											</div>
											
											
											<!-- 삭제폼 모달 start -->
											<div class="modal fade text-left" id="inlineForm${i }"
												tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<label class="modal-title text-text-bold-600"
																id="myModalLabel33">워크스페이스삭제</label>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<form method="post" id="workspaceDeleteForm${i}"
															action="${pageContext.request.contextPath}/safari/removeWorkspace">
															<div class="modal-body">

																<label>비밀번호</label>
																<div class="form-group">
																	<input name="memberPw" type="password" id="memberPw${i}"
																		placeholder="Password" class="form-control">
																</div>
															</div>
															<div class="modal-footer">
																<input name="workNo" type="hidden"
																	class="btn btn-outline-primary btn-lg"
																	value="${r.workNo }"> <input type="reset"
																	class="btn btn-outline-secondary btn-lg"
																	data-dismiss="modal" value="닫기"> <input
																	type="submit" class="btn btn-outline-primary btn-lg"
																	value="삭제" id="deleteButton${i}">
															</div>
														</form>
													</div>
												</div>
											</div>
											<!-- 삭제폼 end -->
											<h4 class="card-title success">${r.workName }</h4>

											<p class="card-text"></p>
											<p class="card-text">${r.createDate }</p>
											<!-- Button trigger modal -->

											<a
												href="${pageContext.request.contextPath }/safari/workspaceMain?workNo=${r.workNo}">
												<button type="button" class="btn btn-outline-success"
													data-toggle="modal" data-target="#iconForm">show
													workspace</button>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>


						<!--워크스페이스 추가 폼  -->
						<div class="col-lg-4 col-md-4">
							<div class="card text-center">
								<div class="card-content">
									<div class="card-body">
										<h4 class="card-title success">workspace</h4>
										<p class="card-text">
										<div class="col-md-12 col-sm-12 col-12 fonticon-container">
											<div class="fonticon-wrap">
												<i class="fa fa-plus"></i>
											</div>
										</div>
										<!-- Button trigger modal -->
										<a
											href="${pageContext.request.contextPath }/safari/addWorkspace"><button
												type="button" class="btn btn-outline-success">

												create workspace</button></a>


									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="content-body"></div>
				</div>
			</div>
		</div>

		<div class="content-overlay"></div>
	</div>
	<!-- END: Content-->

	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<%@ include file="/WEB-INF/view/inc/footer.jsp"%>
	<!-- footer -->

	<%@ include file="/WEB-INF/view/inc/common-js.jsp"%>
	<!-- js -->

	<!-- Modal -->


</body>
<!-- END: Body-->


	



</html>