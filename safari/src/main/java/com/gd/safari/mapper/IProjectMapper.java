package com.gd.safari.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Project;
import com.gd.safari.vo.ProjectForm;

@Mapper
public interface IProjectMapper {
	// ProjectService.getProjectListByWorkspace에서 프로젝트 개괄 페이지를 띄우는 용도
	// 해당 워크스페이스에 속한 프로젝트 리스트를 반환
	List<Map<String, Object>> selectProjectListByWorkspaceNo(Map<String, Object> map);
	
	// 프로젝트 타이틀과 프로젝트 번호를 반환
	// 조원들이 Task 기능 구현에 쓸 메소드
	List<Project> selectProjectTitleAndNoByWorkspaceNo(int workNo);
	
	// 한 프로젝트의 정보를 반환 (수정폼에서 사용)
	Project selectProjectDetailByProjectNo(int projectNo);
	
	// 프로젝트 추가 메소드
	int insertProject(ProjectForm projectForm);
	
	// 프로젝트 수정 메소드
	int updateProject(Map<String, Object> map);
	
	// 프로젝트 삭제 메소드
	int deleteProject(int projectNo);
	
	// 프로젝트그룹에 속한 프로젝트와 해당 워크스페이스에 속한 프로젝트 left join
	// 프로젝트그룹 수정 form에서 사용
	List<Map<String, Object>> selectAllProjectByProjectGroupNo(int workNo, int projectGroupNo);
}
