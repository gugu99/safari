var selected = $('#feedbackReceiver').val(); 
console.log(selected);
document.getElementById("feedbackReceiverList").value = selected;

function selectFeedbackReceiver(e){
	const arr = new Array();
	
	for(let i = 0; i < e.options.length; i++){
		const option = e.options[i];
		
		if(option.selected){
			arr.push(option.value);
		}
	}
	
	console.log(arr);
	
	document.getElementById("feedbackReceiverList").value = arr;
};


$('#addFeedbackBtn').click(function(){
	
	if($("#scheduleTitle").val() == ""){
		alert("제목을 입력해 주세요.");
			$("#scheduleTitle").focus();
		
		return false;
	}
	if($("#scheduleMember").val() == ""){
		alert("참석자를 선택해 주세요.");
			$("#scheduleMember").focus();
		
		return false;
	}
	
	addFeedbackForm.submit();
});
