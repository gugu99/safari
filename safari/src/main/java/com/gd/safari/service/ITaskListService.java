package com.gd.safari.service;

import java.util.List;

import com.gd.safari.vo.CopyTaskList;
import com.gd.safari.vo.TaskList;

public interface ITaskListService {
	// 업무리스트 조회
	List<TaskList> getTaskList(int projectNo);
	// 현재 프로젝트 이름 조회 (업무리스트 위치변경을 위해)
	String getProjectNameByTasklistNo(int tasklistNo);
	// 업무리스트 복사
	CopyTaskList getTaskListAndTaskForCopy(int tasklistNo);
	// 업무리스트 복사생성
	int addCopyTaskList(CopyTaskList copyTaskList);
	// 업무리스트 생성
	int addTaskList(TaskList tasklist);
	// 업무리스트 수정
	int modifyTaskList(TaskList tasklist);
	// 업무리스트 위치변경 - tasklistNo, projectNo가 필요하다
	int modifyTaskListLocation(int projectNo, int tasklistNo);
	// 업무리스트 삭제
	int removeTaskList(int tasklistNo);
}
