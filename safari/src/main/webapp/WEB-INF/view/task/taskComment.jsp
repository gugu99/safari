<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="card shadow-none quill-wrapper">
        <div class="card-header d-flex justify-content-between align-items-center border-bottom px-2 py-1">
            <h3 class="card-title">코멘트</h3>
            <button type="button" class="close close-icon">
                <i class="feather icon-x"></i>
            </button>
        </div>
        <!-- form start -->
        <div class="card-content position-relative" id="taskCmtCardContent">
            <div class="card-body" id="taskCmtCardBody">
                <form class="edit-kanban-item" action="${pageContext.request.contextPath }/member/insertTaskComment" method="post">
	               	<div class="form-group">
			            <label>코멘트</label>
		                <div class="snow-container border rounded p-1">
		                    <textarea class="compose-editor form-control" id="taskCmtContent" placeholder="댓글을 적어주세요."></textarea>
		                    <div class="d-flex justify-content-end">
		                        <div class="compose-quill-toolbar">
		                            <span class="ql-formats mr-0">
		                                <button type="button" class="btn btn-sm btn-primary btn-comment ml-25" id="cmtBtn">보내기</button>
		                            </span>
		                        </div>
		                    </div>
		            	</div>
			        </div>
		        </form>
		    </div>
		    <div class="card-footer">
		        <div class="form-group" id="taskCommentList">
			            	<!-- taskCommentList 들어옴 
			            	<div class="snow-container border rounded p-1 mb-1">
			                    <div class="compose-editor">
			                    	<div class="row">
				                    	<div class="col-10">
											<div class="font-weight-bold">
												예시
											</div>
											<div class="small">
												예시
											</div>
										</div>
				                    	<div class="font-weight-bold col-2">
				                    		<button type="button" class="btn btn-sm"><i class="feather icon-corner-up-left small"></i></button>
				                    		<button type="button" class="btn btn-sm"><i class="feather icon-thumbs-up small"></i></button>
				                    		<button type="button" class="btn btn-sm"><i class="feather icon-more-vertical small"></i></button>
										</div>
									</div>
									<hr>
									<div>
										잘했어요
									</div>
			                    </div>
			                </div>-->
				</div>
			</div>
		</div>
    <!-- form start end-->
	</div>
