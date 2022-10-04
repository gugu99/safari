package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.TaskComment;

public interface ITaskCommentService {
	// 업무 코멘트리스트 가져오기
	List<Map<String, Object>> getTaskComment(int taskNo);
	// 수정하기 위한 업무 코멘트 가져오기
	Map<String, Object> getTaskCommentByTaskCmtNo(int taskCmtNo);
	// 고정된 코멘트 있을 경우 가져오기
	Map<String, Object> getFixTaskCommentByTaskNo(int taskNo);
	// 업무 코멘트 생성
	int addTaskComment(TaskComment taskComment);
	// 업무 코멘트 수정
	int modifyTaskComment(TaskComment taskComment);
	// 고정은 하나밖에 안되기 때문에 설정과 동시에 나머지는 해제를 해야한다.
	// 업무 코멘트 고정하기
	int modifyFixTaskComment(int taskCmtNo);
	// 업무 코멘트 해제하기
	int modifyUnfixedTaskComment(int taskCmtNo);
	// 업무 코멘트 삭제
	int removeTaskComment(TaskComment taskComment);
}
