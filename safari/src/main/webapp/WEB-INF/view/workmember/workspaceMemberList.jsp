<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
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
	href="${pageContext.request.contextPath }/resources/app-assets/css/pages/app-contacts.css">
<%@ include file="/WEB-INF/view/inc/common-css.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/workspaceGuest.css">
<!-- css -->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern content-detached-right-sidebar   fixed-navbar"
	data-open="click" data-menu="vertical-menu-modern"
	data-col="content-detached-right-sidebar">

	<%@ include file="/WEB-INF/view/inc/header.jsp"%>
	<!-- header -->
	<%@ include file="/WEB-INF/view/inc/sidebar.jsp"%>
	<!-- sidebar -->

	<!-- BEGIN: Content-->
	<div class="content-overlay"></div>
	<div class="content-header row"></div>
	<!-- BEGIN: Content-->
	<div class="app-content content">
		<div class="content-overlay"></div>
		<div class="content-wrapper">
			<div class="content-header row"></div>
			<div class="content-detached content-right">
				<div class="content-body">
					<div class="content-overlay"></div>
					<section class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="bug-list-search">
										<div class="bug-list-search-content">
											<div class="sidebar-toggle d-block d-lg-none">
												<i class="feather icon-menu font-large-1"></i>
											</div>
											<form action="${pageContext.request.contextPath }/member/workspaceMemberList">
												<div class="position-relative">
													<input type="text" id="search-contacts" name="search"
														class="form-control" placeholder="????????????">
													<div class="form-control-position">
														<button type="submit" id="searchBtn" class="btn"><i class="fa fa-search"></i></button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>

					<section class="row all-contacts">
						<div class="col-12">
							<div class="card">
								<div class="card-head">
									<div class="card-header">
										<h4 class="card-title">?????????????????? ????????????</h4>
										<p class="card-subtitle text-muted text-center font-small-3 mx-2">
						              		<c:if test="${errorMsg != null}"><strong class="text-center text-danger">${errorMsg}</strong></c:if>
						              	</p>
										<div class="heading-elements mt-0">
											<button class="btn btn-primary btn-md" data-toggle="modal"
												data-target="#addInviteMember">
												<i class="d-md-none d-block feather icon-plus white"></i> <span
													class="d-md-block d-none">????????????</span>
											</button>

											<!-- ???????????? ?????? -->
											<div class="modal fade" id="addInviteMember" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalLabel1"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<section class="contact-form">
															<form id="inviteForm" class="contact-input"
																action="${pageContext.request.contextPath }/member/addWorkspaceMemberByInvite"
																method="post">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel1">????????????</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body add">
																	<fieldset class="form-group col-12">
																		<div class="row">
																			<div class="col-9">
																				<input type="text" id="workMemberEmail"
																					class="contact-email form-control workMemberEmail"
																					name="workMemberEmail" placeholder="Email">
																			</div>
																			<div class="col-3">
																				<input value="??????" type="button"
																					class="btn btn danger form-control" id="btn_add">
																				<input value="${workNo}" type="hidden"
																					class="btn btn danger form-control" name="workNo">
																			</div>
																		</div>
																	</fieldset>
																</div>
																<div class="modal-footer">
																	<fieldset
																		class="form-group position-relative has-icon-left mb-0">
																		<button type="button" id="inviteButton"
																			class="btn btn-info add-contact-item">
																			<span class="d-none d-lg-block">????????????</span>
																		</button>
																	</fieldset>
																</div>
															</form>
														</section>
													</div>
												</div>
											</div>
											<!-- ???????????? ?????? ??? -->
											<!-- ??????????????? ?????? -->
											<div class="modal fade" id="addInviteGuest" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalLabel1"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<section class="contact-form">
															<form id="GuestInviteForm" class="contact-input"
																action="${pageContext.request.contextPath }/member/addWorkspaceGuestByInvite"
																method="post">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel1">???????????????</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body add2">
																	<fieldset class="form-group col-12">
																		<div class="row">
																			<div class="col-9">
																				<input type="text" id="memberEmail"
																					class="contact-email form-control memberEmail"
																					name="memberEmail1" placeholder="Email">
																			</div>
																			<div class="col-3">
																				<input value="??????" type="button"
																					class="btn btn danger form-control" id="guest_add">
																				<input value="${workNo}" type="hidden"
																					class="btn btn danger form-control" name="workNo">
																			</div>
																		</div>
																	</fieldset>

																</div>
																<div class="modal-footer">
																	<fieldset
																		class="form-group position-relative has-icon-left mb-0">
																		<button type="button" id="guestInviteButton"
																			class="btn btn-info add-contact-item">
																			<span class="d-none d-lg-block">????????????</span>
																		</button>
																	</fieldset>
																</div>
															</form>
														</section>
													</div>
												</div>
											</div>
											<span> 
												<c:if test="${workMemberLevel > 1 }">
													<button id="btnSearchDrop1" type="button"
														class="btn btn-warning" data-toggle="modal"
														data-target="#addInviteGuest">???????????????</button>
												</c:if>
											</span>
											<!--???????????????????????? -->
											<button class="btn btn-default btn-sm">
												<i class="feather icon-settings white"></i>
											</button>
										</div>
									</div>
								</div>
								<div class="card-content">
									<div class="card-body">
										<!-- Task List table -->
										<div class="table-responsive">
											<table id="users-contacts"
												class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center">
												<thead>
													<tr>
														<th>??????</th>
														<th>??????</th>
														<th>?????????</th>
														<th>????????????</th>
														<th>????????????</th>
														<c:if test="${workMemberLevel > 1 }">
														<th>????????????</th>
														</c:if>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="r" items="${workspaceMemberList}">
														<c:set var="i" value="${i+1 }" />
														<!-- ???????????? ?????? ?????? -->
														<div class="modal fade" id="workMemberLevelModal${i }"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<section class="contact-form">
																		<form id="workMemberLevelForm${i }"
																			name="workMemberLevelForm${i}" class="contact-input"
																			action="${pageContext.request.contextPath }/member/modifyWorkspaceMemberByLevel"
																			method="post">
																			<div class="modal-header">
																				<h5 class="modal-title" id="exampleModalLabel">????????????</h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">


																				<fieldset class="form-group col-12">
																					<label>????????????:</label> <select name="workMemberLevel"
																						class=" col-3" id="level">
																						<c:if test="${r.workMemberLevel eq 1}">
																							<option selected="selected">1</option>
																							<option>2</option>
																							<option>3</option>
																							<option>4</option>
																						</c:if>

																						<c:if test="${r.workMemberLevel eq 2}">
																							<option>1</option>
																							<option selected="selected">2</option>
																							<option>3</option>
																							<option>4</option>
																						</c:if>
																						<c:if test="${r.workMemberLevel eq 3}">
																							<option>1</option>
																							<option>2</option>
																							<option selected="selected">3</option>
																							<option>4</option>
																						</c:if>
																						<c:if test="${r.workMemberLevel eq 4}">
																							<option>1</option>
																							<option>2</option>
																							<option>3</option>
																							<option selected="selected">4</option>
																						</c:if>

																					</select>
																				</fieldset>

																			</div>
																			<div class="modal-footer">
																				<fieldset
																					class="form-group position-relative has-icon-left mb-0">
																					<button type="submit" id="edit-contact-item"
																						class="btn btn-info edit-contact-item">
																						<i class="fa fa-paper-plane-o d-lg-none"></i> <span
																							class="d-none d-lg-block">????????????</span>
																					</button>
																					<input type="hidden" name="workMemberNo"
																						value="${r.workMemberNo }">
																				</fieldset>
																			</div>
																		</form>
																	</section>
																</div>
															</div>
														</div>
														<!-- ???????????? ?????? ??? -->


														<!-- ????????? ?????? ?????? ?????? -->
														<div class="modal fade" id="updateWorkMemberAdmin${i }"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<section class="contact-form">
																		<form id="updateWorkMemberAdminForm${i }"
																			name="updateWorkMemberAdminForm${i}"
																			class="contact-input"
																			action="${pageContext.request.contextPath }/member/modifyWorkspaceAdmin"
																			method="post">
																			<div class="modal-header">
																				<h5 class="modal-title" id="exampleModalLabel">????????????</h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">

																				<fieldset class="form-group col-12">
																					<label>?????? ???????????? ?????????????????????????</label>
																				</fieldset>

																			</div>
																			<div class="modal-footer">
																				<fieldset
																					class="form-group position-relative has-icon-left mb-0">
																					<button type="submit" id="edit-contact-item"
																						class="btn btn-info edit-contact-item">
																						<i class="fa fa-paper-plane-o d-lg-none"></i> <span
																							class="d-none d-lg-block">???????????????</span>
																					</button>
																					<input type="hidden" name="adminEmail"
																						value="${r.workMemberEmail }"> <input
																						type="hidden" name="workMemberNo"
																						value="${r.workMemberNo }">
																				</fieldset>
																			</div>
																		</form>
																	</section>
																</div>
															</div>
														</div>
														<!-- ??????????????? ?????? ??? -->

														<!-- ???????????? ?????? ?????? ?????? -->
														<div class="modal fade" id="updateWorkMemberActive${i}"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<section class="contact-form">
																		<form id="updateWorkMemberAdminForm${i }"
																			name="updateWorkMemberAdminForm${i}"
																			class="contact-input"
																			action="${pageContext.request.contextPath }/member/modifyWorkspaceMemberByActive"
																			method="post">
																			<div class="modal-header">
																				<h5 class="modal-title" id="exampleModalLabel">????????????</h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">

																				<fieldset class="form-group col-12">
																					<label>?????? ?????????????????????????</label>
																				</fieldset>

																			</div>
																			<div class="modal-footer">
																				<fieldset
																					class="form-group position-relative has-icon-left mb-0">
																					<button type="submit" id="edit-contact-item"
																						class="btn btn-info edit-contact-item">
																						<i class="fa fa-paper-plane-o d-lg-none"></i> <span
																							class="d-none d-lg-block">????????????</span>
																					</button>
																					<input type="hidden" name="workMemberNo"
																						value="${r.workMemberNo }">
																				</fieldset>
																			</div>
																		</form>
																	</section>
																</div>
															</div>
														</div>
														<!-- ???????????? ?????? ??? -->

														<!-- ???????????? ?????? -->
														<div class="modal fade" id="updateWorkMemberApprove${i}"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<section class="contact-form">
																		<form id="updateWorkMemberApproveForm${i}"
																			name="updateWorkMemberApproveForm${i}"
																			class="contact-input"
																			action="${pageContext.request.contextPath }/member/modifyWorkspaceMemberActiveApprove"
																			method="post">
																			<div class="modal-header">
																				<h5 class="modal-title" id="exampleModalLabel">????????????</h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">

																				<fieldset class="form-group col-12">
																					<label>????????? ?????????????????????????</label>
																				</fieldset>

																			</div>
																			<div class="modal-footer">
																				<fieldset
																					class="form-group position-relative has-icon-left mb-0">
																					<button type="submit" id="edit-contact-item"
																						class="btn btn-info edit-contact-item">
																						<i class="fa fa-paper-plane-o d-lg-none"></i> <span
																							class="d-none d-lg-block">????????????</span>
																					</button>
																					<input type="hidden" name="workMemberNo"
																						value="${r.workMemberNo }">
																					<input type="hidden" name="memberEmail"
																						value="${r.workMemberEmail }">	
																				</fieldset>
																			</div>
																		</form>
																	</section>
																</div>
															</div>
														</div>
														<!-- ???????????? ?????? ??? -->


														<tr>
															
															<c:if test="${ r.active != 'N'}">
															<td class="text-center">${r.workMemberPos }</td>
															</c:if>
															<c:if test="${ r.active eq 'N'}">
															<td></td>
															</c:if>
															
															<c:if test="${r.workMemberName eq 'null' && r.active eq 'W'}">
															<td>
																???????????????
															</td>
															</c:if>
															<c:if test="${r.active eq 'N'}">
															<td>
																????????????
															</td>
															</c:if>
															
															<c:if test="${r.workMemberName != 'null' && r.active != 'N' }"> 
															<td>
																<div class="media">
																	<div class="media-body media-middle">
																		<a href="${pageContext.request.contextPath }/member/feedback?workMemberNo=${r.workMemberNo}">${r.workMemberName }</a></div>
																</div>
															</td>
															</c:if>
															
															<td class="text-center"><a class="email"
																href="mailto:email@example.com">${r.workMemberEmail }</a>
															</td>
															
															
															<td class="phone">${r.workMemberPhone }</td>
															<td class="text-center">
																<div class="media-body media-middle">${r.active }
																<c:if test="${r.workMemberCode == null && r.active != 'N'}">(??????????????????)</c:if>
																<c:if test="${r.workMemberCode != null && r.active != 'N'}">(??????????????????)</c:if>
																<c:if test="${ r.active == 'N'}">(????????????)</c:if>
																</div>
															</td>
															<c:if test="${workMemberLevel > 1 }">
															<td><c:if test="${workMemberLevel eq 4 && r.active eq 'Y' && r.workMemberLevel != 4}">
																	<a data-toggle="modal"
																		data-target="#workMemberLevelModal${i}"
																		class="primary edit mr-1"><i class="fa fa-pencil"></i></a>
																	<a class="danger delete mr-1" data-toggle="modal"
																				data-target="#updateWorkMemberActive${i}"> <i
																		class="fa fa-trash-o"></i></a>
																	<a class="danger delete mr-1"> <i
																		data-toggle="modal"
																		data-target="#updateWorkMemberAdmin${i }"
																		class="fa fa-refresh"></i></a>
																</c:if>
																<c:if test="${workMemberLevel > 1 && r.active eq 'W' && r.workMemberCode == null}">
																 <a class="danger delete mr-1"> <i
																	data-toggle="modal"
																	data-target="#updateWorkMemberApprove${i }"
																	class="fa fa-check-square-o"></i></a> 
																</c:if>
																
																<c:if test="${r.workMemberLevel != 4}">	
																<span class="dropdown"> 
																<!--  ????????? -->
																<c:if test="${ r.active == 'Y' and workMemberLevel == 4 || r.active eq 'W' && r.workMemberCode == null  }">
																<a id="btnSearchDrop2"
																	data-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="true"
																	class="dropdown-toggle dropdown-menu-right"></a> 
																	</c:if>
																	<c:if test="${ workMemberLevel >1 and workMemberLevel > 4  && r.active eq 'W' && r.workMemberCode == null  }">
																<a id="btnSearchDrop2"
																	data-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="true"
																	class="dropdown-toggle dropdown-menu-right"></a> 
																	</c:if>
																	
																	
																	<span
																	aria-labelledby="btnSearchDrop2"
																	class="dropdown-menu mt-1 dropdown-menu-right">
																		<!-- ?????? 4??????????????? active??? Y???????????? ?????? -->
																		<c:if test="${workMemberLevel eq 4 && r.active eq 'Y'}">
																			<a data-toggle="modal"
																				data-target="#workMemberLevelModal${i}"
																				class="dropdown-item edit"><i
																				class="feather icon-edit-2"></i> ????????????</a>
																			<a data-toggle="modal"
																				data-target="#updateWorkMemberActive${i}"
																				class="dropdown-item delete"><i
																				class="feather icon-trash-2" id="deleteMember${i}"></i>
																				????????????</a>
																			<a data-toggle="modal"
																				data-target="#updateWorkMemberAdmin${i }"
																				class="dropdown-item"> <i
																				class="feather icon-refresh-ccw"></i>???????????????
																			</a>
																		</c:if> 
																		<!--   ?????? 4??????????????? active??? Y???????????? ?????? -->
																		<c:if test="${r.active eq 'W' && r.workMemberCode == null }">
																		<a data-toggle="modal"
																		data-target="#updateWorkMemberApprove${i }"
																		class="dropdown-item"><i
																			class="fa fa-check-square-o"></i>????????????</a>
																		</c:if>
																</span>
															</span>
															</c:if>
															</td>
															</c:if>
														</tr>
													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<th>??????</th>
														<th>??????</th>
														<th>?????????</th>
														<th>????????????</th>
														<th>????????????</th>
														<c:if test="${workMemberLevel > 1 }">
														<th>????????????</th>
														</c:if>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
			<div class="sidebar-detached sidebar-left">
				<div class="sidebar">
					<div class="bug-list-sidebar-content">
						<!-- Predefined Views -->
						<div class="card">
							<div class="card-head">
								<div class="media p-1">
									<div class="media-left pr-1"></div>
									<div class="media-body media-middle"></div>
								</div>
							</div>


							<!-- Groups-->
							<div class="card-body">
								<p class="lead">??????</p>
								<ul class="list-group">
									<li class="list-group-item"><span
										class="badge badge-primary badge-pill float-right">${allMemberCount}</span> <a
										href="${pageContext.request.contextPath }/member/workspaceMemberList">?????? ??????</a></li>
									<li class="list-group-item"><span
										class="badge badge-info badge-pill float-right">${WMemberCount }</span> <a
										href="${pageContext.request.contextPath }/member/workspaceMemberList?active=W">???????????? ??????</a></li>
									<li class="list-group-item"><span
										class="badge badge-warning badge-pill float-right">${NMemberCount }</span> <a
										href="${pageContext.request.contextPath }/member/workspaceMemberList?active=N">????????? ??????</a></li>

								</ul>
							</div>
							<!--/ Groups-->

							<!--More-->
							<div class="card-body ">
								<p class="lead">?????????</p>
								<ul class="list-group">
									<li class="list-group-item"><span
										class="badge badge-primary badge-pill float-right">${allGuestCount }</span> <a
										href="${pageContext.request.contextPath }/member/workspaceGuestList">?????? ?????????</a></li>
									<li class="list-group-item"><span
										class="badge badge-info badge-pill float-right">${WGuestCount }</span> <a
										href="${pageContext.request.contextPath }/member/workspaceGuestList?active=W">???????????? ?????????</a></li>
								</ul>
							</div>
							<!--/More-->

						</div>
						<!--/ Predefined Views -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END: Content-->


	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<%@ include file="/WEB-INF/view/inc/footer.jsp"%>
	<!-- footer -->
	<%@ include file="/WEB-INF/view/inc/common-js.jsp"%>
	<!-- js -->
	<script
		src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/app-contacts.js"></script>

</body>
<!-- END: Body-->


<script>
	// ?????????????????? ?????????????????? ?????? ?????? 
	$(document)
			.ready(
					function() {
						$("#btn_add")
								.on(
										'click',
										function() {
											var tmpHtml = "<fieldset id='remove1' class='form-group col-12' name='remove'>"
													+ "<div class='row'>"
													+ "<div class='col-9'>"
													+ "<input type='text' name='workMemberEmail' id='contact-email' class='contact-email form-control workMemberEmail' placeholder='Email'>"
													+ "</div>"
													+ "<div class='col-3'>"
													+ "<input value='??????' name='remove1' type='button' class='btn btn danger form-control' id='btn_add'>"
													+ "</div>"
													+ "</div>"
													+ "</fieldset>"
											$(".add").append(tmpHtml);

										});
						var trHtml = $("fieldset[name=remove]:last"); //last??? ???????????? trStaff?????? ?????? ?????? ????????? ?????? ??????
						$(document).on('click', 'input[name=remove1]',
								function() {

									$('#remove1').remove();
									cnt = cnt - 1;
								});
						// ?????????????????? ?????????????????? ?????? ?????????

						// ??????????????? ?????????????????? ?????? ????????????
						$("#guest_add")
								.on(
										'click',
										function() {
											var tmpHtml = "<fieldset id='guestRemove' class='form-group col-12' name='guestRemove'>"
													+ "<div class='row'>"
													+ "<div class='col-9'>"
													+ "<input type='text' name='memberEmail1' id='contact-email' class='contact-email form-control memberEmail' placeholder='Email'>"
													+ "</div>"
													+ "<div class='col-3'>"
													+ "<input value='??????' name='guestRemove1' type='button' class='btn btn danger form-control' id='btn_add'>"
													+ "</div>"
													+ "</div>"
													+ "</fieldset>"
											$(".add2").append(tmpHtml);

										});
						var trHtml = $("fieldset[name=guestRemove]:last"); //last??? ???????????? trStaff?????? ?????? ?????? ????????? ?????? ??????
						$(document).on('click', 'input[name=guestRemove1]',
								function() {

									$('#guestRemove').remove();
									cnt = cnt - 1;
								});

					});
	//??????????????? ???????????? ?????? ?????????
</script>

<script>
	// ?????????????????? ??????
$(document).ready(function() {
	// ?????? ????????? ???????????????
	$('#inviteButton').click(function() {
	var reg_email = RegExp(/^[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\w+\.)+\w+$/);
	
	var admin = 'yes'; 
	
	var grpl = $('input[name=workMemberEmail]').length;
	//?????? ??????
	var grparr = new Array(grpl);
	//????????? ??? ??????

	for (var i = 0; i < grpl; i++) {
		console.log(i);
		console.log(grpl);
		if ($("input[name='workMemberEmail']").eq(i).val() == '') {
			alert('???????????? ???????????????.');
			i = grpl+1;
			return;
		}
		if (!reg_email.test($("input[name='workMemberEmail']").eq(i).val())) {
			alert('?????????????????? ??????????????????.\nexample@example.com');
			console.log($("input[name='workMemberEmail']").eq(i).val());
			return;
			} else if ($("input[name='workMemberEmail']").val() != '') {
			$.ajax({
				async : false,
				url : '/member/existEmail',
				type : 'POST',
				data : {workMemberEmail : $("input[name='workMemberEmail']").eq(i).val()},
				success : function(data) {
						if (data != '?????????????????????') {
							alert(i+ 1+ '?????? ?????? ???????????? ?????? ????????? ????????? ????????? ??????????????????.');
							i = grpl+1;
							console.log(data);
							return;
						}else if (data=='?????????????????????'){
							$.ajax({
								async : false,
								url : '/member/existWorkspaceEmail',
								type : 'POST',
								data : {workMemberEmail : $("input[name='workMemberEmail']").eq(i).val()},
								success : function(json) {
										if (json == '????????????') {
											alert(i+ 1+ '?????? ?????? ??????????????? ??????????????????.');
											i = grpl+1;
											return;
										} else if (json == '??????????????????'&& i == grpl - 1) {
											alert('????????????');
											$('#inviteForm').submit();
										}
									}
								});
							
							} 
					}
				});
			}
		}
	});
	// ?????? ????????? ??????????????? ???

	// ????????? ????????? ????????? ?????? ??????
	$('#guestInviteButton').click(function() {
		var reg_email = RegExp(/^[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\w+\.)+\w+$/);

		var grpl = $('input[name=memberEmail1]').length;
		//?????? ??????
		var grparr = new Array(grpl);
		//????????? ??? ??????

		for (var i = 0; i < grpl; i++) {
			console.log(i);
			console.log(grpl);
			if ($("input[name='memberEmail1']").eq(i).val() == '') {
				alert('???????????? ???????????????.');
				i = grpl+1;
				return;
			}
			if (!reg_email.test($("input[name='memberEmail1']").eq(i).val())) {
				alert('?????????????????? ??????????????????.\nexample@example.com');
				console.log($("input[name='memberEmail']").eq(i).val());
				i = grpl+1;
				return;
			} else if ($("input[name='memberEmail1']").eq(i).val() != '') {
				$.ajax({
					async : false,
					url : '/member/existEmail',
					type : 'POST',
					data : {workMemberEmail : $("input[name='memberEmail1']").eq(i).val()},
					success : function(data) {
							if (data != '?????????????????????') {
								alert(i+ 1+ '?????? ?????? ???????????? ?????? ????????? ????????? ????????? ??????????????????.');
								console.log(data);
								i = grpl+1;
								return;
							}else if (data=='?????????????????????'){
								$.ajax({
									async : false,
									url : '/member/existWorkspaceEmail',
									type : 'POST',
									data : {workMemberEmail : $("input[name='memberEmail1']").eq(i).val()},
									success : function(json) {
											if (json == '????????????') {
												alert(i+ 1+ '?????? ?????? ??????????????? ??????????????????.');
												i = grpl+1;
												return;
											} 
											else if (json!='????????????'){
												$.ajax({
													async : false,
													url : '/member/existGuestEmail',
													type : 'POST',
													data : {memberEmail : $("input[name='memberEmail1']").eq(i).val()},
													success : function(email) {
															if (email == '????????????') {
																alert(i+ 1+ '?????? ?????? ??????????????? ??????????????????.');
																i = grpl+1;
																return;
															} else if (json == '??????????????????'&& i == grpl - 1) {
																alert('????????????');
																$('#GuestInviteForm').submit();
															}
															
														}
													});
												
												} 
											
										}
									});
								
								} 
						}
					});
				}
			}
		});
	
	

});
</script>


</html>