package com.gd.safari.service;

import java.util.List;
import java.util.Map;

public interface ITaskMemberService {
	// 해당 업무의 업무 멤버리스트 조회 - email, name - 피드백에서 사용할 메서드
	List<Map<String, Object>> getMemberListNameAndEmailByTaskNo(int taskNo);
	
	
	// 프로젝트멤버 가져오기
	List<Map<String, Object>> getTaskMember(int projectNo);
	// 해당 업무번호에 없는 프로젝트멤버 조회/해당 업무번호에 따른 업무멤버 조회 - 프로젝트번호, 업무번호 필요하여 map으로 사용
	List<Map<String, Object>> getTaskMemberByProjectNoAndTaskNo(Map<String, Integer> map);
	// 해당 업무번호에 따른 업무멤버 조회 (위에 것에서 파생되는 메서드)
	List<Map<String, Object>> getTaskMemberByTaskNo(Map<String, Integer> map);
	// 업무멤버 생성
	int addTaskMember(Map<String, Object> m);
	// 업무멤버 삭제
	int removeTaskMember(Map<String, Object> m);
}
