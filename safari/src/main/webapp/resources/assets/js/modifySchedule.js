var selected = $('#scheduleMember').val(); 
console.log(selected);
document.getElementById("scheduleMemberList").value = selected;

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
console.log(document.getElementById("scheduleMemberList").value);
console.log(document.getElementById("startDateTime").value);
console.log(document.getElementById("endDateTime").value);

$('#modifyScheduleBtn').click(function(){
	
	if($("#scheduleTitle").val() == ""){
		alert("제목을 입력해 주세요.");
			$("#scheduleTitle").focus();
		
		return false;
	}
	if($("#startDateTime").val() == ""){
		alert("시작일을 입력해 주세요.");
			$("#startDateTime").focus();
		
		return false;
	}
	if($("#endDateTime").val() == ""){
		alert("마감일을 입력해 주세요.");
			$("#endDateTime").focus();
		
		return false;
	}
	if($("#scheduleMember").val() == ""){
		alert("참석자를 선택해 주세요.");
			$("#scheduleMember").focus();
		
		return false;
	}
	$('#scheduleStart').val($('#startDateTime').val().substring(0, 10) + ' ' + $('#startDateTime').val().substring(11));
	$('#scheduleEnd').val($('#endDateTime').val().substring(0, 10) + ' ' + $('#endDateTime').val().substring(11));
	
	modifyScheduleForm.submit();
});
