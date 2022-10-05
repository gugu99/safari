package com.gd.safari.service;

import java.util.Map;

import com.gd.safari.vo.Project;
import com.gd.safari.vo.ProjectForm;

public interface IProjectService {
	// project 메인 페이지를 띄우기 위해 필요한 정보 제공 메소드
	// 전체 프로젝트 리스트, 워크스페이스 멤버 리스트, 프로젝트 그룹리스트
	Map<String, Object> getProjectListByWorkspace(Map<String, Object> paramMap);
	
	// 프로젝트, 프로젝트 멤버 추가 메소드
	void addProject(ProjectForm projectForm);
	
	// 프로젝트 상세정보와 프로젝트 관리자 리스트, 프로젝트 멤버리스트, 워크스페이스 멤버 리스트를 map에 넣어 반환
	// RestProjectController의 수정 메소드에서 사용
	Map<String, Object> getProjectDetailByProjectNo(int workNo, int projectNo);
	
	// 프로젝트, 프로젝트 멤버 수정 메소드
	// RestProjectController의 수정 메소드에서 사용
	Project modifyProject(Map<String, Object> map);
	
	// 프로젝트 삭제
	int removeProject(int projectNo);
	
	// 프로젝트 즐겨찾기 추가/제거
	int addOrRemoveProjectBookmark(Map<String, Object> map);
	
	// 프로젝트 요약 페이지를 띄우는 용도
	Map<String, Object> getProjectSummary(int workNo);
	
	// RestController에서 프로젝트 요약페이지에 쓸 정보 반환
	Map<String, Object> getProjectSummaryChart(int workNo);
}