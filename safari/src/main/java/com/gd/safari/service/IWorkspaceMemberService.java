package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.WorkspaceMember;



public interface IWorkspaceMemberService {
	
	int addWorkspaceMember(WorkspaceMember workspaceMember);
	List<WorkspaceMember> getWorkspaceMemberList(int workNo);
	Map<String,Object> getWorkspaceMemberOne(int workMemberNo);
	int getWorkspaceMemberNo(WorkspaceMember workspaceMember);
	int modifyWorkspaceMember (WorkspaceMember workspaceMember);
	int inviteAddWorkspaceMember(WorkspaceMember workspaceMember);
	String getWorkspaceMemberOneActive (int workMemberNo);
	String getWorkspaceMemberOneCode(int workMemberNo);
}
