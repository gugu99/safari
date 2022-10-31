// 채팅방 만들기
	$("#contact-list li").on("click", function () {
		const workMemberNo = $(this).find('.workMemberNo').val();
		console.log(workMemberNo);
		
		$.ajax({
			type : 'post',
			url : '/member/chat',
			data : {workMemberNo : workMemberNo},
			success : function(json){
				console.log('success!');
				console.log(json);
				
				let str = "";
				
				// 채팅방 목록에 append
				// chatRoom: {workMemberNo=18, login=stringbuckwheat@gmail.com, chatRoomName=김우빈, workNo=7, chatRoomNo=8}
				$(json).each(function(index, item){
					console.log("item");
					console.log(item);
					str += '<li>'
	                	str += '<div class="d-flex align-items-center">'
							str += '<div class="avatar avatar-busy m-0 mr-50 bg-info">'
									str += '<span class="fa fa-user"></span>'
									str += '<i></i>'
								str += '</div>'
	                        str += '<div class="chat-sidebar-name pl-1">'
	                            str += '<h6 class="mb-0">' + item.chatRoomName + '</h6><span class="text-muted"></span>'
	                        	str += '<input type="hidden" class="chatRoomNo" value="' + item.chatRoomNo + '">'
	                        str += '</div>'
	                   str += '</div>'
	               str += '</li>'
	                
	               $("#chat-list").prepend(str);
                });
                
                console.log("SELECTOR");
                console.log( $('#chat-list li').first());
               
               // jquery 이벤트 등록 후에 append한 요소라 click event가 동작하지 않는다
               $('#chat-list li').first().trigger('click');
			},
			error : function(){
				console.log("ERROR");
			}
		})
	}) // $("#contact-list li").on("click" ...
	