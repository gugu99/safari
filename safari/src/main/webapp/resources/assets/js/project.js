// 모달을 닫으면 새로고침
$('#hideBtn').on("click", function () {
	location.reload();
});

// 프로젝트 그룹 추가 버튼 클릭 시 input 창을 띄우는 메소드
function addProjectGroup(){
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	
	form = "<form method='post' action='" + contextPath + "/projectGroup'>"
				+ "<input type='text' name='projectGroupName'>"
				+ "<button type='submit' class='float-right'>생성</button>"
			+ "</form>";
	
	console.log(contextPath);
	console.log(form);
	
	$("#addProjectGroup").empty();
	$('#addProjectGroup').append(form);
};