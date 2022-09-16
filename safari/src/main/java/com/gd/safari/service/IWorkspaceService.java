package com.gd.safari.service;


import java.util.List;

import com.gd.safari.vo.Member;
import com.gd.safari.vo.Workspace;


public interface IWorkspaceService {
	int addWorkspace(Workspace workspace , String workMemberName);
	int removeWorkspace(int workNo,Member member);
	List<Workspace> getWorkspaceList(String workMemberEmail);
}
