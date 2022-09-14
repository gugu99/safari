package com.gd.safari.service;

import com.gd.safari.vo.Member;

public interface IMemberService {
	// 회원가입
	int addMember(Member member);
	// 로그인
	Member getMemberByLogin(Member member);
}
