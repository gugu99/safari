package com.gd.safari.service;

import java.util.*;

public interface IChatService {
	// 해당 워크스페이스의 모든 채팅방 리스트와 워크스페이스 멤버리스트를 리턴
	Map<String, Object> getChatListByWorkNo(Map<String, Object> paramMap);
	
	// 채팅방 하나의 정보 리턴
	List<Map<String, Object>> getChatRoom(Map<String, Object> map);
}
