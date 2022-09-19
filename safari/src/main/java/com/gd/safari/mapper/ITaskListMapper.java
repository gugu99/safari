package com.gd.safari.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.TaskList;

@Mapper
public interface ITaskListMapper {
	// 업무리스트 조회
	List<TaskList> selectTaskList(int projectNo);
	// 업무리스트 생성
	int insertTaskList(TaskList tasklist);
	// 업무리스트 수정
	int updateTaskList(TaskList tasklist);
	// 업무리스트 삭제
	int deleteTaskList(int tasklistNo);
}
