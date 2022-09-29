<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  <div class="app-content content"> 밑에 include -->
<div class="content-header row p-1 border bg-white">
	<div class="col-sm-3"><a href="${pageContext.request.contextPath }/member/project"><i class="feather icon-arrow-left"></i></a></div>
	<div class="col-sm-8">
		<div class="container">
			<div class="row">
				<div class="col-sm-2"><a href="${pageContext.request.contextPath }/member/taskList?projectNo=${projectNo}">업무</a></div>	
				<div class="col-sm-2"><a href="${pageContext.request.contextPath }/safari/scheduleList">일정</a></div>		
				<div class="col-sm-2"><a href="${pageContext.request.contextPath }/safari/todoList">할일</a></div>	
				<div class="col-sm-2"><a href="${pageContext.request.contextPath }">분석</a></div>		
				<c:if test="${guest eq null}">
					<div class="col-sm-2"><a href="${pageContext.request.contextPath }/member/fileList">파일</a></div>
					<div class="col-sm-2"><a href="${pageContext.request.contextPath }/safari/logList">로그</a></div>	
				</c:if>
			</div>
		</div>
	</div>
</div>