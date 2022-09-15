
function selectProjectMember(e){
	const arr = new Array();
	
	for(let i = 0; i < e.options.length; i++){
		const option = e.options[i];
		
		if(option.selected){
			arr.push(option.value);
		}
	}
	
	console.log(arr);
	
	document.getElementById("projectMemberList").value = arr;
};

		
function addProjectGroup(){
	const hostIndex = location.href.indexOf(location.host) + location.host.length;
	const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	
	form = "<form method='post' action='" + contextPath + "/projectGroup'>"
			+ "<input type='text' name='projectGroupName'>"
			+ "<button type='submit' class='float-right'>생성</button>"
		+ "</form>";
	
	console.log(contextPath);
	console.log(form);
	
	$("#addProjectGroup").empty();
	$('#addProjectGroup').append(form);
};
 
 

