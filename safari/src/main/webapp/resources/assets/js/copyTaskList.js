// 업무리스트 복사 폼
// ---------------------------------------- 
var tasklistNo;
var copyTaskList;

$(document).on("click", ".copyTaskListBtn-Modal", function () {
	// 현재 위치한 업무리스트 번호 받아오기
	$id = $(this)
      .closest(".kanban-board")
      .attr("data-id");
	// console.log($id);
	// 변수에 저장하기
	tasklistNo = $id;
	
	// 복사하기 위해 조회
	$.ajax({
		async : false,
		type : 'GET',
		url : '/safari/copyTaskList',
		data : {
			tasklistNo : tasklistNo
		},
		success : function(json){
			copyTaskList = json;
			
			$('#taskListTitleByCopyTaskList').val('[복사됨] ' + json.tasklistTitle);
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
			$('#selectProjectByCopyTaskList').html(str);
		}
    });
});

// 복사버튼 누를시
$('#copyTaskList').click(function(){
	// 선택된 값을 가져온다
	var value_str = document.getElementById('selectProjectByCopyTaskList');
	var projectNo = value_str.options[value_str.selectedIndex].value;
	// console.log( $('#taskListTitleByCopyTaskList').val());
	
	if(projectNo == ''){
		$('#selectProjectByCopyTaskList').focus();
		return;
	}
	
	// 원하는 값으로 객체를 세팅한다
	copyTaskList["projectNo"] = projectNo;
	copyTaskList["tasklistTitle"] = $('#taskListTitleByCopyTaskList').val();
	// console.log(copyTaskList);
	
	// 업무리스트 복사하기
	$.ajax({
		async : false,
		type : 'POST',
		url : '/safari/copyTaskList',
		data : {
			copyTaskList : JSON.stringify(copyTaskList)
		},
		success : function(json){
			if(json != 'ok'){
				alert('업무리스트 복사를 실패했습니다.');
				return;
			} else {
				alert('업무리스트 복사를 성공했습니다.');
			}
		}
    });
    
    // 프로젝트 번호에 알맞게 페이지 이동
	window.location.replace('/safari/taskList?projectNo=' + projectNo);

});