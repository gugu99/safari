package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.TaskMember;

@Mapper
public interface ITaskMemberMapper {
	// 해당 업무번호에 없는 프로젝트멤버 조회/해당 업무번호에 따른 업무멤버 조회 - 프로젝트번호, 업무번호 필요하여 map으로 사용
	List<Map<String, Object>> selectTaskMemberByProjectNoAndTaskNo(Map<String, Integer> map);
	// 업무멤버 생성
	int insertTaskMember(TaskMember taskMember);
	// 업무멤버 삭제
	int deleteTaskMember(TaskMember taskMember);
	// 업무를 삭제할 시 같이 삭제될 업무멤버 삭제 (부모 삭제 시 자식 삭제)
	int deleteTaskMemberByTaskNo(int taskNo);
	// 하위업무 삭제시 삭제될 업무멤버 삭제 (부모 삭제 시 자식의 자식 삭제)
	int deleteLowerTaskMemberByTaskNo(int taskNo);
	// 하위업무의 하위업무 삭제시 삭제될 업무멤버 삭제 (부모 삭제 시 자식의 자식의 자식 삭제)
	int deleteLowerLowerTaskMemberByTaskNo(int taskNo);
}
