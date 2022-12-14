/*=========================================================================================
    File Name: kanban.js
    Description: kanban plugin
    ----------------------------------------------------------------------------------------
    Item Name: Stack - Responsive Admin Theme
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

$(document).ready(function () {
  var kanban_curr_el, kanban_curr_item_id, kanban_item_title, kanban_data, kanban_item, kanban_users;
  // 아이디, 값 받을 변수
  var $id, $value;
  // 업무리스트 내용 담을 배열
  var kanban_board_data = new Array();
  // 업무리스트 안에 넣을 업무 맵
  var task_list = new Array();
  // 하위업무리스트 넣을 리스트 맵
  var lowerTask_list = new Array();
  // 업무 멤버 리스트
  var member_list = new Array();
  // 업무 코멘트 리스트
  var taskCommentList = new Array();
  // 업무 코멘트 좋아요 리스트
  var taskCommentLikeList = new Array();
  // 프로젝트 멤버 담을 배열
  var projectMember = new Array();
  // 업무 멤버 배열
  var user = new Array();
  // 업무 코멘트 배열
  var cmtCnt = new Array();
  // 서브스트링에 있는 값 꺼내기
  var str = window.location.search;
  // 프로젝트 번호
  var projectNo;
  // 정렬
  var sort;
  // 검색
  var search;
  // 완료
  var check;
  // 코멘트 번호
  var taskCmtNo;
  
  // 프로젝트 번호 가져오기
  if(str.indexOf('&') == -1){
	projectNo = str.substring(str.indexOf('projectNo=') + 10);
  } else {
	projectNo = str.substring(str.indexOf('projectNo=') + 10, str.indexOf('&'));
  }
  // 정렬에 관한 설정
  if(str.indexOf('sort') == -1){
	sort = "0";
  } else {
	sort = str.substring(str.lastIndexOf('=') + 1);
  
 	$('#sort > option[value=' + sort + ']').attr('selected', true);
  }
  
  // 검색에 관한 설정
  if(str.indexOf('search') == -1){
	search = null;
  } else {
	if(str.indexOf('&sort=') == -1){
		search = decodeURIComponent(str.substring(str.indexOf('search=') + 7));	
	} else {
		search = decodeURIComponent(str.substring(str.indexOf('search=') + 7, str.lastIndexOf('&')));
	}
	
	$('#search').val(search);
  }
  
  // 완료에 관한 설정 || str.substring(str.indexOf('check=') + 6) == 'false'
  // check에 관한 것이 없으면 check = false
  if(str.indexOf('check') == -1){
	check = false;
	// check에 관한 것이 있다면 분기
  } else {
	if(str.indexOf('&s') == -1){
		check = str.substring(str.indexOf('check=') + 6) == 'false' ? false : true;
	} else {
		check = str.substring(str.indexOf('check=') + 6, str.indexOf('&s')) == 'false' ? false : true;
	}
  }
  
  $('#completeTaskCheck').prop('checked', check);
  
  // 리스트를 위한 조회
  // ----------------------------------------------------------
  // Kanban Board and Item Data passed by json
  
  // 업무코멘트 조회 - 멤버만 보임
  $.ajax({
	async : false,
		type : 'GET',
		url : '/member/taskCommentCnt',
		success : function(json){
			// console.log(json);
			cmtCnt = json;
	}
  });
  
  // 멤버 조회
  
  $.ajax({
		async : false,
		type : 'GET',
		url : '/safari/taskMember',
		success : function(json){
			// console.log(json);
			user = json;
		}
	});
	// console.log("user");
	// console.log(user);
  
  // 프로젝트번호에 맞는 업무 조회
  
  $.ajax({
		async : false,
		type : 'POST',
		data : {
			sort : sort,	
			search : search,
			check : check	
		},
		url : '/safari/task',
		success : function(json){
			// 디버깅
			// console.log("업무 조회");
			// console.log(json);
			
			$(json).each(function(index, item){
				
				var temp = new Array();
				for(var i = 0; i < user.length; i++) {
					if(user[i].taskNo == item.taskNo){
						temp.push(user[i].workMemberName);
						
						// console.log(temp);
					}
				}
				
				var temp1 = new Array();
				for(var i = 0; i < cmtCnt.length; i++) {
					if(cmtCnt[i].taskNo == item.taskNo){
						temp1.push(cmtCnt[i].cmtCnt)
					}
				}
								
				task_list.push({
					id : item.taskNo,
					title : item.taskTitle,
					dueDate : item.taskDeadline,
					tasklistNo : item.tasklistNo,
					users : temp,
					comment : temp1
				});
			});
			
 			// console.log(task_list);
		}
  });
  
  // 프로젝트번호에 맞는 업무리스트 조회
  $.ajax({
		async : false,
		type : 'POST',
		url : '/safari/taskList',
		success : function(json){
		    // 디버깅
		    // console.log("업무리스트 조회");
		    // console.log(json);
		    // console.log(json)
			$(json).each(function(index, item){
				  // 비어있는 배열 변수를 생성
				  var temp = new Array();
				  // 반복문
				  // 업무배열 길이만큼 반복한다.
				  for(var i = 0; i < task_list.length; i++){
					// 업무배열 안에 업무리스트번호와 현재 업무리스트번호가 같다면
					if(task_list[i].tasklistNo == item.tasklistNo){
						// 비어있는 temp배열에 넣는다.
						temp.push(task_list[i]);
					}
				  }
				  // temp배열을 확인하는 디버깅코드
				  // console.log("temp");
				  // console.log(temp);
				  
				  // 배열에 담기
				  kanban_board_data.push({
				      id: item.tasklistNo,
				      title: item.tasklistTitle,
				      item: temp
				    }
				  );
			});
		}
  });
  
  // 정렬
  // ---------------------------------------------
  
  $('#sort').on("change", function(){
		// 선택된 정렬 받아오기
		var value_str = document.getElementById('sort');
		sort = value_str.options[value_str.selectedIndex].value;
		
		if(sort == "0"){
			// 전체업무
		    window.location.replace('/member/taskList?projectNo=' + projectNo);
		} else {
		    if(search != null && check == null){
				// 검색과 정렬 같이 있을 경우
				window.location.replace('/member/taskList?projectNo=' + projectNo + "&search=" + search + "&sort=" + sort);
			} else if(search == null && check != null){
				// 정렬과 체크 같이 있을 경우
				window.location.replace('/member/taskList?projectNo=' + projectNo + "&check=" + check + "&sort=" + sort);
			} else if(search != null && check != null) {
				// 모두 다 있을 경우
				window.location.replace('/member/taskList?projectNo=' + projectNo + "&check=" + check + "&search=" + search + "&sort=" + sort);
			} else {
				// 조회 있는 경우
		    	window.location.replace('/member/taskList?projectNo=' + projectNo + "&sort=" + sort);
			}
		}
		
  });
  
  
  // 검색
  // ----------------------------------------------------------
  
  $('#searchBtn').click(function(){
	search = $('#search').val();
	console.log(search);
		
	if(search == null){
		// 전체업무
	    window.location.replace('/member/taskList?projectNo=' + projectNo);
	} else {
		if(sort != "0" && check == null){
			// 검색과 조회가 같이 있을 경우
			window.location.replace('/member/taskList?projectNo=' + projectNo + "&search=" + search + "&sort=" + sort);
		} else if(sort == "0" && check != null){
			// 검색과 체크 같이 있을 경우
			window.location.replace('/member/taskList?projectNo=' + projectNo + "&check=" + check + "&search=" + search);
		} else if(sort != "0" && check != null) {
			// 모두 다 있을 경우
			window.location.replace('/member/taskList?projectNo=' + projectNo + "&check=" + check + "&search=" + search + "&sort=" + sort);
		} else {
			// 검색만 있을 경우
			window.location.replace('/member/taskList?projectNo=' + projectNo + "&search=" + search);
		}
	}
  });
  
  // 완료된 업무
  // ----------------------------------------------------------
  
  $('#completeTaskCheck').on('change', function(){
	
  	// check가 되어있으면 완료된 업무 보기 - true
  	// 안되어있으면 완료된 업무 안보기 - false
  	// console.log($('#completeTaskCheck').is(':checked'));
	check = $('#completeTaskCheck').is(':checked');
	
	if(check == null){
		// 전체업무
	    window.location.replace('/member/taskList?projectNo=' + projectNo);
	} else {
		if(sort != "0" && search == null){
			// 체크와 정렬 같이 있을 경우
			window.location.replace('/member/taskList?projectNo=' + projectNo + "&check=" + check + "&sort=" + sort);
		} else if(sort == "0" && search != null){
			// 검색과 체크 같이 있을 경우
			window.location.replace('/member/taskList?projectNo=' + projectNo + "&check=" + check + "&search=" + search);
		} else if(sort != "0" && search != null) {
			// 모두 다 있을 경우
			window.location.replace('/member/taskList?projectNo=' + projectNo + "&check=" + check + "&search=" + search + "&sort=" + sort);
		} else {
			// 체크만 있을 경우
			window.location.replace('/member/taskList?projectNo=' + projectNo + "&check=" + check);
		}
	}
	
  });
  
  
  // 업무 멤버
  // ----------------------------------------------------------
  // member modal에 projectMember 객체 넘기기
 $(".memberBtn-modal").on("click", function(){
	// 멤버 select 초기화하기
    $("#insertMember").html('<option value=""></option>');
    $("#deleteMember").html('<option value=""></option>');

    // 프로젝트 멤버 보기
	  $.ajax({
	  	async : false,
		type : 'GET',
		data : {
			taskNo : $('.edit-kanban-item-id').val()	
		},
		url : '/safari/resultTaskMember',
		success : function(json){
			
			projectMember = json;
		 }
	  });
  
	// console.log("projectMember");
	// console.log(projectMember);
    for(var i = 0; i < projectMember.length; i++){
		$("#insertMember").append("<option value='"+ projectMember[i].projectMemberNo +"' class='bg-info'>"+ projectMember[i].workMemberName +"</option>");
    }
    for(var i = 0; i < member_list.length; i++){
		$("#deleteMember").append("<option value='"+ member_list[i].projectMemberNo +"' class='bg-info'>"+ member_list[i].workMemberName +"</option>");
    }
	// console.log(member_list[0].taskNo);
	// console.log($("#deleteMember").val());
	  
  });
  
  
  // 멤버 추가 버튼 누를 시 메서드 실행
  $("#insertBtn").on("click", function(){
	  // 선택된 멤버 받아오기
	  var value_str = document.getElementById('insertMember');
	  
	  // 멤버 추가
	  $.ajax({
	  	async : false,
		type : 'POST',
		data : {
			taskNo : $('.edit-kanban-item-id').val(),
			projectMemberNo : value_str.options[value_str.selectedIndex].value
 		},
		url : '/member/insertTaskMember',
		success : function(json){
			
			if(json != 'ok'){
				alert('멤버 추가를 실패했습니다.');
				return;
			} else {
				// 배열에 추가
				member_list.push({projectMemberNo : value_str.options[value_str.selectedIndex].value, workMemberName : value_str.options[value_str.selectedIndex].text});
				
				// 다시 배열을 value에 담기
				var str = "";
				for(var i = 0; i < member_list.length; i++){
					
					if(member_list[i].workMemberName != "undefined"){
						str += member_list[i].workMemberName + " ";
					}
				}
				// console.log(str);
				// 배정된 멤버를 넣어주기
				// 멤버 select 초기화하기
			    $("#insertMember").html('<option value=""></option>');
			    $("#deleteMember").html('<option value=""></option>');
			
			    // 프로젝트 멤버 보기
				  $.ajax({
				  	async : false,
					type : 'GET',
					data : {
						taskNo : $('.edit-kanban-item-id').val()	
					},
					url : '/safari/resultTaskMember',
					success : function(json){
						
						projectMember = json;
					 }
				  });
			  
				// console.log("projectMember");
				// console.log(projectMember);
			    for(var i = 0; i < projectMember.length; i++){
					$("#insertMember").append("<option value='"+ projectMember[i].projectMemberNo +"' class='bg-info'>"+ projectMember[i].workMemberName +"</option>");
			    }
			    for(var i = 0; i < member_list.length; i++){
					$("#deleteMember").append("<option value='"+ member_list[i].projectMemberNo +"' class='bg-info'>"+ member_list[i].workMemberName +"</option>");
			    }
				// console.log(member_list[0].taskNo);
				// console.log($("#deleteMember").val());
				$('.edit-kanban-item-member').val(str.replace("undefined ", ""));
				
				// alert('멤버 추가를 성공했습니다.');
			}
		 }
  	   }); 
  	   

  });
  
  // 멤버 삭제 버튼 누를 시 메서드 실행
  $("#deleteBtn").on("click", function(){
	  // 선택된 멤버 받아오기
	  var value_str = document.getElementById('deleteMember');
	 	
	  $.ajax({
	  	async : false,
		type : 'POST',
		data : {
			taskNo : $('.edit-kanban-item-id').val(),
			projectMemberNo : value_str.options[value_str.selectedIndex].value
 		},
		url : '/member/deleteTaskMember',
		success : function(json){
			// 디버깅
			// console.log("업무멤버 조회");
			// console.log(json);
			
			if(json != 'ok'){
				alert('멤버 삭제를 실패했습니다.');
				return;
			} else {
				// 멤버 배열의 길이만큼 반복한다.
				for(var i = 0; i < member_list.length; i++){
					// 원하는 값을 찾아서 (삭제한 멤버)
					if(member_list[i].projectMemberNo == value_str.options[value_str.selectedIndex].value){
						// 원하는 값만 제거한다.
						member_list.splice(i, 1);
						// 배열의 index를 참조하는 i의 값을 하나 감소시킨다. (길이가 변하기 때문에)
    					i--;
					}
				}
				// 다시 배열을 value에 담기
				var str = "";
				for(var i = 0; i < member_list.length; i++){
					if(member_list[i].workMemberName != "undefined"){
						str += member_list[i].workMemberName + " ";
					} 
				}
				// 멤버 select 초기화하기
			    $("#insertMember").html('<option value=""></option>');
			    $("#deleteMember").html('<option value=""></option>');
			
			    // 프로젝트 멤버 보기
				  $.ajax({
				  	async : false,
					type : 'GET',
					data : {
						taskNo : $('.edit-kanban-item-id').val()	
					},
					url : '/safari/resultTaskMember',
					success : function(json){
						
						projectMember = json;
					 }
				  });
			  
				// console.log("projectMember");
				// console.log(projectMember);
			    for(var i = 0; i < projectMember.length; i++){
					$("#insertMember").append("<option value='"+ projectMember[i].projectMemberNo +"' class='bg-info'>"+ projectMember[i].workMemberName +"</option>");
			    }
			    for(var i = 0; i < member_list.length; i++){
					$("#deleteMember").append("<option value='"+ member_list[i].projectMemberNo +"' class='bg-info'>"+ member_list[i].workMemberName +"</option>");
			    }
				
				// 배정된 멤버를 넣어주기
				$('.edit-kanban-item-member').val(str.replace("undefined ", ""));
				
				// alert('멤버 삭제를 성공했습니다.');
			}
		 }
  	   });
  });
  // 디버깅
  // console.log("전체 데이터");
  // console.log(kanban_board_data);
  
  
  // 업무
  // ----------------------------------------------------------
  // 칸반 보드
  // Kanban Board
  var KanbanExample = new jKanban({
    element: "#kanban-wrapper", // selector of the kanban container 칸반 컨테이너 선택자
    buttonContent: "+ 업무 추가", // text or html content of the board button 게시판 버튼의 텍스트 또는 html 콘텐츠
	// 현재 칸반 항목을 클릭하십시오
    // click on current kanban-item
    click: function (el) {
	  // 칸반 항목 클릭 시 칸반 오버레이 및 사이드바 표시 블록
      // kanban-overlay and sidebar display block on click of kanban-item
      $(".kanban-overlay").addClass("show");
      $(".kanban-sidebar").addClass("show");

	  // el을 var kanban_curr_el로 설정하고 제목을 업데이트할 때 이 변수를 사용합니다.
      // Set el to var kanban_curr_el, use this variable when updating title
      kanban_curr_el = el;

	  // 칸반 항목 & id 추출하고 각각의 변수에 설정
      // Extract  the kan ban item & id and set it to respective vars
      kanban_item_title = $(el).contents()[0].data;
      kanban_curr_item_id = $(el).attr("data-eid");
      
      // 업무 상세보기
      $.ajax({
	  	async : false,
		type : 'GET',
		data : { taskNo : kanban_curr_item_id },
		url : '/safari/taskDetail',
		success : function(json){
			// 상위업무 초기화
			$('#upperTask').html('');
			
			// 상위업무 받아오기
			if(json.taskUpperNo != null){
				 var upperTaskTitle = "";
				 
				 $.ajax({
					async : false,
					type : 'GET',
					url : '/safari/getUpperTaskTitle',
					data : {
						taskNo : json.taskUpperNo
					},
					success : function(json){
						upperTaskTitle = json;
					}
			 	 }); 
				
				// 상위업무 받기
				$('#upperTask').html(upperTaskTitle + '<i class="feather icon-corner-right-down ml-1"></i>');
			}
			// 디버깅
			// console.log("json");
			// console.log(json);
			// console.log(task_list);
			
			// 날짜와 시간을 데이터베이스에 있는 시간에 맞게 맞추기	
			let start = dateFormat(new Date(json.taskStart));
			let date = dateFormat_show(new Date(json.taskDeadline));
			let end = dateFormat_show(new Date(json.taskEnd));
			
			$('.edit-kanban-item-tasklistNo').val(json.tasklistNo);
			$('.edit-kanban-item-tasklistTitle').val(json.tasklistTitle);
			$('.edit-kanban-item-id').val(kanban_curr_item_id);
			$('.edit-kanban-item-content').val(json.taskContent);
			$('.edit-kanban-item-point').val(json.taskPoint);
			$('.edit-kanban-item-start').val(start.replace("NaN-0NaN-0NaN", ""));
			$('.edit-kanban-item-date').val(date.replace("NaN-0NaN-0NaN 0NaN:0NaN:0NaN", ""));
			$('.edit-kanban-item-end').val(end.replace("NaN-0NaN-0NaN 0NaN:0NaN:0NaN", ""));
			// 업무멤버 조회
			  $.ajax({
					async : false,
					type : 'POST',
					url : '/safari/taskMemberByTaskNo',
					data : {
						taskNo : $('.edit-kanban-item-id').val()
					},
					success : function(json){
						member_list = json;
					}
			  }); 
			// console.log("배정된 멤버");
			// console.log(member_list);
			var str = "";
			for(var i = 0; i < member_list.length; i++){
				if(member_list[i].workMemberName != "undefined"){
					str += member_list[i].workMemberName + " ";
				}
			}
			// console.log(str);
			// 배정된 멤버를 넣어주기
			$('.edit-kanban-item-member').val(str.replace("undefined ", ""));
			
			// 업무번호에 이어져있는 하위 업무 조회
			  $.ajax({
					async : false,
					type : 'POST',
					data : { 
						taskNo : $('.edit-kanban-item-id').val()
					},
					url : '/safari/lowerTask',
					success : function(json){
						lowerTask_list = json;
			 			// console.log(lowerTask_list);
				    }
		 	  }); 
		 	  
		 	  // 하위업무 리스트 보여주기
		 	  var str = "";
		 	  for(var i = 0; i < lowerTask_list.length; i++) {
					str += '<li>' + lowerTask_list[i].taskTitle + '</li>';
			  }
			  
			  $('.edit-kanban-item-task').html(str);
		}
	  });
      
	  // 업무코멘트 리스트 보여주기
	  cmt_list();
  
	  // 편집 제목 설정
      // set edit title
      $(".edit-kanban-item .edit-kanban-item-title").val(kanban_item_title);
    },
    
    buttonClick: function (el, boardId) {
	  // 새 요소를 추가하기 위한 양식 만들기
      // create a form to add add new element
      var formItem = document.createElement("form");
      formItem.setAttribute("class", "itemform");
      formItem.innerHTML =
        '<div class="form-group">' +
        '<textarea class="form-control add-new-item" rows="2" autofocus required></textarea>' +
        "</div>" +
        '<div class="form-group">' +
        '<button type="submit" class="btn btn-primary btn-sm mr-50">확인</button>' +
        '<button type="button" id="CancelBtn" class="btn btn-sm btn-danger">취소</button>' +
        "</div>";
        
	  // 제출 클릭 시 새 항목 추가
      // add new item on submit click
      KanbanExample.addForm(boardId, formItem);
      formItem.addEventListener("submit", function (e) {
        e.preventDefault();
        var text = e.target[0].value;
        KanbanExample.addElement(boardId, {
          title: text
        });
        $id = $(this)
	      .closest(".kanban-board")
	      .attr("data-id");
        // 디버깅
        // console.log("새로운 업무 : " + text);
        // console.log("id : " + $id);
        
        // 새로운 업무 추가
        $.ajax({
			async : false,
			type : 'POST',
			url : '/member/insertTask',
			data : {
				taskTitle : text,
				tasklistNo : $id
			},
			success : function(json){
				if(json != 'ok'){
					alert('업무 추가를 실패했습니다.');
					return;
				} // else {
					// alert('업무 추가를 성공했습니다.');
				// }
			}
	     });
		 window.location.reload();
        formItem.parentNode.removeChild(formItem);
      });
      $(document).on("click", "#CancelBtn", function () {
        $(this).closest(formItem).remove();
      });
    },
    addItemButton: true, // add a button to board for easy item creation 쉬운 항목 생성을 위해 게시판에 버튼 추가
    boards: kanban_board_data // data passed from defined variable 정의된 변수에서 전달된 데이터
   
  });
  
  // 업무 완료
  $('.complete-kanban-item').click(function(){
	
	$.ajax({
		async : false,
		type : 'POST',
		url : '/member/completeTask',
		data : {
			taskNo : $('.edit-kanban-item-id').val()
		},
		success : function(json){
			if(json != 'ok'){
				alert('업무완료를 실패했습니다.');
				return;
			} // else {
				// alert('업무완료를 성공했습니다.');
			// }
		}
     });
     
     window.location.reload();
	
  });
  
  // 업무 완료취소
  $('.cancel-kanban-item').click(function(){
	
	$.ajax({
		async : false,
		type : 'POST',
		url : '/member/cancelEndTask',
		data : {
			taskNo : $('.edit-kanban-item-id').val()
		},
		success : function(json){
			if(json != 'ok'){
				alert('업무완료취소를 실패했습니다.');
				return;
			} // else {
				// alert('업무완료취소를 성공했습니다.');
			// }
		}
     });
     
     window.location.reload();
	
  });
  
  // 업무 수정
  $('.update-kanban-item').click(function(){
	// 날짜와 시간을 데이터베이스에 있는 시간에 맞게 맞추기	
	let start = dateFormat(new Date($('.edit-kanban-item-start').val()));
	let date = dateFormat(new Date($('.edit-kanban-item-date').val()));
	let end = dateFormat(new Date($('.edit-kanban-item-end').val()));
	let datetime = date + timeFormat($('.edit-kanban-item-time').val());
	
	// 디버깅
	// console.log($('.edit-kanban-item-date').val());
	// console.log("////////");
	// console.log(start);
	// alert($('.edit-kanban-item-start').val());
	
	// 해당 클래스에 value값 변경해서 넣기
	$('.edit-kanban-item-start').val(start);
	$('.edit-kanban-item-date').val(datetime);
	$('.edit-kanban-item-end').val(end);
	
	// 버튼누를시 제출하기
	$('.edit-kanban-item').submit();
  });
  
  
  // 하위 업무 
  // ----------------------------------------------------------
  $('.lowerTaskBtn-modal').on("click", function(){
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
			$('#selectProjectByChangeLowerTask').html(str);
		}
    });
    
    // 선택된 프로젝트 번호에 맞는 업무 가져오기 
    $('#selectProjectByChangeLowerTask').on("change",function(){
		var value_str = document.getElementById('selectProjectByChangeLowerTask');
		// console.log(value_str.options[value_str.selectedIndex].value);
		// insertLowerTask를 select 만들기
		$.ajax({
			async : false,
			type : 'POST',
			data : {
				projectNo : value_str.options[value_str.selectedIndex].value,
				taskNo : $('.edit-kanban-item-id').val()
			},
			url : '/safari/taskForLowerTask',
			success : function(json){
				var str = "<option value=''></option>";
				// console.log(json);
				// html로 가공
				for(var i = 0; i < json.length; i++){
					str += '<option value="' + json[i].taskNo + '" class="bg-info">' + json[i].taskTitle + '</option>';
				}
				$('#insertTaskByChangeLowerTask').html(str);
			}	
		});	
	});
  });
  
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
					taskTitle : $('.lowerTask').val(),
					tasklistNo : $('.edit-kanban-item-tasklistNo').val()
				},
				url : '/member/insertLowerTask',
				success : function(json){
					if(json != 'ok'){
						alert('하위업무 생성을 실패했습니다.');
						return;
					} else {
						 $.ajax({
								async : false,
								type : 'POST',
								data : { 
									taskNo : $('.edit-kanban-item-id').val()
								},
								url : '/safari/lowerTask',
								success : function(json){
									lowerTask_list = json;
						 			// console.log(lowerTask_list);
							    }
					 	  }); 
							// 다시 배열을 value에 담기
							var str = "";
							for(var i = 0; i < lowerTask_list.length; i++){
								str += '<li><a href="/member/taskList?projectNo=' + lowerTask_list[i].projectNo + '">' + lowerTask_list[i].taskTitle + ' </a></li>';
							}
							  
							$('.edit-kanban-item-task').html(str);
							
							// alert('하위업무 생성을 성공했습니다.');
					}
				}	
			});
		}
	});
	  
  
  // 하위업무 전환
  // ---------------- insertLowerTask
  $('#changeLowerTaskBtn').on("click", function(){
	var value_str = document.getElementById('insertTaskByChangeLowerTask');
	var value_project = document.getElementById('selectProjectByChangeLowerTask');
	$.ajax({
		async : false,
		type : 'POST',
		data : {
			taskNo : value_str.options[value_str.selectedIndex].value,
			lowerTaskNo : $('.edit-kanban-item-id').val()
		},
		url : '/member/updateLowerTask',
		success : function(json){
			if(json != 'ok'){
				alert('하위업무 전환을 실패했습니다.');
				return;
			} // else {
				// alert('하위업무 전환을 성공했습니다.');
			// }
		}	
    });
  });
  
  // 메인업무 전환
  // ---------------- taskModal
  $('#changeTaskBtn').on("click", function(){
	$.ajax({
		async : false,
		type : 'POST',
		data : {
			lowerTaskNo : $('.edit-kanban-item-id').val()
		},
		url : '/member/deleteLowerTask',
		success : function(json){
			if(json != 'ok'){
				alert('메인업무 전환을 실패했습니다.');
				return;
			} // else {
				// alert('메인업무 전환을 성공했습니다.');
			// }
		}	
    });
  });
  
  // 업무코멘트
  // ----------------------------------------------------
  // 업무코멘트 생성
  
  $('#cmtBtn').on("click", function(){
	// alert($('.compose-editor').val());
	// console.log($('.edit-kanban-item-id').val());
	// console.log($('.compose-editor').val());
	
	$.ajax({
		async : false,
		type : 'POST',
		data : {
			taskNo : $('.edit-kanban-item-id').val(),
			taskCmtContent : $('.compose-editor').val()
		},
		url : '/member/insertTaskComment',
		success : function(json){
			if(json != 'ok'){
				alert('업무 코멘트 생성을 실패했습니다.');
				return;
			} else {
				// alert('업무 코멘트 생성을 성공했습니다.');
				
				
				// 업무코멘트 리스트 보여주기
				cmt_list();
				  
				$('.compose-editor').val('');
			}
		}	
    });
    
    
  });
  
  // 업무코멘트 수정 Modal 띄우기
  $(document).on("click", ".updateTaskCmtBtn-modal", function () {
    taskCmtNo = $(this)
      .closest(".snow-container").attr("id");
	// 내용 가져오기
  	$.ajax({
		async : false,
		type : 'GET',
		data : { 
			taskCmtNo : taskCmtNo
		},
		url : '/member/taskCommentOne',
		success : function(json){
			// console.log("업무코멘트 수정");
			// console.log(json);
			
  			$('#updateTaskCmtContent').val(json.taskCmtContent);
		}
  	});
  });
  
  
  // 수정할 내용 가져오기
  $('#updateTaskCmtBtn').click(function(){
	// console.log(taskCmtNo);
	if($('#updateTaskCmtContent').val() == ''){
		alert('수정할 업무코멘트 내용이 빈칸입니다.');
	} else {
		// 업무코멘트 수정
		$.ajax({
			async : false,
			type : 'POST',
			data : { 
				taskCmtNo : taskCmtNo 
				, taskCmtContent : $('#updateTaskCmtContent').val()
			},
			url : '/member/updateTaskComment',
			success : function(json){
				// console.log("업무코멘트 수정");
				if(json != 'ok'){
					alert('본인이 작성한 코멘트인지 확인해주시기 바랍니다.');
					return;
				} else {
					// alert('업무코멘트 수정을 성공했습니다.');
					
					// 리스트 띄우기
					cmt_list();
					
					// Modal 닫기
					$(".updateTaskCmtBtn-modal").click();
				}
			}
	  	});
	}
  });
  
  
  // 업무코멘트 삭제
  $(document).on("click", ".deleteTaskCmtBtn", function () {
	
    var taskCmtNo = $(this)
      .closest(".snow-container").attr("id");
	// console.log(taskCmtNo);
	// alert(taskCmtNo);
	
	// 삭제하기
  	$.ajax({
		async : false,
		type : 'POST',
		data : { 
			taskCmtNo : taskCmtNo 
		},
		url : '/member/deleteTaskComment',
		success : function(json){
			// console.log("업무코멘트 삭제");
			if(json != 'ok'){
				alert('본인이 작성한 코멘트인지 확인해주시기 바랍니다.');
				return;
			} // else {
				// alert('업무코멘트 삭제를 성공했습니다.');
			// }
		}
  	});
  	
 	// 업무코멘트 리스트 보여주기
	cmt_list();
  });
  
  
  
  // 업무코멘트 좋아요
  // ----------------------------------------------------
  // 업무코멘트 좋아요 생성 / 삭제
  $(document).on("click", "#taskCmtLikeBtn", function () {
	
	var taskCmtNo = $(this)
      .closest(".snow-container").attr("id");
	// console.log(taskCmtNo);
	// alert(taskCmtNo);
	
	// 업무코멘트 좋아요 생성 / 삭제
  	$.ajax({
		async : false,
		type : 'POST',
		data : { 
			taskCmtNo : taskCmtNo 
		},
		url : '/member/taskCommentLike',
		success : function(json){
			// console.log("업무코멘트 좋아요 생성 / 삭제");
			if(json == 'not ok'){
				alert('좋아요를 실패했습니다.');
				return;
			} // else if(json == 'insert ok') {
				// alert('업무코멘트 좋아요를 성공했습니다.');
			// } else if(json == 'delete ok') {
				// alert('업무코멘트 좋아요를 취소했습니다.');
			// }
		}
  	});
  	
  	// 업무코멘트 리스트 보여주기
	cmt_list();
  });
  
  
  // 업무코멘트 고정
  // ----------------------------------------------------------
  // taskCmtFixBtn
  $(document).on("click", "#taskCmtFixBtn", function () {
	var taskCmtNo = $(this)
      .closest(".snow-container").attr("id");
	// 고정메서드 실행
	$.ajax({
		async : false,
		type : 'POST',
		data : { 
			taskCmtNo : taskCmtNo 
		},
		url : '/member/fixTaskComment',
		success : function(json){
			// console.log("업무코멘트 고정");
			if(json == 'not ok'){
				alert('업무코멘트 고정을 실패했습니다.');
				return;
			} // else {
				// alert('업무코멘트 고정을 성공했습니다.');
				
			// } 
		}		
	});
  	// 업무코멘트 리스트 보여주기
	cmt_list();
  });
  
  
  
  	// 업무코멘트 업무로 만들기
	// ---------------------------------------- 
	
	
	$(document).on("click", ".taskCmtToTaskBtn-modal", function () {
		// 현재 위치한 업무코멘트 내용 받아오기
		taskCmtNo = $(this)
	      .closest(".snow-container").attr("id");
	      
		// 내용 가져오기
	  	$.ajax({
			async : false,
			type : 'GET',
			data : { 
				taskCmtNo : taskCmtNo
			},
			url : '/member/taskCommentContent',
			success : function(json){
	  			$('#taskTitleByTaskCmtToTask').val(json);
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
				
				$('#selectProjectByTaskCmtToTask').html(str);
				
			}
	    });
	    
	    // 선택된 프로젝트 번호에 맞는 업무리스트 가져오기 
	    $('#selectProjectByTaskCmtToTask').on("change",function(){
			var value_str = document.getElementById('selectProjectByTaskCmtToTask');
			// console.log(value_str.options[value_str.selectedIndex].value);
			// tasklist를 select 만들기
			$.ajax({
				async : false,
				type : 'POST',
				data : {
					projectNo : value_str.options[value_str.selectedIndex].value,
					tasklistNo : $('.edit-kanban-item-tasklistNo').val()
				},
				url : '/safari/taskListByTaskForCopy',
				success : function(json){
					var str = "<option value=''></option>";
					// console.log(json);
					// html로 가공
					for(var i = 0; i < json.length; i++){
						str += '<option value="' + json[i].tasklistNo + '" class="bg-info">' + json[i].tasklistTitle + '</option>';
					}
					$('#selectTaskListByTaskCmtToTask').html(str);
				}	
			});	
		});
	});
	
	// 업무로 만들기버튼 누를시
	$('#taskCmtToTaskBtn').click(function(){
		// 선택된 값을 가져온다
		var value_str = document.getElementById('selectTaskListByTaskCmtToTask');
		var project_str = document.getElementById('selectProjectByTaskCmtToTask');
		var projectNo = project_str.options[project_str.selectedIndex].value;
		// 변수
		var task = new Map();
				
		if(projectNo == ''){
			$('#selectProjectByTaskCmtToTask').focus();
			return;
		} else if(value_str.options[value_str.selectedIndex].value == '') {
			$('#selectTaskListByTaskCmtToTask').focus();
			return;
		}
		
		// 업무 생성하기
		$.ajax({
			async : false,
			type : 'POST',
			url : '/member/insertTask',
			data : {
				taskTitle : $('#taskTitleByTaskCmtToTask').val(),
				tasklistNo : value_str.options[value_str.selectedIndex].value
			},
			success : function(json){
				if(json != 'ok'){
					alert('업무로 만들기를 실패했습니다.');
					return;
				} // else {
					// alert('업무로 만들기를 성공했습니다.');
				// }
			}
	    });
	    
	    // 프로젝트 번호에 알맞게 페이지 이동
	    window.location.replace('/member/taskList?projectNo=' + projectNo);
	});
  
  
  // 업무코멘트 회신하기 폼
  $(document).on("click", ".taskCmtReplyBtn-modal", function () {
	// 현재 위치한 업무코멘트 내용 받아오기
	taskCmtNo = $(this)
      .closest(".snow-container").attr("id");
      
	// 내용 가져오기
  	$.ajax({
		async : false,
		type : 'GET',
		data : { 
			taskCmtNo : taskCmtNo
		},
		url : '/member/taskCommentOne',
		success : function(json){
			console.log(json);
			var str = '<div class="snow-container border rounded p-1 mb-1" id="' + json.taskCmtNo + '">' +
						'<div class="compose-editor">' +
							'<div class="row">' +
								'<div class="col-10">' +
									'<div class="font-weight-bold">' +
										json.workMemberName + 
									'</div>' +
									'<div class="small">' + dateFormat_show(new Date(json.createDate)) + '</div>' +
				 				'</div>' + 
							'</div>' +
							'<hr>' +
							'<div>' +
								json.taskCmtContent + 
							'</div>' +
						'</div>' +
					'</div>';
					
  			$('#toTaskComment').html(str);
		}
  	});
  });
  
  // 업무코멘트 회신하기 액션
  $('#taskCmtReplyBtn').click(function(){
  	$.ajax({
		async : false,
		type : 'POST',
		data : { 
			taskCmtUpperNo : taskCmtNo,
			taskNo : $('.edit-kanban-item-id').val(),
			taskCmtContent : $('#fromTaskComment').val()
		},
		url : '/member/insertTaskComment',
		success : function(json){
			if(json != 'ok'){
				alert('업무코멘트 회신하기 실패했습니다.');
				return;
			} else {
				// alert('업무코멘트 회신하기 성공했습니다.');
				
				// 모달 닫고
				$('.taskCmtReplyBtn-modal').click();
				
			  	// 업무코멘트 리스트 보여주기
				cmt_list();
			}
		}
  	});
  	
  });
  
  
  // 칸반 보드 속성
  // ----------------------------------------------------------
  // Kanban 항목에 사용자 정의 데이터 속성에 대한 html 추가
  var board_item_id, board_item_el;
  // Kanban board loop
  for (kanban_data in kanban_board_data) {
    // Kanban board items loop
    for (kanban_item in kanban_board_data[kanban_data].item) {
      var board_item_details = kanban_board_data[kanban_data].item[kanban_item]; // set item details
      board_item_id = $(board_item_details).attr("id"); // set 'id' attribute of kanban-item

      (board_item_el = KanbanExample.findElement(board_item_id)), // find element of kanban-item by ID
      (board_item_users = board_item_dueDate = board_item_comment = board_item_attachment = board_item_image = board_item_badge =
        " ");
        
  	  // check if users are defined or not and loop it for getting value from user's array
      if (typeof $(board_item_el).attr("data-users") !== "undefined") {
        for (kanban_users in kanban_board_data[kanban_data].item[kanban_item].users) {
          board_item_users +=
            '<div class="font-center">' +
            '<div class="small">' +
            kanban_board_data[kanban_data].item[kanban_item].users[kanban_users] + 
            '</div>';
        }
      }
      // DueDate가 정의되어 있는지 확인
      // null일 경우도 보이지 않게 처리한다.
      if (typeof $(board_item_el).attr("data-dueDate") !== "undefined" && $(board_item_el).attr("data-dueDate") !== "null") {
        board_item_dueDate =
          '<div class="kanban-due-date mr-50">' +
          '<i class="feather icon-clock font-size-small mr-25"></i>' +
          '<span class="font-size-small">' +
          $(board_item_el).attr("data-dueDate") +
          "</span>" +
          "</div>";
      }
      // check if comment is defined or not 댓글이 정의되어 있는지 확인
      if (typeof $(board_item_el).attr("data-comment") !== "undefined" && $(board_item_el).attr("data-comment") != "") {
        board_item_comment =
          '<div class="kanban-comment mr-50">' +
          '<i class="feather icon-message-square font-size-small mr-25"></i>' +
          '<span class="font-size-small">' +
          $(board_item_el).attr("data-comment") +
          "</span>" +
          "</div>";
      }
      // check if attachment is defined or not 첨부 파일이 정의되어 있는지 확인
      if (typeof $(board_item_el).attr("data-attachment") !== "undefined") {
        board_item_attachment =
          '<div class="kanban-attachment">' +
          '<i class="feather icon-link font-size-small mr-25"></i>' +
          '<span class="font-size-small">' +
          $(board_item_el).attr("data-attachment") +
          "</span>" +
          "</div>";
      }
      
      // check if Badge is defined or not
      if (typeof $(board_item_el).attr("data-badgeContent") !== "undefined") {
        board_item_badge =
          '<div class="kanban-badge">' +
          '<div class="avatar bg-' +
          kanban_board_data[kanban_data].item[kanban_item].badgeColor +
          ' font-size-small font-weight-bold">' +
          kanban_board_data[kanban_data].item[kanban_item].badgeContent +
          "</div>";
        ("</div>");
      }
      
      // 사용자 정의 '칸반 footer' 추가
      // add custom 'kanban-footer'
      if (
        typeof (
          $(board_item_el).attr("data-dueDate") ||
          $(board_item_el).attr("data-comment") ||
          $(board_item_el).attr("data-users") ||
          $(board_item_el).attr("data-attachment")
        ) !== "undefined"
      ) {
        $(board_item_el).append(
          '<div class="kanban-footer d-flex justify-content-between mt-1">' +
          '<div class="kanban-footer-left d-flex">' +
          board_item_dueDate +
          board_item_comment +
          board_item_attachment +
          "</div>" +
          '<div class="kanban-footer-right">' +
          '<div class="kanban-users">' +
          board_item_badge +
          '<ul class="list-unstyled users-list cursor-pointer m-0 d-flex align-items-center">' +
          board_item_users +
          "</ul>" +
          "</div>" +
          "</div>" +
          "</div>" +
          "</div>"
        );
      }
      
      // 칸반 항목 이미지 추가
      // add Image prepend to 'kanban-Item'
      if (typeof $(board_item_el).attr("data-image") !== "undefined") {
        $(board_item_el).prepend(board_item_image);
      }
    }
  }


  // 업무리스트
  // Add new kanban board 
  // ----------------------------------------------------------
  var addBoardDefault = document.getElementById("add-kanban");
  var i = 1;
  addBoardDefault.addEventListener("click", function () {
    KanbanExample.addBoards([{
      id: "kanban-" + i, // generate random id for each new kanban
      title: "새 업무리스트"
    }]);
    var kanbanNewBoard = KanbanExample.findBoard("kanban-" + i)

    if (kanbanNewBoard) {
      $(".kanban-title-board").on("mouseenter", function () {
        $(this).attr("contenteditable", "true");
        $(this).addClass("line-ellipsis");
      });
      kanbanNewBoardData =
        '<div class="dropdown">' +
        '<div class="dropdown-toggle cursor-pointer" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-more-vertical"></i></div>' +
        '<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton"> ' +
        '<a data-toggle="modal" class="dropdown-item taskListBtn-modal" id="taskListBtn-modal" href="#updateTaskListLocationModal"><i class="feather icon-external-link mr-50"></i>위치 변경</a>' +
        '<a data-toggle="modal" class="dropdown-item copyTaskListBtn-modal" id="copyTaskListBtn-modal" href="#copyTaskListModal"><i class="feather icon-file-text mr-50"></i>복사</a>' +
        '<a data-toggle="modal" class="dropdown-item kanban-delete" id="kanban-delete" href="#deleteTaskListModal"><i class="feather icon-trash-2 mr-50"></i>삭제</a>' +
        "</div>" + "</div>";
      var kanbanNewDropdown = $(kanbanNewBoard).find("header");
      $(kanbanNewDropdown).append(kanbanNewBoardData);
    }
    i++;
	
	// 업무리스트 추가하기
    // console.log("projectNo값 : " + projectNo);
	$.ajax({
		async : false,
		type : 'POST',
		url : '/member/insertTaskList',
		data : {
			tasklistTitle : '새 업무리스트'
		},
		success : function(json){
			// console.log("projectNo값 여기에 들어와야함 : " + projectNo);
			if(json != 'ok'){
				alert('업무리스트 추가를 실패했습니다.');
				return;
			} // else {
				// alert('업무리스트 추가를 성공했습니다.');
			// }
		}
     });
     window.location.reload();
  });





  // 업무코멘트 리스트 함수
  // ----------------------------------------------------------
  function cmt_list() {
	// 변수
	var memberEmail = "";
	
	// 초기화
	taskCommentList = new Array();
	
	// 내가 쓴 코멘트만 수정/삭제 가능하게 세션에서 메일 받아오기
	  $.ajax({
			async : false,
			type : 'GET',
			url : '/member/memberEmail',
			success : function(json){
				memberEmail = json;
				// console.log(memberEmail);
		    }
	  }); 
	
	// 업무코멘트 좋아요 리스트 가져오기
      $.ajax({
			async : false,
			type : 'GET',
			data : { 
				taskNo : $('.edit-kanban-item-id').val()
			},
			url : '/member/taskCommentLikeList',
			success : function(json){
				taskCommentLikeList = json;
	 			// console.log(taskCommentLikeList);
		    }
	  }); 
	
	// 업무코멘트 리스트
	  $.ajax({
	  	async : false,
		type : 'GET',
		data : { taskNo : kanban_curr_item_id },
		url : '/member/taskCommentList',
		success : function(json){
			// console.log("업무코멘트 리스트");
			
			$(json).each(function(index, item){
				// 좋아요 개수를 넣어준다
				var temp = 0;
				for(var i = 0; i < taskCommentLikeList.length; i++) {
					if(taskCommentLikeList[i].taskCmtNo == item.taskCmtNo){
						temp = taskCommentLikeList[i].likeCnt;
						
						// console.log(temp);
					}
				}			
				// 배열에 담는다	
				taskCommentList.push({
					taskCmtNo : item.taskCmtNo,
					taskCmtContent : item.taskCmtContent,
					taskCmtWriter : item.taskCmtWriter,
					workMemberName : item.workMemberName,
					createDate : item.createDate,
					taskCmtUpperNo : item.taskCmtUpperNo,
					likeCnt : temp
				});
			});
		}
	  });	
	  
	  
	
	// 업무코멘트 리스트 보여주기
	  var str = "";
	    
	// 고정된 코멘트 있을 경우 가져오기 
	  $.ajax({
			async : false,
			type : 'GET',
			data : { 
				taskNo : $('.edit-kanban-item-id').val()
			},
			url : '/member/fixedTaskComment',
			success : function(json){
	 			if(json != ''){
		
	 				console.log(json);
	 				// 고정된 코멘트 먼저 넣어주기
					  str += '<div class="dropdown">' +
					  			'<div class="dropdown-toggle cursor-pointer mr-5 mb-2" role="button" id="fixTaskCmtDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' +
					  				'<a href="#"><i class="fa fa-thumb-tack mr-1"></i>고정 코멘트</a>' +
								'</div>' +
								'<div class="dropdown-menu dropdown-menu-right" aria-labelledby="taskCmtMenuBtn"> ';
					  str += 		'<div class="snow-container rounded p-1 mb-1" id="' + json.taskCmtNo + '">' +
										'<div class="compose-editor">' +
											'<div class="row">' +
												'<div class="col-10">' +
													'<div class="font-weight-bold">' +
														json.workMemberName + 
													'</div>' +
													'<div class="small">' + dateFormat_show(new Date(json.createDate)) + '</div>';
									
						str += 					'</div>' + 
											'</div>' +
											'<hr>' +
											'<div>' +
												json.taskCmtContent + 
											'</div>' +
										'</div>' +
									'</div>' +
								'</div>' +
					  		 '</div>';
				}
		    }
	  }); 
	
	
	// 리스트를 반복문으로 보여준다.
	  for(var i = 0; i < taskCommentList.length; i++) {
		 	let createDate = dateFormat_show(new Date(taskCommentList[i].createDate));
		 	var subCmt = '';
		 	if(taskCommentList[i].taskCmtUpperNo != undefined){
		 		console.log(taskCommentList[i].taskCmtUpperNo);
				// 내용 가져오기
			  	$.ajax({
					async : false,
					type : 'GET',
					data : { 
						taskCmtNo : taskCommentList[i].taskCmtUpperNo
					},
					url : '/member/taskCommentOne',
					success : function(json){
						console.log(json);
						subCmt = '<div class="snow-container border rounded p-1 mb-1" id="' + json.taskCmtNo + '">' +
									'<div class="compose-editor">' +
										'<div class="row">' +
											'<div class="col-10">' +
												'<div class="font-weight-bold bebebe">' +
													json.workMemberName + 
												'</div>' +
												'<div class="small bebebe">' + dateFormat_show(new Date(json.createDate)) + '</div>' +
							 				'</div>' + 
										'</div>' +
										'<hr>' +
										'<div class="bebebe">' +
											json.taskCmtContent + 
										'</div>' +
									'</div>' +
								'</div>';
					}
			  	});
			}
		 	
			str += '<div class="snow-container border rounded p-1 mb-1" id="' + taskCommentList[i].taskCmtNo + '">' +
						'<div class="compose-editor">' +
							'<div class="row">' +
								'<div class="col-10">' +
									'<div class="font-weight-bold">' +
										taskCommentList[i].workMemberName + 
									'</div>' +
									'<div class="small">' + createDate + '</div>';
									
									// 좋아요가 있을 시에만 보이기
									if(taskCommentList[i].likeCnt != 0){
										str += '<div class="small mt-1 text-primary"><i class="feather icon-thumbs-up small"></i>' + taskCommentList[i].likeCnt + '</div>';
									}
									
			str += 				'</div>' + 
								'<div class="col-2">' + 
									'<a data-toggle="modal" class="taskCmtReplyBtn-modal btn btn-sm" id="taskCmtReplyBtn-modal" href="#taskCmtReplyModal"><i class="feather icon-corner-up-left small"></i></a>' +
									'<a href="#" class="btn btn-sm" id="taskCmtLikeBtn">' +
										'<i class="feather icon-thumbs-up small"></i>' +
				 					'</a>' +
									'<div class="dropdown">' +
										'<div class="dropdown-toggle cursor-pointer mr-5" role="button" id="taskCmtMenuBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' +
										'</div>' +
										'<div class="dropdown-menu dropdown-menu-right" aria-labelledby="taskCmtMenuBtn"> ' +
											'<a data-toggle="modal" class="dropdown-item taskCmtToTaskBtn-modal" id="taskCmtToTaskBtn-modal" href="#taskCmtToTaskModal"><i class="feather icon-file-plus mr-50"></i>업무로 만들기</a>' +
											'<a href="#" class="dropdown-item" id="taskCmtFixBtn"><i class="feather icon-bookmark mr-50"></i>이 코멘트 고정하기</a>';
											
											// 본인의 것에만 수정/삭제 버튼보이기
						 					if(memberEmail == taskCommentList[i].taskCmtWriter){
												str += '<a data-toggle="modal" class="dropdown-item updateTaskCmtBtn-modal" id="updateTaskCmtBtn-modal" href="#updateTaskCmtModal"><i class="feather icon-edit mr-50"></i>수정</a>' +
													   '<a href="#" class="dropdown-item deleteTaskCmtBtn" id="deleteTaskCmtBtn"><i class="feather icon-trash-2 mr-50"></i>삭제</a>';
											}
				 					
											
			str += 						'</div>' +
									'</div>' +
								'</div>' +
							'</div>' +
							'<hr>' +
							subCmt +
							'<div>';
							
								if(subCmt != ''){
									str += '<i class="feather icon-corner-down-right mr-1"></i>';
								}
								
			str += 				taskCommentList[i].taskCmtContent + 
							'</div>' +
						'</div>' +
					'</div>';
	  }
	  
	  $('#taskCommentList').html(str);
  }
  

  // 칸반 보드 드롭다운
  // Kanban board dropdown
  // ----------------------------------------------------------

  var kanban_dropdown = document.createElement("div");
  kanban_dropdown.setAttribute("class", "dropdown");

  dropdown();

  function dropdown() {
    kanban_dropdown.innerHTML =
      '<div class="dropdown-toggle cursor-pointer" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-more-vertical"></i></div>' +
      '<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton"> ' +
      '<a data-toggle="modal" class="dropdown-item taskListBtn-modal" id="taskListBtn-modal" href="#updateTaskListLocationModal"><i class="feather icon-external-link mr-50"></i>위치 변경</a>' +
      '<a data-toggle="modal" class="dropdown-item copyTaskListBtn-modal" id="copyTaskListBtn-modal" href="#copyTaskListModal"><i class="feather icon-file-text mr-50"></i>복사</a>' +
      '<a data-toggle="modal" class="dropdown-item kanban-delete" id="kanban-delete" href="#deleteTaskListModal"><i class="feather icon-trash-2 mr-50"></i>삭제</a>' +
      "</div>";
    if (!$(".kanban-board-header div").hasClass("dropdown")) {
      $(".kanban-board-header").append(kanban_dropdown);
    }
  }
  
  // 칸반 오버레이 및 사이드바 숨기기
  // Kanban-overlay and sidebar hide
  // --------------------------------------------
  $(
    ".kanban-sidebar .delete-kanban-item, .kanban-sidebar .close-icon, .kanban-sidebar .update-kanban-item, .kanban-overlay"
  ).on("click", function () {
    $(".kanban-overlay").removeClass("show");
    $(".kanban-sidebar").removeClass("show");
  });
  
  // 업무 수정 / 삭제
  // ----------------------------------------------------------
  // 업무 수정
  // 필드에 대한 데이터 값 업데이트
  // Updating Data Values to Fields
  // 버튼은 save라고 되어있다
  // -------------------------------
  $(".update-kanban-item").on("click", function (e) {
    e.preventDefault();
  });

  // 업무 삭제
  // 칸반 항목 삭제
  // Delete Kanban Item
  // -------------------
  $(".delete-kanban-item").on("click", function () {
    $delete_item = kanban_curr_item_id;
    // 디버깅
    // console.log("$delete_item : " + $delete_item);
        
    addEventListener("click", function () {
      KanbanExample.removeElement($delete_item);
    });
    
    $.ajax({
		async : false,
		type : 'POST',
		url : '/member/deleteTask',
		data : {taskNo : $delete_item},
		success : function(json){
			// console.log("$delete_item값 여기에 들어와야함 : " + teskNo);
			if(json != 'ok'){
				alert('업무 삭제를 실패했습니다.');
				return;
			} // else {
				// alert('업무 삭제를 성공했습니다.');
			// }
		}
    });
    
    window.location.reload();
  });
  
  // 칸반 깃펜 편집기
  // Kanban Quill Editor
  // -------------------
  var composeMailEditor = new Quill(".snow-container .compose-editor", {
    modules: {
      toolbar: ".compose-quill-toolbar"
    },
    placeholder: "댓글을 적어주세요.",
    theme: "snow"
  });

  // Making Title of Board editable 편집 가능한 보드 제목 만들기
  // ------------------------------
  $(".kanban-title-board").on("click", function () {
	$(this).attr("contenteditable", "true");
    $(this).addClass("line-ellipsis");
    
    // 디버깅
	// console.log("data-id : " + $id);
  });
  
  
  // 업무리스트 수정 
  // ----------------------------------------------------------
  $(".kanban-title-board").on("keydown", function (event) {
   	if(event.keyCode === 13){
		// 업무리스트 쉬프트 + 엔터 클릭시 줄바꿈		
		if(!event.shiftKey){
			event.preventDefault();
		}
    	// js에서 사용할 id 추가하기
		$(this).attr("id", "kanban-title-board");
		
	    // 선택한 id를 변수에 담기 (이 id는 업무리스트의 데이터베이스 PK이다)
	   	$id = $(this)
	      .closest(".kanban-board")
	      .attr("data-id");
	      
		// 엔터를 누르는 동시에 현재 안에 값을 value로 저장한다.
    	$(this).attr("value", document.getElementById('kanban-title-board').innerHTML);
    	
    	// value를 변수에 담는다.
    	$value = $(this)
	  	  .attr("value");
	  	  
        // 디버깅
	  	// console.log("id : " + $id);
	  	// alert($value);
	  	
		$.ajax({
			async : false,
			type : 'POST',
			url : '/member/updateTaskList',
			data : {
				tasklistNo : $id,
				tasklistTitle : $value
			},
			success : function(json){
				// console.log("id값 여기에 들어와야함 : " + $id);
				if(json != 'ok'){
					alert('업무리스트 수정을 실패했습니다.');
					return;
				} // else {
					// alert('업무리스트 수정을 성공했습니다.');
				// }
			}
		});	
		
		window.location.reload();
	}
  });
  
  // 업무리스트 삭제 Modal
  // Delete kanban board 
  //---------------------
 $(document).on("click", ".kanban-delete", function () {
	
    $id = $(this)
      .closest(".kanban-board")
      .attr("data-id");
	
	// 업무리스트 삭제
	// -----------------------------------------------------------
	$('#taskListDeleteBtn').on("click", function(){
		$.ajax({
			async : false,
			type : 'POST',
			url : '/member/deleteTaskList',
			data : {tasklistNo : $id},
			success : function(json){
				// console.log("id값 여기에 들어와야함 : " + $id);
				if(json != 'ok'){
					alert('업무리스트 삭제를 실패했습니다.');
					return;
				} else {
					// alert('업무리스트 삭제를 성공했습니다.');
					
    				KanbanExample.removeBoard($id);
    				
					window.location.reload();
				}
			}
	    });
	});
  });
  
  
  
  // date 날짜 포맷 메서드
  // ----------------------------------------------------------
  function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear() + '-' + month + '-' + day + ' ';
  }
  
  // datetime 날짜 포맷 메서드
  // ----------------------------------------------------------
  function dateFormat_show(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
  } 
  
  // 시간 포맷 메서드
  // ----------------------------------------------------------
  function timeFormat(s) {
      let splitTime = s.split(':');
	  let ampm = s.slice(-3);
	
	  if (splitTime[0] !== '12') {
	    splitTime[0] = ampm === ' PM' ? parseInt(splitTime[0]) + 12 : splitTime[0];
	  } else {
	    splitTime[0] = ampm === ' AM' ? '00' : splitTime[0];
	  }
	  
	  return splitTime.join(':').replace(ampm, ":00");
  } 
  
  
  // 칸반 항목 - 날짜 선택
  // kanban Item - Pick-a-Date
  // ----------------------------------------------------------
  $(".edit-kanban-item-date").pickadate();
  $(".edit-kanban-item-start").pickadate();
  // $(".edit-kanban-item-end").pickadate();
  $(".edit-kanban-item-time").pickatime();
  $(".edit-kanban-item-deadline-time").pickatime();
  
  
  // Perfect Scrollbar - 칸반 사이드바의 카드 콘텐츠
  // Perfect Scrollbar - card-content on kanban-sidebar
  // ----------------------------------------------------------
  if ($(".kanban-sidebar .edit-kanban-item .card-content").length > 0) {
    var kanbanSidebar = new PerfectScrollbar(".kanban-sidebar .edit-kanban-item .card-content", {
      wheelPropagation: false
    });
  }
  
  // 색상 옵션
  // select default bg color as selected option
  // ----------------------------------------------------------
  $("select").addClass($(":selected", this).attr("class"));

  // change bg color of select form-control
  // ----------------------------------------------------------
  $("select").change(function () {
    $(this)
      .removeClass($(this).attr("class"))
      .addClass($(":selected", this).attr("class") + " form-control text-white");
  });
  

});