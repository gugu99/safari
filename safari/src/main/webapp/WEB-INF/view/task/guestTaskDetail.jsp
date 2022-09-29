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
            <div class="card-content position-relative">
                <div class="card-body">
               		<input type="hidden" class="edit-kanban-item-id" name="taskNo">
               		<input type="hidden" class="edit-kanban-item-tasklistNo" name="tasklistNo">
               		<input type="hidden" class="edit-kanban-item-tasklistTitle" name="tasklistTitle">
                    <div class="form-group">
                        <label>업무 제목</label>
                        <div id="upperTask"></div>
                        <input type="text" class="form-control edit-kanban-item-title" placeholder="업무 제목" name="taskTitle" readonly>
                    </div>
                    <div class="form-group">
                        <label>업무 내용</label>
                        <textarea class="form-control edit-kanban-item-content" placeholder="업무 내용" name="taskContent" readonly></textarea>
                    </div>
                    <div class="form-group">
                        <label>시작일</label>
                        <input type="text" class="form-control edit-kanban-item-start" placeholder="시작일" name="taskStart" readonly>
                    <div class="form-group mt-1">
                        <label>마감일</label>
                        <input type="text" class="form-control edit-kanban-item-date" placeholder="마감일" name="taskDeadline" readonly>
                        <input type="text" class="form-control edit-kanban-item-time" placeholder="시간" readonly>
                    </div>
                    <div class="form-group">
                        <label>종료일</label>
                        <input type="text" class="form-control edit-kanban-item-end" placeholder="종료일" id="taskEnd" readonly>
                        <div class="result"></div>
                    </div>
                    <div class="form-group">
                    	<label>배정된 멤버</label>
                         	<input type="button" class="form-control edit-kanban-item-member memberBtn-modal text-left">
	                </div>
			        <div class="form-group">
                        <label>중요도</label>
                        <select class="form-control text-dark edit-kanban-item-point" name="taskPoint">
                            <option value="" class="bg-primary" selected></option>
                        </select>
                    </div>
                   <div class="form-group">
                   		<label>하위업무</label>
                   		<ul class="edit-kanban-item-task">
                   			<!-- 하위 업무 리스트 -->
                   		</ul>
                   </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--/ User Chat profile right area -->