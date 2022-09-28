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
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/workspaceGuest.css">
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
											<form action="${pageContext.request.contextPath }/member/workspaceGuestList">
												<div class="position-relative">
													<input type="search" id="search-contacts" name="search"
														class="form-control" placeholder="게스트검색 이메일을 입력해주세요">
													<div class="form-control-position">
														<button type="submit" id ="searchButton"><i 
															class="fa fa-search text-size-base text-muted la-rotate-270"></i></button>
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
										<h4 class="card-title">워크스페이스 게스트목록</h4>
										<div class="heading-elements mt-0">
											<button class="btn btn-primary btn-md" data-toggle="modal"
												data-target="#addInviteMember">
												<i class="d-md-none d-block feather icon-plus white"></i> <span
													class="d-md-block d-none">사원초대</span>
											</button>

											<!-- 사원초대 모달 -->
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
																	<h5 class="modal-title" id="exampleModalLabel1">사원초대</h5>
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
																				<input value="추가" type="button"
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
																			<span class="d-none d-lg-block">초대하기</span>
																		</button>
																	</fieldset>
																</div>
															</form>
														</section>
													</div>
												</div>
											</div>
											<!-- 사원초대 모달 끝 -->
											<!-- 게스트초대 모달 -->
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
																	<h5 class="modal-title" id="exampleModalLabel1">게스트초대</h5>
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
																				<input value="추가" type="button"
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
																			<span class="d-none d-lg-block">초대하기</span>
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
														data-target="#addInviteGuest">게스트초대</button>
												</c:if>
											</span>
											<!--게스트초대모달끝 -->
											<button class="btn btn-default btn-sm">
												<i class="feather icon-settings white"></i>
											</button>
										</div>
									</div>
								</div>
								<div class="card-content">
									<div class="card-body">
										<!-- Task List table -->
										<button type="button"
											class="btn btn-danger btn-sm delete-all mb-1">Delete
											All</button>
										<div class="table-responsive">
											<table id="users-contacts"
												class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center">
												<thead>
													<tr>
														<th>이메일</th>
														<th>활동여부</th>
														<th>초대날짜</th>
														<c:if test="${workMemberLevel > 2 }">
														<th>부가기능</th>
														</c:if>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="r" items="${workspaceGuestList}">
														<c:set var="i" value="${i+1 }" />

														<!-- 게스트 추방 변경 모달 시작 -->
														<div class="modal fade" id="updateWorkGuestActive${i}"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<section class="contact-form">
																		<form id="updateWorkGuestActiveForm${i}"
																			name="updateWorkGuestActiveForm${i}"
																			class="contact-input"
																			action="${pageContext.request.contextPath }/member/modifyWorkspaceGuestByActive"
																			method="post">
																			<div class="modal-header">
																				<h5 class="modal-title" id="exampleModalLabel">게스트추방</h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">

																				<fieldset class="form-group col-12">
																					<label>정말 추방하시겠습니까?</label>
																				</fieldset>

																			</div>
																			<div class="modal-footer">
																				<fieldset
																					class="form-group position-relative has-icon-left mb-0">
																					<button type="submit" id="edit-contact-item"
																						class="btn btn-info edit-contact-item">
																						<i class="fa fa-paper-plane-o d-lg-none"></i> <span
																							class="d-none d-lg-block">게스트추방</span>
																					</button>
																					<input type="hidden" name="memberEmail"
																						value="${r.memberEmail }">
																					<input type="hidden" name="workNo"
																						value="${r.workNo }">
																				</fieldset>
																			</div>
																		</form>
																	</section>
																</div>
															</div>
														</div>
														<!-- 멤버추방 모달 끝 -->
														
														<!-- 게스트 승인 모달 -->
														<div class="modal fade" id="updateWorkGuestApprove${i}"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<section class="contact-form">
																		<form id="updateWorkGuestApprove${i}"
																			name="updateWorkGuestApprove${i}"
																			class="contact-input"
																			action="${pageContext.request.contextPath }/member/modifyWorkspaceGuestActiveApprove"
																			method="post">
																			<div class="modal-header">
																				<h5 class="modal-title" id="exampleModalLabel">게스트승인</h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">

																				<fieldset class="form-group col-12">
																					<label>게스트를 승인하시겠습니까?</label>
																				</fieldset>

																			</div>
																			<div class="modal-footer">
																				<fieldset
																					class="form-group position-relative has-icon-left mb-0">
																					<button type="submit" id="edit-contact-item"
																						class="btn btn-info edit-contact-item">
																						<i class="fa fa-paper-plane-o d-lg-none"></i> <span
																							class="d-none d-lg-block">게스트승인</span>
																					</button>
																					<input type="hidden" name="memberEmail"
																						value="${r.memberEmail }">
																					<input type="hidden" name="workNo"
																						value="${r.workNo }">
																				</fieldset>
																			</div>
																		</form>
																	</section>
																</div>
															</div>
														</div>
														<!-- 게스트승인 모달 끝 -->

														<tr>
															<td>
																<div class="media">
																	<div class="media-body media-middle">
																		${r.memberEmail }
																	</div>
																</div>
															</td>
															<td class="text-center"><a class="email"
																href="mailto:email@example.com">${r.active }</a>
															</td>
															<td class="phone">${r.createDate }</td>
															<c:if test="${workMemberLevel > 2 }">
																<td>
																<c:if test="${workMemberLevel eq 4 }">
																	<a class="danger delete mr-1"> <i
																		data-toggle="modal"
																		data-target="#updateWorkGuestActive${i}"
																		class="fa fa-trash-o"></i></a>
																		</c:if>
																	<c:if test="${workMemberLevel > 1 && r.active eq 'W'}">	 
																	<a class="danger delete mr-1"> <i data-toggle="modal"
																		data-target="#updateWorkGuestApprove${i}"
																		class="fa fa-check-square-o"></i></a>
																		</c:if> 
																		<span class="dropdown">
																		<a id="btnSearchDrop2" data-toggle="dropdown"
																		aria-haspopup="true" aria-expanded="true"
																		class="dropdown-toggle dropdown-menu-right"></a> <span
																		aria-labelledby="btnSearchDrop2"
																		class="dropdown-menu mt-1 dropdown-menu-right">
																			<c:if test="${workMemberLevel eq 4 }">
																			<a
																			data-toggle="modal"
																			data-target="#updateWorkGuestActive${i}"
																			class="dropdown-item delete"><i
																				class="feather icon-trash-2" id="deleteMember${i}"></i>
																				게스트추방</a> 
																				</c:if>
																				
																				<c:if test="${workMemberLevel > 1 && r.active eq 'W'}">
																				<a data-toggle="modal"
																			data-target="#updateWorkGuestApprove${i}"
																			class="dropdown-item"><i
																				class="fa fa-check-square-o"></i>게스트승인</a>
																				</c:if>
																	</span>
																</span></td>
																</c:if>
														</tr>
													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<th>이메일</th>
														<th>활동여부</th>
														<th>초대날짜</th>
														<c:if test="${workMemberLevel > 2 }">
														<th>부가기능</th>
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
									<div class="media-left pr-1">
									</div>
									<div class="media-body media-middle">
									</div>
								</div>
							</div>

							<!-- Groups-->
							<div class="card-body">
								<p class="lead">사원</p>
								<ul class="list-group">
									<li class="list-group-item"><span
										class="badge badge-primary badge-pill float-right">${allMemberCount}</span> <a
										href="${pageContext.request.contextPath }/member/workspaceMemberList">모든 멤버</a></li>
									<li class="list-group-item"><span
										class="badge badge-info badge-pill float-right">${WMemberCount }</span> <a
										href="${pageContext.request.contextPath }/member/workspaceMemberList?active=W">초대중인 멤버</a></li>
									<li class="list-group-item"><span
										class="badge badge-warning badge-pill float-right">${NMemberCount }</span> <a
										href="${pageContext.request.contextPath }/member/workspaceMemberList?active=N">삭제된 멤버</a></li>

								</ul>
							</div>
							<!--/ Groups-->

							<!--More-->
							<div class="card-body ">
								<p class="lead">게스트</p>
								<ul class="list-group">
									<li class="list-group-item"><span
										class="badge badge-primary badge-pill float-right">${allGuestCount }</span> <a
										href="${pageContext.request.contextPath }/member/workspaceGuestList">모든 게스트</a></li>
									<li class="list-group-item"><span
										class="badge badge-info badge-pill float-right">${WGuestCount }</span> <a
										href="${pageContext.request.contextPath }/member/workspaceGuestList?active=W">초대중인 게스트</a></li>
									<li class="list-group-item"><span
										class="badge badge-info badge-pill float-right">${NGuestCount }</span> <a
										href="${pageContext.request.contextPath }/member/workspaceGuestList?active=N">삭제된 게스트</a></li>
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
	// 사원멤버추가 이메일추가칸 생성 삭제 
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
													+ "<input value='삭제' name='remove1' type='button' class='btn btn danger form-control' id='btn_add'>"
													+ "</div>"
													+ "</div>"
													+ "</fieldset>"
											$(".add").append(tmpHtml);

										});
						var trHtml = $("fieldset[name=remove]:last"); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
						$(document).on('click', 'input[name=remove1]',
								function() {

									$('#remove1').remove();
									cnt = cnt - 1;
								});
						// 사원멤버추가 이메일추가칸 생성 삭제끝

						// 게스트추가 이메일추가칸 생성 삭제시작
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
													+ "<input value='삭제' name='guestRemove1' type='button' class='btn btn danger form-control' id='btn_add'>"
													+ "</div>"
													+ "</div>"
													+ "</fieldset>"
											$(".add2").append(tmpHtml);

										});
						var trHtml = $("fieldset[name=guestRemove]:last"); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
						$(document).on('click', 'input[name=guestRemove1]',
								function() {

									$('#guestRemove').remove();
									cnt = cnt - 1;
								});

					});
	//게스트추가 이메일칸 생성 삭제끝
</script>

<script>
	// 이메일유효성 검사
$(document).ready(function() {
	// 사원 초대폼 유효성검사
	$('#inviteButton').click(function() {
	var reg_email = RegExp(/^[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\w+\.)+\w+$/);
	
	var admin = 'yes'; 
	
	var grpl = $('input[name=workMemberEmail]').length;
	//배열 생성
	var grparr = new Array(grpl);
	//배열에 값 주입

	for (var i = 0; i < grpl; i++) {
		console.log(i);
		console.log(grpl);
		if ($("input[name='workMemberEmail']").eq(i).val() == '') {
			alert('이메일이 빈칸입니다.');
			return;
		}
		if (!reg_email.test($("input[name='workMemberEmail']").eq(i).val())) {
			alert('이메일형식을 확인해주세요.\nexample@example.com');
			console.log($("input[name='workMemberEmail']").eq(i).val());
			return;
			} else if ($("input[name='workMemberEmail']").val() != '') {
			$.ajax({
				async : false,
				url : '/member/existEmail',
				type : 'POST',
				data : {workMemberEmail : $("input[name='workMemberEmail']").eq(i).val()},
				success : function(data) {
						if (data != '존재하는이메일') {
							alert(i+ 1+ '번쨰칸은 가입하지 않는 아이디입니다');
							console.log(data);
							return;
						}else if (data=='존재하는이메일'){
							$.ajax({
								async : false,
								url : '/member/existWorkspaceEmail',
								type : 'POST',
								data : {workMemberEmail : $("input[name='workMemberEmail']").eq(i).val()},
								success : function(json) {
										if (json == '이미사용') {
											alert(i+ 1+ '칸은 이미가입된 이메일입니다.');
											return;
										} else if (json == '사용하지않음'&& i == grpl - 1) {
											alert('제출완료');
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
	// 사원 초대폼 유효성검사 끝

	// 게스트 초대폼 유효성 검사 시작
	$('#guestInviteButton').click(function() {
		var reg_email = RegExp(/^[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\w+\.)+\w+$/);

		var grpl = $('input[name=memberEmail1]').length;
		//배열 생성
		var grparr = new Array(grpl);
		//배열에 값 주입

		for (var i = 0; i < grpl; i++) {
			console.log(i);
			console.log(grpl);
			if ($("input[name='memberEmail1']").eq(i).val() == '') {
				alert('이메일이 빈칸입니다.');
				return;
			}
			if (!reg_email.test($("input[name='memberEmail1']").eq(i).val())) {
				alert('이메일형식을 확인해주세요.\nexample@example.com');
				console.log($("input[name='memberEmail1']").eq(i).val());
				return;
			} else if ($("input[name='memberEmail1']").eq(i).val() != '') {
				$.ajax({
					async : false,
					url : '/member/existEmail',
					type : 'POST',
					data : {workMemberEmail : $("input[name='memberEmail1']").eq(i).val()},
					success : function(data) {
							if (data != '존재하는이메일') {
								alert(i+ 1+ '번쨰칸은 가입하지 않는 아이디입니다');
								console.log(data);
								return;
							}else if (data=='존재하는이메일'){
								$.ajax({
									async : false,
									url : '/member/existWorkspaceEmail',
									type : 'POST',
									data : {workMemberEmail : $("input[name='memberEmail1']").eq(i).val()},
									success : function(json) {
											if (json == '이미사용') {
												alert(i+ 1+ '칸은 이미가입된 이메일입니다.');
												return;
											} 
											else if (json!='이미사용'){
												$.ajax({
													async : false,
													url : '/member/existGuestEmail',
													type : 'POST',
													data : {memberEmail : $("input[name='memberEmail1']").eq(i).val()},
													success : function(email) {
															if (email == '이미사용') {
																alert(i+ 1+ '칸은 이미가입된 게스트입니다.');
																return;
															} else if (json == '사용하지않음'&& i == grpl - 1) {
																alert('제출완료');
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