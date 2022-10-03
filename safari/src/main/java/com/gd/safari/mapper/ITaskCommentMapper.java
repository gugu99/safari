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
	// 업무 코멘트 생성
	int insertTaskComment(TaskComment taskComment);
	// 업무 코멘트 수정
	int updateTaskComment(TaskComment taskComment);
	// 업무 코멘트 삭제
	int deleteTaskComment(int taskCmtNo);
}
