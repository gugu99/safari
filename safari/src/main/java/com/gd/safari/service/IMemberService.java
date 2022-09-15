package com.gd.safari.service;

import com.gd.safari.vo.Member;

public interface IMemberService {
	// 회원가입
	int addMember(Member member);
	// 중복 아이디 확인
	boolean getMemberEmailByCheck(String memberEmail);
	// 로그인
	Member getMemberByLogin(Member member);
	// 계정 활성화 (active 값을 Y로 변경 - N일 경우만! X일 경우는 탈퇴된 계정이라 활성화되지 않음)
	int modifyActiveByUnlockUser(Member member);
	// 탈퇴 (active 값을 X로 변경)
	int modifyActiveByDeleteAccount(Member member);
}
