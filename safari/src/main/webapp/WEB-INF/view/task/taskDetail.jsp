<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        <form class="edit-kanban-item" action="${pageContext.request.contextPath }/safari/taskDetail" method="post">
            <div class="card-content position-relative">
                <div class="card-body">
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
                        <input type="text" class="form-control edit-kanban-item-date" placeholder="시작일" name="taskStart">
                    </div>
                    <div class="form-group">
                        <label>마감일</label>
                        <input type="text" class="form-control edit-kanban-item-date" placeholder="마감일" name="taskDeadline">
                    </div>
                    <div class="form-group">
                        <label>종료일</label>
                        <input type="text" class="form-control edit-kanban-item-date" placeholder="종료일" name="taskEnd">
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <div class="form-group">
                                <label>색상 라벨</label>
                                <select class="form-control text-white" name="taskLabel">
                                    <option class="bg-primary" selected>Primary</option>
                                    <option class="bg-danger">Danger</option>
                                    <option class="bg-success">Success</option>
                                    <option class="bg-info">Info</option>
                                    <option class="bg-warning">Warning</option>
                                    <option class="bg-secondary">Secondary</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label>중요도</label>
                                <select class="form-control text-white" name="taskPoint">
                                    <option value="default" selected></option>
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label>배정된 멤버</label>
                                <div class="d-flex align-items-center">
                                    <div class="avatar avatar-offline bg-info m-0 mr-50"><span class="fa fa-user"></span></div>
                                    <div class="badge-circle">
                                        <i class="feather icon-plus"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>파일</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="emailAttach">
                            <label class="custom-file-label" for="emailAttach">파일</label>
                        </div>
                    </div>
                    <!-- Compose mail Quill editor -->
                    <div class="form-group">
                        <label>댓글</label>
                        <div class="snow-container border rounded p-1">
                            <div class="compose-editor"></div>
                            <div class="d-flex justify-content-end">
                                <div class="compose-quill-toolbar">
                                    <span class="ql-formats mr-0">
                                        <button class="ql-bold"></button>
                                        <button class="ql-italic"></button>
                                        <button class="ql-underline"></button>
                                        <button class="ql-link"></button>
                                        <button class="ql-image"></button>
                                        <button class="btn btn-sm btn-primary btn-comment ml-25">댓글</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex justify-content-end">
                <button type="reset" class="btn btn-danger delete-kanban-item mr-1">
                    <i class='feather icon-trash-2 mr-50'></i>
                    <span>삭제</span>
                </button>
                <button type="submit" class="btn btn-primary glow update-kanban-item">
                    <i class='feather icon-play mr-50'></i>
                    <span>수정</span>
                </button>
            </div>
        </form>
        <!-- form start end-->
    </div>
</div>
<!--/ User Chat profile right area -->