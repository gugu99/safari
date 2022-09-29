package com.gd.safari.mapper;

import com.gd.safari.vo.TaskComment;

public interface ITaskCommentMapper {
	
	// 업무 코멘트 작성
	int insertTaskComment(TaskComment taskComment);
	
	// 업무하위코멘트 작성
	int insertSubTaskComment(TaskComment taskComment);
	
	// 업무 코멘트 수정
	int updateTaskComment(TaskComment taskComment);
	
	// 업무 코멘트 삭제
	int deleteTaskComment(TaskComment taskComment);
	
	// 업무 코멘트 고정하기
	int updateTaskCommentNewTaskCmtFix(TaskComment taskComment);
	
	// 원래 고정이었던 코멘트 고정여부 수정
	int updateTaskCommentLastTaskCmtFix(TaskComment taskComment);
	
	// 고정인 코멘트 불러오기
	int selectTaskCommentNoByTaskCmtFixY(TaskComment taskComment);
	
	// 코멘트 리스트
	int selectTaskCommentList(TaskComment taskComment);
	
}
