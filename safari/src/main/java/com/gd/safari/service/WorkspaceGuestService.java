package com.gd.safari.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IWorkspaceGuestMapper;
import com.gd.safari.mapper.IWorkspaceMemberMapper;
import com.gd.safari.vo.WorkspaceGuest;
import com.gd.safari.vo.WorkspaceMember;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class WorkspaceGuestService implements IWorkspaceGuestService{
	@Autowired
	private IWorkspaceGuestMapper workspaceGuestMapper;
	@Autowired
	private IWorkspaceMemberMapper workspaceMemberMapper;
	
	// 워크스페이스 게스트 초대하는 메서드
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
	
	// 워크스페이스 게스트리스트
	@Override
	public List<WorkspaceMember> getWorkspaceGuestList(WorkspaceGuest workspaceGuest) {
		
		// workspaceGuest 디버거
		log.debug(TeamColor.CJM + workspaceGuest + "Service workspaceGuest");
		
		// 게스트 리스트
		return workspaceGuestMapper.selectWorkspaceGuestList(workspaceGuest);
	}
	
	// 워크스페이스 게스트 추방
	@Override
	public int modifyWorkspaceGuestByActive(WorkspaceGuest workspaceGuest) {
		
		// workspaceGuest 디버거
		log.debug(TeamColor.CJM + workspaceGuest + "Service workspaceGuest");
		
		// 게스트 추방
		return workspaceGuestMapper.updateWorkspaceGuestByActive(workspaceGuest);
	}
	
	// 워크스페이스 게스트 승인
	@Override
	public int modifyWorkspaceGuestActiveApprove(WorkspaceGuest workspaceGuest) {
		
		// workspaceGuest 디버거
		log.debug(TeamColor.CJM + workspaceGuest + "Service workspaceGuest");
		
		// 워크스페이스 게스트 승인
		return workspaceGuestMapper.updateWorkspaceGuestActiveApprove(workspaceGuest);
	}

	@Override
	public String getWorkspaceGuestEmailByConfirm(WorkspaceGuest workspaceGuest) {
		// workspaceGuest 디버거
		log.debug(TeamColor.CJM + workspaceGuest + "Service workspaceGuest");
		
		return workspaceGuestMapper.selectWorkspaceGuestEmailByConfirm(workspaceGuest);
	}

	@Override
	public ArrayList<Integer> getWorkspaceGuestCount(WorkspaceGuest workspaceGuest) {
		ArrayList<Integer> countList= new ArrayList<>();
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workspaceGuest + " Service workspaceMember");
		
		// 워크스페이스멤버 전체수
		countList.add(workspaceMemberMapper.selectWorkspaceMemberCount(workspaceGuest.getWorkNo())) ;
		
		// 워크스페이스 W 인 멤버수
		countList.add(workspaceMemberMapper.selectWorkspaceMemberActiveWCount(workspaceGuest.getWorkNo())) ;
		
		// 워크스페이스 active N인 멤버수
		countList.add(workspaceMemberMapper.selectWorkspaceMemberActiveNCount(workspaceGuest.getWorkNo()));
		
		// 워크스페이스 게스트 전체수
		countList.add(workspaceGuestMapper.selectWorkspaceGuestCount(workspaceGuest.getWorkNo()));
		
		// 워크스페이스 N인 게스트수
		countList.add(workspaceGuestMapper.selectWorkspaceGuestActiveNCount(workspaceGuest.getWorkNo()));
		
		// 워크스페이스 W인 게스트수
		countList.add(workspaceGuestMapper.selectWorkspaceGuestActiveWCount(workspaceGuest.getWorkNo()));
		
		// 워크스페이스 멤버수 구하는메서드
		return countList;
	}

	@Override
	public List<Map<String,Object>> getWorkspaceGuestListByEmail(String memberEmail) {
		
		// memberEmail 디버깅
		log.debug(TeamColor.CJM + memberEmail + " Service memberEmail");
		
		return workspaceGuestMapper.selectWorkspaceGuestListByEmail(memberEmail);
	}

}
