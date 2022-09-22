/* 프로젝트 수정폼을 띄우는 ajax
 * 
 */
 
 $(document).ready(function(){
    	$.ajax({
    		type : 'get',
    		url : '/safari/restModifyProject',
    		data : {projectNo : $("#projectNo").val()},
    		success : function(json){
				
				console.log(json);
    			
    			$(json).each(function(index, item){
    				$('#projectName').val(item.project.projectName);
    				$('#projectExpl').val(item.project.projectExpl);
    				$('#customSelect').val(item.project.projectAuth);
    				$('#date1').val(item.project.projectStart);
    				$('#date2').val(item.project.projectDeadline);
    				$('#date3').val(item.project.projectEnd);
    				$('#projectMemberList').val(item.projectMemberList.workMemberNo);
    				
					// 받아온 프로젝트 관리자 리스트 반복문
    				for(let i = 0; i < item.projectManagerList.length; i++){
						// workspace member와 프로젝트 매니저들의 left join의 결과물
						// projectNo가 있으면 현재 프로젝트 매니저 -> selected
						if(item.projectManagerList[i].projectNo != null){
							$("#projectManagerList").append("<option value='" + item.projectManagerList[i].workMemberNo + "' selected>" + item.projectManagerList[i].workMemberName + "</option>");
						} else {
							// 프로젝트넘버가 없으면, 워크스페이스에는 속해있지만 프로젝트엔 속하지 않은 멤버 (== 프로젝트에 참여할 권한이 있음)
							$("#projectManagerList").append("<option value='" + item.projectManagerList[i].workMemberNo + "'>" + item.projectManagerList[i].workMemberName + "</option>");
						}
					}
    				
    				// 프로젝트 멤버 리스트 반복문
    				for(let i = 0; i < item.projectMemberList.length; i++){
						// workspace member와 프로젝트 멤버들 left join
						// projectNo가 있으면 현재 프로젝트 멤버 -> selected
						if(item.projectMemberList[i].projectNo != null){
							$("#projectMemberList").append("<option value='" + item.projectMemberList[i].workMemberNo + "' selected>" + item.projectMemberList[i].workMemberName + "</option>");
						} else {
							$("#projectManagerList").append("<option value='" + item.projectMemberList[i].workMemberNo + "'>" + item.projectMemberList[i].workMemberName + "</option>");
						}					
					}
					
    			});
    			
    			
    		},
    		
    		error : function(error) {
				console.log("Error!");
			}
    		
    	});
    	
    })