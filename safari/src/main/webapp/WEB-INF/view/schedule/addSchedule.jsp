<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section id="modal-sizes">
    <div class="row">
        <div class="col-12">
            <div class="card">
                
                <div class="card-content collapse show">
                        <div class="row my-2">
                            
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="form-group">

                                    <!-- Modal -->
                                    <div class="modal fade text-left" id="add-schedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel17" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h3 class="modal-title" id="myModalLabel17">일정 작성</h3>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
		                                                <form action="#" method="post">
		                                                    <div class="row">
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="scheduleTitle"><span class="fa fa-pencil mr-1"></span>제목</label>
		                                                                <input type="text" class="form-control" id="scheduleTitle" name="scheduleTitle" placeholder="제목을 입력하세요.">
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-6">
		                                                            <div class="form-group">
		                                                                <div class="controls">
		                                                                    <label for="startDateTime"><span class="fa fa-calendar mr-1"></span>시작일</label>
		                                                                    <input type="datetime-local" class="form-control" name="startDateTime"  id="startDateTime" >
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <input type="hidden" id="scheduleStart" name="scheduleStart" value="">
		                                                        <div class="col-6">
		                                                            <div class="form-group">
		                                                                <div class="controls">
		                                                                    <label for="endDateTime"><span class="fa fa-calendar mr-1"></span>마감일</label>
		                                                                    <input type="datetime-local" class="form-control" name="endDateTime" id="endDateTime" >
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <input type="hidden" id="scheduleEnd" name="scheduleEnd" value="">
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="languageselect2"><span class="fa fa-users mr-2"></span>참석자</label>
		                                                                <select class="form-control scheduleMemberSelect" multiple="multiple" onChange="selectScheduleMember(this)">
		                                                                    <option value="English" >English</option>
		                                                                    <option value="Spanish">Spanish</option>
		                                                                    <option value="French">French</option>
		                                                                    <option value="Russian">Russian</option>
		                                                                    <option value="German">German</option>
		                                                                    <option value="Arabic" >Arabic</option>
		                                                                    <option value="Sanskrit">Sanskrit</option>
		                                                                </select>
		                                                            </div>
		                                                        </div>
		                                                        <input type="hidden" id="scheduleMemberList" name="scheduleMemberList" value="">
		                                                        <div class="col-10">
		                                                            <div class="form-group">
		                                                                <label for="account-website"><span class="fa fa-map-marker mr-2"></span>장소</label>
		                                                                <input type="text" class="form-control" name="scheduleLocation" id="addr" placeholder="주소를 입력하세요.">
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-2">
		                                                        	<div class="form-group">
		                                                            	<button type="button" id="addrBtn" class="btn btn-secondary pull-right mt-2">주소 찾기</button>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="account-website"><span class="fa fa-map-marker mr-2"></span>상세 장소</label>
		                                                                <input type="text" class="form-control" id="detailAddr" placeholder="주소를 입력하세요.">
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12">
		                                                            <div class="form-group">
		                                                                <label for="accountTextarea"><span class="fa fa-pencil-square-o mr-1"></span>내용</label>
		                                                                <textarea class="form-control" id="accountTextarea" rows="5" placeholder="내용을 입력하세요."></textarea>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
		                                                        	<div class="form-group mt-1">
		                                                                <label for="accountSelect"><span class="fa fa-lock mr-1"></span>공개설정</label>
		                                                                <select class="form-control" id="accountSelect">
		                                                                    <option selected>전체공개</option>
		                                                                    <option>관리자, 작성자만 공개</option>
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
                                                    <button type="button" id="addScheduleBtn" class="btn btn-outline-primary">올리기</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
 