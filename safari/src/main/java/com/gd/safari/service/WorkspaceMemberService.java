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
	 
	// 워크스페이스멤버추가
	@Override
	public int addWorkspaceMember(WorkspaceMember workspaceMember) {

		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceMember + "Service workspaceMember");
		
		// workspaceMember 추가
		return workspaceMemberMapper.insertWorkspaceMember(workspaceMember);
	}
	
	// 워크스페이스 리스트
	@Override
	public List<WorkspaceMember> getWorkspaceMemberList(int workNo) {
		
		// workNo 디버깅
		log.debug(TeamColor.CJM + workNo + "Service workNo"); 
		
		// workspaceMember List
		return workspaceMemberMapper.selectWorkspaceMemberList(workNo); 
	}
	
	// 워크스페이스 상세보기
	@Override
	public Map<String, Object> getWorkspaceMemberOne(int workMemberNo) {
		
		// workMemberNo 디버깅
		log.debug(TeamColor.CJM + workMemberNo + "Service workMemberNo"); 

		// 워크스페이스멤버 상세정보
		return workspaceMemberMapper.selectWorkspaceMemberOne(workMemberNo);
	}

	// 워크스페이스 멤버넘버
	@Override
	public int getWorkspaceMemberNo(WorkspaceMember workspaceMember) {
		
		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceMember + "Service workspaceMember"); 
		
		// workspaceMember No 가져오는 메서드
		return workspaceMemberMapper.selectWorkspaceMemberNo(workspaceMember);
	}
	
	// 워크스페이스멤버 수정
	@Override
	public int modifyWorkspaceMember(WorkspaceMember workspaceMember) {
		
		// workspaceMember 디버깅
		log.debug(TeamColor.CJM + workspaceMember + "Service workspaceMember"); 
		
		// 워크스페이스 멤버 수정
		return workspaceMemberMapper.updateWorkspaceMember(workspaceMember);
	}
	
	// 초대된멤버 추가
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
	
	// 활동여부 가져오는메서드
	@Override
	public String getWorkspaceMemberOneActive(int workMemberNo) {
		// workMemberNo 디버거
		log.debug(TeamColor.CJM + workMemberNo + "Service workMemberNo");
		
		// 활동여부 가져오기 메서드
		return workspaceMemberMapper.selectWorkspaceMemberOneActive(workMemberNo);
	}
	
	// 코드 가져오는메서드
	@Override
	public String getWorkspaceMemberOneCode(int workMemberNo) {
		
		// workMemberNo 디버깅
		log.debug(TeamColor.CJM + workMemberNo + "Service workMemberNo"); 
		
		// workMemberCode 가져오기 메서드 
		return workspaceMemberMapper.selectWorkspaceMemberOneCode(workMemberNo);
	}

	// 존재이메일인지 확인하는메서드
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

	// 워크스페이스 멤버 초반에 정보수정하는 메서드
	@Override
	public int modifyWorkspaceMemberByInvite(WorkspaceMember workspaceMember) {
		
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workspaceMember + " Service workspaceMember");
		
		// 초대된 멤버 처음 입장시 정보 변경하는메서드
		return workspaceMemberMapper.updateWorkspaceMemberByInvite(workspaceMember);
	}
	
	// 워크스페이스 멤버 레벨조정
	@Override
	public int modifyWorkspaceMemberByLevel(WorkspaceMember workspaceMember) {
		
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workspaceMember + " Service workspaceMember");
		
		// 워크스페이스멤버 권한등급 조정하는 메서드
		return workspaceMemberMapper.updateWorkspaceMemberByLevel(workspaceMember);
	}
	
	// 워크스페이스멤버 활동정지 하는메서드
	@Override
	public int modifyWorkspaceMemberByActive(int workMemberNo) {
		
		// workMemberNo  디버깅
		log.debug(TeamColor.CJM + workMemberNo + " Service workMemberNo");
		
		// 워크스페이스 활동정지 하는메서드
		return workspaceMemberMapper.updateWorkspaceMemberByActive(workMemberNo);
	}

	// 워크스페이스 레벨 가져오는메서드
	@Override
	public int getWorkspaceMemberLevel(WorkspaceMember workspaceMember) {
		
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workspaceMember + " Service workspaceMember");
		
		return workspaceMemberMapper.selectWorkspaceMemberLevel(workspaceMember);
	}

	// 활동여부에따른 리스트 불러오기
	@Override
	public List<WorkspaceMember> getWorkspaceMemberListByActive(WorkspaceMember workspaceMember) {
		
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workspaceMember + " Service workspaceMember");
		
		// 멤버리스트 불러오기 
		return workspaceMemberMapper.selectWorkspaceMemberListByActive(workspaceMember);
	}
	
	// 워크스페이스 활동정지 하는메서드
	@Override
	public int modifyWorkspaceMemberActiveApprove(int workMemberNo) {
		// workMemberNo  디버깅
		log.debug(TeamColor.CJM + workMemberNo + " Service workMemberNo");
		
		// 워크스페이스 활동정지 하는메서드
		return workspaceMemberMapper.updateWorkspaceMemberActiveApprove(workMemberNo);
		
	}
	
	// 가입된 workspaceMemberEmail 인지 확인 하는 메서드
	@Override
	public String getWorkspaceMemberEmailByConfirm(WorkspaceMember workspaceMember) {
		
		// workspaceMember  디버깅
		log.debug(TeamColor.CJM + workspaceMember + " Service workspaceMember");
		
		// 가입된 workspaceMemberEmail 인지 확인 하는 메서드
		return workspaceMemberMapper.selectWorkspaceMemberEmailByConfirm(workspaceMember);
	}
	
	

}
