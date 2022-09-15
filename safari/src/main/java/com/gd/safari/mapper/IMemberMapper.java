package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Member;

@Mapper
public interface IMemberMapper {
	// 회원가입
	int insertMember(Member member);
	// 중복 아이디 확인
	String selectMemberEmailByCheck(Member member);
	// 로그인
	Member selectMemberByLogin(Member member);
	// 탈퇴 (active 값을 X로 변경)
	int updateActiveByDeleteAccount(Member member);
}
