package com.gd.safari.service;

import java.util.*;

public interface IChatService {
    // 채팅 메인 페이지
	// 해당 워크스페이스의 모든 채팅방 리스트와 워크스페이스 멤버리스트를 리턴
	Map<String, Object> getChatListByWorkNo(Map<String, Object> paramMap);
	
	// 채팅방
	// 채팅방 하나의 정보 리턴 (기존 채팅 메시지 리스트, 방 이름, chatMemberNo...)
	Map<String, Object> getChatRoom(Map<String, Object> map);
	
	// 채팅 메시지 저장
	void addChatMsg(Map<String, Object> map);
}
