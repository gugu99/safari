package com.gd.safari.service;


import java.util.List;

import com.gd.safari.vo.Workspace;


public interface IWorkspaceService {
	int addWorkspace(Workspace workspace , String workMemberName);
	int removeWorkspace(int workNo);
	List<Workspace> getWorkspaceList(String workMemberEmail);
}
