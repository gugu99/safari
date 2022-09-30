<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mt-5">
	<h3 class="pass-dropdown">비밀번호 변경<i class="feather icon-chevron-down"></i></h3>
  	<div class="card border-grey border-lighten-3 px-2 py-2 m-0">
  		<div class="card-content">
      		<div class="card-body">
			<form action="${pageContext.request.contextPath }/safari/change-password" method="post" id="changePwForm">
		        <fieldset class="form-group floating-label-form-group">
		            <label for="memberPw">현재 비밀번호</label>
		            <input type="password" class="form-control" placeholder="현재 사용중인 비밀번호를 입력해주세요" name="memberPw" id="memberPw">
		        </fieldset>
		        <fieldset class="form-group floating-label-form-group mb-1">    
		            <label for="memberNewPw" id="mailconfirmTxt">새 비밀번호</label>
		            <input type="password" class="form-control" placeholder="새 비밀번호를 입력해주세요" name="memberNewPw" id="memberNewPw">
		        </fieldset>
		        <fieldset class="form-group floating-label-form-group mb-1">
		            <label for="checkMemberNewPw">새 비밀번호 확인</label>
		            <input type="password" class="form-control" placeholder="새 비밀번호를 한번 더 입력해주세요" id="checkMemberNewPw">
		        </fieldset>
		        <button type="button" class="btn btn-outline-primary btn-lg btn-block" id="changePwBtn"><i class="feather icon-lock"></i> 비밀번호 변경</button>
		    </form>
  			</div>
  		</div>
  	</div>
</div>
<hr>
<div class="mt-5">
	<h3 class="pass-dropdown">계정 삭제<i class="feather icon-chevron-down"></i></h3>
	<div class="card border-grey border-lighten-3 px-2 py-2 m-0">
		<div class="card-content">
	   		<div class="card-body">
	   			<p>
	   				한 번 삭제된 계정은 다시 복구할 수 없습니다. 계정이 삭제되면, 현재 계정에서 생성된 모든 데이터에 더이상 엑세스할 수 없습니다. <br>
	   				삭제 후, Safari를 다시 이용하고자 한다면, 새로 가입해주셔야합니다. 또한, 계정 삭제를 진행 함에 따라 자동 갱신이 취소되지 않습니다. <br>
	   				반드시 계정 삭제 전 요금제&결제 탭 아래에서 정기 결제 해지를 진행해주시길 바랍니다.
	   			</p>
	   			<p class="mt-5">
	   				워크스페이스 소유권을 가지고 있으실 경우 계정 삭제가 불가합니다. 
	   				<a href="${pageContext.request.contextPath }/safari/index"><strong class="text-danger">워크스페이스를 삭제</strong></a>하거나 
	   				<a href="${pageContext.request.contextPath }/member/workspaceMemberList"><strong class="text-danger">소유권을 이전</strong></a>하셔야 합니다. <br>
	   			</p>
	   			<a data-toggle="modal" href="#deleteAccountModal"><button type="button" class="deleteAccountBtn-modal btn btn-outline-danger btn-lg btn-block"><i class="feather icon-trash-2"></i> 계정 삭제</button></a>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/view/account/deleteAccountModal.jsp"%>