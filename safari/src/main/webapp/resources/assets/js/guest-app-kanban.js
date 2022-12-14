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
  // 프로젝트 멤버 담을 배열
  var projectMember = new Array();
  // 업무 멤버 배열
  var user = new Array();
  
  // 서브스트링에 있는 값 꺼내기
  var str = window.location.search;
  // 프로젝트 번호
  var projectNo = str.substring(str.indexOf('projectNo=') + 10);
  // 정렬
  var sort;
  // 검색
  var search;
  // 완료
  var check;
  
  // 리스트를 위한 조회
  // ----------------------------------------------------------
  // Kanban Board and Item Data passed by json
  
  
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
						
						//console.log(temp);
					}
				}				
				task_list.push({
					id : item.taskNo,
					title : item.taskTitle,
					dueDate : item.taskDeadline,
					tasklistNo : item.tasklistNo,
					users : temp
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
  
  
  
  // 업무 멤버
  // ----------------------------------------------------------
  // member modal에 projectMember 객체 넘기기
 $(".memberBtn-modal").on("click", function(){
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
  
	// console.log(member_list[0].taskNo);
	// console.log($("#deleteMember").val());
	  
  });
  
  
  // 업무
  // ----------------------------------------------------------
  // 칸반 보드
  // Kanban Board
  var KanbanExample = new jKanban({
    element: "#kanban-wrapper", // selector of the kanban container 칸반 컨테이너 선택자
    //buttonContent: "+ 업무 추가", // text or html content of the board button 게시판 버튼의 텍스트 또는 html 콘텐츠
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
			// 디버깅
			console.log("json");
			console.log(json);
			// console.log(task_list);
			
			// 날짜와 시간을 데이터베이스에 있는 시간에 맞게 맞추기	
			let start = dateFormat(new Date(json.taskStart));
			let date = dateFormat_show(new Date(json.taskDeadline));
			let end = dateFormat_show(new Date(json.taskEnd));
			
			// 클래스에 맞는 value 값 넣어주기
			//if(json.taskUpperNo != null){
			//	$('#upperTask').html('<i class="feather icon-corner-down-right"></i>' + json.upperTaskTitle);
			//}
			$('.edit-kanban-item-tasklistNo').val(json.tasklistNo);
			$('.edit-kanban-item-tasklistTitle').val(json.tasklistTitle);
			$('.edit-kanban-item-id').val(kanban_curr_item_id);
			$('.edit-kanban-item-title').val(json.taskTitle);
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
					str += '<li><a href="/member/taskList?projectNo=' + lowerTask_list[i].projectNo + '">' + lowerTask_list[i].taskTitle + ' </a></li>';
			  }
			  
			  $('.edit-kanban-item-task').html(str);
			  
		 }
	  });
      
     
    },
   
    boards: kanban_board_data // data passed from defined variable 정의된 변수에서 전달된 데이터
   
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
      if (typeof $(board_item_el).attr("data-comment") !== "undefined") {
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
  
  // 칸반 오버레이 및 사이드바 숨기기
  // Kanban-overlay and sidebar hide
  // --------------------------------------------
  $(
    ".kanban-sidebar .delete-kanban-item, .kanban-sidebar .close-icon, .kanban-sidebar .update-kanban-item, .kanban-overlay"
  ).on("click", function () {
    $(".kanban-overlay").removeClass("show");
    $(".kanban-sidebar").removeClass("show");
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
    // js에서 사용할 id 추가하기
    $(this).attr("id", "kanban-title-board");
    // 선택한 id를 변수에 담기 (이 id는 업무리스트의 데이터베이스 PK이다)
   	$id = $(this)
      .closest(".kanban-board")
      .attr("data-id");
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
		// 디버깅
		// alert('엔터키 이벤트');
		
		// 엔터를 누르는 동시에 현재 안에 값을 value로 저장한다.
    	$(this).attr("value", document.getElementById('kanban-title-board').innerHTML);
    	// value를 변수에 담는다.
    	$value = $(this)
	  	  .attr("value");
        // 디버깅
	  	// console.log("value : " + $value);
	
	}
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