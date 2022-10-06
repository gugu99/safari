<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 업무코멘트 업무로 만들기 modal 시작 -->
<div class="modal fade text-left" id="taskCmtReplyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel43" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<label class="modal-title text-text-bold-600" id="myModalLabel43">회신하기</label>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>받을 코멘트</label>
					<div class="text-dark" id="toTaskComment">
					
					</div>
				</div>
                <div class="form-group">
					<label>보낼 코멘트</label>
					<textarea class="form-control text-dark" id="fromTaskComment"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" id="taskCmtReplyBtn">회신하기</button>
				<input type="reset" class="btn btn-outline-secondary btn" data-dismiss="modal" value="닫기"> 
			</div>
		</div>
	</div>
</div>
<!-- 업무코멘트 업무로 만들기 modal 끝 -->