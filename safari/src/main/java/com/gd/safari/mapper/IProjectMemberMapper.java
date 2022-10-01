package com.gd.safari.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ProjectMember;

@Mapper
public interface IProjectMemberMapper {
	// 프로젝트 멤버 추가 메소드(프로젝트 추가 메소드와 트랜잭션)
	int insertProjectMember(ProjectMember projectMember);
	
	// 워크스페이스 멤버에 해당 프로젝트에 속한 멤버를 Left Join - 수정 폼에서 사용
	List<Map<String, Object>> selectPossibleProjectMemberListByWorkNoAndProjectNo(int workNo, int projectNo);
	
	// 해당 프로젝트에 속한 멤버와 관리자, email을 반환 - 조원들을 위해 생성
	List<Map<String, Object>> selectProjectMemberList(int projectNo);	
	
	// 관리자 여부 확인 - null이면 관리자가 아님
	Integer selectProjectManager(int projectNo, int workMemberNo);
	
	// 프로젝트 멤버 수정
	int updateProjectMember(ProjectMember projectMember);
	
	// (탈퇴 기능에서 사용)
	int updateProjectMemberActiveNByMemberEmail(String memberEmail);
	
	// 해당 프로젝트에 속 멤버를 모두 삭제 -> Project 삭제 메소드에서 사용
	int deleteProjectMemberByProjectNo(int projectNo);
}
