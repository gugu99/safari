package com.gd.safari.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ProjectMember;

@Mapper
public interface IProjectMemberMapper {
	// 프로젝트 멤버 추가 메소드(프로젝트 추가 메소드와 트랜잭션)
	int insertProjectMember(ProjectMember projectMember);
	
	// 워크스페이스 멤버에 해당 프로젝트에 속한 멤버를 Left Join - 수정 폼에서 사용
	List<Map<String, Object>> selectProjectMemberListByProjectNo(int workNo, int projectNo);
	
	// 실제 프로젝트에 속한 멤버 + 멤버 email을 반환 - 조원들을 위해 생성
	List<Map<String, Object>> selectProjectMemberList(int projectNo);
	
}
