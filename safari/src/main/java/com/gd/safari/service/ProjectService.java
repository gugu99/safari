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
		Map<String, Object> map = new HashMap<>();
		int workNo = (int)paramMap.get("workNo");
		
		// 전체 프로젝트 리스트
		List<Map<String, Object>> projectList = projectMapper.selectProjectListByWorkspaceNo(paramMap);
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
	
	// 프로젝트, 프로젝트 멤버 추가 메소드
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
		
		if(row != 1) {
			// 롤백 유도
			throw new RuntimeException();
		}
		
		log.debug(TeamColor.CSK + "insertProject 성공");
		// VO 객체 생성 후 insertProject()에서 받아온 projectNo 세팅
		ProjectMember projectMember = new ProjectMember();
		projectMember.setProjectNo((int) map.get("projectNo"));
		
		// 프로젝트 멤버의 수만큼 반복하여 insert
		// TODO projManagerNo랑 같으면 관리자로 인서트
		for(String s : projectMemberArr) {
			int workMemberNo = Integer.parseInt(s);
			projectMember.setWorkMemberNo(workMemberNo);
			
			// 세션에 저장된 워크스페이스멤버 번호와 같으면
			// 즉, 작성자 본인이면 워크스페이스 관리자로 등록됨
			if(workMemberNo == (int)map.get("projManagerNo")) {
				projectMemberMapper.insertProjectManager(projectMember);
				continue;
			}
			
			projectMemberMapper.insertProjectMember(projectMember);
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
	
	// 프로젝트, 프로젝트 멤버 수정 메소드
	@Transactional
	@Override
	public void modifyProject(Map<String, Object> map) {
		// map: {projectName=야호, projectExpl=야호야호 신나는 파프, projectAuth=N, projectStart=2022-09-17, projectDeadline=2022-09-30, projectEnd=, projectMemberList=14,15}
		// 문자열로 받은 projectMemberList를 배열로 가공
		String tmp = (String) map.get("projectMemberList"); // 프로젝트 멤버에 변동사항이 없을 경우 빈 문자열
		// log.debug(TeamColor.CSK + "tmp: " + tmp);
		
		// map에서 삭제
		map.remove("projectMemberList");
		
		// 프로젝트 수정
		int row = projectMapper.updateProject(map);
		
		log.debug(TeamColor.CSK + "row: " + row);
		log.debug(TeamColor.CSK + "projectMapper.updateProject() 성공");
		
		////// projectMember 수정 시작
		log.debug(TeamColor.CSK + "projectMember 수정 시작");
		// 프로젝트 멤버에 변동 사항이 없을 경우 프로젝트멤버 테이블 업데이트 X
		if("".equals(tmp)) {
			return;
		}
		
		// 문자열로 받은 프로젝트 멤버 수정 정보를 배열로 변환
		String[] tmpArr = tmp.split(",");
		//	tmpArr를 List로 변환			1) 리스트로 변환		2) 스트림	3) 형변환			4) 최종연산
		List<Integer> newProjectMemberList = Arrays.asList(tmpArr).stream().map(Integer::parseInt).collect(Collectors.toList());
		log.debug(TeamColor.CSK + "newProjectMemberList: " + newProjectMemberList);
		
		// map에서 뽑아낸 projectNo를 가공
		int projectNo = Integer.parseInt(String.valueOf(map.get("projectNo")));
		
		// 수정 전 프로젝트 멤버 no 리스트
		List<Integer> prevProjectMemberList = projectMemberMapper.selectProjectMemberNoList(projectNo);
		List<Integer> deleteProjectMemberList = new ArrayList<>(prevProjectMemberList); 
		
		log.debug(TeamColor.CSK + "prevProjectMemberList: " + prevProjectMemberList);
		
		deleteProjectMemberList.removeAll(newProjectMemberList); // 차집합 - 프로젝트에서 삭제된 멤버
		newProjectMemberList.removeAll(prevProjectMemberList); // 차집합 - 프로젝트에 새로 추가된 멤버
		
		log.debug(TeamColor.CSK + "삭제할 멤버: " + deleteProjectMemberList);
		log.debug(TeamColor.CSK + "추가할 멤버: " + newProjectMemberList);
		
		// vo 세팅
		ProjectMember projectMember = new ProjectMember();
		projectMember.setProjectNo(projectNo);
		
		// 프로젝트 멤버의 active 값을 N으로
		for(int workMemberNo : deleteProjectMemberList) {
			projectMember.setWorkMemberNo(workMemberNo); // 해당 멤버의 workMemberNo 세팅
			projectMemberMapper.updateProjectMemberActiveN(projectMember);
			// update project_member set active = 'N' where work_member_no = #{workMemberNo} and project_no = #{projectNo};
		}
		
		// 프로젝트에 새롭게 추가 메소드
		for(int workMemberNo : newProjectMemberList) {
			projectMember.setWorkMemberNo(workMemberNo); // 해당 멤버의 workMemberNo 세팅
			int pmRow = projectMemberMapper.insertProjectMember(projectMember);
			
			if(pmRow != 1) {
				throw new RuntimeException(); // rollback 유도
			}
		}
		
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
