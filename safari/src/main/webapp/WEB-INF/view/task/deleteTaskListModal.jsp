<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 업무리스트 삭제 modal 시작 -->
<div class="modal fade text-left" id="deleteTaskListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel40" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<label class="modal-title text-text-bold-600" id="myModalLabel40">업무리스트 삭제</label>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<p>
						<strong id="myDeleteTaskList"></strong>정말 삭제하시겠습니까?<br>
						업무리스트 / 업무 / 하위업무 / 멤버가 모두 삭제됩니다.
					</p>
				</div>
			</div>
			<div class="modal-footer">
				<input type="reset" class="btn btn-outline-secondary btn" data-dismiss="modal" value="아니오, 업무리스트를 유지합니다."> 
				<button class="btn btn-outline-primary" id="taskListDeleteBtn">삭제</button>
			</div>
		</div>
	</div>
</div>
<!-- 업무리스트 삭제 modal 끝 -->