package com.gd.safari.service;


import java.util.List;


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
}
