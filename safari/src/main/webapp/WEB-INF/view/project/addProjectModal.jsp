<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="form-group">
	<div class="modal fade text-left" id="bootstrap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel35" aria-hidden="true">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <h3 class="modal-title" id="myModalLabel35">프로젝트 추가</h3>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                      </button>
                  </div><!-- modal header -->
                  <form method="post" action="${pageContext.request.contextPath}/safari/project">
                      <div class="modal-body">
                          <fieldset class="form-group floating-label-form-group">
                              <label for="projectName">프로젝트 이름(*)</label>
                              <input type="text" class="form-control" id="projectName" name="projectName">
                          </fieldset>
                          <fieldset class="form-group floating-label-form-group">
                             <label for="projectAuth">공개범위</label>
                             <select name="projectAuth" class="form-control" id="projectAuth">
                         <option value="N">public</option>
                         <option value="Y">private</option>
                     </select>
                          </fieldset>
                          <br>
                      </div>
                <div class="form-group col-12 mb-2">
                <div class="card-content collapse show">
                    <label for="projectMember">프로젝트 멤버</label>
                    <select class="select2 form-control" multiple="multiple" id="projectMember" onChange="selectProjectMember(this)">
                           <!-- 프로젝트 멤버 리스트를 띄울 곳 -->
                             <option value="1">Alaska</option>
                             <option value="2">Hawaii</option>
                             <option value="3">California</option>
                             <option value="4">Nevada</option>
                             <option value="5">Oregon</option>
                             <option value="6">Washington</option>
                      </select>
                  </div>
                  <input type="hidden" id="projectMemberList" name="projectMemberList" value="">
                   </div>
                  
                   <div class="modal-footer">
                       <input type="reset" class="projectForm btn btn-outline-secondary btn-lg" data-dismiss="modal" value="닫기">
                       <input type="submit" class="projectForm btn btn-outline-primary btn-lg" value="프로젝트 생성">
                   </div>
                 </form>
            </div>
        </div>
	</div>
</div>