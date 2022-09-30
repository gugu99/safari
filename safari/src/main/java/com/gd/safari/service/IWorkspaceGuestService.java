package com.gd.safari.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gd.safari.vo.WorkspaceGuest;
import com.gd.safari.vo.WorkspaceMember;

public interface IWorkspaceGuestService {
	
	// 초대된 게스트 추가하는 메서드
	public int addWorkspaceGuestByInvite(WorkspaceGuest workspaceGuest, String[] memberEmail) ;
	
	// 워크스페이스 게스트 리스트
	List<WorkspaceMember> getWorkspaceGuestList(Map<String,Object> map);
	
	// 워크스페이스게스트 추방
	int modifyWorkspaceGuestByActive (WorkspaceGuest workspaceGuest);
	
	// 워크스페이스 게스트 승인
	int modifyWorkspaceGuestActiveApprove(WorkspaceGuest workspaceGuest);
	
	// 이미 생성된 게스트아이디인지 확인
	String getWorkspaceGuestEmailByConfirm(WorkspaceGuest workspaceGuest);
	
	// 워크스페이스 멤버수 구하기
	ArrayList<Integer> getWorkspaceGuestCount(int workNo);
	
	// 워크스페이스 게스트 index 목록 
	List<Map<String,Object>> getWorkspaceGuestListByEmail (String memberEmail);
	
	// 워크스페이스 게스트 코드 확인하기
	String getWorkspaceGuestOneCode (WorkspaceGuest workspaceGuest);
	
	// 활동상태 알아보기
	String getWorkspaceGuestOneActive(WorkspaceGuest workspaceGuest);
	
}
