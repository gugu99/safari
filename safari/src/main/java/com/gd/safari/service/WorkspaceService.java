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
	public int addWorkspace(Workspace workspace , String workMemberName) {
		log.debug(TeamColor.CJM+workspace +"Service workspace");				 	 // workspace 디버깅
		workspaceMapper.insertWorkspace(workspace); 					  		     //workspace 생성
		log.debug(TeamColor.CJM+workspace.getWorkNo() +"get WorkNo Service");		//		 	
		WorkspaceMember workspaceMember = new WorkspaceMember();
		int workNo= workspace.getWorkNo();
		workspaceMember.setWorkNo(workNo);
		workspaceMember.setWorkMemberName(workMemberName); 							 // workspaceMember Name 입력
		workspaceMember.setWorkMemberEmail(workspace.getAdminEmail());				 // workspaceMember Email입력
		
		return workspaceMemberMapper.insertWorkspaceCreater(workspaceMember);		 //workspaceMember 생성
	}


	@Override
	public int removeWorkspace(int workNo,Member member) {
		log.debug(TeamColor.CJM+workNo +"Service WorkNo"); 						// workNo 디버깅
		log.debug(TeamColor.CJM+member +"Service member"); 						// member 디버깅
		
		Member resultMember = memberMapper.selectMemberByLogin(member);			// member 조회
		log.debug(TeamColor.CJM+resultMember +"Service resultMember"); 
		if(resultMember!=null) {
		workspaceMemberMapper.deleteWorkspaceMember(workNo);					// member 삭제
		return workspaceMapper.deleteWorkspace(workNo);	}						// 워크스페이스 삭제
		
		return 0;
					
	}


	@Override
	public List<Workspace> getWorkspaceList(String workMemberEmail) {
		log.debug(TeamColor.CJM+workMemberEmail +"Service workMemberEmail"); 				// workMemberEmail 디버깅
		return workspaceMapper.selectWorkspaceList(workMemberEmail);
	}


	@Override
	public int modifyWorkspace(Workspace workspace) {
		log.debug(TeamColor.CJM+workspace +"Service workspace"); 				// workspace 디버깅
		return workspaceMapper.updateWorkspace(workspace);
	}

}
