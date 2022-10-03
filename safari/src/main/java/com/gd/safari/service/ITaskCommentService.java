package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.TaskComment;

public interface ITaskCommentService {
	// 업무 코멘트리스트 가져오기
	List<Map<String, Object>> getTaskComment(int taskNo);
	// 수정하기 위한 업무 코멘트 가져오기
	Map<String, Object> getTaskCommentByTaskCmtNo(int taskCmtNo);
	// 업무 코멘트 생성
	int addTaskComment(TaskComment taskComment);
	// 업무 코멘트 수정
	int modifyTaskComment(TaskComment taskComment);
	// 업무 코멘트 삭제
	int removeTaskComment(int taskCmtNo);
}
