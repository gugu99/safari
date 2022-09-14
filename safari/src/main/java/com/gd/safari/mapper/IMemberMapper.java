package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Member;

@Mapper
public interface IMemberMapper {
	// 회원가입
	int insertMember(Member member);
	// 로그인
	Member selectMemberByLogin(Member member);
}
