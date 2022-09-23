package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.TaskMember;

public interface ITaskMemberService {
	// 해당 업무번호에 없는 프로젝트멤버 조회/해당 업무번호에 따른 업무멤버 조회 - 프로젝트번호, 업무번호 필요하여 map으로 사용
	List<Map<String, Object>> getTaskMemberByProjectNoAndTaskNo(Map<String, Integer> map);
	// 해당 업무번호에 따른 업무멤버 조회 (위에 것에서 파생되는 메서드)
	List<Map<String, Object>> getTaskMemberByTaskNo(Map<String, Integer> map);
	// 업무멤버 생성
	int addTaskMember(TaskMember taskMember);
	// 업무멤버 삭제
	int removeTaskMember(TaskMember taskMember);
}
