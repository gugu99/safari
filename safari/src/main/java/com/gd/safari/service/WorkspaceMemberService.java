package com.gd.safari.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
public class WorkspaceMemberService implements IWorkspaceMemberService {
	@Autowired
	private IWorkspaceMemberMapper workspaceMemberMapper;

	@Override
	public int addWorkspaceMember(WorkspaceMember workspaceMember) {

		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceMember + "Service workspaceMember");
		
		// workspaceMember 추가
		return workspaceMemberMapper.insertWorkspaceMember(workspaceMember);
	}

	@Override
	public List<WorkspaceMember> getWorkspaceMemberList(int workNo) {
		
		// workNo 디버깅
		log.debug(TeamColor.CJM + workNo + "Service workNo"); 
		
		// workspaceMember List
		return workspaceMemberMapper.selectWorkspaceMemberList(workNo); 
	}

	@Override
	public Map<String, Object> getWorkspaceMemberOne(int workMemberNo) {
		
		// workMemberNo 디버깅
		log.debug(TeamColor.CJM + workMemberNo + "Service workMemberNo"); 

		// 워크스페이스멤버 상세정보
		return workspaceMemberMapper.selectWorkspaceMemberOne(workMemberNo);
	}

	@Override
	public int getWorkspaceMemberNo(WorkspaceMember workspaceMember) {
		
		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceMember + "Service workspaceMember"); 
		
		// workspaceMember No 가져오는 메서드
		return workspaceMemberMapper.selectWorkspaceMemberNo(workspaceMember);
	}

	@Override
	public int modifyWorkspaceMember(WorkspaceMember workspaceMember) {
		
		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceMember + "Service workspaceMember"); 
		
		// 워크스페이스 멤버 수정
		return workspaceMemberMapper.updateWorkspaceMember(workspaceMember);
	}

	@Override
	public int inviteAddWorkspaceMember(WorkspaceMember workspaceMember, String[] workMemberEmail) {
		
		// workspaceMember 디버거
		log.debug(TeamColor.CJM + workspaceMember + "Service workspaceMember");
		
		// workMemberEmail 디버깅
		log.debug(TeamColor.CJM + Arrays.toString(workMemberEmail) + "Service workMemberEmail");
		
		// 성공여부 return 할 변수 가져오기
		int result = 0;
		
		// 초대된멤버 추가 반복문
		for (String a : workMemberEmail) {
			workspaceMember.setWorkMemberEmail(a);
			// 멤버추가
			result = workspaceMemberMapper.inviteInsertWorkspaceMember(workspaceMember);
		}
		
		//result return
		return result;
	}

	@Override
	public String getWorkspaceMemberOneActive(int workMemberNo) {
		// workMemberNo 디버거
		log.debug(TeamColor.CJM + workMemberNo + "Service workMemberNo");
		
		// 활동여부 가져오기 메서드
		return workspaceMemberMapper.selectWorkspaceMemberOneActive(workMemberNo);
	}

	@Override
	public String getWorkspaceMemberOneCode(int workMemberNo) {
		
		// workMemberNo 디버깅
		log.debug(TeamColor.CJM + workMemberNo + "Service workMemberNo"); 
		
		// workMemberCode 가져오기 메서드 
		return workspaceMemberMapper.selectWorkspaceMemberOneCode(workMemberNo);
	}

	@Override
	public boolean getMemberEmailByConfirm(String memberEmail) {
		
		// memberEmail 존재하는 이메일인가 디버깅
		log.debug(TeamColor.CJM + memberEmail + " 존재하는 이메일인가");
		
		// 초기화
		boolean result = false; 
		
		// 확인하는 메서드
		String resultEmail = workspaceMemberMapper.selectMemberEmailByConfirm(memberEmail);
		
		// 존재 하면 true
		if (resultEmail != null) {
			result = true;
		}
		// 디버깅
		log.debug(TeamColor.CJM + resultEmail + " 존재하는 이메일인가");
		return result;
	}

	@Override
	public int modifyWorkspaceMemberByInvite(WorkspaceMember workspaceMember) {
		
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workspaceMember + " Service workspaceMember");
		
		// 초대된 멤버 처음 입장시 정보 변경하는메서드
		return workspaceMemberMapper.updateWorkspaceMemberByInvite(workspaceMember);
	}

	@Override
	public int modifyWorkspaceMemberByLevel(WorkspaceMember workspaceMember) {
		
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workspaceMember + " Service workspaceMember");
		
		// 워크스페이스멤버 권한등급 조정하는 메서드
		return workspaceMemberMapper.updateWorkspaceMemberByLevel(workspaceMember);
	}

	@Override
	public int modifyWorkspaceMemberByActive(int workMemberNo) {
		
		// workMemberNo  디버깅
		log.debug(TeamColor.CJM + workMemberNo + " Service workMemberNo");
		
		// 워크스페이스 활동정지 하는메서드
		return workspaceMemberMapper.updateWorkspaceMemberByActive(workMemberNo);
	}

	@Override
	public int getWorkspaceMemberLevel(WorkspaceMember workspaceMember) {
		
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workspaceMember + " Service workspaceMember");
		
		return workspaceMemberMapper.selectWorkspaceMemberLevel(workspaceMember);
	}

}
