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
  // 프로젝트 번호 받기
  var projectNo;
  // 아이디, 값 받을 변수
  var $id, $value;
  // 업무리스트 내용 담을 배열
  var kanban_board_data = new Array();
  // 업무리스트 안에 넣을 업무 맵
  var task_list = new Array();
  
  
  // Kanban Board and Item Data passed by json
  // 프로젝트번호에 맞는 업무멤버 조회
 /* $.ajax({
		async : false,
		type : 'POST',
		url : '/safari/taskMember',
		success : function(json){
			// 디버깅
			console.log("업무멤버 조회");
			console.log(json);
			
			$(json).each(function(index, item){
				// 배열에 넣기
				task_list.push({
					user : 이미지들어가는 배열이
				});
			});
		}
  }); */
  
  // 프로젝트번호에 맞는 업무 조회
  $.ajax({
		async : false,
		type : 'POST',
		url : '/safari/task',
		success : function(json){
			// 디버깅
			console.log("업무 조회");
			console.log(task_list);
			
			$(json).each(function(index, item){
				// 배열에 넣기
				task_list.push({
					id : item.taskNo,
					title : item.taskTitle,
					dueDate : item.taskDeadline,
					tasklistNo : item.tasklistNo
				});
			});
		}
  });
  // 프로젝트번호에 맞는 업무리스트 조회
  $.ajax({
		async : false,
		type : 'POST',
		url : '/safari/taskList',
		success : function(json){
		    // 디버깅
		    console.log("업무리스트 조회");
		    console.log(json);
		    
			$(json).each(function(index, item){
				  // 비어있는 배열 변수를 생성
				  var temp = new Array();
				  // 프로젝트 번호 세팅
				  projectNo = item.projectNo;
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
				  console.log("temp");
				  console.log(temp);
				  
				  // 배열에 담기
				  kanban_board_data.push({
				      id: item.tasklistNo,
				      title: item.tasklistTitle,
				      item: temp
				      // 업무 (현재는 샘플데이터)
				      //[{
				          // id: "11",
				          // title: "Facebook Campaign 😎",
				          // border: "success",
				          // dueDate: "Feb 6",
				          // comment: 1,
				          // attachment: 3,
				          // users: [
				          // ]
				        //}
				      //]
				    }
				  );
			});
		}
  });
  // 디버깅
  console.log("전체 데이터");
  console.log(kanban_board_data);
  
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
      
      // 업무 상세 보기
      $.ajax({
	  	async : false,
		type : 'GET',
		data : { taskNo : kanban_curr_item_id },
		url : '/safari/taskDetail',
		success : function(json){
			$(json).each(function(index, item){
				// 디버깅
				console.log(item);
				
				// 날짜와 시간을 데이터베이스에 있는 시간에 맞게 맞추기	
				let start = dateFormat(new Date(item.taskStart));
				let date = dateFormat(new Date(item.taskDeadline));
				let end = dateFormat(new Date(item.taskEnd));
				
				// 클래스에 맞는 value 값 넣어주기
				$('.edit-kanban-item-id').val(kanban_curr_item_id);
				$('.edit-kanban-item-content').val(item.taskContent);
				$('.edit-kanban-item-tasklistNo').val(item.tasklistTitle);
				$('.edit-kanban-item-point').val(item.taskPoint);
				$('.edit-kanban-item-start').val(start);
				$('.edit-kanban-item-date').val(date);
				$('.edit-kanban-item-end').val(end);
			});
		}
	  });
      
      // 디버깅
      console.log(kanban_curr_item_id);
      console.log(kanban_item_title);
      
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
        console.log("새로운 업무 : " + text);
        console.log("id : " + $id);
        
        // 새로운 업무 추가
        $.ajax({
			async : false,
			type : 'POST',
			url : '/safari/insertTask',
			data : {
				taskTitle : text,
				tasklistNo : $id
				},
			success : function(json){
				if(json != 'ok'){
					alert('업무 추가를 실패했습니다.');
					return;
				} else {
					alert('업무 추가를 성공했습니다.');
				}
			}
	     });
		
        formItem.parentNode.removeChild(formItem);
      });
      $(document).on("click", "#CancelBtn", function () {
        $(this).closest(formItem).remove();
      });
    },
    addItemButton: true, // add a button to board for easy item creation 쉬운 항목 생성을 위해 게시판에 버튼 추가
    boards: kanban_board_data // data passed from defined variable 정의된 변수에서 전달된 데이터
    
  });
  
  // 업무 수정
  
  $('.update-kanban-item').click(function(){
	// 날짜와 시간을 데이터베이스에 있는 시간에 맞게 맞추기	
	let start = dateFormat(new Date($('.edit-kanban-item-start').val()));
	let date = dateFormat(new Date($('.edit-kanban-item-date').val()));
	let end = dateFormat(new Date($('.edit-kanban-item-end').val()));
	
	// 해당 클래스에 value값 변경해서 넣기
	$('.edit-kanban-item-start').val(start);
	$('.edit-kanban-item-date').val(date);
	$('.edit-kanban-item-end').val(end);
	
	// 디버깅
	console.log($('.edit-kanban-item-date').val());
	
	// 버튼누를시 제출하기
	$('.edit-kanban-item').submit();
  });
  
  
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

      // 사용자가 정의되어 있는지 확인하고 사용자 배열에서 값을 가져오기 위해 반복합니다.
      if (typeof $(board_item_el).attr("data-users") !== "undefined") {
        for (kanban_users in kanban_board_data[kanban_data].item[kanban_item].users) {
          board_item_users +=
            '<li class="avatar pull-up my-0">' +
            '<img class="media-object" src=" ' +
            kanban_board_data[kanban_data].item[kanban_item].users[kanban_users] +
            '" alt="Avatar" height="18" width="18">' +
            "</li>";
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
      // check if Image is defined or not 이미지가 정의되어 있는지 확인
      if (typeof $(board_item_el).attr("data-image") !== "undefined") {
        board_item_image =
          '<div class="kanban-image mb-1">' +
          '<img class="img-fluid" src=" ' +
          kanban_board_data[kanban_data].item[kanban_item].image +
          '" alt="kanban-image">';
        ("</div>");
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

  // 업무리스트 추가
  // Add new kanban board 
  //---------------------
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
        '<a class="dropdown-item" href="#"><i class="feather icon-link mr-50"></i>링크 복사</a>' +
        '<a class="dropdown-item kanban-delete" id="kanban-delete" href="#"><i class="feather icon-trash-2 mr-50"></i>삭제</a>' +
        "</div>" + "</div>";
      var kanbanNewDropdown = $(kanbanNewBoard).find("header");
      $(kanbanNewDropdown).append(kanbanNewBoardData);
    }
    i++;
	
	// 업무리스트 추가하기
    console.log("projectNo값 : " + projectNo);
	$.ajax({
		async : false,
		type : 'POST',
		url : '/safari/insertTaskList',
		data : {
			tasklistTitle : '새 업무리스트',
			projectNo : projectNo
			},
		success : function(json){
			console.log("projectNo값 여기에 들어와야함 : " + projectNo);
			if(json != 'ok'){
				alert('업무리스트 추가를 실패했습니다.');
				return;
			} else {
				alert('업무리스트 추가를 성공했습니다.');
			}
		}
     });
  });

  // 업무리스트 삭제
  // Delete kanban board 
  //---------------------
  $(document).on("click", ".kanban-delete", function () {
    $id = $(this)
      .closest(".kanban-board")
      .attr("data-id");
    //addEventListener("click", function () {
      KanbanExample.removeBoard($id);
      console.log("id값 : " + $id);
	//});
	 $.ajax({
		async : false,
		type : 'POST',
		url : '/safari/deleteTaskList',
		data : {tasklistNo : $id},
		success : function(json){
			console.log("id값 여기에 들어와야함 : " + $id);
			if(json != 'ok'){
				alert('업무리스트 삭제를 실패했습니다.');
				return;
			} else {
				alert('업무리스트 삭제를 성공했습니다.');
			}
		}
    });
  });

  // 칸반 보드 드롭다운
  // Kanban board dropdown
  // ---------------------

  var kanban_dropdown = document.createElement("div");
  kanban_dropdown.setAttribute("class", "dropdown");

  dropdown();

  function dropdown() {
    kanban_dropdown.innerHTML =
      '<div class="dropdown-toggle cursor-pointer" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-more-vertical"></i></div>' +
      '<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton"> ' +
      '<a class="dropdown-item" href="#"><i class="feather icon-link mr-50"></i>링크 복사</a>' +
      '<a class="dropdown-item kanban-delete" id="kanban-delete" href="#"><i class="feather icon-trash-2 mr-50"></i>삭제</a>' +
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
    console.log("$delete_item : " + $delete_item);
        
    addEventListener("click", function () {
      KanbanExample.removeElement($delete_item);
    });
    
    $.ajax({
		async : false,
		type : 'POST',
		url : '/safari/deleteTask',
		data : {taskNo : $delete_item},
		success : function(json){
			console.log("$delete_item값 여기에 들어와야함 : " + teskNo);
			if(json != 'ok'){
				alert('업무 삭제를 실패했습니다.');
				return;
			} else {
				alert('업무 삭제를 성공했습니다.');
			}
		}
    });
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
	console.log("data-id : " + $id);
  });
  
  // 업무리스트 수정
  // ------------------------------
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
	  	console.log("value : " + $value);
	  	
		$.ajax({
			async : false,
			type : 'POST',
			url : '/safari/updateTaskList',
			data : {
				tasklistNo : $id,
				tasklistTitle : $value
				},
			success : function(json){
				console.log("id값 여기에 들어와야함 : " + $id);
				if(json != 'ok'){
					alert('업무리스트 수정을 실패했습니다.');
					return;
				} else {
					alert('업무리스트 수정을 성공했습니다.');
				}
			}
		});	
		
		window.location.reload();
	}
  });
  
  // 날짜 포맷 메서드
  function dateFormat(date) {
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
  
  // 칸반 항목 - 날짜 선택
  // kanban Item - Pick-a-Date
  $(".edit-kanban-item-date").pickadate();
  $(".edit-kanban-item-start").pickadate();
  $(".edit-kanban-item-end").pickadate();
  
  // Perfect Scrollbar - 칸반 사이드바의 카드 콘텐츠
  // Perfect Scrollbar - card-content on kanban-sidebar
  if ($(".kanban-sidebar .edit-kanban-item .card-content").length > 0) {
    var kanbanSidebar = new PerfectScrollbar(".kanban-sidebar .edit-kanban-item .card-content", {
      wheelPropagation: false
    });
  }
  
  // 색상 옵션
  // select default bg color as selected option
  $("select").addClass($(":selected", this).attr("class"));

  // change bg color of select form-control
  $("select").change(function () {
    $(this)
      .removeClass($(this).attr("class"))
      .addClass($(":selected", this).attr("class") + " form-control text-white");
  });
});