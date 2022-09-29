
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


$('#modifyFeedbackBtn').click(function(){
	
	
	if($("#feedbackReceiver").val() == ""){
		alert("멤버를 선택해 주세요.");
		
		return false;
	}
	if($("#feedbackContent").val() == ""){
		alert("피드백 내용을 입력해 주세요.");
		
		return false;
	}
	
	var selected = $('#feedbackReceiver').val(); 

	document.getElementById("feedbackReceiverList").value = selected;
	
	modifyFeedbackForm.submit();
});
