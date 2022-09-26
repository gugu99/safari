/* 프로젝트 수정폼을 띄우는 ajax
 * 
 */
 
 $(document).ready(function(){
    	let prevProjectManagerArr = new Array(); // 기존 관리자들의 번호를 저장해놓을 배열
		let prevProjectMemberArr = new Array(); // 기존 멤버들의 번호를 저장해놓을 배열
		let projectKeep = null;

    	$.ajax({
    		type : 'get',
    		url : '/safari/restModifyProject',
    		data : {projectNo : $("#projectNo").val()},
    		success : function(json){
				console.log(json);
    			$(json).each(function(index, item){
    				$('#projectName').val(item.project.projectName);
    				$('#projectExpl').val(item.project.projectExpl);
    				$('#projectAuth').val(item.project.projectAuth);
    				$('#date1').val(item.project.projectStart);
    				$('#date2').val(item.project.projectDeadline);
    				$('#date3').val(item.project.projectEnd);
    				projectKeep = item.project.projectKeep;
					
    				// 프로젝트 멤버 리스트 반복문
    				console.log("item.projectMemberList");
    				console.log(item.projectMemberList);
    				
    				for(let i = 0; i < item.projectMemberList.length; i++){
						if(item.projectMemberList[i].projectMemberAuth == null){
							$("#projectMemberList").append("<option value='" + item.projectMemberList[i].workMemberNo + "'>" + item.projectMemberList[i].workMemberName + "</option>");
							$("#projectManagerList").append("<option value='" + item.projectMemberList[i].workMemberNo + "'>" + item.projectMemberList[i].workMemberName + "</option>");
						} else if(item.projectMemberList[i].projectMemberAuth == 'Y'){
							$("#projectManagerList").append("<option value='" + item.projectMemberList[i].workMemberNo + "' selected>" + item.projectMemberList[i].workMemberName + "</option>");
							prevProjectManagerArr.push(String(item.projectMemberList[i].workMemberNo));
						} else {
							$("#projectMemberList").append("<option value='" + item.projectMemberList[i].workMemberNo + "'selected>" + item.projectMemberList[i].workMemberName + "</option>");
							prevProjectMemberArr.push(String(item.projectMemberList[i].workMemberNo));
						}
					}
					
					if(item.project.projectKeep == 'Y'){
						// 프로젝트 보관 시 모든 수정 사항 disabled 
						$("#projectName").attr("disabled", true);
						$("#projectExpl").attr("disabled", true);
						$("#projectAuth").attr("disabled", true);
						$("#date1").attr("disabled", true);
						$("#date2").attr("disabled", true);
						$("#date3").attr("disabled", true);
						$("#projectManagerList").attr("disabled", true);
						$("#projectMemberList").attr("disabled", true);
						
						// 버튼에 띄울 제목
						title = "프로젝트 보관 해제";
					} else { // null이거나 n인 경우
						// 프로젝트 보관하지 않았을 시 수정 가능 
						$("#projectName").attr("disabled", false);
						$("#projectExpl").attr("disabled", false);
						$("#projectAuth").attr("disabled", false);
						$("#date1").attr("disabled", false);
						$("#date2").attr("disabled", false);
						$("#date3").attr("disabled", false);
						$("#projectManagerList").attr("disabled", false);
						$("#projectMemberList").attr("disabled", false);
						
						// 버튼에 띄울 제목
						title = "프로젝트 보관하기";
					}
					
					$("#projectKeep").append("<button type='button' class='btn btn-outline-primary btn-lg' id='projectKeepBtn'>" + title + "</button>");

    			});
    		},
    		
    		error : function(error) {
				console.log("Error!");
			}
    	}); // end for ajax
    	
    	// 각각의 #id 값에 변동이 일어나면 ajax로 update 실행
    	$("#projectName").change(function(){
			
			if($("#projectName").val() == ""){
				alert("프로젝트 이름을 입력해 주세요.");
				$("#projectName").focus();
				return;
			}
			
			$.ajax({
				type : 'put',
				url : '/safari/modifyProject',
				data : {projectNo : $("#projectNo").val(),
						projectName: $("#projectName").val()},
				success : function(json){
					$(json).each(function(index, item){
						$('#projectName').val(item.projectName);
						i++;
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
						$('#projectExpl').val(item.projectExpl);
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectExpl change
		
		// 프로젝트 공개여부
		$("#projectAuth").change(function(){
			$.ajax({
				type : 'put',
				url : '/safari/modifyProject',
				data : {projectNo : $("#projectNo").val(),
						projectAuth: $("#projectAuth").val()},
				success : function(json){
					$(json).each(function(index, item){
						$('#projectAuth').val(item.projectAuth);
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
						$('#date1').val(item.projectStart);
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
						$('#date2').val(item.projectDeadline);
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
						$('#date3').val(item.projectEnd);
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectEnd change
		
		// 프로젝트 관리자
		$("#projectManagerList").change(function(){
			
			if($("#projectManagerList").val() == ""){
				alert("최소 한 명의 프로젝트 관리자가 필요합니다.");
				return;
			}
			
			console.log("prevProjectManagerArr: " + prevProjectManagerArr);
			
			const select = $("#projectManagerList").val();
			// console.log("typeof select: projectManagerList.val()" + typeof select);
			// console.log("---" + typeof select[0]); // string 
			// console.log("---" + typeof prevProjectManagerArr[0]); // number
			
			console.log("select: " + select);
			
			const newManager = $(select).not(prevProjectManagerArr).get();
			console.log("newManager: " + newManager);
			
			const deleteManager = $(prevProjectManagerArr).not(select).get();
			console.log("deleteManager: " + deleteManager);
			
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
					console.log("projectManagerList");
					console.log(json);
					console.log("---------------------");
					
					prevProjectManagerArr = new Array(); // 관리자 배열 초기화
						
					$("#projectMemberList").empty();
					$("#projectManagerList").empty();
					
					$(json).each(function(index, item){
						if(item.projectMemberAuth == null){
							$("#projectMemberList").append("<option value='" + item.workMemberNo + "'>" + item.workMemberName + "</option>");
							$("#projectManagerList").append("<option value='" + item.workMemberNo + "'>" + item.workMemberName + "</option>");
						} else if(item.projectMemberAuth == 'Y'){
							$("#projectManagerList").append("<option value='" + item.workMemberNo + "' selected>" + item.workMemberName + "</option>");
							prevProjectManagerArr.push(String(item.workMemberNo));
						} else {
							$("#projectMemberList").append("<option value='" + item.workMemberNo + "'selected>" + item.workMemberName + "</option>");
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
			console.log("prevProjectMemberArr: " + prevProjectMemberArr);

			const select = $("#projectMemberList").val();
			// console.log("---" + typeof select[0]); // string 
			// console.log(select);
			
			const newMember = $(select).not(prevProjectMemberArr).get();
			// console.log(newMember);
			
			const deleteMember = $(prevProjectMemberArr).not(select).get();
			// console.log(deleteMember);
			
			// boolean -> true면 매니저 delete, false면 매니저 update
			const inOrOut = newMember.length == 0;
			console.log(inOrOut ? "delete" : "update");
			
			$.ajax({
				type : 'put',
				url : '/safari/modifyMember',
				data : {projectNo : $("#projectNo").val(),
						workMemberNo: (inOrOut) ? deleteMember[0] : newMember[0],
						projectMemberAuth: "N", // 관리자가 아님
						active : (inOrOut) ? "N" : "Y"},
				success : function(json){
					$("#projectMemberList").empty();
					$("#projectManagerList").empty();
					console.log("projectMemberList success");
					console.log(json);
					console.log(typeof projectMemberList);
					
					prevProjectMemberArr = new Array(); // 기존 프로젝트 멤버 배열 초기화
					
					$(json).each(function(index, item){
						if(item.projectMemberAuth == null){
							$("#projectMemberList").append("<option value='" + item.workMemberNo + "'>" + item.workMemberName + "</option>");
							$("#projectManagerList").append("<option value='" + item.workMemberNo + "'>" + item.workMemberName + "</option>");
						} else if(item.projectMemberAuth == 'Y'){
							$("#projectManagerList").append("<option value='" + item.workMemberNo + "' selected>" + item.workMemberName + "</option>");
						} else {
							$("#projectMemberList").append("<option value='" + item.workMemberNo + "'selected>" + item.workMemberName + "</option>");
							prevProjectMemberArr.push(String(item.workMemberNo));
						}
					})
				}, // end for success call back function
				error : function(error){
					console.log("error!");
				}
			}); // end 
		}); // end for projectMember change
    	
    	// 프로젝트 보관여부
    	$("#projectKeep").on("click", "button", function(){
			console.log("projectKeepBtn click");
			
			$.ajax({
				type : 'put',
				url : '/safari/modifyProject',
				data : {projectNo : $("#projectNo").val(),
						projectKeep : (projectKeep == 'Y') ? "N" : "Y"},
				success : function(json){
					$(json).each(function(index, item){
						projectKeep = item.projectKeep; // 변수에 재대입
						$("#projectKeep").empty();
						title = "";
						
						if(item.projectKeep == 'Y'){
							// 프로젝트 보관 시 모든 수정 사항 disabled 
							$("#projectName").attr("disabled", true);
							$("#projectExpl").attr("disabled", true);
							$("#projectAuth").attr("disabled", true);
							$("#date1").attr("disabled", true);
							$("#date2").attr("disabled", true);
							$("#date3").attr("disabled", true);
							$("#projectManagerList").attr("disabled", true);
							$("#projectMemberList").attr("disabled", true);
							
							// 버튼에 띄울 제목
							title = "프로젝트 보관 해제";
						} else {
							// 프로젝트 보관하지 않았을 시 수정 가능 
							$("#projectName").attr("disabled", false);
							$("#projectExpl").attr("disabled", false);
							$("#projectAuth").attr("disabled", false);
							$("#date1").attr("disabled", false);
							$("#date2").attr("disabled", false);
							$("#date3").attr("disabled", false);
							$("#projectManagerList").attr("disabled", false);
							$("#projectMemberList").attr("disabled", false);
						
							// 버튼에 띄울 제목
							title = "프로젝트 보관하기";
						}
						
						$("#projectKeep").append("<button type='button' class='btn btn-outline-primary btn-lg' id='projectKeepBtn'>" + title + "</button>");
					})
				}, // end for success call back function
				
				error : function(error){
					console.log("error!");
				}
			}); // end 
			
		}); // end for projectKeepBtn change
		
    })