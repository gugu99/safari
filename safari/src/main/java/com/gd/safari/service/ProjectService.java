package com.gd.safari.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IProjectGroupMapper;
import com.gd.safari.mapper.IProjectMapper;
import com.gd.safari.mapper.IWorkspaceMemberMapper;
import com.gd.safari.vo.Project;
import com.gd.safari.vo.ProjectGroup;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProjectService implements IProjectService {
	@Autowired
	private IWorkspaceMemberMapper workspaceMemberMapper;
	@Autowired
	private IProjectMapper projectMapper;
	@Autowired
	private IProjectGroupMapper projectGroupMapper;

	// project 메인 페이지 정보 제공 메소드
	@Override
	public Map<String, Object> getProjectListByWorkspace(int workNo) {
		Map<String, Object> map = new HashMap<>();
		
		// 전체 프로젝트 리스트
		List<Project> projectList = projectMapper.selectProjectListByWorkspaceNo(workNo);
		log.debug(TeamColor.CSK + projectList);
		
		// 워크스페이스 멤버 리스트
		List<WorkspaceMember> workspaceMemberList = workspaceMemberMapper.selectWorkspaceMemberList(workNo);
		log.debug(TeamColor.CSK + workspaceMemberList);

		// 프로젝트 그룹리스트
		List<ProjectGroup> projectGroupList = projectGroupMapper.selectProjectGroupListByWorkspaceNo(workNo);
		log.debug(TeamColor.CSK + projectGroupList);

		// map에 묶기
		map.put("projectList", projectList);
		map.put("workspaceMemberList", workspaceMemberList);
		map.put("projectGroupList", projectGroupList);
		
		return map;
	}
}
