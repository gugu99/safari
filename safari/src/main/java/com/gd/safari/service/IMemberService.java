package com.gd.safari.service;

import com.gd.safari.vo.Member;

public interface IMemberService {
	// 회원가입
	int addMember(Member member);
	// 중복 아이디 확인
	String getMemberEmailByCheck(Member member);
	// 로그인
	Member getMemberByLogin(Member member);
	// 탈퇴 (active 값을 X로 변경)
	int modifyActiveByDeleteAccount(Member member);
}
