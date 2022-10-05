$(document).ready(function(){
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	const section = $('#section').val();
	const projectGroupNo = $('#projectGroupNo').val();
	
	if(section != ""){
		$("#order").append("<input type='hidden' name='section' value='" + section + "'>");
	}
	
	if(projectGroupNo != ""){
		// select에 hidden append
		$("#order").append("<input type='hidden' name='projectGroupNo' value='" + projectGroupNo + "'>");
	}
	
	$('#order').change(function () {
		orderForm.submit();
	});
	
	
	// 모달을 닫으면 새로고침
	$('#hideBtn').on("click", function () {
		location.reload();
	});
	
	// 프로젝트 추가 빈칸검사
	$('#projectBtn').click(function(){
		
		console.log(typeof $('#projectMemberList').val());
		console.log($('#projectMemberList').val());
		
		let hasMe = false;
		
		// 본인 검증
		for(let i = 0; i < $('#projectMemberList').val().length; i++){
			if($('#projManagerNo').val() == $('#projectMemberList').val()[i]){
				hasMe = true;
			}
		}
		
		if(!hasMe){
			alert("프로젝트 생성자가 멤버로 포함되어야 합니다.");
		} else if($('#projectName').val() == ""){
			alert("프로젝트 이름을 입력해주세요.");
			$("#projectName").focus();
			return false;
		} else if($('#projectMemberList').val() == ""){
			alert("최소 한 명의 프로젝트 멤버가 필요합니다.");
			return false;
		} else {
			addProjectForm.submit();
		}
	});
	
	$('#customSwitch1').click(function(){
		finishForm.submit();
	})
	
	// 프로젝트 그룹 추가 버튼 클릭 시 input 창을 띄우는 메소드
	let show = false;
	
	$('#addProjectGroupBtn').click(function(){
		
		if(show){
			show = false;
			$("#addProjectGroup").empty();
		} else {
			show = true;
			
			/*
			const hostIndex = location.href.indexOf(location.host) + location.host.length;
			const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
			*/
			console.log("contextPath: " + contextPath);
					
			form = "<form method='post' action='" + contextPath + "/projectGroup' id='projectGroupForm'>"
						+ '<fieldset>'
							+'<div class="input-group">'
								+'<input type="text" name="projectGroupName" id="projectGroupName" class="form-control" aria-describedby="button-addon4">'
									+'<div class="input-group-append" id="button-addon4">'
											+'<button class="btn btn-primary" id="projectGroupBtn" type="button"><i class="feather icon-check-square mr-0"></i></button>'
		                            +'</div>'
							+'</div>'
		                 +'</fieldset>'
		            + "</form>";
			
			$("#addProjectGroup").empty();
			$('#addProjectGroup').append(form);
		}
	});
	
	// 프로젝트 그룹 추가 빈칸검사
	$('.addProjectGroup').on("click", "button", function(){
		console.log("clicked");
		
		if($('#projectGroupName').val() == ""){
			
			console.log("빈칸");
			alert("프로젝트 그룹 이름을 입력해주세요.");
			$("#projectGroupName").focus();
			
			return false;
		
		} else {
			
			projectGroupForm.submit();
		
		}
	});

})
