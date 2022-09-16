package com.gd.safari.service;

import java.util.List;

import com.gd.safari.vo.WorkspaceMember;



public interface IWorkspaceMemberService {
	
	int addWorkspaceMember(WorkspaceMember workspaceMember);
	List<WorkspaceMember> getWorkspaceMemberList(int workNo);
	WorkspaceMember getWorkspaceMemberOne(WorkspaceMember workspaceMember);
}
