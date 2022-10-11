$(document).ready(function(){
   $('#removeFile').click(function(){
      $('#fileSection').empty();
      $('.multiList').val(null);
      $('.custom-file-label').html('파일 선택');
   });

   
   $('#addFile').on("click", function(){
      let isFileEmpty = false;
      
      // onchange="checkFile(this)"
      
      let html = '<div class="custom-file">'+
          '<input type="file" class="custom-file-input multiList" name="file" onchange="checkFile(this)">'+
          '<label class="custom-file-label" for="inputGroupFile01">파일선택</label>'+
      '</div>';
      
      $('.multiList').each(function(index, item){
          // $(this) --> item
          if($(item).val() == '') {
             isFileEmpty = true;
             alert('파일을 업로드하시고 추가해주세요.');
          }
      });
      
      if(isFileEmpty == false) {
      	$('#fileSection').append(html);
      }
      
   });
   
    $(document).on('change', '.custom-file-input', function (event) {
	    $(this).next('.custom-file-label').html(event.target.files[0].name);
	});
	
	$('#modifyBoardBtn').click(function() {
		if($('#boardContent').val() == '') {
			alert('내용을 입력해주세요!');
			$('#boardContent').focus();
			return;
		}
		$('#modifyBoardForm').submit();
	});
	
	$('#deleteLocation').click(function(){
      $('#addr').val(null);
      $('#detailAddr').val(null);
   });
   
   $('#deleteFile').click(function(){
     
   });
});

function checkFile(el){

	// files 로 해당 파일 정보 얻기.
	var file = el.files;

	// file[0].size 는 파일 용량 정보입니다.
	if(file[0].size > 1024 * 1024 * 1){
		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
		alert('1MB 이하 파일만 등록할 수 있습니다.');
		
		$(el).val('');
	}
}

function deleteFile(fileNo, fileId){
	console.log(fileNo);
	console.log(fileId);
	let html = '<input type="hidden" name="boardFileNo" value="'+fileNo+'">';
	$('#fileList').append(html);
	$('#'+fileId).empty();
	console.log(html);
}