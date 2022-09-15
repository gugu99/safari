package com.gd.safari.vo;

import lombok.Data;

@Data
public class BoardLike {		// 보드(게시판) 좋아요를 위한 vo
	private int boardNo;		// 보드 번호(PK)
	private String memberEmail;	// 좋아요를 남긴 멤버 이메일(PK)
}
