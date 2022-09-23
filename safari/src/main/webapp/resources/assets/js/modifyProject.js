/* 프로젝트 수정폼을 띄우는 ajax
 * 
 */
 
 $(document).ready(function(){
    	const prevProjectManagerArr = new Array(); 
		const prevProjectMemberArr = new Array();			


    	$.ajax({
    		type : 'get',
    		url : '/safari/restModifyProject',
    		data : {projectNo : $("#projectNo").val()},
    		success : function(json){
				// console.log(json);
    			$(json).each(function(index, item){
    				$('#projectName').val(item.project.projectName);
    				$('#projectExpl').val(item.project.projectExpl);
    				$('#customSelect').val(item.project.projectAuth);
    				$('#date1').val(item.project.projectStart);
    				$('#date2').val(item.project.projectDeadline);
    				$('#date3').val(item.project.projectEnd);
    				
					// 받아온 프로젝트 관리자 리스트 반복문
    				for(let i = 0; i < item.projectManagerList.length; i++){
						// workspace member와 프로젝트 매니저들의 left join의 결과물
						// projectNo가 있으면 현재 프로젝트 매니저 -> selected
						if(item.projectManagerList[i].projectNo != null){
							$("#projectManagerList").append("<option value='" + item.projectManagerList[i].workMemberNo + "' name='workMemberNo' selected>" + item.projectManagerList[i].workMemberName + "</option>");
							prevProjectManagerArr.push(String(item.projectManagerList[i].workMemberNo));

						} else {
							// 프로젝트넘버가 없으면, 워크스페이스에는 속해있지만 프로젝트엔 속하지 않은 멤버 (== 프로젝트에 참여할 권한이 있음)
							$("#projectManagerList").append("<option value='" + item.projectManagerList[i].workMemberNo + "' name='workMemberNo' >" + item.projectManagerList[i].workMemberName + "</option>");
						}
					}
					
    				// 프로젝트 멤버 리스트 반복문
    				console.log(item.projectMemberList);
    				
    				for(let i = 0; i < item.projectMemberList.length; i++){
						// workspace member와 프로젝트 멤버들 left join
						// projectNo가 있으면 현재 프로젝트 멤버 -> selected
						if(item.projectMemberList[i].projectNo != null){
							$("#projectMemberList").append("<option value='" + item.projectMemberList[i].workMemberNo + "' selected>" + item.projectMemberList[i].workMemberName + "</option>");
							prevProjectMemberArr.push(String(item.projectMemberList[i].workMemberNo));

						} else {
							$("#projectMemberList").append("<option value='" + item.projectMemberList[i].workMemberNo + "'>" + item.projectMemberList[i].workMemberName + "</option>");
						}					
					}
    			});
    		},
    		
    		error : function(error) {
				console.log("Error!");
			}
    	}); // end for ajax
    	
    	// 각각의 #id 값에 변동이 일어나면 ajax로 update 실행
    	$("#projectName").change(function(){
			$.ajax({
				type : 'put',
				url : '/safari/modifyProject',
				data : {projectNo : $("#projectNo").val(),
						projectName: $("#projectName").val()},
				success : function(json){
					$(json).each(function(index, item){
						$('#projectName').val(item.project.projectName);
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectName change
		
		// 프로젝트 설명
		$("#projectExpl").change(function(){
			$.ajax({
				type : 'put',
				url : '/safari/modifyProject',
				data : {projectNo : $("#projectNo").val(),
						projectExpl: $("#projectExpl").val()},
				success : function(json){
					$(json).each(function(index, item){
						$('#projectExpl').val(item.project.projectExpl);
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectExpl change
		
		// 프로젝트 공개여부
		$("#customSelect").change(function(){
			$.ajax({
				type : 'put',
				url : '/safari/modifyProject',
				data : {projectNo : $("#projectNo").val(),
						projectAuth: $("#customSelect").val()},
				success : function(json){
					$(json).each(function(index, item){
						$('#customSelect').val(item.project.projectAuth);
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectAuth change
		
		// 시작일
		$("#date1").change(function(){
			console.log("onchange");
			
			$.ajax({
				type : 'put',
				url : '/safari/modifyProject',
				data : {projectNo : $("#projectNo").val(),
						projectStart: $("#date1").val()},
				success : function(json){
					$(json).each(function(index, item){
						$('#date1').val(item.project.projectStart);
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectStart change
		
		// 마감일
		$("#date2").change(function(){
			console.log("onchange");
			
			$.ajax({
				type : 'put',
				url : '/safari/modifyProject',
				data : {projectNo : $("#projectNo").val(),
						projectDeadline: $("#date2").val()},
				success : function(json){
					$(json).each(function(index, item){
						$('#date2').val(item.project.projectDeadline);
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectDeadline change
		
		// 종료일
		$("#date3").change(function(){
			console.log("onchange");
			
			$.ajax({
				type : 'put',
				url : '/safari/modifyProject',
				data : {projectNo : $("#projectNo").val(),
						projectEnd: $("#date3").val()},
				success : function(json){
					$(json).each(function(index, item){
						$('#date3').val(item.project.projectEnd);
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectEnd change
		
		// 프로젝트 관리자
		$("#projectManagerList").change(function(){
			
			const select = $("#projectManagerList").val();
			console.log(typeof select);
			console.log("---" + typeof select[0]); // string 
			console.log("---" + typeof prevProjectManagerArr[0]); // number
			
			console.log(select);
			
			const newManager = $(select).not(prevProjectManagerArr).get();
			console.log(newManager);
			
			const deleteManager = $(prevProjectManagerArr).not(select).get();
			console.log(deleteManager);
			
			// boolean -> true면 매니저 delete, false면 매니저 update
			const inOrOut = newManager.length == 0;
			console.log(inOrOut ? "delete" : "update");
			
			$.ajax({
				type : 'put',
				url : '/safari/modifyMember',
				data : {projectNo : $("#projectNo").val(),
						workMemberNo: (inOrOut) ? deleteManager[0] : newManager[0],
						projectMemberAuth: "Y",
						active : (inOrOut) ? "N" : "Y"},
				success : function(json){
					$(json).each(function(index, item){
						// 반복문 돌릴 자리
						console.log(json);
						
						for(let i = 0; i < item.projectManagerList.length; i++){
							// workspace member와 프로젝트 매니저들의 left join의 결과물
							// projectNo가 있으면 현재 프로젝트 매니저 -> selected
							if(item.projectManagerList[i].projectNo != null){
								$("#projectManagerList").append("<option value='" + item.projectManagerList[i].workMemberNo + "' name='workMemberNo' selected>" + item.projectManagerList[i].workMemberName + "</option>");
							} else {
								// 프로젝트넘버가 없으면, 워크스페이스에는 속해있지만 프로젝트엔 속하지 않은 멤버 (== 프로젝트에 참여할 권한이 있음)
								$("#projectManagerList").append("<option value='" + item.projectManagerList[i].workMemberNo + "' name='workMemberNo' >" + item.projectManagerList[i].workMemberName + "</option>");
							}
						}
						
						for(let i = 0; i < item.projectMemberList.length; i++){
							// workspace member와 프로젝트 멤버들 left join
							// projectNo가 있으면 현재 프로젝트 멤버 -> selected
							if(item.projectMemberList[i].projectNo != null){
								$("#projectMemberList").append("<option value='" + item.projectMemberList[i].workMemberNo + "' selected>" + item.projectMemberList[i].workMemberName + "</option>");
							} else {
								$("#projectMemberList").append("<option value='" + item.projectMemberList[i].workMemberNo + "'>" + item.projectMemberList[i].workMemberName + "</option>");
							}					
						}
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectManager change
		
		// 프로젝트 멤버
		$("#projectMemberList").change(function(){
			const select = $("#projectMemberList").val();
			// console.log("---" + typeof select[0]); // string 
			
			// console.log(select);
			
			const newMember = $(select).not(prevProjectMemberArr).get();
			// console.log(newMember);
			
			const deleteMember = $(prevProjectMemberArr).not(select).get();
			// console.log(deleteMember);
			
			// boolean -> true면 매니저 delete, false면 매니저 update
			const inOrOut = newMember.length == 0;
			// console.log(inOrOut ? "delete" : "update");
			
			$.ajax({
				type : 'put',
				url : '/safari/modifyMember',
				data : {projectNo : $("#projectNo").val(),
						workMemberNo: (inOrOut) ? deleteMember[0] : newMember[0],
						projectMemberAuth: "N", // 관리자가 아님
						active : (inOrOut) ? "N" : "Y"},
				success : function(json){
					$(json).each(function(index, item){
						// 반복문 돌릴 자리
						// console.log(json);
						// $('#date3').val(item.project.projectEnd);
						
						for(let i = 0; i < item.projectManagerList.length; i++){
							// workspace member와 프로젝트 매니저들의 left join의 결과물
							// projectNo가 있으면 현재 프로젝트 매니저 -> selected
							if(item.projectManagerList[i].projectNo != null){
								$("#projectManagerList").append("<option value='" + item.projectManagerList[i].workMemberNo + "' name='workMemberNo' selected>" + item.projectManagerList[i].workMemberName + "</option>");
							} else {
								// 프로젝트넘버가 없으면, 워크스페이스에는 속해있지만 프로젝트엔 속하지 않은 멤버 (== 프로젝트에 참여할 권한이 있음)
								$("#projectManagerList").append("<option value='" + item.projectManagerList[i].workMemberNo + "' name='workMemberNo' >" + item.projectManagerList[i].workMemberName + "</option>");
							}
						}
						
						for(let i = 0; i < item.projectMemberList.length; i++){
							// workspace member와 프로젝트 멤버들 left join
							// projectNo가 있으면 현재 프로젝트 멤버 -> selected
							if(item.projectMemberList[i].projectNo != null){
								$("#projectMemberList").append("<option value='" + item.projectMemberList[i].workMemberNo + "' selected>" + item.projectMemberList[i].workMemberName + "</option>");
								prevProjectMemberArr.push(String(item.projectMemberList[i].workMemberNo));
							} else {
								$("#projectMemberList").append("<option value='" + item.projectMemberList[i].workMemberNo + "'>" + item.projectMemberList[i].workMemberName + "</option>");
							}					
						}
						
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectMember change
    	
    })