package com.gd.safari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IMemberMapper;
import com.gd.safari.mapper.IWorkspaceMapper;
import com.gd.safari.mapper.IWorkspaceMemberMapper;
import com.gd.safari.vo.Member;
import com.gd.safari.vo.Workspace;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class WorkspaceService implements IWorkspaceService {
	@Autowired private IWorkspaceMapper workspaceMapper;
	@Autowired private IWorkspaceMemberMapper workspaceMemberMapper;
	@Autowired private IMemberMapper memberMapper;

	@Override
	public int addWorkspace(Workspace workspace, WorkspaceMember workspaceMember) {
		
		// workspace 디버깅
		log.debug(TeamColor.CJM + workspace + "Service workspace"); 			 
		
		// workspace 생성
		workspaceMapper.insertWorkspace(workspace); 							 
		
		 // workspace No디버깅
		log.debug(TeamColor.CJM + workspace.getWorkNo() + "get WorkNo Service");
		
		// 워크스페이스에 삽입된 wokNo 가져오기
		int workNo = workspace.getWorkNo();
		
		// 워크스페이스멤버에 wokNo 삽입
		workspaceMember.setWorkNo(workNo);
		
		// 워크스페이스멤버에 WorkMemberEmail 삽입
		workspaceMember.setWorkMemberEmail(workspace.getAdminEmail()); 			
		
		// workspaceMember 생성
		workspaceMemberMapper.insertWorkspaceCreater(workspaceMember);			
		
		// workNo 리턴
		return workNo;
	}

	@Override
	public int removeWorkspace(int workNo, Member member) {
		
		// workNo 디버깅
		log.debug(TeamColor.CJM + workNo + "Service WorkNo"); 					
		
		// member 디버깅
		log.debug(TeamColor.CJM + member + "Service member"); 					

		// member 조회
		Member resultMember = memberMapper.selectMemberByLogin(member); 		
		
		// Service resultMember 디버깅
		log.debug(TeamColor.CJM + resultMember + "Service resultMember");
		
		// member 삭제
		if (resultMember != null) {
			workspaceMemberMapper.deleteWorkspaceMember(workNo); 				
			return workspaceMapper.deleteWorkspace(workNo);
		} // 워크스페이스 삭제

		return 0;

	}

	@Override
	public List<Workspace> getWorkspaceList(String workMemberEmail) {
		
		// workMemberEmail 디버깅
		log.debug(TeamColor.CJM + workMemberEmail + "Service workMemberEmail"); 
		
		// 워크스페이스 리스트 조회 메서드
		return workspaceMapper.selectWorkspaceList(workMemberEmail);
	}

	@Override
	public int modifyWorkspace(Workspace workspace) {
		
		// workspace 디버깅
		log.debug(TeamColor.CJM + workspace + "Service workspace"); 
		
		// 워크스페이스 수정 메서드
		return workspaceMapper.updateWorkspace(workspace);
	}
	
	// 워크스페이스 관리자 이메일 변경 메서드
	@Override
	public int modifyWorkspaceAdminEmail(Workspace workspace,WorkspaceMember workspaceMember,int workMemberNo) {
		
		// workspace 디버깅
		log.debug(TeamColor.CJM + workspace + "Service workspace");
		
		// 바뀌기전 어드민 이메일 담기
		String adminEmail = workspace.getAdminEmail();
		
		// 워크스페이스 관리자 이메일 변경 메서드
		workspaceMapper.updateWorkspaceAdminEmail(workspace);
		
		// 워크스페이스 과거 관리자 레벨 변경
		workspaceMemberMapper.updateWorkspaceMemberByAdminLevel(workMemberNo);
		
		// 워크스페이스 새로운 관리자 레벨변경
		workspaceMemberMapper.updateWorkspaceMemberByNewAdminLevel(workspaceMember.getWorkMemberNo());
		
		// 워크스페이스 번호 얻기
		workspaceMember.setWorkNo(workspace.getWorkNo());
		
		// 이메일 담기
		workspaceMember.setWorkMemberEmail(adminEmail);
		
		return workspaceMemberMapper.selectWorkspaceMemberLevel(workspaceMember);
	}

	
	
}
