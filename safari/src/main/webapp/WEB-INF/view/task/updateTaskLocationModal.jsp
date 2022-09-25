<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 업무 위치변경 modal 시작 -->
<div class="modal fade text-left" id="updateTaskLocationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel36" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<label class="modal-title text-text-bold-600" id="myModalLabel36">업무 위치변경</label>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
                   	<label>현재위치</label>
                   	<input type="text" class="form-control taskLocation" readonly>
                </div>
                <div class="form-group">
					<label>프로젝트 선택</label>
					<select class="form-control text-dark" id="selectLocationProject">
						<!-- 프로젝트가 추가 된다. -->
					</select>
				</div>
				<div class="form-group">
					<label>업무리스트 선택</label>
					<select class="form-control text-dark" id="selectLocationTaskList">
						<!-- 업무리스트가 추가 된다. -->
					</select>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" id="updateLocation">변경</button>
				<input type="reset" class="btn btn-outline-secondary btn" data-dismiss="modal" value="닫기"> 
			</div>
		</div>
	</div>
</div>
<!-- 업무 위치변경 modal 끝 -->