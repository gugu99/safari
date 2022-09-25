// 업무리스트 복사 폼
// ---------------------------------------- 
var tasklistNo;

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
		type : 'POST',
		url : '/safari/copyTaskList',
		data : {
			tasklistNo : tasklistNo
		},
		success : function(json){
			console.log(json);
			
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