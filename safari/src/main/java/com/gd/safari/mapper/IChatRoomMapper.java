package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IChatRoomMapper {
	// 채팅방 생성하기
	int insertChatRoom(Map<String, Object> map);
	
	// 채팅방 불러오기
	List<Map<String, Object>> selectChatRoomListByWorkMemberEmail(Map<String, Object> map);
}
