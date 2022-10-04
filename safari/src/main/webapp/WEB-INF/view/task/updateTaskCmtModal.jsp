<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 업무코멘트 수정 modal 시작 -->
<div class="modal fade text-left" id="updateTaskCmtModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel43" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<label class="modal-title text-text-bold-600" id="myModalLabel43">업무코멘트 수정하기</label>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>업무코멘트 내용</label>
                    <textarea class="compose-editor form-control" id="updateTaskCmtContent" placeholder="댓글을 적어주세요."></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" id="updateTaskCmtBtn">수정</button>
				<input type="reset" class="btn btn-outline-secondary btn" data-dismiss="modal" value="닫기"> 
			</div>
		</div>
	</div>
</div>
<!-- 업무코멘트 수정 modal 끝 -->