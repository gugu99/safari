package com.gd.safari.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.vo.WorkspaceMember;



public interface IWorkspaceMemberService {
	
	// 워스크페이스 멤버 추가메서드
	int addWorkspaceMember(WorkspaceMember workspaceMember);
	
	// 멤버리스트 보기메서드
	List<WorkspaceMember> getWorkspaceMemberList(int workNo);
	
	// 멤버 상세보기 메서드
	Map<String,Object> getWorkspaceMemberOne(int workMemberNo);
	
	// 멤버 No가져오는 메서드
	int getWorkspaceMemberNo(WorkspaceMember workspaceMember);
	
	// 멤버 수정 메서드
	int modifyWorkspaceMember (WorkspaceMember workspaceMember);
	
	// 초대된 멤버 워크스페이스멤버에 추가하는메서드 
	int inviteAddWorkspaceMember(WorkspaceMember workspaceMember,String[] workMemberEmail);
	
	// 워크스페이스멤버 활용여부 파악하는 메서드
	String getWorkspaceMemberOneActive (int workMemberNo);
	
	// 초대된 워크스페이스멤버 코드 수집하는메서드
	String getWorkspaceMemberOneCode(int workMemberNo);
	
	// 현재 가입된 이메일 확인하는메서드
	public boolean getMemberEmailByConfirm(String memberEmail);
	
	// 초대된 멤버 처음 입장시 정보 변경하는메서드
	int modifyWorkspaceMemberByInvite(WorkspaceMember workspaceMember);
	
	// 워크스페이스 멤버 권한등급 조정 메서드
	int modifyWorkspaceMemberByLevel(WorkspaceMember workspaceMember);
	
	// 워크스페이스 멤버 활동정지 하는메서드
	int modifyWorkspaceMemberByActive (int workMemberNo);
	
	// 워크스페이스 레벨 알아오는 메서드
	int getWorkspaceMemberLevel (WorkspaceMember workspaceMember);
	
	// 워크스페이스 활동여부에 따른 리스트
	 List<WorkspaceMember> getWorkspaceMemberListByActive(WorkspaceMember workspaceMember);
	
	 // Active Y로 바꾸는 메서드 
	int modifyWorkspaceMemberActiveApprove(int workMemberNo);
	
	// 가입된 workspaceMemberEmail 인지 확인 하는 메서드
	String getWorkspaceMemberEmailByConfirm(WorkspaceMember workspaceMember);
	
	// 워크스페이스 멤버수 구하기
	ArrayList<Integer> getWorkspaceMemberCount(WorkspaceMember workspaceMember);
}
