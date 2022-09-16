package com.gd.safari.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Project;

@Mapper
public interface IProjectMapper {
	// ProjectService.getProjectListByWorkspace에서 프로젝트 개괄 페이지를 띄우는 용도
	// 해당 워크스페이스에 속한 프로젝트 리스트를 반환
	List<Project> selectProjectListByWorkspaceNo(int workNo);
	
	// 프로젝트 추가 메소드
	int insertProject(Map<String, Object> map);
}