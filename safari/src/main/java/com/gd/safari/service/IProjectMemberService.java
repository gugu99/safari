package com.gd.safari.service;

import java.util.Map;

import com.gd.safari.vo.ProjectMember;

public interface IProjectMemberService {
	Map<String, Object> modifyProjectMember(int workNo, ProjectMember projectMember);
}
