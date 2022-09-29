// 계정삭제
// 소유권 이전 페이지에서 워크스페이스 / 워크스페이스멤버 리스트 보여주기
// ------------------------------------------------------------

var tasklistNo;

$(document).on("click", ".transferOfOwnershipModalBtn-modal", function () {
	// 워크스페이스 조회 (소유권이전을 위해)
	$.ajax({
		async : false,
		type : 'GET',
		url : '/safari/myWorkspaceList',
		success : function(json){
			
			// select default 값 초기화
			var str = "<option value=''></option>";
			
			// 반복문으로 select로 가공
			for(var i = 0; i < json.length; i++){
				str += '<option value="' + json[i].workNo + '" class="bg-info">' + json[i].workName + '</option>';
			}
			
			// 원하는 위치에 보여주기
			$('#selectWorkspace').html(str);
		}
	});
});	
	

// 워크스페이스멤버 리스트 보여주기
// ---------------------------------------- 
$('#selectWorkspace').on('change', function(){
	// 현재 위치한 업무리스트 번호 받아오기
	var value_str = document.getElementById('selectWorkspace');
	var workNo = value_str.options[value_str.selectedIndex].value;

	if(workNo == ''){
		return;
	}
	
	// 워크스페이스멤버 리스트 보여주기 - 나를 제외 (소유권이전을 위해) 
	$.ajax({
		async : false,
		type : 'GET',
		data : {
			workNo : workNo
		},
		url : '/safari/workspaceMemberListForOwnership',
		success : function(json){
			
			// select default 값 초기화
			var str = "<option value=''></option>";
			
			// 반복문으로 select로 가공
			for(var i = 0; i < json.length; i++){
				str += '<option value="' + json[i].workMemberEmail + '" class="bg-info">' + json[i].workMemberName + '</option>';
			}
			
			// 원하는 위치에 보여주기
			$('#selectWorkspaceMember').html(str);
		}
	});
});