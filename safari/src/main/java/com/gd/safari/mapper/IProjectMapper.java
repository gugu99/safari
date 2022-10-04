package com.gd.safari.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Project;
import com.gd.safari.vo.ProjectForm;

@Mapper
public interface IProjectMapper {
	// 프로젝트 개관 페이지 띄우기
	// 해당 워크스페이스에 속한 프로젝트 리스트를 반환
	// 세션에 저장된 workMemberNo를 사용해 해당 유저가 각 프로젝트의 수정/삭제 권한이 있는지를 검사하는 서브쿼리 (manager)
	// workMemberNo를 사용해 북마크된 프로젝트인지를 검사하는 서브쿼리 (projectBookmark)
	// 해당 프로젝트의 task 완성도를 반환하는 서브쿼리(complete)
	List<Map<String, Object>> selectProjectListByWorkspaceNo(Map<String, Object> map);
	
	// 게스트 계정으로 들어왔을 시 공개할 프로젝트 리스트
	List<Map<String, Object>> selectPublicProjectListByWorkspaceNo(Map<String, Object> map);
	
	// 프로젝트 타이틀과 프로젝트 번호를 반환
	// 조원들이 Task 기능 구현에 쓸 메소드
	List<Project> selectProjectTitleAndNoByWorkspaceNo(int workNo);
	
	// 프로젝트그룹에 속한 프로젝트와 해당 워크스페이스에 속한 프로젝트 left join
	// 프로젝트그룹 수정 form에서 사용
	List<Map<String, Object>> selectAllProjectByProjectGroupNo(int workNo, int projectGroupNo);
	
	// 한 프로젝트의 정보를 반환 (수정폼에서 사용)
	Project selectProjectDetailByProjectNo(int projectNo);
	
	// 프로젝트 완성률 반환 (Project Summary에서 사용)
	Map<String, Object> selectProjectCompleteRateByWorkNo(int workNo);
	
	// 프로젝트 추가 메소드
	int insertProject(ProjectForm projectForm);
	
	// 프로젝트 수정 메소드
	int updateProject(Map<String, Object> map);
	
	// 프로젝트 삭제 메소드
	int deleteProject(int projectNo);
}
