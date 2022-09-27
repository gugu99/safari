package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.Task;

public interface ILowerTaskService {
	// 하위 업무 가져오기
	List<Map<String, Object>> getLowerTaskByTaskNo(int taskNo);
	// 프로젝트번호에 맞는 업무 가져오기 (단, 하위업무가 아닌 것)
	List<Map<String, Object>> getLowerTaskByProjectNo(Map<String, Integer> map);
	// 하위 업무 생성
	int addLowerTask(Task task);
	// 하위 업무 추가
	int modifyinsertLowerTask(Map<String, Integer> m);
	// 하위 업무 해제
	int modifydeleteLowerTask(int lowerTaskNo);
}
