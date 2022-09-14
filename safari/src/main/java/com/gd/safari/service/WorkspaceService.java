package com.gd.safari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.controller.WorkspaceController;
import com.gd.safari.mapper.IWorkspaceMapper;
import com.gd.safari.vo.Workspace;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class WorkspaceService implements IWorkspaceService {
	@Autowired private IWorkspaceMapper WorkspaceMapper;
	
	
	
	@Override
	public int addWorkspace(Workspace workspace) {
		log.debug(TeamColor.CJM+workspace +"Service workspace"); // workspace 디버깅
		
		return WorkspaceMapper.insertWorkspace(workspace);
	}


	@Override
	public int removeWorkspace(int workNo) {
		log.debug(TeamColor.CJM+workNo +"Service WorkNo"); // workNo 디버깅
		return WorkspaceMapper.deleteWorkspace(workNo);
	}

}
