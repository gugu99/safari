package com.gd.safari.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ProjectMember;

@Mapper
public interface IProjectMemberMapper {
	// 프로젝트 멤버 추가 메소드(프로젝트 추가 메소드와 트랜잭션)
	int insertProjectMember(ProjectMember projectMember);
	int insertProjectManager(ProjectMember projectMember);
	
	// auth 값에 따른(멤버, 관리자) 프로젝트 멤버 리스트를 반환
	// projectNo, projectMemberAuth 필요
	List<Map<String, Object>> selecProjectMemberListByMemberAuth(Map<String, Object> map);
	
	// 워크스페이스 멤버에 해당 프로젝트에 속한 멤버를 Left Join - 수정 폼에서 사용 /////
	List<Map<String, Object>> selectProjectMemberListByProjectNo(int workNo, int projectNo);
	
	// 해당 프로젝트에 속한 멤버와 관리자, email을 반환 - 조원들을 위해 생성
	List<Map<String, Object>> selectProjectMemberList(int projectNo);
	
	// 프로젝트에 속한 멤버의 no만 리턴 -> 수정 메소드에서 사용 ///// 
	List<Integer> selectProjectMemberNoList(int projectNo);
	
	// 프로젝트 멤버의 활성화 값을 N으로 수정 (프로젝트에서 탈퇴)
	int updateProjectMemberActiveN(ProjectMember projectMember);
	
	// 프로젝트 멤버 삭제
	int deleteProjectMemberByProjectNo(int projectNo);
	
	// 관리자 여부 확인
	Integer selectProjectManager(int projectNo, int workMemberNo);
}
