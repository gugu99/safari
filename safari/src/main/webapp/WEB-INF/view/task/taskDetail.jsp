<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="kanban-sidebar">
	<!-- User new mail right area -->
	<ul class="nav nav-tabs mb-2" role="tablist">
	    <li class="nav-item">
	        <a class="nav-link d-flex align-items-center active" id="taskDetail-tab" data-toggle="tab" href="#taskDetail" aria-controls="taskDetail" role="tab" aria-selected="true">
	            <i class="feather icon-clipboard mr-25"></i><span class="d-none d-sm-block">업무 상세보기</span>
	        </a>
	    </li>
	    <li class="nav-item">
	        <a class="nav-link d-flex align-items-center" id="taskComment-tab" data-toggle="tab" href="#taskComment" aria-controls="taskComment" role="tab" aria-selected="false">
	            <i class="feather icon-message-square mr-25"></i><span class="d-none d-sm-block">코멘트</span>
	        </a>
	    </li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="taskDetail" aria-labelledby="taskDetail-tab" role="tabpanel">
		    <div class="card shadow-none quill-wrapper">
		        <div class="card-header d-flex justify-content-between align-items-center border-bottom px-2 py-1">
		            <h3 class="card-title">업무 상세보기</h3>
		            <button type="button" class="close close-icon">
		                <i class="feather icon-x"></i>
		            </button>
		        </div>
		        <!-- form start -->
		        <form class="edit-kanban-item" action="${pageContext.request.contextPath }/member/updateTask" method="post">
		            <div class="card-content position-relative">
		                <div class="card-body">
		               		<input type="hidden" class="edit-kanban-item-id" name="taskNo">
		               		<input type="hidden" class="edit-kanban-item-tasklistNo" name="tasklistNo">
		               		<input type="hidden" class="edit-kanban-item-tasklistTitle" name="tasklistTitle">
		                    <div class="form-group">
		                        <label>업무 제목</label>
		                        <div id="upperTask"></div>
		                        <input type="text" class="form-control edit-kanban-item-title" placeholder="업무 제목" name="taskTitle">
		                    </div>
		                    <div class="form-group">
		                        <label>업무 내용</label>
		                        <textarea class="form-control edit-kanban-item-content" placeholder="업무 내용" name="taskContent"></textarea>
		                    </div>
		                    <div class="form-group">
		                        <label>시작일</label>
		                        <input type="text" class="form-control edit-kanban-item-start" placeholder="시작일" name="taskStart">
		                    <div class="form-group mt-1">
		                        <label>마감일</label>
		                        <input type="text" class="form-control edit-kanban-item-date" placeholder="마감일" name="taskDeadline">
		                        <input type="text" class="form-control edit-kanban-item-time" placeholder="시간">
		                    </div>
		                    <div class="form-group">
		                        <label>종료일</label>
		                        <input type="text" class="form-control edit-kanban-item-end" placeholder="종료일" id="taskEnd" readonly>
		                        <div class="result"></div>
		                    </div>
		                    <div class="form-group">
		                    	<label>배정된 멤버</label>
		                         	<a data-toggle="modal" href="#taskMemberModal"><input type="button" class="form-control edit-kanban-item-member memberBtn-modal text-left"></a>
			                </div>
					        <div class="form-group">
		                        <label>중요도</label>
		                        <select class="form-control text-dark edit-kanban-item-point" name="taskPoint">
		                            <option value="" class="bg-primary" selected></option>
		                            <option value="1" class="bg-danger">1</option>
		                            <option value="2" class="bg-success">2</option>
		                            <option value="3" class="bg-info">3</option>
		                            <option value="4" class="bg-warning">4</option>
		                            <option value="5" class="bg-secondary">5</option>
		                        </select>
		                    </div>
		                    <div class="row">
		                        <div class="col-6">
		                             <div class="form-group">
				                   		<label>위치</label>
				                   		<div>
				                   			<a data-toggle="modal" href="#updateTaskLocationModal"><button type="button" class="projectBtn-modal btn btn-outline-primary">업무위치변경 <i class="feather icon-external-link"></i></button></a>
				                   		</div>
				                    </div>
		                        </div>
		                        <div class="col-6">
		                        	<div class="form-group">
				                   		<label>복사</label>
				                   		<div>
				                   			<a data-toggle="modal" href="#copyTaskModal"><button type="button" class="copyBtn-modal btn btn-outline-primary">업무복사하기 <i class="feather icon-file-text"></i></button></a>
				                   		</div>
				                    </div>
		                        </div>
		                      </div>
		                   </div>
		                   <div class="form-group">
		                   		<label>하위업무</label>
		                   		<ul class="edit-kanban-item-task">
		                   			<!-- 하위 업무 리스트 -->
		                   		</ul>
		                   		<div>
				               	 	<input type="text" class="form-control lowerTask" id="lowerTask" placeholder="하위업무 만들기">	
		                   		</div>
		                   		<div class="text-right">
		                   		</div>
		                   </div>
		                   <div class="row">
		                        <div class="col-6">
		                             <div class="form-group">
				                   		<label>하위업무 전환</label>
				                   		<div>
		                   					<a data-toggle="modal" href="#lowerTaskModal"><button type="button" class="lowerTaskBtn-modal btn btn-outline-primary">하위업무전환 <i class="feather icon-corner-down-left"></i></button></a>
				                   		</div>
				                    </div>
		                        </div>
		                        <div class="col-6">
		                        	<div class="form-group">
				                   		<label>메인업무 전환</label>
				                   		<div>
				                   			<button type="button" class="taskBtn-modal btn btn-outline-primary" id="changeTaskBtn">메인업무전환 <i class="feather icon-corner-right-up"></i></button>
				                   		</div>
				                    </div>
		                        </div>
		                      </div>
		           		</div>
			            <div class="card-footer d-flex justify-content-end">
			            	<button type="button" class="btn btn-warning cancel-kanban-item mr-1">
			                    <span>완료취소</span>
			                </button>
			            	<button type="button" class="btn btn-info complete-kanban-item mr-1">
			                    <span>업무완료</span>
			                </button>
			                <button type="reset" class="btn btn-danger delete-kanban-item mr-1">
			                    <i class="feather icon-trash-2 mr-50"></i>
			                    <span>삭제</span>
			                </button>
			                <button type="button" class="btn btn-primary glow update-kanban-item">
			                    <i class="feather icon-play mr-50"></i>
			                    <span>수정</span>
			                </button>
		                </div>
		            </div>
		        </form>
		        <!-- form start end-->
		    </div>
		</div>
		<div class="tab-pane" id="taskComment" aria-labelledby="taskComment-tab" role="tabpanel">
			<div class="card shadow-none quill-wrapper">
		        <div class="card-header d-flex justify-content-between align-items-center border-bottom px-2 py-1">
		            <h3 class="card-title">코멘트</h3>
		            <button type="button" class="close close-icon">
		                <i class="feather icon-x"></i>
		            </button>
		        </div>
		        <form class="comment-kanban-item">
	        		<div class="card-content position-relative" id="taskCmtCardContent">
			            <div class="card-body" id="taskCmtCardBody">
				            <label>코멘트</label>
			                <div class="snow-container border rounded p-1">
			                    <textarea class="compose-editor form-control" id="taskCmtContent" placeholder="댓글을 적어주세요."></textarea>
			                    <div class="d-flex justify-content-end">
			                        <div class="compose-quill-toolbar">
			                            <span class="ql-formats mr-0">
			                                <button type="button" class="btn btn-sm btn-primary btn-comment ml-25" id="cmtBtn">보내기</button>
			                            </span>
			                        </div>
			                    </div>
			            	</div>
					    </div>
					    <div class="card-footer">
					        <div id="taskCommentList">
				            	<!-- taskCommentList 들어옴 -->
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/view/task/taskMemberModal.jsp"%>
<%@ include file="/WEB-INF/view/task/lowerTaskModal.jsp"%>
<%@ include file="/WEB-INF/view/task/updateTaskLocationModal.jsp"%>
<%@ include file="/WEB-INF/view/task/updateTaskListLocationModal.jsp"%>
<%@ include file="/WEB-INF/view/task/copyTaskListModal.jsp"%>
<%@ include file="/WEB-INF/view/task/copyTaskModal.jsp"%>
<%@ include file="/WEB-INF/view/task/updateTaskCmtModal.jsp"%>
<!--/ User Chat profile right area -->