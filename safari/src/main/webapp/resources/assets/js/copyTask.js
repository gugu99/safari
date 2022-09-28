// 업무 복사 폼
// ---------------------------------------- 
var task;

$(document).on("click", ".copyBtn-modal", function () {
	// 현재 위치한 업무 이름 받아오기
	$('#taskTitleByCopyTask').val('[복사됨] ' + $('.edit-kanban-item-title').val());
	
	// 현재 위치한 업무 객체로 받아오기
	$.ajax({
		async : false,
		type : 'GET',
		data : {
			taskNo : $('.edit-kanban-item-id').val()	
		},
		url : '/safari/getTask',
		success : function(json){
			task = json;
			// console.log(json);
		}
    });
	
	// 프로젝트 선택
	$.ajax({
		async : false,
		type : 'POST',
		url : '/safari/projectListByTask',
		success : function(json){
			var str = "<option value=''></option>";
			// console.log(json);
			// html로 가공
			for(var i = 0; i < json.length; i++){
				str += '<option value="' + json[i].projectNo + '" class="bg-info">' + json[i].projectName + '</option>';
			}
			
			$('#selectProjectByCopyTask').html(str);
			
		}
    });
    
    // 선택된 프로젝트 번호에 맞는 업무리스트 가져오기 
    $('#selectProjectByCopyTask').on("change",function(){
		var value_str = document.getElementById('selectProjectByCopyTask');
		// console.log(value_str.options[value_str.selectedIndex].value);
		// tasklist를 select 만들기
		$.ajax({
			async : false,
			type : 'POST',
			data : {
				projectNo : value_str.options[value_str.selectedIndex].value,
				tasklistNo : $('.edit-kanban-item-tasklistNo').val()
			},
			url : '/safari/taskListByTask',
			success : function(json){
				var str = "<option value=''></option>";
				// console.log(json);
				// html로 가공
				for(var i = 0; i < json.length; i++){
					str += '<option value="' + json[i].tasklistNo + '" class="bg-info">' + json[i].tasklistTitle + '</option>';
				}
				$('#selectTaskListByCopyTask').html(str);
			}	
		});	
	});
});

// 복사버튼 누를시
$('#copyTask').click(function(){
	// 선택된 값을 가져온다
	var value_str = document.getElementById('selectTaskListByCopyTask');
	var project_str = document.getElementById('selectProjectByCopyTask');
	var projectNo = project_str.options[project_str.selectedIndex].value;
	// console.log( $('#selectTaskListByCopyTask').val());
	
	if(projectNo == ''){
		$('#selectProjectByCopyTask').focus();
		return;
	} else if(value_str.options[value_str.selectedIndex].value == '') {
		$('#selectTaskListByCopyTask').focus();
		return;
	}
	
	// 원하는 값으로 객체를 세팅한다
	task["tasklistNo"] = value_str.options[value_str.selectedIndex].value;
	task["taskTitle"] = $('#taskTitleByCopyTask').val();
	
	// 업무 복사하기
	$.ajax({
		async : false,
		type : 'POST',
		url : '/member/copyTask',
		data : {
			task : JSON.stringify(task)
		},
		success : function(json){
			if(json != 'ok'){
				alert('업무 복사를 실패했습니다.');
				return;
			} else {
				alert('업무 복사를 성공했습니다.');
			}
		}
    });
    
    // 프로젝트 번호에 알맞게 페이지 이동
    window.location.replace('/member/taskList?projectNo=' + projectNo);
});