package com.gd.safari.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ProjectMember;

@Mapper
public interface IProjectMemberMapper {
	// 프로젝트 멤버 추가 메소드(프로젝트 추가 메소드와 트랜잭션)
	int insertProjectMember(ProjectMember projectMember);
	
	// 해당 프로젝트에 속한 멤버 리스트 반환
	List<ProjectMember> selectProjectMemberListByProjectNo(int projectNo);
	
}
