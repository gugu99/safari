$(document).ready(function(){
	$('#taskNo').change(function(){
		// alert('taskList change');
		// ajax호출 -> 값 -> countryId select append
		if($('#taskNo').val() == ''){
			alert('업무를 선택하세요');
		} else {
			$('#feedbackReceiver').empty();
			
			$.ajax({
				url: '/safari/getFeedbackReceiverList',
				type : 'get',
				data : {taskNo : $('#taskNo').val()},
				success : function(json) {
					
					$(json).each(function(index, item){ 
						if(item.workMemberEmail == $('#myEmail').val()){
							$('#feedbackReceiver').append('<option value="'+item.workMemberEmail+'" selected>'+item.workMemberName+'</option>')
						} else {
							$('#feedbackReceiver').append('<option value="'+item.workMemberEmail+'">'+item.workMemberName+'</option>');
						}
					}); // each end
				} // success end
			});	// ajax end			
		} // if-else end
	}); // taskNo change end
});


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
	
	if($("#taskNo").val() == ""){
		alert("업무를 선택해 주세요.");
		
		return false;
	}
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
	
	addFeedbackForm.submit();
});
