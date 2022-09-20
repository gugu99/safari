package com.gd.safari.service;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IProjectGroupMapper;
import com.gd.safari.mapper.IProjectMapper;
import com.gd.safari.vo.ProjectGroup;
import com.gd.safari.vo.ProjectGroupConn;

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
	public int addProjectGroup(String projectGroupName) {
		return projectGroupMapper.insertProjectGroup(projectGroupName);
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
	public void modifyProjectGroup(Map<String, Object> map) {
		// projectGroupName=pull 잊지마 얘들아!!!, projectList=1,2,3, projectGroupNo=1
		String tmp = (String) map.get("projectList");
		map.remove("projectList"); // project 테이블 컬럼에 맞추기 위해 map에서 삭제
		
		// 프로젝트 그룹 수정
		projectGroupMapper.updateProjectGroup(map);
		log.debug(TeamColor.CSK + "projectGroupMapper.updateProjectGroup() 성공");
		
		// 프로젝트 리스트에 변동사항 없는 경우
		if("".equals(tmp)) {
			return;
		}
		
		String[] tmpArr = tmp.split(",");
		int projectGroupNo = Integer.parseInt(String.valueOf(map.get("projectGroupNo")));
		List<Integer> newProjectList = Arrays.asList(tmpArr).stream().map(Integer::parseInt).collect(Collectors.toList());
		List<Integer> prevProjectList = projectGroupMapper.selectProjectListByProjectGroupNo(projectGroupNo);
		List<Integer> deleteProjectList = new ArrayList<>(prevProjectList);
		
		// log.debug(TeamColor.CSK + "prevProjectList" + prevProjectList);
		
		deleteProjectList.removeAll(newProjectList); // 차집합
		newProjectList.removeAll(prevProjectList); // 차집합
		
		// VO 생성
		ProjectGroupConn projectGroupConn = new ProjectGroupConn();
		projectGroupConn.setProjectGroupNo(projectGroupNo);
		
		// 프로젝트 그룹에서 제외된 프로젝트
		for(int p : deleteProjectList) {
			projectGroupConn.setProjectNo(p);
			projectGroupMapper.deleteProjectGroupConn(projectGroupConn);
		}
		
		// 프로젝트 그룹에 추가된 프로젝트
		for(int p : newProjectList) {
			projectGroupConn.setProjectNo(p);
			System.out.println(projectGroupConn);
			projectGroupMapper.insertProjectGroupConn(projectGroupConn);
		}
	}
	
}
