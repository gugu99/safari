package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.TaskMember;

public interface ITaskMemberService {
	// 프로젝트 멤버 조회 (IProjectMemberMapper에서 받아오기)
	List<Map<String, Object>> getProjectMemberList(int projectNo);
	// 해당 업무번호에 따른 업무멤버 조회
	List<Map<String, Object>> getTaskMemberByTaskNo(int taskNo);
	// 해당 업무번호에 없는 프로젝트멤버 조회/해당 업무번호에 따른 업무멤버 조회 - 프로젝트번호, 업무번호 필요하여 map으로 사용
	List<Map<String, Object>> getTaskMemberByProjectNoAndTaskNo(Map<String, Integer> map);
	// 업무멤버 생성
	int addTaskMember(TaskMember taskMember);
	// 업무멤버 삭제
	int removeTaskMember(TaskMember taskMember);
}
