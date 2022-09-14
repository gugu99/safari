package com.gd.safari.vo;

import lombok.Data;

@Data
public class ChatMember {
	private int chatMemberNo;
	private int chatRoomNo;
	private String chatMemberEmail;
	private String createDate;
	private String updateDate;
}
