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
import com.gd.safari.mapper.IProjectSummaryMapper;
import com.gd.safari.mapper.IWorkspaceGuestMapper;
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
	private IProjectMapper projectMapper;
	@Autowired
	private IWorkspaceMemberMapper workspaceMemberMapper;
	@Autowired
	private IWorkspaceGuestMapper workspaceGuestMapper;
	@Autowired
	private IProjectGroupMapper projectGroupMapper;
	@Autowired
	private IProjectMemberMapper projectMemberMapper;
	@Autowired
	private IProjectBookmarkMapper projectBookmarkMapper;
	@Autowired
	private IProjectSummaryMapper projectSummaryMapper;

	// project 메인 페이지 정보 제공 메소드
	@Override
	public Map<String, Object> getProjectListByWorkspace(Map<String, Object> paramMap) {
		Map<String, Object> map = new HashMap<>();
		
		// not null이면 guest
		String guest = workspaceGuestMapper.selectWorkspaceGuestByEmailAndWorkNo(paramMap);
		log.debug(TeamColor.CSK + "guest: " + guest);

		map.put("guest", guest);
		
		// 게스트 계정으로 접속했을 시
		if(guest != null) {
			// 공개된 프로젝트만 보여준다
			log.debug(TeamColor.CSK + "PROJECT - GUEST");
			
			List<Map<String, Object>> projectList = projectMapper.selectPublicProjectListByWorkspaceNo(paramMap);
			
			map.put("projectList", projectList);
			map.put("title", "게스트 프로젝트 리스트");
			
			return map;
		}
		
		log.debug(TeamColor.CSK + "PROJECT - GUEST");
		
		// 워크스페이스 멤버일 경우
		// 전체 프로젝트 리스트
		List<Map<String, Object>> projectList = projectMapper.selectProjectListByWorkspaceNo(paramMap);
				
		// 워크스페이스 멤버 리스트
		List<WorkspaceMember> workspaceMemberList = workspaceMemberMapper.selectWorkspaceMemberList((int)paramMap.get("workNo"));

		// 프로젝트 그룹리스트
		List<ProjectGroup> projectGroupList = projectGroupMapper.selectProjectGroupListByWorkspaceNo((int)paramMap.get("workNo"));
		
		// jsp에서 띄울 타이틀 구하기
		String title = "프로젝트 리스트";
		
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
	public int removeProject(int projectNo) {
		return projectMapper.deleteProject(projectNo);
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
		Map<String, Object> map = new HashMap<>();
		
		// 해당 워크스페이스의 정보
		map.put("workspaceOne", projectSummaryMapper.selectWorkspaceOne(workNo));
		map.put("workspaceMemberList", projectSummaryMapper.selectWorkspaceMemberListWithProfileImgByWorkNo(workNo));
		map.put("taskData", projectSummaryMapper.selectTaskCntAndTaskCompleteRateByWorkNo(workNo));
		map.put("projectData", projectMapper.selectProjectCompleteRateByWorkNo(workNo));
		map.put("taskPointStatistic", projectSummaryMapper.selectTaskCntPerTaskPointByWorkNo(workNo));
		map.put("taskPerDate", projectSummaryMapper.selectFinishedTaskPerDate(workNo));
		return map;
	}
}
