package com.gd.safari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IMemberMapper;
import com.gd.safari.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MemberService implements IMemberService {
	@Autowired private IMemberMapper memberMapper;
	
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
	// 로그인
	@Override
	public Member getMemberByLogin(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " getMemberByLogin (로그인)");
		return memberMapper.selectMemberByLogin(member);
	}
	// 비밀번호 찾기 (랜덤비밀번호를 이메일로 전송해준 뒤 비밀번호 변경)
	@Override
	public int modifyMemberPwByRecoverPw(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " modifyMemberPwByRecoverPw (비밀번호 찾기)");
		return memberMapper.updateMemberPwByRecoverPw(member);
	}
	// 계정 활성화 (active 값을 Y로 변경 - N일 경우만! X일 경우는 탈퇴된 계정이라 활성화되지 않음)
	@Override
	public int modifyActiveByUnlockUser(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " modifyActiveByUnlockUser (계정 활성화)");
		return memberMapper.updateActiveByUnlockUser(member);
	}
	// 탈퇴 (active 값을 X로 변경)
	@Override
	public int modifyActiveByDeleteAccount(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " modifyActiveByRemoveAccount (탈퇴)");
		return memberMapper.updateActiveByDeleteAccount(member);
	}
}
