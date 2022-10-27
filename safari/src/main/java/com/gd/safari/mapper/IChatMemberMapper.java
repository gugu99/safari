package com.gd.safari.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ChatMember;

@Mapper
public interface IChatMemberMapper {
	// 채팅 멤버 추가하기
	int insertChatMember(ChatMember chatMember);
	
	// email과 chatRoomNo를 통해 chatMemberNo를 리턴
	int selectChatMemberNoByWorkMemberEmail(Map<String, Object> paramMap);
}
