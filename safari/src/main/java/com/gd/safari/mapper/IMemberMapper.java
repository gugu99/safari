package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Member;

@Mapper
public interface IMemberMapper {
	// 회원가입
	int insertMember(Member member);
	// 중복 아이디 확인
	String selectMemberEmailByCheck(String memberEmail);
	// 로그인
	Member selectMemberByLogin(Member member);
	// 계정 활성화 (active 값을 Y로 변경 - N일 경우만! X일 경우는 탈퇴된 계정이라 활성화되지 않음)
	int updateActiveByUnlockUser(Member member);
	// 탈퇴 (active 값을 X로 변경)
	int updateActiveByDeleteAccount(Member member);
}
