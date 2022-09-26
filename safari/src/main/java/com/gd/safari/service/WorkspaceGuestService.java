package com.gd.safari.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IWorkspaceGuestMapper;
import com.gd.safari.vo.WorkspaceGuest;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class WorkspaceGuestService implements IWorkspaceGuestService{
	@Autowired
	private IWorkspaceGuestMapper workspaceGuestMapper;
	
	@Override
	public int addWorkspaceGuestByInvite(WorkspaceGuest workspaceGuest, String[] memberEmail) {
			// workspaceGuest 디버거
			log.debug(TeamColor.CJM + workspaceGuest + "Service workspaceGuest");
			
			// workMemberEmail 디버깅
			log.debug(TeamColor.CJM + Arrays.toString(memberEmail) + "Service memberEmail");
			
			// 성공여부 return 할 변수 가져오기
			int result = 0;
			
			// 초대된게스트 추가 반복문
			for (String a : memberEmail) {
				workspaceGuest.setMemberEmail(a);
				// 게스트추가
				result = workspaceGuestMapper.insertWorkspaceGuest(workspaceGuest);
			}
			
			//result return
			return result;
	}

	@Override
	public List<WorkspaceMember> getWorkspaceGuestList(WorkspaceGuest workspaceGuest) {
		
		// workspaceGuest 디버거
		log.debug(TeamColor.CJM + workspaceGuest + "Service workspaceGuest");
		
		// 게스트 리스트
		return workspaceGuestMapper.selectWorkspaceGuestList(workspaceGuest);
	}

}
