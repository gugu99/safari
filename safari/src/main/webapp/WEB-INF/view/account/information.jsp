<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mt-5">
	<h3 class="pass-dropdown">비밀번호 변경<i class="feather icon-chevron-down"></i></h3>
  	<div class="card border-grey border-lighten-3 px-2 py-2 m-0">
  		<div class="card-content">
      		<div class="card-body">
			<form action="${pageContext.request.contextPath }/account/recover-password" method="post" id="form">
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
		            <input type="password" class="form-control" placeholder="새 비밀번호를 한번 더 입력해주세요" name="checkMemberNewPw" id="checkMemberNewPw">
		        </fieldset>
		        <button type="button" class="btn btn-outline-primary btn-lg btn-block" id="btn"><i class="feather icon-lock"></i> 비밀번호 변경</button>
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
	   			<a data-toggle="modal" href="#transferOfOwnershipModal"><button type="button" class="transferOfOwnershipModalBtn-modal btn btn-outline-danger btn-lg btn-block"><i class="feather icon-trash-2"></i> 계정 삭제</button></a>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/view/account/transferOfOwnershipModal.jsp"%>