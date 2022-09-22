<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- User new mail right area -->
<div class="kanban-sidebar">
    <div class="card shadow-none quill-wrapper">
        <div class="card-header d-flex justify-content-between align-items-center border-bottom px-2 py-1">
            <h3 class="card-title">업무 상세보기</h3>
            <button type="button" class="close close-icon">
                <i class="feather icon-x"></i>
            </button>
        </div>
        <!-- form start -->
        <form class="edit-kanban-item" action="${pageContext.request.contextPath }/safari/updateTask" method="post">
            <div class="card-content position-relative">
                <div class="card-body">
               		<input type="hidden" class="edit-kanban-item-id" name="taskNo">
                    <div class="form-group">
                        <label>업무 제목</label>
                        <input type="text" class="form-control edit-kanban-item-title" placeholder="업무 제목" name="taskTitle">
                    </div>
                    <div class="form-group">
                        <label>업무 내용</label>
                        <textarea class="form-control edit-kanban-item-content" placeholder="업무 내용" name="taskContent"></textarea>
                    </div>
                    <div class="form-group">
                        <label>시작일</label>
                        <input type="text" class="form-control edit-kanban-item-start" placeholder="시작일" name="taskStart">
                    </div>
                    <div class="form-group">
                        <label>마감일</label>
                        <input type="text" class="form-control edit-kanban-item-date" placeholder="마감일" name="taskDeadline">
                    </div>
                    <div class="form-group">
                        <label>종료일</label>
                        <input type="text" class="form-control edit-kanban-item-end" placeholder="종료일" name="taskEnd" readonly>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>색상 라벨</label>
                                <select class="form-control text-white">
                                    <option class="bg-primary" selected>Primary</option>
                                    <option class="bg-danger">Danger</option>
                                    <option class="bg-success">Success</option>
                                    <option class="bg-info">Info</option>
                                    <option class="bg-warning">Warning</option>
                                    <option class="bg-secondary">Secondary</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>중요도</label>
                                <select class="form-control text-white edit-kanban-item-point" name="taskPoint">
                                    <option value="" class="bg-primary" selected></option>
                                    <option value="1" class="bg-danger">1</option>
                                    <option value="2" class="bg-success">2</option>
                                    <option value="3" class="bg-info">3</option>
                                    <option value="4" class="bg-warning">4</option>
                                    <option value="5" class="bg-secondary">5</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                    	<label>배정된 멤버</label>
                         <a data-toggle="modal" href="#taskMemberModal"><input type="button" class="form-control edit-kanban-item-member memberBtn-modal text-left"></a>
	                </div>
                 </div>
           	</div>
            <div class="card-footer d-flex justify-content-end">
                <button type="reset" class="btn btn-danger delete-kanban-item mr-1">
                    <i class='feather icon-trash-2 mr-50'></i>
                    <span>삭제</span>
                </button>
                <button type="button" class="btn btn-primary glow update-kanban-item">
                    <i class='feather icon-play mr-50'></i>
                    <span>수정</span>
                </button>
            </div>
        </form>
        <!-- form start end-->
        <!-- 업무멤버 수정 modal 시작 -->
        <div class="modal fade text-left" id="taskMemberModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title text-text-bold-600" id="myModalLabel33">업무멤버 수정</label>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form method="post" action="#">
						<div class="modal-body">
							<div class="form-group">
		                    	<label>배정된 멤버</label>
		                        <input type="text" class="form-control edit-kanban-item-member text-left" readonly>
			                </div>
							<div class="form-group">
								<label>멤버 추가</label>
								<select class="form-control text-dark edit-kanban-item-point select-option" name="insertMember" id="insertMember">
									<!--  -->
								</select>
							</div>
							<div class="form-group">
								<label>멤버 삭제</label>
								<select class="form-control text-dark edit-kanban-item-point select-option" name="deleteMember" id="deleteMember">
									
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<a href="" class="btn btn-outline-primary btn" id="insertBtn">추가</a>
							<a href="" class="btn btn-outline-danger btn" id="deleteBtn">삭제</a>
							<input type="reset" class="btn btn-outline-secondary btn" data-dismiss="modal" value="닫기"> 
						</div>
					</form>
				</div>
			</div>
		</div>
        <!-- 업무멤버 수정 modal 끝 -->
    </div>
</div>
<!--/ User Chat profile right area -->