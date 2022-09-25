 
  // 업무 위치 변경
  // -------------------- updateLocation
  $('.projectBtn-modal').click(function(){
	// 현재위치 보여주기
	$('.taskLocation').val($('.edit-kanban-item-tasklistTitle').val());
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
			$('#selectLocationProject').html(str);
		}
    });
    
	// 선택된 프로젝트 번호에 맞는 업무리스트 가져오기 
    $('#selectLocationProject').on("change",function(){
		var value_str = document.getElementById('selectLocationProject');
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
				$('#selectLocationTaskList').html(str);
			}	
		});	
	});
  });
  
  // 업무 위치 변경
  // 선택된 프로젝트 번호에 맞는 업무리스트 가져오기 
  $('#updateLocation').click(function(){
	var value_str = document.getElementById('selectLocationTaskList');
	var value_project = document.getElementById('selectLocationProject');
	
	// 변경 ajax
	$.ajax({
		async : false,
		type : 'POST',
		data : {
			taskNo : $('.edit-kanban-item-id').val(),
			tasklistNo : value_str.options[value_str.selectedIndex].value
		},
		url : '/safari/updateTaskLocation',
		success : function(json){
			if(json != 'ok'){
				alert('업무 위치 변경을 실패했습니다.');
				return;
			} else {
				$('.taskLocation').val(value_str.options[value_str.selectedIndex].text);
				alert('업무 위치 변경을 성공했습니다.');
			}
		}	
	});	
	// 프로젝트 번호에 알맞게 페이지 이동
    window.location.replace('/safari/taskList?projectNo=' + value_project.options[value_project.selectedIndex].value);
  });
  