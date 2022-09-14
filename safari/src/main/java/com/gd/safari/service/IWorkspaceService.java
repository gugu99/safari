package com.gd.safari.service;


import com.gd.safari.vo.Workspace;


public interface IWorkspaceService {
	int addWorkspace(Workspace workspace);
	int removeWorkspace(int workNo);
	
}
