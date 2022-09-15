package com.gd.safari.vo;

import lombok.Data;

@Data
public class TaskCommentLike {
	private int taskCmtNo;		// 업무 코멘트번호
	private String memberEmail;	// 멤버이메일
	private String createDate;	// 생성일
	
}
