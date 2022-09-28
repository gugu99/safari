package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.Task;

public interface ILowerTaskService {
	// 하위 업무 가져오기
	List<Map<String, Object>> getLowerTaskByTaskNo(int taskNo);
	// 프로젝트번호에 맞는 업무 가져오기 (단, 자신이 아닌 것)
	List<Map<String, Object>> getTaskByProjectNoForLowerTask(Map<String, Integer> map);
	// 하위 업무 생성
	int addLowerTask(Task task);
	// 하위 업무 전환
	int modifyChangeLowerTask(Map<String, Integer> m);
	// 메인 업무 전환
	int modifyChangeTask(int lowerTaskNo);
}
