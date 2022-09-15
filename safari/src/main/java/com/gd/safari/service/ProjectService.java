package com.gd.safari.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IProjectGroupMapper;
import com.gd.safari.mapper.IProjectMapper;
import com.gd.safari.mapper.IProjectMemberMapper;
import com.gd.safari.mapper.IWorkspaceMemberMapper;
import com.gd.safari.vo.Project;
import com.gd.safari.vo.ProjectGroup;
import com.gd.safari.vo.ProjectMember;
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
	@Autowired
	private IProjectMemberMapper projectMemberMapper;

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
	
	// 프로젝트 추가 메소드
	@Override
	@Transactional
	public void addProject(Map<String, Object> map) {
		// map: projectName, projectAuth, projectMemberList, workNo
		// map.get("projectMemberList").getClass().getSimpleName()); // String
		// 자바스크립트를 통해 배열로 넘긴 projectMemberList는 String 타입
		// 문자열로 받은 projectMemberList를 배열로 가공
		String tmp = (String) map.get("projectMemberList");
		String[] projectMemberArr = tmp.split(",");
		// log.debug(TeamColor.CSK + "projectMemberArr: " + Arrays.toString(projectMemberArr));
		
		// map에서 삭제
		map.remove("projectMemberList");
		
		// 프로젝트 추가
		int row = projectMapper.insertProject(map);
		log.debug(TeamColor.CSK + "insert 후 map: " + map);
		
		if(row == 1) {
			log.debug(TeamColor.CSK + "insertProject 성공");
			// VO 객체 생성 후 insertProject()에서 받아온 projectNo 세팅
			ProjectMember projectMember = new ProjectMember();
			projectMember.setProjectNo((int) map.get("projectNo"));
			
			// 프로젝트 멤버의 수만큼 반복하여 insert
			for(String s : projectMemberArr) {
				int workMemberNo = Integer.parseInt(s);
				projectMember.setWorkMemberNo(workMemberNo);
				
				projectMemberMapper.insertProjectMember(projectMember);
			}
		}
		
	}
}
