package com.gd.safari.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IProjectBookmarkMapper;
import com.gd.safari.mapper.IProjectGroupMapper;
import com.gd.safari.mapper.IProjectMapper;
import com.gd.safari.mapper.IProjectMemberMapper;
import com.gd.safari.mapper.IWorkspaceMemberMapper;
import com.gd.safari.vo.Project;
import com.gd.safari.vo.ProjectForm;
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
	@Autowired
	private IProjectBookmarkMapper projectBookmarkMapper;

	// project 메인 페이지 정보 제공 메소드
	@Override
	public Map<String, Object> getProjectListByWorkspace(Map<String, Object> paramMap) {
		int workNo = (int)paramMap.get("workNo");
		
		// 전체 프로젝트 리스트
		List<Map<String, Object>> projectList = projectMapper.selectProjectListByWorkspaceNo(paramMap);
		
		// 워크스페이스 멤버 리스트
		List<WorkspaceMember> workspaceMemberList = workspaceMemberMapper.selectWorkspaceMemberList(workNo);

		// 프로젝트 그룹리스트
		List<ProjectGroup> projectGroupList = projectGroupMapper.selectProjectGroupListByWorkspaceNo(workNo);
		
		// jsp에서 띄울 타이틀 구하기
		String title = "전체 프로젝트";
		
		if(paramMap.get("projectGroupNo") != null) {
			title = "프로젝트 그룹 리스트";
		} else if(paramMap.get("search") != null) {
			title = paramMap.get("search") + "의 검색 결과";
		} else if(paramMap.get("section") != null) {
			// section 파라미터의 값에 따라 title 값 변경
			String section = (String) paramMap.get("section");
			if("my".equals(section)) {
				title = "내가 속한 프로젝트";
			} else if("bookmark".equals(section)) {
				title = "중요 프로젝트";
			} else {
				// if("keep".equals(section))
				title = "보관된 프로젝트";
			}
		}

		// map에 묶기
		Map<String, Object> map = new HashMap<>();
		
		map.put("projectList", projectList);
		map.put("workspaceMemberList", workspaceMemberList);
		map.put("projectGroupList", projectGroupList);
		map.put("title", title);
		
		return map;
	}
	
	// 프로젝트, 프로젝트 멤버 추가 메소드
	@Override
	@Transactional
	public void addProject(ProjectForm projectForm) {
		// 프로젝트 추가
		projectMapper.insertProject(projectForm);
		log.debug(TeamColor.CSK + "insert 후 projectForm: " + projectForm);

		// VO 객체 생성 후 프로젝트 정보 세팅
		ProjectMember projectMember = new ProjectMember();
		projectMember.setProjectNo(projectForm.getProjectNo());
		
		// 프로젝트 멤버의 수만큼 반복하여 insert
		for(int i : projectForm.getProjectMemberList()) {
			projectMember.setProjectMemberAuth("N"); // 기본 값 그냥 멤버
			projectMember.setWorkMemberNo(i);
			
			// form에서 받은 관리자 정보와 일치하면
			if(i == projectForm.getProjManagerNo()) {
				// 관리자로 insert
				projectMember.setProjectMemberAuth("Y");
			}
			
			// 아닐 시 멤버로 insert
			projectMemberMapper.insertProjectMember(projectMember);
		}
	}
	
	// 프로젝트 수정 전 정보를 띄우기 위한 메소드
	@Override
	public Map<String, Object> getProjectDetailByProjectNo(int workNo, int projectNo) {
		// 프로젝트 테이블의 정보를 담은 Project VO
		Project project = projectMapper.selectProjectDetailByProjectNo(projectNo);
		// log.debug(TeamColor.CSK + "project: " + project);

		List<Map<String, Object>> projectMemberList = projectMemberMapper.selectPossibleProjectMemberListByWorkNoAndProjectNo(workNo, projectNo);
		// log.debug(TeamColor.CSK + "projectMemberList: " + projectMemberList);
		
		// map에 넣기
		Map<String, Object> map = new HashMap<>();
		map.put("project", project); // 프로젝트 정보
		map.put("projectMemberList", projectMemberList);

		return map;
	}
	
	@Override
	public Project modifyProject(Map<String, Object> map) {
		// 파라미터로 받은 정보를 사용하여 Project를 수정
		projectMapper.updateProject(map);
		
		// map안의 projectNo를 추출
		int projectNo = Integer.parseInt(String.valueOf(map.get("projectNo")));
		
		// 수정 후 project 정보를 반환
		return projectMapper.selectProjectDetailByProjectNo(projectNo);
	}
	
	// 프로젝트 삭제 메소드
	@Transactional
	@Override
	public void removeProject(int projectNo) {
		// 자식 테이블의 데이터를 다 지워야 프로젝트 삭제 가능
		projectMemberMapper.deleteProjectMemberByProjectNo(projectNo);
		
		// TODO 조원들이 삭제메소드를 구현하는대로 추가할 것
		// 모두 추가되면 controller에 연결
		
		projectMapper.deleteProject(projectNo);
	}
	
	// 프로젝트 즐겨찾기 추가/제거
	@Override
	public int addOrRemoveProjectBookmark(Map<String, Object> map) {
		
		// projectBookmark의 값이 빈 문자열이면 insert 대상
		if("".equals(map.get("projectBookmark"))) {
			return projectBookmarkMapper.insertProjectBookmark(map);
		}
		
		// 빈 문자열이 아니면 삭제 대상
		return projectBookmarkMapper.deleteProjectBookmark(map);
	}
	
	// 프로젝트 요약 페이지 띄우기
	@Override
	public Map<String, Object> getProjectSummary(int workNo) {
		
		return null;
	}
}
