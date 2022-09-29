<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 계정 삭제 modal 시작 -->
<form>
	<div class="modal fade text-left" id="transferOfOwnershipModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel42" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<label class="modal-title text-text-bold-600" id="myModalLabel42">소유권 이전하기</label>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p class="mt-1">
						계정을 삭제하기 전에 회원님의 워크스페이스, 프로젝트, 업무, 대화 <br>
						채널 소유권을 다른 팀원에게 이전해야합니다.
					</p>
					<div class="form-group mt-5">
						<label>워크스페이스 선택</label>
						<select class="form-control text-dark" id="selectWorkspace">
							<!-- 워크스페이스가 추가 된다. -->
						</select>
					</div>
					<div class="form-group">
						<label>소유권 이전할 멤버 선택</label>
						<select class="form-control text-dark" id="selectWorkspaceMember">
							<!-- 업무가 추가 된다. -->
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<a data-toggle="modal" href="#deleteAccountModal"><button type="button" class="deleteAccountBtn-modal btn btn-outline-danger"> 다음 : 계정 삭제하기</button></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 계정 삭제 modal 끝 -->
	
	<!-- 계정 삭제 modal 시작 -->
	
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
	                            <input type="checkbox" >
	                            <span>계정 삭제에 동의합니다.</span>
                            </div>
                        </fieldset>
					</div>
				</div>
				<div class="modal-footer">
					<a data-toggle="modal" href="#transferOfOwnershipModal"><button type="button" class="transferOfOwnershipBtn-modal btn btn-outline-primary"> 뒤로</button></a>
					<button type="submit" class="btn btn-outline-danger"><i class="feather icon-trash-2"></i>계정 삭제하기</button>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- 계정 삭제 modal 끝 -->