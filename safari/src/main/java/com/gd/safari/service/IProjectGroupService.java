package com.gd.safari.service;

import java.util.*;

public interface IProjectGroupService {
	// 프로젝트 그룹 추가
	int addProjectGroup(String projectGroupName);
	
	// 수정폼에서 사용
	// 프로젝트 그룹에 속한 프로젝트와 속하지 않은 프로젝트를 모두 반환
	Map<String, Object> getAllProjectByProjectGroupNo(int workNo, int projectGroupNo);
	
	// 프로젝트 그룹 수정 메소드 (+ 프로젝트 그룹게 프로젝트 추가)
	void modifyProjectGroup(Map<String, Object> map);
}
