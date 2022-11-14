/*=========================================================================================
    File Name: app-chat.js
    Description: chat application.
    ----------------------------------------------------------------------------------------
    Item Name: Stack - Responsive Admin Theme
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

var chatSidebarListWrapper = $(".chat-sidebar-list-wrapper"),
	chatOverlay = $(".chat-overlay"),
	chatContainer = $(".chat-container"),
	chatSidebarProfileToggle = $(".chat-sidebar-profile-toggle"),
	chatProfileToggle = $(".chat-profile-toggle"),
	chatSidebarClose = $(".chat-sidebar-close"),
	chatProfile = $(".chat-profile"),
	chatUserProfile = $(".chat-user-profile"),
	chatProfileClose = $(".chat-profile-close"),
	chatSidebar = $(".chat-sidebar"),
	chatArea = $(".chat-area"),
	chatStart = $(".chat-start"),
	chatSidebarToggle = $(".chat-sidebar-toggle"),
	chatMessageSend = $(".chat-message-send");

$(document).ready(function () {
	"use strict";
	
	// $(".chat-sidebar-list-wrapper ul li").on("click", function () {
	// 동적으로 추가된 요소에 이벤트가 동작하지 않으므로
	// 아래처럼 조건을 바꾸어 이벤트를 선택자가 아니라 document에 위임
	$(document).on("click",".chat-sidebar-list-wrapper ul li",function(){
		// console.log('$(".chat-sidebar-list-wrapper ul li").on("click",');
		// 메시지 출력 부분의 하위 요소와 메시지 입력창 초기화
		$("#msgArea").empty();
		$("#msg").val(null);
		
		if ($(".chat-sidebar-list-wrapper ul li").hasClass("active")) {
			$(".chat-sidebar-list-wrapper ul li").removeClass("active");
		}
		
		$(this).addClass("active");
		
		// 채팅방이 선택된 경우
		if ($(".chat-sidebar-list-wrapper ul li").hasClass("active")) {
			// 클래스 값 변경
			chatStart.addClass("d-none");
			chatArea.removeClass("d-none");
		} else {
			chatStart.removeClass("d-none");
			chatArea.addClass("d-none");
		}
	});
	
	
	
	// 채팅 유저 리스트에 active 클래스를 주고 AJAX로 정보 받아오기
	$(document).on("click","#chat-list li", function(){
	// $("#chat-list li").on("click", function () {
		console.log("chatlist selected");
		
		let login = $("#login").val();
		let workMemberName = $("#workMemberName").val(); //?
		// 자식요소 중 class 이름이 chatRoomNo인 요소를 찾는다.
		let chatRoomNo = $(this).find('.chatRoomNo').val();
		
		let sockJs = null;
		let stomp = null;
		
		/*
		console.log("chatRoomName: " + chatRoomName);
		console.log("login: " + login);
		console.log("workMemberName: " + workMemberName);
		
		console.log("===================================");
		console.log("chatRoomNo: " + $(this).find('.chatRoomNo').val());
		console.log("===================================");
		*/
			
		// ajax로 방 정보와 기존 채팅 메시지 목록 받아오기
		function chatRoomInfo(){
			return new Promise(function(resolve, reject){
				$.ajax({
					type : 'get',
					url : '/member/chat/' + chatRoomNo,
					// 채팅 방 번호와 자기 자신의 workMemberNo를 전송
					data: { chatRoomNo : chatRoomNo},
					success: function(json){
						// console.log(json);
						resolve(json);
					}
				}); // end for ajax
			})
		}
		
		// return 받은 json을 메시지 영역에 append
		function append(json){
			return new Promise(function(resolve, reject){
				// console.log("APPEND");
				let chatMemberNo;
				
				$(json).each(function(index, item){
					// $("#chatRoomName").text(item.chatRoomName);
					$('.chat-container').scrollTop(0);
					chatMemberNo = item.chatMemberNo;
					/*
					console.log("===================================");
					console.log("chatMemberNo: " + chatMemberNo);
					console.log("===================================");
					*/
					
					for(let i = 0; i < item.msgList.length; i++){
					
						let str = "";
						let msgTime = timeForToday(item.msgList[i].createDate);
						// console.log(msgTime);
						
						// 접속자의 이름과 메시지 보낸 이의 이름이 같은 경우
						if(workMemberName === item.msgList[i].workMemberName){
							// console.log("나: " + item.msgList[i].chatMsg);
							
		                    str = '<div class="chat">'
		                    str += '<div class="chat-avatar">'
		                    	str += '<div class="avatar avatar-busy m-0 mr-50 bg-info">'
									str += '<span class="fa fa-user"></span>'
								str += '</div>' // end for avatar
		                        // str += '<img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="avatar" height="36" width="36"/>'
		                    	str += '<p>' + item.msgList[i].workMemberName + '<p>'
		                    str += '</div>' // end for chat-avatar
		                    	str += '<div class="chat-body">'
		                    		str += '<div class="chat-message">'
		                        		str += '<p>' + item.msgList[i].chatMsg + '</p>'
		                        		str += '<span class="chat-time">' + msgTime + '</span>'
		                    		str += '</div>' // end for chat-message
		                		str += '</div>' // end for chat-message
		            		str += '</div>'; // end for chat
		                } else {
		                    str = '<div class="chat chat-left">'
		                    str += '<div class="chat-avatar">'
		                        str += '<div class="avatar avatar-busy m-0 mr-50 bg-info">'
									str += '<span class="fa fa-user"></span>'
								str += '</div>'
		                        // str += '<img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="avatar" height="36" width="36"/>'
		                    	str += '<p>' + item.msgList[i].workMemberName + '<p>'
		                    str += '</div>'
		                    	str += '<div class="chat-body">'
		                    		str += '<div class="chat-message">'
		                       str += '<p>' + item.msgList[i].chatMsg + '</p>'
		                        str += '<span class="chat-time">' + msgTime + '</span>'
		                    str += '</div>'
		                	str += '</div>'
		            		str += '</div>';
		                }
						
						$("#msgArea").append(str);
					} // end for 반복문
				}) // end for json 함수
				
				// 자동 스크롤
				chatContainer.animate({
					scrollTop: chatContainer[0].scrollHeight
				}, 400)				
				
				resolve(chatMemberNo);
			})
		}
		
		// STOMP 통신 시작
		function stompConnection(chatMemberNo){
			sockJs = new SockJS("/stomp/chat"); 
			// registerStompEndpoints - registry.addEndpoint("/stomp/chat")
			// var sockJs = new SockJS("http://localhost:80/ws/chat", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]});
		
			stomp = webstomp.over(sockJs);
		
			// 2. connection 성공 시 콜백함수
			stomp.connect({}, function(){
				// console.log("STOMP connected!");
				//3. send(path, header, message)로 메세지를 보낼 수 있음
	            // stomp.send('/pub/chat/enter', JSON.stringify({chatRoomNo: chatRoomNo, workMemberName: workMemberName}));
				
				//4. subscribe(path, callback)으로 메세지를 받을 수 있음
	            stomp.subscribe("/sub/chat/" + chatRoomNo, function (chat) {
	            	// console.log("subscribe!!!");
	            	
	                let content = JSON.parse(chat.body);
	                let chatMemberEmail = content.chatMemberEmail;
	                let msg = content.chatMsg;
	                // console.log(chatMemberEmail + ": " + msg); 
	                let str = '';
	                
	                let msgTime = timeForToday(content.time);
	                
	                if(content.chatMemberEmail == null){
	                    str = '<div class="badge badge-pill badge-light-secondary my-1">' + msg + '</div>';
	                } else if(chatMemberEmail === login){
						// console.log("chatMemberEmail === login");
		
	                    str = '<div class="chat">'
	                    str += '<div class="chat-avatar">'
	                    	str += '<div class="avatar avatar-busy m-0 mr-50 bg-info">'
								str += '<span class="fa fa-user"></span>'
							str += '</div>'
	                        // str += '<img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="avatar" height="36" width="36"/>'
	                    	str += '<p>' + content.workMemberName + '<p>'
	                    str += '</div>'
	                    	str += '<div class="chat-body">'
	                    		str += '<div class="chat-message">'
	                        str += '<p>' + msg + '</p>'
	                        str += '<span class="chat-time">'+ msgTime + '</span>'
	                    str += '</div>'
	                	str += '</div>'
	            		str += '</div>';
	                } else {
						// console.log("else");
		
	                    str = '<div class="chat chat-left">'
	                    str += '<div class="chat-avatar">'
	                    	str += '<div class="avatar avatar-busy m-0 mr-50 bg-info">'
								str += '<span class="fa fa-user"></span>'
							str += '</div>'
	                        // str += '<img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="avatar" height="36" width="36"/>'
	                    	str += '<p>' + content.workMemberName + '<p>'
	                    str += '</div>'
	                    	str += '<div class="chat-body">'
	                    		str += '<div class="chat-message">'
	                        str += '<p>' + msg + '</p>'
	                        str += '<span class="chat-time">' + msgTime + '</span>'
	                    str += '</div>'
	                	str += '</div>'
	            		str += '</div>';
	                }
	                
	                	//	console.log(" === STOMP append === ");
			           $("#msgArea").append(str);
			           str = '';
			           
			           // 자동스크롤
			          chatContainer.animate({
							scrollTop: chatContainer[0].scrollHeight
						}, 400)	
					});
					
			        $("#button-send").off("click").on("click", function(e){
						// console.log("#button-send on click!!");
		                var msg = $("#msg").val();
		               	
		               	if(msg == "" || msg == null){
							// console.log("빈칸");
							return;
						}
						
						if (e.isComposing || e.keyCode === 229) {
							console.log("e.isComposing || e.keyCode === 229");
							return;
						}
		                
		                // console.log("STOMP SEND")
		                // console.log(workMemberName + "(" + chatMemberNo + "):" + msg);
		                
		                stomp.send('/pub/chat/message', JSON.stringify({chatRoomNo: chatRoomNo, chatMemberNo: chatMemberNo, chatMsg: msg, workMemberName: workMemberName, chatMemberEmail: login}));
		                $("#msg").val(null);
			        });
			        
			        // 엔터키를 누르면 submit 버튼이 눌리도록
			        $("#msg").keyup(function(event) {
	    				if (event.which === 13) {
							// console.log("enter key pressed!");
	        				$("#button-send").click();
	    				}
	    			});
				}); // end for stomp connect
		} // end for function stompConnection
		
		// 메시지 시간 계산 함수
		function timeForToday(value) {
	        const today = new Date();
	        const timeValue = new Date(value);
	
	        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	        
	        if (betweenTime < 1) return '방금전';
	        
	        if (betweenTime < 60) {
	            return `${betweenTime}분전`;
	        }
	
	        const betweenTimeHour = Math.floor(betweenTime / 60);
	        
	        if (betweenTimeHour < 24) {
	            return `${betweenTimeHour}시간전`;
	        }
	
	        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	        
	        if (betweenTimeDay < 365) {
	            return `${betweenTimeDay}일전`;
	        }
	
	        return `${Math.floor(betweenTimeDay / 365)}년전`;
 		}
		
		// 체이닝!!!!
		// 채팅방 정보와 메시지 리스트를 받아온 다음
		// 메시지를 특정 영역에 append 한 뒤
		// stomp 연결을 시작한다.
		
		chatRoomInfo()
		.then(append)
		.then(stompConnection);
	}); // end for chat-list click
	
	
	// menu user list perfect scrollbar initialization
	if (!$.app.menu.is_touch_device()) {
		if (chatSidebarListWrapper.length > 0) {
			var menu_user_list = new PerfectScrollbar(".chat-sidebar-list-wrapper");
		}
		// user profile sidebar perfect scrollbar initialization
		if ($(".chat-user-profile-scroll").length > 0) {
			var profile_sidebar_scroll = new PerfectScrollbar(".chat-user-profile-scroll");
		}
		// chat area perfect scrollbar initialization
		if (chatContainer.length > 0) {
			var chat_user_user = new PerfectScrollbar(".chat-container");
		}
		if ($(".chat-profile-content").length > 0) {
			var chat_profile_content = new PerfectScrollbar(".chat-profile-content");
		}
	} else {
		$('.chat-sidebar-list-wrapper').css('overflow', 'scroll');
		$('.chat-user-profile-scroll').css('overflow', 'scroll');
		$('.chat-container').css('overflow', 'scroll');
		$('.chat-profile-content').css('overflow', 'scroll');
	}
	
	// user profile sidebar toggle
	chatSidebarProfileToggle.on("click", function () {
		chatUserProfile.addClass("show");
		chatOverlay.addClass("show");
	});
	
	// user profile sidebar toggle
	chatProfileToggle.on("click", function () {
		chatProfile.addClass("show");
		chatOverlay.addClass("show");
	});
	
	// on profile close icon click
	chatProfileClose.on("click", function () {
		chatUserProfile.removeClass("show");
		chatProfile.removeClass("show");
		if (!chatSidebar.hasClass("show")) {
			chatOverlay.removeClass("show");
		}
	});
	
	// On chat menu sidebar close icon click
	chatSidebarClose.on("click", function () {
		chatSidebar.removeClass("show");
		chatOverlay.removeClass("show");
	});
	
	// on overlay click
	chatOverlay.on("click", function () {
		chatSidebar.removeClass("show");
		chatOverlay.removeClass("show");
		chatUserProfile.removeClass("show");
		chatProfile.removeClass("show");
	});
	
	// app chat favorite star click
	$(".chat-icon-favorite i").on("click", function (e) {
		$(this).parent(".chat-icon-favorite").toggleClass("warning");
		$(this).toggleClass("bxs-star bx-star");
		e.stopPropagation();
	});
	
	// menu toggle till medium screen
	if ($(window).width() < 992) {
		chatSidebarToggle.on("click", function () {
			chatSidebar.addClass("show");
			chatOverlay.addClass("show");
		});
	}
	
	// autoscroll to bottom of Chat area
	$(".chat-sidebar-list li").on("click", function () {
		chatContainer.animate({
			scrollTop: chatContainer[0].scrollHeight
		}, 400)
	});

	// click on main menu toggle will remove sidebars & overlays
	$(".menu-toggle").click(function () {
		chatSidebar.removeClass("show");
		chatOverlay.removeClass("show");
		chatUserProfile.removeClass("show");
		chatProfile.removeClass("show");
	});

	// chat search filter
	$("#chat-search").on("keyup", function () {
		var value = $(this).val().toLowerCase();
		if (value != "") {
			$(".chat-sidebar-list-wrapper .chat-sidebar-list li").filter(function () {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
			});
		} else {
			// if search filter box is empty
			$(".chat-sidebar-list-wrapper .chat-sidebar-list li").show();
		}
	});
	
	// window resize
	$(window).on("resize", function () {
		// remove show classes from overlay when resize, if size is > 992
		if ($(window).width() > 992) {
			if (chatOverlay.hasClass("show")) {
				chatOverlay.removeClass("show");
			}
		}
		// menu toggle on resize till medium screen
		if ($(window).width() < 992) {
			chatSidebarToggle.on("click", function () {
				chatSidebar.addClass("show");
				chatOverlay.addClass("show");
			});
		}
		// disable on click overlay when resize from medium to large
		if ($(window).width() > 992) {
			chatSidebarToggle.on("click", function () {
				chatOverlay.removeClass("show");
			});
		}
	});
});