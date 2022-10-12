package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ChatMsg;

@Mapper
public interface IChatMsgMapper {
	// 채팅 메세지 보내기
	int insertChatMsg(ChatMsg chatMsg);
}
