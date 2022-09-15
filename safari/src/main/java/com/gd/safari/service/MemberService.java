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
	public String getMemberEmailByCheck(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " getMemberEmailByCheck (중복 아이디 확인)");
		return memberMapper.selectMemberEmailByCheck(member);
	}
	// 로그인
	@Override
	public Member getMemberByLogin(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " getMemberByLogin (로그인)");
		return memberMapper.selectMemberByLogin(member);
	}
	// 탈퇴 (active 값을 X로 변경)
	@Override
	public int modifyActiveByDeleteAccount(Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " modifyActiveByRemoveAccount (탈퇴)");
		return memberMapper.updateActiveByDeleteAccount(member);
	}
}
