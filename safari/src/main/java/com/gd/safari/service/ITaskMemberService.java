package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.TaskMember;

public interface ITaskMemberService {
	// 프로젝트 멤버 조회 (IProjectMemberMapper에서 받아오기)
	List<Map<String, Object>> getProjectMemberList(int projectNo);
	// 해당 프로젝트번호 따른 업무멤버 조회
	List<Map<String, Object>> getTaskMemberByTask(int projectNo);
	// 업무멤버 생성
	int addTaskMember(TaskMember taskMember);
	// 업무멤버 삭제
	int removeTaskMember(TaskMember taskMember);
}
