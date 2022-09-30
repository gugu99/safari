// 비밀번호 정규식
var reg_pass = RegExp(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[^\w]).{8,}/);
// 이메일 정규식
var reg_email = RegExp(/^[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\w+\.)+\w+$/);
// 워크스페이스 소유권 여부
var isWorkspace;


// 비밀번호변경
$('#changePwBtn').click(function(){
	
	if ($('#memberPw').val() == '') {
		alert('비밀번호칸이 빈칸입니다.');
		$('#memberPw').focus();
	} else if ($('#memberNewPw').val() == '') {
		alert('새 비밀번호칸이 빈칸입니다.');
		$('#memberNewPw').focus();
	} else if (!reg_pass.test($('#memberNewPw').val())) {
		alert('비밀번호형식을 확인해주세요.\n최소한 8자 대소문자 1개이상 + 숫자 1개이상 + 특수문자 1개이상');
		$('#memberNewPw').focus();
	} else if ($('#checkMemberNewPw').val() == '') {
		alert('새 비밀번호 확인칸이 빈칸입니다.');
		$('#checkMemberNewPw').focus();
	} else if ($('#memberPw').val() == $('#memberNewPw').val()) {
		alert('현재 비밀번호와 변경할 비밀번호가 같습니다.');
		$('#checkMemberNewPw').focus();
	} else if ($('#checkMemberNewPw').val() != $('#memberNewPw').val()) {
		alert('새 비밀번호와 새 비밀번호 확인이 다릅니다.');
		$('#checkMemberNewPw').focus();
	} else {
		$('#changePwForm').submit();
	}
});



// 계정삭제
// 소유권 이전 페이지에서 워크스페이스 / 워크스페이스멤버 리스트 보여주기
// ------------------------------------------------------------

$(document).on("click", ".deleteAccountBtn-modal", function () {
	// 워크스페이스 조회 (false인 경우만 modal띄우기)
	$.ajax({
		async : false,
		type : 'GET',
		url : '/safari/myWorkspaceList',
		success : function(json){
			isWorkspace = json;			
		}
	});
});	
	
console.log(isWorkspace);
// 삭제버튼을 누르면
$('#deleteAccountBtn').click(function(){
console.log(isWorkspace);
	if(isWorkspace.length > 0) {
		alert('워크스페이스 소유권이 있습니다.\n워크스페이스를 삭제하거나 소유권을 이전하셔야 합니다.');
		$('#memberEmail').focus();
	} else if($('#memberEmail').val() == '') {
		alert('이메일칸이 빈칸입니다.');
		$('#memberEmail').focus();
	} else if (!reg_email.test($('#memberEmail').val())) {
		alert('이메일형식을 확인해주세요.\nexample@example.com');
		$('#memberEmail').focus();
	} else if ($('#check').is(':checked') == false) {
		alert('계정 삭제에 동의 체크를 해주세요.');
		$('#check').focus();
	} else {
		$('#deleteForm').submit();
	}
});