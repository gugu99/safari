<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 업무멤버 수정 modal 시작 -->
<div class="modal fade text-left" id="taskMemberModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<label class="modal-title text-text-bold-600" id="myModalLabel35">업무멤버 수정</label>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
                   	<label>배정된 멤버</label>
                       <input type="text" class="form-control edit-kanban-item-member text-left" readonly>
                </div>
				<div class="form-group">
					<label>멤버 추가</label>
					<select class="form-control text-dark" name="insertMember" id="insertMember">
						<!-- 멤버가 추가 된다. -->
					</select>
				</div>
				<div class="form-group">
					<label>멤버 삭제</label>
					<select class="form-control text-dark" name="deleteMember" id="deleteMember">
						<!-- 멤버가 추가 된다. -->
					</select>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" id="insertBtn">추가</button>
				<button class="btn btn-outline-danger" id="deleteBtn">삭제</button>
				<input type="reset" class="btn btn-outline-secondary btn" data-dismiss="modal" value="닫기"> 
			</div>
		</div>
	</div>
</div>
<!-- 업무멤버 수정 modal 끝 -->