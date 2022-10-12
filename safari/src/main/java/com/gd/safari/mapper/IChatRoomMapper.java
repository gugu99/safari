package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.ChatRoom;

@Mapper
public interface IChatRoomMapper {
	// 채팅방 생성하기
	int insertChatRoom(ChatRoom chatRoom);
}
