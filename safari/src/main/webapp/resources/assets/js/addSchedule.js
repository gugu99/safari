
function selectScheduleMember(e){
	const arr = new Array();
	
	for(let i = 0; i < e.options.length; i++){
		const option = e.options[i];
		
		if(option.selected){
			arr.push(option.value);
		}
	}
	
	console.log(arr);
	
	document.getElementById("scheduleMemberList").value = arr;
};


