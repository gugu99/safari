<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="loading" lang="ko" data-textdirection="ltr">
<!-- BEGIN: Head-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Task</title>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
	<!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/jkanban/jkanban.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/forms/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/core/menu/menu-types/vertical-menu-modern.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/app-assets/css/pages/app-kanban.css">
    <!-- END: Page CSS-->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/assets/css/ProjectFileList.css">

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern 2-columns  menu-collapsed fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

	 <%@ include file="/WEB-INF/view/inc/header.jsp" %> <!-- header -->
	 <%@ include file="/WEB-INF/view/inc/sidebar.jsp" %> <!-- sidebar -->

    <!-- BEGIN: Content-->	
    <div class="app-content content">
    	<%@ include file="/WEB-INF/view/task/taskHeader.jsp" %> <!-- taskHeader -->
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-body mt-2">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">프로젝트 파일리스트</h4>
                               	<a href="${pageContext.request.contextPath}/member/fileList" class="btn btn-sm btn-primary mr-25">전체목록</a>
                               	<a href="${pageContext.request.contextPath}/member/fileList?uploader=${workMemberName}" class="btn btn-sm btn-primary mr-25">내가올린파일</a>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                   		 <li>
	                                   		<select id="selectTasklistNo" name="tasklistNo" class="btn btn-sm btn-primary mr-25">
			                            	<option value="">업무리스트 선택</option>
			                            	<c:forEach var="t" items="${taskList}">
			                            	<option value="${t.tasklistNo}">${t.tasklistTitle}</option>
			                            	</c:forEach>
			                            	</select>
                                   		 </li>
                                   		 <li>
                                   		 <select name="taskNo" id="selectTaskNo" class="btn btn-sm btn-primary mr-25">
										</select>
                                   		 </li>
                                        <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                                        <li><a data-action="expand"><i class="feather icon-maximize"></i></a></li>
                                    </ul>
                                </div>
                                <p>
                                 <a href="#" id ="addFileButton"  class="btn btn-sm btn-success mr-25" data-toggle="modal" data-target="#inlineForm">파일올리기</a>
                                 </p>
                            </div>
                            <!--file Modal -->
							<div class="col-lg-4 col-md-6 col-sm-12">
						        <div class="form-group">
						            <div class="modal fade text-left" id="inlineForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
						                <div class="modal-dialog None" role="document">
						                    <div class="modal-content">
						                        <div class="modal-header">
						                            <label class="modal-title text-text-bold-600" id="myModalLabel33">파일업로드</label>
						                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                                <span aria-hidden="true">&times;</span>
						                            </button>
						                        </div>
						                        <form id="fileForm"  method="post" action="${pageContext.request.contextPath}/member/addFile" enctype="multipart/form-data">
						                            <div class="modal-body">
						                            	<label>업무리스트:</label>
						                            	<select id="tasklistNo" name="tasklistNo"class="btn btn-sm btn-primary mr-25">
						                            	<option value="">업무리스트 선택</option>
						                            	<c:forEach var="t" items="${taskList}">
						                            	<option value="${t.tasklistNo}">${t.tasklistTitle}</option>
						                            	</c:forEach>
						                            	</select>
						                            	<br>
						                            	<label>업무선택:</label>
						                            	<select name="taskNo" id="taskNo" class="btn btn-sm btn-primary mr-25">
														</select>
									                    <div class="col-12 px-0 d-flex flex-sm-row flex-column justify-content-start">
						                                    <input class="btn btn-sm btn-primary ml-50 file" name="file" type="file" id="file" onchange="checkFile(this)">
						                                </div>
						                                 <div id="fileSection">      
     													 </div>
						                                	<br>
						                                <div class= "row"> 
						                                  <div class="col-6">
						                                    <input class="btn btn-sm btn-primary ml-50" id="addFile" name="" type="button" value="파일추가">
						                                     <input class="btn btn-sm btn-primary ml-50" id="removeFile" name="" type="button" value="파일삭제">
						                                </div>
						                                </div>
						                            </div>
						                            <div class="modal-footer">
						                                <input type="reset" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" value="닫기">
						                                <input id="uploadButton" type="button" class="btn btn-outline-primary btn-lg" value="업로드">
						                            </div>
						                        </form>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div>
							<!-- IMG Modal END -->
                            <div class="card-content collapse show">
                                <div class="table-responsive">
                                    <table class="table table-xl mb-0" id="tableAlign">
                                        <thead>
                                            <tr>
                                                <th>파일이름</th>
                                                <th>크기</th>
                                                <th>공유날짜</th>
                                                <th>공유한사람</th>
                                                <th>업무명<th>
                                            </tr>
                                        </thead>
										                           
                                        <tbody id="fileInfo">
                                             <c:forEach var="f" items="${fileList}">
                                             <tr>
                                               <th scope="row" ><a href="${pageContext.request.contextPath}/resources/fileupload/${f.filename}${f.fileExt}"
                                               download="${f.originName}">${ f.originName}</a></th>
                                               
                                                <td>${f.fileSize}</td>
                                                <td>${f.createDate}</td>
                                                <td>${f.uploader} 
                                                <c:if test="${workMemberName eq f.uploader}">
                                                <a href="${pageContext.request.contextPath}/member/removeFile?fileNo=${f.fileNo}"><button class="btn btn-sm btn-danger mr-25">파일삭제</button></a>
                                                </c:if>
                                                </td>
                                                <td>${f.taskTitle}</td>
                                                 </tr>
                                                 </c:forEach>
                                            </tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

	 <%@ include file="/WEB-INF/view/inc/footer.jsp" %> <!-- footer -->

    <!-- BEGIN: Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/jkanban/jkanban.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/forms/quill/quill.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app-menu.js"></script>
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="${pageContext.request.contextPath }/resources/app-assets/js/scripts/pages/app-kanban.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/taskLocation.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/taskListLocation.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/copyTaskList.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/copyTask.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/lowerTask.js"></script>
    <!-- END: Page JS-->

</body>
<!-- END: Body-->


<script>
$(document).ready(function(){
   $('#removeFile').click(function(){
      $('#fileSection').empty();
   });
   
   $('#addFile').click(function(){
      let isFileEmpty = false;
      
      let html = '<div class="col-12 px-0 d-flex flex-sm-row flex-column justify-content-start">'+
          '<input class="btn btn-sm btn-primary ml-50 multiList file" value="" name="file" type="file" id="file" onchange="checkFile(this)">'+
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
   
});
</script>

<script>
$(document).ready(function(){
	
	
	// 파일 업로드 업무 번호조회
	$('#tasklistNo').change(function() {
		if($('#tasklistNo').val() == '') {
			alert('업무리스트를 선택하세요');
		} else {
			$('#taskNo').empty();
			$('#taskNo').append('<option value="">::: 업무선택 :::</option>')
			
			$.ajax({
				url : '/member/tasklist',
				type : 'post',
				data : {tasklistNo : $('#tasklistNo').val()},
				success : function(json) {
					$(json).each(function(index, item){
						$('#taskNo').append('<option value="'+item.taskNo+'">'+item.taskTitle+'</option>')
					});
				}
			});
		}
	});
	
	// 조회 업무 리스트 선택
	$('#selectTasklistNo').change(function() {
		if($('#selectTasklistNo').val() =='') { 
			
			alert('업무리스트를 선택하세요');
		} else {
			$('#selectTaskNo').empty();
			$('#selectTaskNo').append('<option value="">::: 업무선택 :::</option>')
			
			$.ajax({
				
				url : '/member/tasklist',
				type : 'post',
				data : {tasklistNo : $('#selectTasklistNo').val()},
				success : function(json) {
					$(json).each(function(index, item){
						$('#selectTaskNo').append('<option value="'+item.taskNo+'">'+item.taskTitle+'</option>')
					});
				}
			});
			$.ajax({
				async : false,
				url : '/member/tasklistNoFileList',
				type : 'post',
				data : {tasklistNo : $('#selectTasklistNo').val()},
				success : function(json) {
					$('#fileInfo').empty();
					$(json).each(function(index, item){
						if(item.filename != '널'){
							let html = '';
							console.log(json);
							var uploader=item.uploader;
							console.log(uploader);
							html += "<tr><th scope='row'><a href='${pageContext.request.contextPath}/resources/fileupload/"+item.filename+item.fileExt+"'";
							html += " download='"+item.originName+"'";
							html += ">";
							html += item.originName;
							html += "</a></th>";
							
							html += "<td>"+item.fileSize+"</td>";
							html += "<td>"+item.createDate+"</td>";
							html += "<td>"+item.uploader;
							html += "</td>";
							html += "<td>"+item.taskTitle+"</td>";
							html += "</tr>";
							
							
							$('#fileInfo').append(html);
							}else if (item.filename == '널'){
								let html = '';
								html += "<tr><th colspan='6'>파일이 없습니다.</th></tr>";
								
								$('#fileInfo').append(html);
								
							}
					});
				}
			});
			
			
		}
	});
	
	// 업무 번호에 따른 리스트 조회
	$('#selectTaskNo').change(function() {
		$.ajax({
			async : false,
			url : '/member/taskFileList',
			type : 'post',
			data : {taskNo : $('#selectTaskNo').val()},
			success : function(json) {
				$('#fileInfo').empty();
				
				$(json).each(function(index, item){
					if(item.filename != '널'){
					let html = '';
					console.log(json);
					html += "<tr><th scope='row'><a href='${pageContext.request.contextPath}/resources/fileupload/"+item.filename+item.fileExt+"'";
					html += " download='"+item.originName+"'";
					html += ">";
					html += item.originName;
					html += "</a></th>";
					
					html += "<td>"+item.fileSize+"</td>";
					html += "<td>"+item.createDate+"</td>";
					html += "<td>"+item.uploader + "    ";
					html += "</td>"
					html += "<td>"+item.taskTitle+"</td>";
					html += "</tr>";
					
					
					$('#fileInfo').append(html);
					}else if (item.filename == '널'){
						let html = '';
						html += "<tr><th colspan='6'>파일이 없습니다.</th></tr>";
						
						$('#fileInfo').append(html);
						
					}
					
					
					
				});
			}
		});
		
	});
	
	
});

</script>

<script>
$(document).ready(function(){
	
	var grpl = $('input[name=file]').length;
	//배열 생성
	var grparr = new Array(grpl);
	$('#uploadButton').click(function() {
		
		for (var i = 0; i <= grpl; i++) {
			if ($('#tasklistNo').val() == '') {
				alert('업무리스트를 선택해주세요');
				$('#tasklistNo').focus();
				console.log(grpl);
				return;
			}else if($('#taskNo').val() == ''){
				alert('업무를 선택해주세요');
				$('#taskNo').focus();
				return;
			}
			else if($("input[name='file']").eq(i).val() == ''){
					alert('파일을 첨부해주세요');
					i = grpl+1;
					return;
				}
			else if(i == grpl){
				$('#fileForm').submit();
			}
				
		}			
	});
	

});





</script>

<script>
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

</script>


</html>