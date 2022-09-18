
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

/* 일정 시작일과 마감일 기본값을 현재 날짜로 넣어주는 자바스크립트  */
const date = new Date();
date.setHours(9,0,0);

document.getElementById("startDateTime").value = date.toISOString().slice(0, 16);
document.getElementById("endDateTime").value = date.toISOString().slice(0, 16);

console.log(document.getElementById("startDateTime").value);
console.log(document.getElementById("endDateTime").value);


$('#addScheduleBtn').click(function(){
	
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
});
