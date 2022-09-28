// 업무리스트 위치변경 폼
// ---------------------------------------- 
var tasklistNo;

$(document).on("click", ".taskListBtn-modal", function () {
	// 현재 위치한 업무리스트 번호 받아오기
	$id = $(this)
      .closest(".kanban-board")
      .attr("data-id");
	// console.log($id);
	// 변수에 저장하기
	tasklistNo = $id;
	
	// 현재 프로젝트 이름 조회 (업무리스트 위치변경을 위해)
	$.ajax({
		async : false,
		type : 'POST',
		url : '/safari/projectNameBytaskListNo',
		data : {
			tasklistNo : tasklistNo
		},
		success : function(json){
			// console.log(json);
			// 현재위치 보여주기
			$('.taskListLocation').val(json);
		}
	});
	
	// 프로젝트 선택에 select 보여주기 (현재 워크스페이스의 모든 프로젝트 보여주기) 
	$.ajax({
		async : false,
		type : 'POST',
		url : '/safari/projectListByTask',
		success : function(json){
			
			// select default 값 초기화
			var str = "<option value=''></option>";
			
			// 반복문으로 select로 가공
			for(var i = 0; i < json.length; i++){
				str += '<option value="' + json[i].projectNo + '" class="bg-info">' + json[i].projectName + '</option>';
			}
			
			// 원하는 위치에 보여주기
			$('#selectProjectByTaskList').html(str);
		}
	});
	
});	

// 업무리스트 위치변경 액션
// ---------------------------------------- 
$('#updateTaskListLocation').click(function(){
	// 현재 위치한 업무리스트 번호 받아오기
	var value_str = document.getElementById('selectProjectByTaskList');
	var projectNo = value_str.options[value_str.selectedIndex].value;
	if(projectNo == ''){
		return;
	}
	// select 값을 받아와서 메서드 실행하기 (위치 변경 메서드)
	$.ajax({
		async : false,
		type : 'POST',
		data : {
			projectNo : projectNo,
			tasklistNo : tasklistNo
		},
		url : '/safari/updateTaskListLocation',
		success : function(json){
			if(json != 'ok'){
				alert('업무리스트 위치변경을 실패했습니다.');
			} else {
				alert('업무리스트 위치변경을 성공했습니다.');
			}
		}	
	});	
	
	// 프로젝트 번호에 알맞게 페이지 이동
    window.location.replace('/safari/taskList?projectNo=' + projectNo);
});