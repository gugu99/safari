<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="tab-pane active" id="taskDetail" aria-labelledby="taskDetail-tab" role="tabpanel">
    <div class="card shadow-none quill-wrapper">
        <div class="card-header d-flex justify-content-between align-items-center border-bottom px-2 py-1">
            <h3 class="card-title">코멘트</h3>
            <button type="button" class="close close-icon">
                <i class="feather icon-x"></i>
            </button>
        </div>
        <!-- form start -->
            <div class="card-content position-relative">
                <div class="card-body">
                	<form class="edit-kanban-item" action="${pageContext.request.contextPath }/member/taskComment" method="post">
	               		<div class="form-group">
			                <label>코멘트</label>
			                <div class="snow-container border rounded p-1">
			                    <div class="compose-editor"></div>
			                    <div class="d-flex justify-content-end">
			                        <div class="compose-quill-toolbar">
			                            <span class="ql-formats mr-0">
			                                <button class="ql-link"></button>
			                                <button class="ql-image"></button>
			                                <button class="btn btn-sm btn-primary btn-comment ml-25">보내기</button>
			                            </span>
			                        </div>
			                    </div>
			                </div>
			            </div>
		        	</form>
                </div>
                <div class="card-footer">
                </div>
            </div>
        <!-- form start end-->
	</div>
</div>