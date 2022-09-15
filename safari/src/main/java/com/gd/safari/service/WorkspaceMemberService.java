package com.gd.safari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IWorkspaceMemberMapper;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class WorkspaceMemberService implements IWorkspaceMemberService{
	@Autowired private IWorkspaceMemberMapper workspaceMemberMapper;
	@Override
	public int addWorkspaceMember(WorkspaceMember workspaceMember) {
	log.debug(TeamColor.CJM+workspaceMember +"Controller workName"); // workspaceMember 디버깅
	
		return workspaceMemberMapper.insertWorkspaceMember(workspaceMember);
	}
	@Override
	public List<WorkspaceMember> getWorkspaceMemberList() {
		return workspaceMemberMapper.selectWorkspaceMemberList(); //workspaceMember List 
	}

}