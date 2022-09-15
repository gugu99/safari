package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.WorkspaceMember;

@Mapper
public interface IWorkspaceMemberMapper {

	int insertWorkspaceCreater(WorkspaceMember workspaceMember); // 관리자 워크스페이스 멤버추가
	int insertWorkspaceMember(WorkspaceMember workspaceMember);
}
