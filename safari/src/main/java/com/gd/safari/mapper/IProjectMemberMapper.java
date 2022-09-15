package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ProjectMember;

@Mapper
public interface IProjectMemberMapper {
	int insertProjectMember(ProjectMember projectMember);
}
