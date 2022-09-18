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
	
	// 프로젝트 수정 전 정보를 띄우기 위한 메소드
	@Override
	public Map<String, Object> getProjectDetailByProjectNo(int workNo, int projectNo) {
		Map<String, Object> map = new HashMap<>();
		
		// 프로젝트 테이블의 정보를 담은 Project VO
		Project project = projectMapper.selectProjectDetailByProjectNo(projectNo);
		log.debug(TeamColor.CSK + "project: " + project);
		
		// 워크스페이스 멤버에 해당 프로젝트에 속한 멤버를 Left Join
		// 키셋이 projectNo, workMemberNo, workMemberName인 Map으로 이루어진 List를 리턴
		// left join의 결과물이므로 프로젝트에 속해있지 않으면 projectNo == null
		// 위 조건을 사용하여 modifyProject.jsp(수정폼)에서 언제든 프로젝트에 참여할 수 있도록 한다
		List<Map<String, Object>> projectMemberList = projectMemberMapper.selectProjectMemberListByProjectNo(workNo, projectNo);
		// log.debug(TeamColor.CSK + "projectMemberList: " + projectMemberList);
		log.debug(TeamColor.CSK + "projectMemberList.size(): " + projectMemberList.size());
				
		// map에 넣기
		map.put("project", project);
		map.put("projectMemberList", projectMemberList);

		return map;
	}
	
	@Override
	public boolean modifyProject(Map<String, Object> map) {
		boolean result = false;
		
		// map: {projectName=야호, projectExpl=야호야호 신나는 파프, projectAuth=N, projectStart=2022-09-17, projectDeadline=2022-09-30, projectEnd=, projectMemberList=14,15}
		// 문자열로 받은 projectMemberList를 배열로 가공
		String tmp = (String) map.get("projectMemberList"); // 프로젝트 멤버에 변동사항이 없을 경우 빈 문자열
		// log.debug(TeamColor.CSK + "tmp: " + tmp);
		
		// map에서 삭제
		map.remove("projectMemberList");
		
		// 프로젝트 수정
		int row = projectMapper.updateProject(map);
		
		// row == 1 검사 불가. 나중에 다시 생각해봐야 할듯
		
		log.debug(TeamColor.CSK + "projectMapper.updateProject() 성공");
		
		// projectMember 수정 시작
		// 프로젝트 멤버에 변동 사항이 없을 경우 프로젝트멤버 테이블 업데이트 X
		if("".equals(tmp)) {
			return true;
		}
		
		// 문자열로 받은 프로젝트 멤버 정보를 배열로 변환
		String[] projectMemberArr = tmp.split(",");
		ProjectMember projectMember = new ProjectMember();
		projectMember.setProjectNo((int)map.get("projectNo"));
		
		for(String s : projectMemberArr) {
			projectMember.setWorkMemberNo(Integer.parseInt(s));
		}
		
		return result;
	}
}
