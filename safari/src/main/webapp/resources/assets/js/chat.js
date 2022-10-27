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
	
	// 채팅 유저 리스트에 active 클래스를 주고 AJAX로 정보 받아오기
	$(".chat-sidebar-list-wrapper ul li").on("click", function () {
		// 메시지 출력 부분의 하위 요소 제거
		$("#msgArea").empty();
		
		if ($(".chat-sidebar-list-wrapper ul li").hasClass("active")) {
			$(".chat-sidebar-list-wrapper ul li").removeClass("active");
		}
		
		$(this).addClass("active");
		
		// 채팅방이 선택된 경우
		if ($(".chat-sidebar-list-wrapper ul li").hasClass("active")) {
			// 클래스 값 변경
			chatStart.addClass("d-none");
			chatArea.removeClass("d-none");
			
			console.log("selected!!!");
		} else {
			chatStart.removeClass("d-none");
			chatArea.addClass("d-none");
		}
		
		let chatRoomName = $("#roomName").text();
		let login = $("#login").val();
		let workMemberName = $("#workMemberName").val();
		// 자식요소 중 class 이름이 chatRoomNo인 요소를 찾는다.
		let chatRoomNo = $(this).find('.chatRoomNo').val();
		let chatMemberNo = -1; // 초기화
			
		/*
		console.log("chatRoomName: " + chatRoomName);
		console.log("login: " + login);
		console.log("workMemberName: " + workMemberName);
		
		console.log("===================================");
		console.log("chatRoomNo: " + $(this).find('.chatRoomNo').val());
		console.log("===================================");
		*/
			
			// ajax로 방 정보 받아오기
			$.ajax({
				type : 'get',
				url : '/member/chat/' + $(this).find('.chatRoomNo').val(),
				// 채팅 방 번호와 자기 자신의 workMemberNo를 전송
				data: { chatRoomNo : chatRoomNo, workMemberNo : $('#workMemberNo').val()},
				success : function(json){
					console.log(json);
					
					$(json).each(function(index, item){
						console.log("item");
						console.log(item);
						
						chatMemberNo = item.chatMemberNo;
						console.log("chatMemberNo: " + chatMemberNo);
						
						for(let i = 0; i < item.msgList.length; i++){
						
							let str = "";
							
							// 접속자의 이름과 메시지 보낸 이의 이름이 같은 경우
							if(workMemberName === item.msgList[i].workMemberName){
								console.log("나" + item.chatMsg);
								
			                    str = '<div class="chat">'
			                    str += '<div class="chat-avatar">'
			                    str += '<a class="avatar m-0">'
			                    	str += '<div class="avatar avatar-busy m-0 mr-50 bg-info">'
										str += '<span class="fa fa-user"></span>'
									str += '</div>'
			                        // str += '<img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="avatar" height="36" width="36"/>'
			                    	str += '<p>' + item.msgList[i].workMemberName + '<p>'
			                    str += '</a>'
			                    str += '</div>'
			                    	str += '<div class="chat-body">'
			                    		str += '<div class="chat-message">'
			                        str += '<p>' + item.msgList[i].chatMsg + '</p>'
			                        str += '<span class="chat-time">' + item.msgList[i].createDate + '</span>'
			                    str += '</div>'
			                	str += '</div>'
			            		str += '</div>';
			                } else {
			                    str = '<div class="chat chat-left">'
			                    str += '<div class="chat-avatar">'
			                    str += '<a class="avatar m-0">'
			                        str += '<div class="avatar avatar-busy m-0 mr-50 bg-info">'
										str += '<span class="fa fa-user"></span>'
									str += '</div>'
			                        // str += '<img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="avatar" height="36" width="36"/>'
			                    	str += '<p>' + item.msgList[i].workMemberName + '<p>'
			                    str += '</a>'
			                    str += '</div>'
			                    	str += '<div class="chat-body">'
			                    		str += '<div class="chat-message">'
			                       str += '<p>' + item.msgList[i].chatMsg + '</p>'
			                        str += '<span class="chat-time">' + item.msgList[i].createDate + '</span>'
			                    str += '</div>'
			                	str += '</div>'
			            		str += '</div>';
			                }
						
							$("#msgArea").append(str);
						}
					});
				},
				error : function(){
					console.log("ERROR");
				}
			})
			
			///////////////////////////
			// STOMP 통신 시작
			
			let sockJs = new SockJS("/stomp/chat"); 
			// registerStompEndpoints - registry.addEndpoint("/stomp/chat")
			// var sockJs = new SockJS("http://localhost:80/ws/chat", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]});
			console.log("sockJs");
			console.log(sockJs);
			
			var stomp = webstomp.over(sockJs);
			console.log(stomp);
			
			// 2. connection 성공 시 콜백함수
			stomp.connect({}, function(){
				console.log("STOMP connected!");
				//3. send(path, header, message)로 메세지를 보낼 수 있음
	            // stomp.send('/pub/chat/enter', JSON.stringify({chatRoomNo: chatRoomNo, workMemberName: workMemberName}));
				
				//4. subscribe(path, callback)으로 메세지를 받을 수 있음
	            stomp.subscribe("/sub/chat/" + chatRoomNo, function (chat) {
	            	console.log("subscribe!!!");
	            	console.log("chat");
	            	console.log(chat.body);
	            	
	                var content = JSON.parse(chat.body);
	            	console.log("content");
	            	console.log(content);
	
	                var chatMemberEmail = content.chatMemberEmail;
	                let msg = content.chatMsg;
	                console.log("SUBSCRIBE")
	                console.log(chatMemberEmail + ": " + msg); 
	                let str = '';
	                
	                if(content.chatMemberEmail == null){
	                    str = '<div class="badge badge-pill badge-light-secondary my-1">' + msg + '</div>';
	                } else if(chatMemberEmail === login){
	                    str = '<div class="chat">'
	                    str += '<div class="chat-avatar">'
	                    str += '<a class="avatar m-0">'
	                    	str += '<div class="avatar avatar-busy m-0 mr-50 bg-info">'
								str += '<span class="fa fa-user"></span>'
							str += '</div>'
	                        // str += '<img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="avatar" height="36" width="36"/>'
	                    	str += '<p>' + content.workMemberName + '<p>'
	                    str += '</a>'
	                    str += '</div>'
	                    	str += '<div class="chat-body">'
	                    		str += '<div class="chat-message">'
	                        str += '<p>' + msg + '</p>'
	                        str += '<span class="chat-time">'+ content.time + '</span>'
	                    str += '</div>'
	                	str += '</div>'
	            		str += '</div>';
	                } else {
	                    str = '<div class="chat chat-left">'
	                    str += '<div class="chat-avatar">'
	                    str += '<a class="avatar m-0">'
	                    	str += '<div class="avatar avatar-busy m-0 mr-50 bg-info">'
								str += '<span class="fa fa-user"></span>'
							str += '</div>'
	                        // str += '<img src="${pageContext.request.contextPath}/resources/app-assets/images/portrait/small/avatar-s-11.png" alt="avatar" height="36" width="36"/>'
	                    	str += '<p>' + content.workMemberName + '<p>'
	                    str += '</a>'
	                    str += '</div>'
	                    	str += '<div class="chat-body">'
	                    		str += '<div class="chat-message">'
	                        str += '<p>' + msg + '</p>'
	                        str += '<span class="chat-time">' + content.time + '</span>'
	                    str += '</div>'
	                	str += '</div>'
	            		str += '</div>';
	                }
	                
	                	// console.log(str);
			           $("#msgArea").append(str);
			           str = '';
					}); 
					
			        $("#button-send").on("click", function(e){
		                var msg = $("#msg").val();
		                console.log(workMemberName + "(" + chatMemberNo + "):" + msg);
		                
		                stomp.send('/pub/chat/message', JSON.stringify({chatRoomNo: chatRoomNo, chatMemberNo: chatMemberNo, chatMsg: msg, workMemberName: workMemberName, chatMemberEmail: login}));
		                $("#msg").val(null);
			        });
			        
			        // 엔터키를 누르면 submit 버튼이 눌리도록
			        $("#msg").keyup(function(event) {
        				if (event.which === 13) {
            			$("#button-send").click();
        			}
    });
 
			}); // end for stomp subscribe
	});
	
	
	/////////////////////////////////////////////////////////////////
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
