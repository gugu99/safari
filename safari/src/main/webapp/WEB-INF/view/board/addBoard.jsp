<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="modal-sizes">
    <div class="row">
        <div class="col-12">
            <div class="card">
                
                <div class="card-content collapse show">
                        <div class="row my-2">
                            
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="form-group">

                                    <!-- Modal -->
                                    <div class="modal fade text-left" id="add-board" tabindex="-1" role="dialog" aria-labelledby="myModalLabel17" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h3 class="modal-title" id="myModalLabel17">게시글 작성</h3>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
		                                                <form action="${pageContext.request.contextPath }/member/addBoard" enctype="multipart/form-data" method="post" id="addBoard">
		                                               		<input type="hidden" name="boardWriter" value="${login }">
		                                                    <div class="row">
		                                                        <div class="col-12">
							                                        <div class="form-group">
							                                            <label for="boardTitle"><span class="fa fa-pencil mr-1"></span>제목</label>
							                                            <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요.">
							                                        </div>
							                                    </div>
		                                                        <div class="col-10">
		                                                            <div class="form-group">
		                                                                <label for="account-website"><span class="fa fa-map-marker mr-2"></span>장소</label>
		                                                                <input type="text" class="form-control" name="boardLocation" id="addr" placeholder="주소를 입력하세요." readonly>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-2">
		                                                        	<div class="form-group">
		                                                            	<button type="button" id="addrBtn" class="btn btn-secondary pull-right mt-2">주소 찾기</button>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="detailAddr"><span class="fa fa-map-marker mr-2"></span>상세 장소</label>
		                                                                <input type="text" class="form-control" name="boardDetailLocation" id="detailAddr" placeholder="주소를 입력하세요.">
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
							                                        <div class="form-group">
							                                            <label for="boardContent"><span class="fa fa-pencil-square-o mr-1"></span>내용</label>
							                                            <textarea class="form-control" name="boardContent" id="boardContent" rows="7" placeholder="내용을 입력하세요."></textarea>
							                                        </div>
							                                    </div>
							                                    <div class="col-12">
					                                                <fieldset class="form-group">
					                                                    <label for="basicInputFile">파일 올리기</label>
					                                                    <div class="custom-file"> 
					                                                        <input type="file" class="custom-file-input multiList file" name="file" onchange="checkFile(this)" >
					                                                        <label class="custom-file-label" for="inputGroupFile01">파일 선택</label>
					                                                    </div>
					                                                    <div id="fileSection">      
																		</div>
													                   	<br>
													                   <div class= "row"> 
													                   	 <div class="col-6">
															                   <input class="btn btn-sm btn-primary ml-50" id="addFile" name="" type="button" value="파일추가">
															                   <input class="btn btn-sm btn-danger ml-50" id="removeFile" name="" type="button" value="파일삭제">
													                  	 </div>
													                   </div>
					                                                </fieldset>
					                                            </div>
		                                                        <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
		                                                        	<div class="form-group mt-1">
		                                                                <label for="boardAuth"><span class="fa fa-lock mr-1"></span>공개설정</label>
		                                                                <select class="form-control" id="boardAuth" name="boardAuth">
		                                                                    <option value="N" selected>전체공개</option>
		                                                                    <option value="Y">관리자, 작성자만 공개</option>
		                                                                </select>
		                                                            </div>
		                                                            <div class="form-group">
		                                                                <button type="reset" class="btn btn-light mt-3 ml-2">입력취소</button>
		                                                            </div>
		                                                            
		                                                        </div>
		                                                    </div>
		                                                </form>
	                                                <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
														<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
													</div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">닫기</button>
                                                    <button type="button" id="addBoardBtn" class="btn btn-outline-primary">올리기</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</section>
