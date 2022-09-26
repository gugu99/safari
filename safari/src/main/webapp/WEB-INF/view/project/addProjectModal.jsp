<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="form-group">
	<div class="modal fade text-left" id="bootstrap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel35" aria-hidden="true">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <h3 class="modal-title" id="myModalLabel35">프로젝트 추가</h3>
                  </div><!-- modal header -->
                  <form method="post" action="${pageContext.request.contextPath}/safari/project" id="addProjectForm">
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
	                	 <div class="form-group">
	                         <label>프로젝트 관리자</label>
	                         <select class="form-control select2" multiple="multiple" id="projectMemberList" name="projectMemberList">
	                           <c:forEach var="wm" items="${workspaceMemberList}">
	                           		<c:if test="${workMemberNo eq wm.workMemberNo}">
	                           			<option value="${wm.workMemberNo}" selected>${wm.workMemberName}</option>
	                           		</c:if>
	                           		<c:if test="${workMemberNo ne wm.workMemberNo}">
	                           			<option value="${wm.workMemberNo}">${wm.workMemberName}</option>
	                           		</c:if>
	                           </c:forEach>
	                         </select>
	                     </div>
	               </div>
	               
	               <input type="hidden" value="${sessionScope.workNo}" name="workNo">
	               <input type="hidden" value="${sessionScope.workMemberNo}" name="projManagerNo">
	               
                   <div class="modal-footer">
                       <button type="button" class="projectForm btn btn-outline-secondary btn-lg" id="hideBtn">닫기</button>
                       <button type="button" class="projectForm btn btn-outline-primary btn-lg" id="projectBtn">프로젝트 생성</button>
                   </div>
                 </form>
            </div>
        </div>
	</div>
</div>