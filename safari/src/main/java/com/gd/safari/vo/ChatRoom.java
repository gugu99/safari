package com.gd.safari.vo;

import lombok.Data;

@Data
public class ChatRoom {
	private int chatRoomNo; // PK
	private String chatRoomName; // 채팅방 이름 
	private String createDate; // 생성일
	private String updateDate; // 수정일 
	private int workNo; // 워크스페이스넘버
}
