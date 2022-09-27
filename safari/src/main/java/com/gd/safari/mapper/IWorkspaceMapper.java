package com.gd.safari.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Workspace;

@Mapper
public interface IWorkspaceMapper {
	
	// 워크스페이스 생성
	int insertWorkspace(Workspace workspace);
	
	// 워크스페이스 삭제
	int deleteWorkspace(int workNo);
	
	// 워크스페이스 수정
	int updateWorkspace(Workspace workspace);
	
	// 워크스페이스 리스트
	List<Workspace> selectWorkspaceList(String workMemberEmail);
	
	// 워크스페이스 관리자변경
	int updateWorkspaceAdminEmail(Workspace workspace);
	
	// 워크스페이스 관리자조회
	String selectWorkspaceAdminEmail(int workNo);
	
	// 워크스페이스 게스트 리스트

}
