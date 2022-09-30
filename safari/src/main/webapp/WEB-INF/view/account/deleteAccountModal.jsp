<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 계정 삭제 modal 시작 -->
<form action="${pageContext.request.contextPath }/safari/delete-account" method="post" id="deleteForm">
	<div class="modal fade text-left" id="deleteAccountModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel41" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<label class="modal-title text-text-bold-600" id="myModalLabel41">계정 삭제하기</label>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p class="mt-1">
						한 번 삭제된 계정은 다시 복구할 수 없으며 영구적으로 삭제됩니다.
					</p>
	                <div class="form-group mt-5">
						<fieldset class="form-group floating-label-form-group">
                            <label for="memberEmail">이메일 계정확인</label>
                            <input type="email" class="form-control" placeholder="이메일을 입력해주세요" name="memberEmail" id="memberEmail">
                            <div class="mt-1 text-right">
	                            <input type="checkbox" id="check">
	                            <span>계정 삭제에 동의합니다.</span>
                            </div>
                        </fieldset>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-danger" id="deleteAccountBtn"><i class="feather icon-trash-2"></i>계정 삭제하기</button>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- 계정 삭제 modal 끝 -->