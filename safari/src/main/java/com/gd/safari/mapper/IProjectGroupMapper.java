package com.gd.safari.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ProjectGroup;

@Mapper
public interface IProjectGroupMapper {
	// ProjectService.getProjectListByWorkspace에서 프로젝트 개괄 페이지를 띄우는 용도
	// 해당 워크스페이스에 속한 프로젝트 그룹 리스트를 반환
	List<ProjectGroup> selectProjectGroupListByWorkspaceNo(int workNo);
}
