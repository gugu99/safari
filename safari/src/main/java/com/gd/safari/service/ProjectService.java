package com.gd.safari.service;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
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
		int row = projectMapper.insertProject(projectForm);
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
		log.debug(TeamColor.CSK + "project: " + project);
		
		// auth 값에 따른(멤버, 관리자) 프로젝트 멤버 리스트를 반환
		// projectNo, projectMemberAuth 필요
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("projectNo", projectNo);
		paramMap.put("workNo", workNo);
		paramMap.put("projectMemberAuth", "Y");
		
		List<Map<String, Object>> projectManagerList = projectMemberMapper.selecProjectMemberListByMemberAuth(paramMap);
		
		paramMap.put("projectMemberAuth", "N");
		List<Map<String, Object>> projectMemberList = projectMemberMapper.selecProjectMemberListByMemberAuth(paramMap);
		
		// map에 넣기
		Map<String, Object> map = new HashMap<>();
		map.put("project", project);
		map.put("projectManagerList", projectManagerList);
		map.put("projectMemberList", projectMemberList);

		return map;
	}
	
//	// 프로젝트, 프로젝트 멤버 수정 메소드
//	@Transactional
//	@Override
//	public void modifyProject(Map<String, Object> map) {
//		// keySet: 
//		// 문자열로 받은 projectMemberList를 배열로 가공
//		String tmp = (String) map.get("projectMemberList"); // 프로젝트 멤버에 변동사항이 없을 경우 빈 문자열
//		// log.debug(TeamColor.CSK + "tmp: " + tmp);
//		
//		// map에서 삭제
//		map.remove("projectMemberList");
//		
//		// 프로젝트 수정
//		int row = projectMapper.updateProject(map);
//		
//		log.debug(TeamColor.CSK + "row: " + row);
//		log.debug(TeamColor.CSK + "projectMapper.updateProject() 성공");
//		
//		////// projectMember 수정 시작
//		log.debug(TeamColor.CSK + "projectMember 수정 시작");
//		// 프로젝트 멤버에 변동 사항이 없을 경우 프로젝트멤버 테이블 업데이트 X
//		if("".equals(tmp)) {
//			return;
//		}
//		
//		// 문자열로 받은 프로젝트 멤버 수정 정보를 배열로 변환
//		String[] tmpArr = tmp.split(",");
//		//	tmpArr를 List로 변환			1) 리스트로 변환		2) 스트림	3) 형변환			4) 최종연산
//		List<Integer> newProjectMemberList = Arrays.asList(tmpArr).stream().map(Integer::parseInt).collect(Collectors.toList());
//		log.debug(TeamColor.CSK + "newProjectMemberList: " + newProjectMemberList);
//		
//		// map에서 뽑아낸 projectNo를 가공
//		int projectNo = Integer.parseInt(String.valueOf(map.get("projectNo")));
//		
//		// 수정 전 프로젝트 멤버 no 리스트
//		List<Integer> prevProjectMemberList = projectMemberMapper.selectProjectMemberNoList(projectNo);
//		List<Integer> deleteProjectMemberList = new ArrayList<>(prevProjectMemberList); 
//		
//		log.debug(TeamColor.CSK + "prevProjectMemberList: " + prevProjectMemberList);
//		
//		deleteProjectMemberList.removeAll(newProjectMemberList); // 차집합 - 프로젝트에서 삭제된 멤버
//		newProjectMemberList.removeAll(prevProjectMemberList); // 차집합 - 프로젝트에 새로 추가된 멤버
//		
//		log.debug(TeamColor.CSK + "삭제할 멤버: " + deleteProjectMemberList);
//		log.debug(TeamColor.CSK + "추가할 멤버: " + newProjectMemberList);
//		
//		// vo 세팅
//		ProjectMember projectMember = new ProjectMember();
//		projectMember.setProjectNo(projectNo);
//		
//		// 프로젝트 멤버의 active 값을 N으로
//		for(int workMemberNo : deleteProjectMemberList) {
//			projectMember.setWorkMemberNo(workMemberNo); // 해당 멤버의 workMemberNo 세팅
//			projectMemberMapper.updateProjectMemberActiveN(projectMember);
//			// update project_member set active = 'N' where work_member_no = #{workMemberNo} and project_no = #{projectNo};
//		}
//		
//		// 프로젝트에 새롭게 추가 메소드
//		for(int workMemberNo : newProjectMemberList) {
//			projectMember.setWorkMemberNo(workMemberNo); // 해당 멤버의 workMemberNo 세팅
//			int pmRow = projectMemberMapper.insertProjectMember(projectMember);
//			
//			if(pmRow != 1) {
//				throw new RuntimeException(); // rollback 유도
//			}
//		}
//	}
	
	@Override
	public Project modifyProject(Map<String, Object> map) {
		projectMapper.updateProject(map);
		int projectNo = Integer.parseInt(String.valueOf(map.get("projectNo")));
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
}
