package com.gd.safari.mapper;

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
	Workspace selectWorkspace();
	
}
