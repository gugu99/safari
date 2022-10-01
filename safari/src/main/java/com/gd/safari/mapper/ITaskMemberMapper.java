package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.TaskMember;

@Mapper
public interface ITaskMemberMapper {
	// 해당 업무의 업무 멤버리스트 조회 - email, name - 피드백에서 사용할 메서드
	List<Map<String, Object>> selectMemberListNameAndEmailByTaskNo(int taskNo);
	
	
	// 프로젝트멤버 가져오기
	List<Map<String, Object>> selectTaskMember(int projectNo);
	// 해당 업무번호에 없는 프로젝트멤버 조회/해당 업무번호에 따른 업무멤버 조회 - 프로젝트번호, 업무번호 필요하여 map으로 사용
	List<Map<String, Object>> selectTaskMemberByProjectNoAndTaskNo(Map<String, Integer> m);
	// 업무리스트에 따른 업무멤버 가져오기 - 업무리스트 이동시 업무멤버 삭제하기 위한 메서드
	List<TaskMember> selectTaskMemberByTaskListNo(int tasklistNo);
	// 업무번호에 따른 업무멤버 가져오기 - 업무 이동시 업무멤버 삭제하기 위한 메서드
	List<TaskMember> selectTaskMemberByTaskNo(int taskNo);
	// 탈퇴를 위한 업무멤버 가져오기
	List<TaskMember> selectTaskMemberByMemberEmail(String memberEmail);
	// 업무멤버 생성
	int insertTaskMember(TaskMember taskMember);
	// 업무멤버 삭제
	int deleteTaskMember(TaskMember taskMember);
}
