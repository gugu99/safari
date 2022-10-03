<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 업무코멘트 삭제 modal 시작 -->
<div class="modal fade text-left" id="deleteTaskCmtModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel42" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<label class="modal-title text-text-bold-600" id="myModalLabel42">업무코멘트 삭제하기</label>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>업무 제목</label>
					<input type="text" class="form-control text-dark" id="taskTitleByCopyTask">
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" id="copyTask">삭제</button>
				<input type="reset" class="btn btn-outline-secondary btn" data-dismiss="modal" value="닫기"> 
			</div>
		</div>
	</div>
</div>
<!-- 업무코멘트 삭제 modal 끝 -->