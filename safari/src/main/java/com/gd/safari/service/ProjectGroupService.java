package com.gd.safari.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IProjectGroupMapper;
import com.gd.safari.mapper.IProjectMapper;
import com.gd.safari.vo.ProjectGroup;
import com.gd.safari.vo.ProjectGroupConn;
import com.gd.safari.vo.ProjectGroupForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProjectGroupService implements IProjectGroupService {
	@Autowired
	IProjectGroupMapper projectGroupMapper;
	@Autowired
	IProjectMapper projectMapper;
	
	// 프로젝트 그룹 추가
	@Override
	public int addProjectGroup(ProjectGroup projectGroup) {
		return projectGroupMapper.insertProjectGroup(projectGroup);
	}
	
	// 한 프로젝트 그룹의 정보와 해당 그룹에 속한 프로젝트 리스트를 반환
	// 수정 form에서 사용
	@Override
	public Map<String, Object> getAllProjectByProjectGroupNo(int workNo, int projectGroupNo) {
		Map<String, Object> map = new HashMap<>();
		
		List<Map<String, Object>> projectList = projectMapper.selectAllProjectByProjectGroupNo(workNo, projectGroupNo);
		ProjectGroup projectGroup = projectGroupMapper.selectProjectGroupByProjectGroupNo(projectGroupNo);
		
		map.put("projectList", projectList);
		map.put("projectGroup", projectGroup);
		
		return map;
	}
	
	// 프로젝트 그룹 수정 및 그룹에 속한 프로젝트 목록 추가, 삭제
	@Transactional
	@Override
	public void modifyProjectGroup(ProjectGroupForm projectGroupForm) {
		
		// 프로젝트 그룹 수정
		projectGroupMapper.updateProjectGroup(projectGroupForm);
		log.debug(TeamColor.CSK + "projectGroupMapper.updateProjectGroup() 성공");
		
		// form에서 받아온 프로젝트 그룹 리스트
		List<Integer> newProjectList = projectGroupForm.getProjectList();
		log.debug(TeamColor.CSK + "newProjectList: " + newProjectList);

		// 기존에 저장되어 있던 프로젝트 리스트
		List<Integer> prevProjectList = projectGroupMapper.selectProjectListByProjectGroupNo(projectGroupForm.getProjectGroupNo());
		log.debug(TeamColor.CSK + "prevProjectList: " + prevProjectList);

		// 차집합 구현을 위해 생성자를 사용하여 복사
		List<Integer> deleteProjectList = new ArrayList<>(prevProjectList);
		log.debug(TeamColor.CSK + "deleteProjectList: " + deleteProjectList);
		
		deleteProjectList.removeAll(newProjectList); // 차집합
		newProjectList.removeAll(prevProjectList); // 차집합
		
		log.debug(TeamColor.CSK + "newProjectList: " + newProjectList);
		log.debug(TeamColor.CSK + "prevProjectList: " + prevProjectList);
		log.debug(TeamColor.CSK + "deleteProjectList: " + deleteProjectList);
		
		// VO 생성
		ProjectGroupConn projectGroupConn = new ProjectGroupConn();
		projectGroupConn.setProjectGroupNo(projectGroupForm.getProjectGroupNo());
		
		// 프로젝트 그룹에서 제외된 프로젝트
		for(int p : deleteProjectList) {
			projectGroupConn.setProjectNo(p);
			projectGroupMapper.deleteProjectGroupConnByProjectNo(projectGroupConn);
		}
		
		// 프로젝트 그룹에 추가된 프로젝트
		for(int p : newProjectList) {
			projectGroupConn.setProjectNo(p);
			projectGroupMapper.insertProjectGroupConn(projectGroupConn);
		}
	}
	
	// 프로젝트 그룹 삭제
	@Transactional
	@Override
	public void deleteProjectGroup(int projectGroupNo) {
		// projectGroupMapper.deleteAllProjectGroupConnByProjectGroupNo(projectGroupNo);
		projectGroupMapper.deleteProjectGroup(projectGroupNo);
	}
}
