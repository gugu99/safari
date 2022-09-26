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
                                <div class="modal fade text-left" id="add-feedback" tabindex="-1" role="dialog" aria-labelledby="myModalLabel17" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="myModalLabel17">피드백 작성</h3>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                              <form action="${pageContext.request.contextPath }/safari/" method="post" id="addFeedbackForm">
                                             		<input type="hidden" name="scheduleWriter" value="${login }">
                                                  <div class="row">
                                                  	 <div class="col-12">
                                                          <div class="form-group">
                                                              <label for="languageselect2"><span class="fa fa-list-ul mr-2"></span>업무(*)</label>
                                                              <select class="form-control select" id="taskList">
                                                           		 <option value="default" >업무를 선택하세요</option>
                                                           		 <option value="email" >업무1</option>
                                                           		 <option value="email" >업무2</option>
                                                           		 <option value="email" >업무3</option>
                                                              </select>
                                                          </div>
                                                      </div>
                                                      
                                                      <div class="col-12">
                                                          <div class="form-group">
                                                              <label for="languageselect2"><span class="fa fa-users mr-2"></span>피드백 멤버(*)</label>
                                                              <select class="form-control memberSelect" id="feedbackReceiver" multiple="multiple" onChange="selectFeedbackReceiver(this)">
                                                           		 <%-- <option value="${}" ${login eq  ? 'selected' : ''}>${fm.workMemberName }</option> --%>
                                                           		 <option value="email" selected>이름1</option>
                                                           		 <option value="email" >이름2</option>
                                                           		 <option value="email" >이름3</option>
                                                              </select>
                                                          </div>
                                                      </div>
                                                      <input type="hidden" id="feedbackReceiverList" name="feedbackReceiverList" value="">
                                                      <div class="col-12">
                                                          <div class="form-group">
                                                              <label for="scheduleContent"><span class="fa fa-pencil-square-o mr-1"></span>내용</label>
                                                              <textarea class="form-control" name="scheduleContent" id="scheduleContent" rows="5" placeholder="내용을 입력하세요."></textarea>
                                                          </div>
                                                      </div>
                                                      <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
                                                      	<div class="form-group mt-1">
                                                              <label for="scheduleAuth"><span class="fa fa-lock mr-1"></span>공개설정</label>
                                                              <select class="form-control" id="scheduleAuth" name="scheduleAuth">
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
                                                <button type="button" id="addFeedbackBtn" class="btn btn-outline-primary">올리기</button>
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