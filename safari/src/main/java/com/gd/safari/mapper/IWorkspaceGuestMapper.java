package com.gd.safari.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.WorkspaceGuest;
import com.gd.safari.vo.WorkspaceMember;

@Mapper
public interface IWorkspaceGuestMapper {
	
	// 워크스페이스 게스트 추가
	int insertWorkspaceGuest(WorkspaceGuest workspaceGuest);
	
	// 워크스페이스 게스트 목록
	List<WorkspaceMember> selectWorkspaceGuestList(WorkspaceGuest workspaceGuest);
}
