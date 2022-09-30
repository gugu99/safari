package com.gd.safari.service;

import java.util.Map;

import com.gd.safari.vo.Member;

public interface IMemberService {
	// 회원가입
	int addMember(Member member);
	// 중복 아이디 확인
	boolean getMemberEmailByDuplicate(String memberEmail);
	// 유효한 이메일 검사 (탈퇴회원 제외)
	boolean getMemberEmailByCheck(String memberEmail);
	// 유효한 이메일 검사 (탈퇴회원 포함)
	boolean getMemberEmailByCheckAll(String memberEmail);
	// 로그인
	Member getMemberByLogin(Member member);
	// 비밀번호 찾기 (랜덤비밀번호를 이메일로 전송해준 뒤 비밀번호 변경)
	int modifyMemberPwByRecoverPw(Member member);
	// 비밀번호 변경 (원래 계정과 원래비밀번호 새로운 비밀번호 받기)
	int modifyMemberPwByNewPw(Map<String, Object> m);
	// 구글 로그인 비밀번호 변경 (원래 계정과 새로운 비밀번호 받기)
	int modifyMemberPwWithGoogle(Member member);
	// 계정 활성화 (active 값을 Y로 변경 - N일 경우만! X일 경우는 탈퇴된 계정이라 활성화되지 않음)
	int modifyMemberActiveYByUnlockUser(Member member);
	// 계정 비활성화 (active 값을 N으로 변경 - Y일 경우만! X일 경우는 탈퇴된 계정이라 비활성화되지 않음)
	int modifyMemberActiveN();
	// 탈퇴 (active 값을 X로 변경)
	int modifyMemberActiveXByDeleteAccount(String memberEmail);
}
