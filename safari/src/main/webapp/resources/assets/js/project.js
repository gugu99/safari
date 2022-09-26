// 모달을 닫으면 새로고침
$('#hideBtn').on("click", function () {
	location.reload();
});

// 프로젝트 추가 빈칸검사
$('#projectBtn').click(function(){
	if($('#projectName').val() == ""){
		alert("프로젝트 이름을 입력해주세요.");
		$("#projectName").focus();
		return false;
	} else if($('#projectMemberList').val() == ""){
		alert("최소 한 명의 프로젝트 멤버가 필요합니다.");
		return false;
	} else {
		addProjectForm.submit();
	}
})

// 프로젝트 그룹 추가 버튼 클릭 시 input 창을 띄우는 메소드
function addProjectGroup(){
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	
	form = "<form method='post' action='" + contextPath + "/projectGroup' id='projectGroupForm'>"
				+ "<input type='text' name='projectGroupName' id='projectGroupName'>"
				+ "<button type='button' class='float-right' id='projectGroupBtn'>생성</button>"
			+ "</form>";
	
	console.log(contextPath);
	
	$("#addProjectGroup").empty();
	$('#addProjectGroup').append(form);
};

/*
// 프로젝트 그룹 추가 빈칸검사
$('#projectGroupBtn').on("click", "button", function(){
	console.log("clicked");
	
	if($('#projectGroupName').val() == ""){
		console.log("빈칸");
		alert("프로젝트 그룹 이름을 입력해주세요.");
		$("#projectGroupName").focus();
		return false;
	} else {
		// projectGroupForm.submit();
	}
})
*/