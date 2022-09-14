package com.gd.safari.vo;

import lombok.Data;

@Data
public class ChatMsg {
	private int chatMsgNo;
	private int chatMemberNo;
	private String chatMsg;
	private int chatReadCnt;
	private String createDate;
}
