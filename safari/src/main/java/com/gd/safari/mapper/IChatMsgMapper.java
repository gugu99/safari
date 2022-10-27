package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IChatMsgMapper {
	// 채팅 메세지 보내기
	int insertChatMsg(Map<String, Object> map);
	
	// 채팅 메시지 리스트 불러오기
	List<Map<String, Object>> selectMsgListByChatRoomNo(Map<String, Object> map);
}
