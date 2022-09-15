package com.gd.safari.vo;

import lombok.Data;

@Data
public class NoteCommentLike {
	private int noteCmtNo;		  // 노트코멘트 번호
	private String memberEmail;   // 멤버 이메일
	private String createDate;	  // 노트코멘트 좋아요 생성일
	
}
