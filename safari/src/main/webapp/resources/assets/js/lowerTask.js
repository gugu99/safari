// 하위 업무 생성
$('.lowerTask').on("keydown", function(event){
	if(event.keyCode === 13){
		// 엔터를 누르는 동시에 현재 안에 값을 value로 저장한다.
		// console.log($('.lowerTask').val());
		$.ajax({
			async : false,
			type : 'POST',
			data : {
				taskNo : $('.edit-kanban-item-id').val(),
				lowerTaskNo : value_str.options[value_str.selectedIndex].value
			},
			url : '/safari/insertLowerTask',
			success : function(json){
				if(json != 'ok'){
					alert('하위업무 추가를 실패했습니다.');
					return;
				} else {
					// 하위업무 리스트 보여주기
				 	lowerTask_list.push({
						projectNo : value_project.options[value_project.selectedIndex].value,
						taskNo : value_str.options[value_str.selectedIndex].value,
						taskTitle : value_str.options[value_str.selectedIndex].text
					});
					// 다시 배열을 value에 담기
					var str = "";
					for(var i = 0; i < lowerTask_list.length; i++){
						str += '<li><a href="/safari/taskList?projectNo=' + lowerTask_list[i].projectNo + '">' + lowerTask_list[i].taskTitle + ' </a></li>';
					}
					  
					$('.edit-kanban-item-task').html(str);
					
					alert('하위업무 추가를 성공했습니다.');
				}
			}	
		});
	}
});