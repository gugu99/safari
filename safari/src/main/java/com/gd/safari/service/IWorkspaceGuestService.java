package com.gd.safari.service;

import java.util.List;

import com.gd.safari.vo.WorkspaceGuest;
import com.gd.safari.vo.WorkspaceMember;

public interface IWorkspaceGuestService {
	
	// 초대된 게스트 추가하는 메서드
	public int addWorkspaceGuestByInvite(WorkspaceGuest workspaceGuest, String[] memberEmail) ;
	
	// 워크스페이스 게스트
	List<WorkspaceMember> getWorkspaceGuestList(WorkspaceGuest workspaceGuest);
	
}