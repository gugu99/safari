package com.gd.safari.service;


import java.util.List;
import java.util.Map;

import com.gd.safari.vo.Member;
import com.gd.safari.vo.Workspace;
import com.gd.safari.vo.WorkspaceMember;


public interface IWorkspaceService {
	// 워크스페이스 추가
	int addWorkspace(Workspace workspace , WorkspaceMember workspaceMember);
	// 워크스페이스 제거
	int removeWorkspace(int workNo,Member member);
	// 워크스페이스 리스트
	List<Workspace> getWorkspaceList(String workMemberEmail);
	// 워크스페이스 수정
	int modifyWorkspace(Workspace workspace);
	// 존재하는 아이디인지 확인
	
	// 관리자 이메일 변경메서드
	int modifyWorkspaceAdminEmail(Workspace workspace,WorkspaceMember workspaceMember,int workMemberNo);
	
	// 탈퇴를 위한 소유권 이전하기
	// 워크스페이스 내가 관리자인 리스트
	List<Workspace> getMyWorkspaceByMemberEmail(String memberEmail);
	
	// 워크스페이스 이름가져오기
	Workspace getMyWorkspaceByWorkNo(int workNo);
	
	
	
}
