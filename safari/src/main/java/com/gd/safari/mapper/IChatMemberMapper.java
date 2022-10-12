package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ChatMember;

@Mapper
public interface IChatMemberMapper {
	// 채팅 멤버 추가하기
	int insertChatMember(ChatMember chatMember);
}
