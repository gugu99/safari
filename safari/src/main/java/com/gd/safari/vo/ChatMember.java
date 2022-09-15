package com.gd.safari.vo;

import lombok.Data;

@Data
public class ChatMember {
	private int chatMemberNo; // PK
	private int chatRoomNo; // 채팅방 번호(FK) 
	private String chatMemberEmail; // 채팅멤버 이메일
	private String createDate; // 생성일
	private String updateDate; // 수정일
}
