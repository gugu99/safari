package com.gd.safari.service;

import java.util.List;

import com.gd.safari.vo.TaskList;

public interface ITaskListService {
	// 업무리스트 보여주기
	List<TaskList> getTaskList();
	// 업무리스트 생성
	int addTaskList(TaskList tasklist);
	// 업무리스트 수정
	int modifyTaskList(TaskList tasklist);
	// 업무리스트 삭제
	int removeTaskList(int tasklistNo);
}
