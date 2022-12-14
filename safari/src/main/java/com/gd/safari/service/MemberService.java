package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IMemberMapper;
import com.gd.safari.mapper.IProjectMemberMapper;
import com.gd.safari.mapper.ITaskMemberMapper;
import com.gd.safari.mapper.IWorkspaceGuestMapper;
import com.gd.safari.mapper.IWorkspaceMemberMapper;
import com.gd.safari.vo.Member;
import com.gd.safari.vo.TaskMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MemberService implements IMemberService {
	@Autowired private IMemberMapper memberMapper;
	@Autowired private ITaskMemberMapper taskMemberMapper;
	@Autowired private IProjectMemberMapper projectMemberMapper;
	@Autowired private IWorkspaceMemberMapper workspaceMemberMapper;
	@Autowired private IWorkspaceGuestMapper workspaceGuestMapper;
	
	// 회원가입
	@Override
	public int addMember(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " addMember (회원가입)");
		return memberMapper.insertMember(member);
	}
	
	// 중복 아이디 확인
	@Override
	public boolean getMemberEmailByDuplicate(String memberEmail) {
		log.debug(TeamColor.CSH + this.getClass() + " getMemberEmailByDuplicate (중복 아이디 확인)");
		// 리턴값 초기화
		boolean result = false;
		// 매퍼 호출
		String resultEmail = memberMapper.selectMemberEmailByDuplicate(memberEmail);
		
		// 분기 resultEmail가 null일 경우 중복되지 않은 아이디
		if(resultEmail == null) {
			result = true;
		}
		
		// 디버깅
		log.debug(resultEmail + " : " + result + " - null : true를 만족해야 사용 가능한 아이디");
		return result;
	}
	
	// 유효한 이메일 검사 (탈퇴회원 제외)
	@Override
	public boolean getMemberEmailByCheck(String memberEmail) {
		log.debug(TeamColor.CSH + this.getClass() + " getMemberEmailByCheck (유효한 이메일 검사 - 탈퇴회원 제외)");
		// 리턴값 초기화
		boolean result = false;
		// 매퍼 호출
		String resultEmail = memberMapper.selectMemberEmailByCheck(memberEmail);
		
		// 분기 resultEmail가 null이 아닐 경우 유효한 이메일
		if(resultEmail != null) {
			result = true;
		}
		
		// 디버깅
		log.debug(resultEmail + " : " + result + " - not null : true를 만족해야 유효한 이메일");
		return result;
	}
	
	// 유효한 이메일 검사 (탈퇴회원 포함)
	@Override
	public boolean getMemberEmailByCheckAll(String memberEmail) {
		log.debug(TeamColor.CSH + this.getClass() + " getMemberEmailByCheck (유효한 이메일 검사 - 탈퇴회원 포함)");
		// 리턴값 초기화
		boolean result = false;
		// 매퍼 호출
		String resultEmail = memberMapper.selectMemberEmailByCheckAll(memberEmail);
		
		// 분기 resultEmail가 null이 아닐 경우 유효한 이메일
		if(resultEmail != null) {
			result = true;
		}
		
		// 디버깅
		log.debug(resultEmail + " : " + result + " - not null : true를 만족해야 유효한 이메일");
		return result;
	}
	
	// 로그인
	@Override
	public Member getMemberByLogin(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " getMemberByLogin (로그인)");
		// 로그인 메서드 실행
		Member resultMember = memberMapper.selectMemberByLogin(member);
		
		log.debug(TeamColor.CSH + resultMember);
		
		// 활성화된 이메일이라면 마지막 로그인 날짜 변경하는 메서드 실행
		if(resultMember != null && resultMember.getActive().equals("Y")) {
			memberMapper.updateMemberLastLogin(member.getMemberEmail());
		}
		
		return resultMember;
	}
	
	// 비밀번호 찾기 (랜덤비밀번호를 이메일로 전송해준 뒤 비밀번호 변경)
	@Override
	public int modifyMemberPwByRecoverPw(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " modifyMemberPwByRecoverPw (비밀번호 찾기)");
		return memberMapper.updateMemberPwByRecoverPw(member);
	}

	// 비밀번호 변경 (원래 계정과 원래비밀번호 새로운 비밀번호 받기)
	@Override
	public int modifyMemberPwByNewPw(Map<String, Object> m) {
		log.debug(TeamColor.CSH + this.getClass() + " modifyMemberPwByNewPw (비밀번호 변경)");
		return memberMapper.updateMemberPwByNewPw(m);
	}
	
	// 구글 비밀번호 변경 (원래 계정과 새로운 비밀번호 받기)
	@Override
	public int modifyMemberPwWithGoogle(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " modifyMemberPwWithGoogle (구글 비밀번호 변경)");
		return memberMapper.updateMemberPwWithGoogle(member);
	}
	
	// 계정 활성화 (active 값을 Y로 변경 - N일 경우만! X일 경우는 탈퇴된 계정이라 활성화되지 않음)
	@Override
	public int modifyMemberActiveYByUnlockUser(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " modifyMemberActiveYByUnlockUser (계정 활성화)");
		return memberMapper.updateMemberActiveYByUnlockUser(member);
	}
	
	// 계정 비활성화 (active 값을 N으로 변경 - Y일 경우만! X일 경우는 탈퇴된 계정이라 비활성화되지 않음) - 스프링 스케쥴러가 자동으로 실행
	@Override
	public int modifyMemberActiveN() {
		log.debug(TeamColor.CSH + this.getClass() + " modifyMemberActiveN (계정 비활성화)");
		return memberMapper.updateMemberActiveN();
	}
	
	// 탈퇴 (active 값을 X로 변경)
	@Override
	@Transactional
	public int modifyMemberActiveXByDeleteAccount(String memberEmail) {
		log.debug(TeamColor.CSH + this.getClass() + " modifyMemberActiveXByDeleteAccount (탈퇴)");
		
		// 업무멤버 삭제 하기 위한 조회
		List<TaskMember> taskMemberList = taskMemberMapper.selectTaskMemberByMemberEmail(memberEmail);
		// 업무멤버 삭제
		for(TaskMember t : taskMemberList) {
			taskMemberMapper.deleteTaskMember(t);
		}
		
		// 프로젝트멤버 active N 설정하기
		projectMemberMapper.updateProjectMemberActiveNByMemberEmail(memberEmail);
		
		// 워크스페이스멤버 active N 설정하기
		workspaceMemberMapper.updateWorkspaceMemberAllActvieN(memberEmail);
		
		// 워크스페이스게스트 삭제하기
		workspaceGuestMapper.deleteWorkspaceGuest(memberEmail);
		
		// 마지막에 탈퇴 - active X 설정하기
		return memberMapper.updateMemberActiveXByDeleteAccount(memberEmail);
	}
}
