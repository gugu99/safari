package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ProjectGroup;
import com.gd.safari.vo.ProjectGroupConn;

@Mapper
public interface IProjectGroupMapper {
	// ProjectService.getProjectListByWorkspace에서 프로젝트 개괄 페이지를 띄우는 용도
	// 해당 워크스페이스에 속한 프로젝트 그룹 리스트를 반환
	List<ProjectGroup> selectProjectGroupListByWorkspaceNo(int workNo);
	
	// 프로젝트 그룹 한 개의 정보를 반환
	ProjectGroup selectProjectGroupByProjectGroupNo(int projectGroupNo);
	
	// 프로젝트 그룹 추가 메소드
	int insertProjectGroup(String projectGroupName);
	
	// 프로젝트 그룹에 프로젝트 추가
	int insertProjectGroupConn(ProjectGroupConn projectGroupConn);
	
	// 프로젝트 그룹 수정 메소드
	int updateProjectGroup(Map<String, Object> map);
	
	// 해당 프로젝트에 속한 프로젝트 리스트를 반환
	List<Integer> selectProjectListByProjectGroupNo(int projectGroupNo);

	// 프로젝트 그룹에서 프로젝트 삭제
	int deleteProjectGroupConn(ProjectGroupConn projectGroupConn);
}
