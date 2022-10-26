package com.gd.safari.vo;

import lombok.Data;

@Data
public class ChatMsg {
	private int chatMsgNo; // PK
	private int chatMemberNo; // 채팅멤버넘버(FK)
	private String chatMsg; // 채팅 메시지
	private int chatReadCnt; // 읽은 사람 카운트
	private String createDate; // 보낸 시각
	
	private int chatRoomNo;
	private String option;
	private String chatMemberEmail;
}
