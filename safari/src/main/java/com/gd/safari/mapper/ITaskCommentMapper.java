package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.TaskComment;

@Mapper
public interface ITaskCommentMapper {
	// 업무 코멘트리스트 가져오기
	List<Map<String, Object>> selectTaskComment(int taskNo);
	// 수정하기 위한 업무 코멘트 가져오기
	Map<String, Object> selectTaskCommentByTaskCmtNo(int taskCmtNo);
	// 고정된 코멘트 있을 경우 가져오기
	Map<String, Object> selectFixTaskCommentByTaskNo(int taskNo);
	// 업무 코멘트를 업무로 만들기 위해 내용 가져오기
	String selectTaskCommentToTask(int taskCmtNo);
	// 업무 코멘트 생성
	int insertTaskComment(TaskComment taskComment);
	// 업무 코멘트 수정
	int updateTaskComment(TaskComment taskComment);
	// 고정은 하나밖에 안되기 때문에 설정과 동시에 나머지는 해제를 해야한다.
	// 업무 코멘트 고정하기
	int updateFixTaskComment(int taskCmtNo);
	// 업무 코멘트 해제하기
	int updateUnfixedTaskComment(int taskCmtNo);
	// 업무 코멘트 삭제
	int deleteTaskComment(TaskComment taskComment);
}
