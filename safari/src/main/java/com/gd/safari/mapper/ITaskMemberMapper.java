package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.TaskMember;

@Mapper
public interface ITaskMemberMapper {
	// 해당 프로젝트번호 따른 업무멤버 조회
	List<Map<String, Object>> selectTaskMemberByTask(int projectNo);
	// 업무멤버 생성
	int insertTaskMember(TaskMember taskMember);
	// 업무멤버 삭제
	int deleteTaskMember(TaskMember taskMember);
}
