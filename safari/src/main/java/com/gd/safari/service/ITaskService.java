package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.Task;

public interface ITaskService {
	// 프로젝트 번호에 맞는 업무 조회
	List<Task> getTaskByProjectNo(int projectNo);
	// 상세 보기
	Map<String, Object> getTaskByTaskNo(int taskNo);
	// 업무 생성
	int addTask(Task task);
	// 업무 수정
	int modifyTask(Task task);
	// 업무 삭제
	int removeTask(int taskNo);
}
