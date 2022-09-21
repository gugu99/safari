package com.gd.safari.service;


import java.util.List;

import com.gd.safari.vo.Member;
import com.gd.safari.vo.Workspace;
import com.gd.safari.vo.WorkspaceMember;


public interface IWorkspaceService {
	int addWorkspace(Workspace workspace , WorkspaceMember workspaceMember);
	int removeWorkspace(int workNo,Member member);
	List<Workspace> getWorkspaceList(String workMemberEmail);
	int modifyWorkspace(Workspace workspace);
}
