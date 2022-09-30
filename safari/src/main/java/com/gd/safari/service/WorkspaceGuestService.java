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
	public List<WorkspaceMember> getWorkspaceGuestList(Map<String,Object> map) {
		
		// workNo 디버거
		log.debug(TeamColor.CJM + map.get("workNo") + "Service workNo");
		
		// search 디버거
		log.debug(TeamColor.CJM + map.get("search") + "Service search");
		
		// 게스트 리스트
		return workspaceGuestMapper.selectWorkspaceGuestList(map);
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
	
	// 게스트 이메일확인 메서드
	@Override
	public String getWorkspaceGuestEmailByConfirm(WorkspaceGuest workspaceGuest) {
		// workspaceGuest 디버거
		log.debug(TeamColor.CJM + workspaceGuest + "Service workspaceGuest");
		
		return workspaceGuestMapper.selectWorkspaceGuestEmailByConfirm(workspaceGuest);
	}
	
	// 게스트 인원수 확인하는 메서드
	@Override
	public ArrayList<Integer> getWorkspaceGuestCount(int workNo) {
		ArrayList<Integer> countList= new ArrayList<>();
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workNo + " Service workNo");
		
		// 워크스페이스멤버 전체수
		countList.add(workspaceMemberMapper.selectWorkspaceMemberCount(workNo)) ;
		
		// 워크스페이스 W 인 멤버수
		countList.add(workspaceMemberMapper.selectWorkspaceMemberActiveWCount(workNo)) ;
		
		// 워크스페이스 active N인 멤버수
		countList.add(workspaceMemberMapper.selectWorkspaceMemberActiveNCount(workNo));
		
		// 워크스페이스 게스트 전체수
		countList.add(workspaceGuestMapper.selectWorkspaceGuestCount(workNo));
		
		// 워크스페이스 N인 게스트수
		countList.add(workspaceGuestMapper.selectWorkspaceGuestActiveNCount(workNo));
		
		// 워크스페이스 W인 게스트수
		countList.add(workspaceGuestMapper.selectWorkspaceGuestActiveWCount(workNo));
		
		// 워크스페이스 멤버수 구하는메서드
		return countList;
	}
	
	@Override
	public List<Map<String,Object>> getWorkspaceGuestListByEmail(String memberEmail) {
		
		// memberEmail 디버깅
		log.debug(TeamColor.CJM + memberEmail + " Service memberEmail");
		
		return workspaceGuestMapper.selectWorkspaceGuestListByEmail(memberEmail);
	}

	@Override
	public String getWorkspaceGuestOneCode(WorkspaceGuest workspaceGuest) {
		
		// workspaceGuest 디버깅
		log.debug(TeamColor.CJM + workspaceGuest + " Service workspaceGuest");
		return workspaceGuestMapper.selectWorkspaceGuestOneCode(workspaceGuest);
	}

	@Override
	public String getWorkspaceGuestOneActive(WorkspaceGuest workspaceGuest) {
		
		log.debug(TeamColor.CJM + workspaceGuest + " Service workspaceGuest");
		return workspaceGuestMapper.selectWorkspaceGuestOneActive(workspaceGuest);
	}

	@Override
	public int updateWorkspaceGuestCodeNull(WorkspaceGuest workspaceGuest) {
		
		log.debug(TeamColor.CJM + workspaceGuest + " Service workspaceGuest");
		
		return workspaceGuestMapper.updateWorkspaceGuestCodeNull(workspaceGuest);
	}

}
