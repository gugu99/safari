package com.gd.safari.vo;

import lombok.Data;

@Data
public class TodoListLike {		// 할일 리스트 좋아요를 위한 vo
	private int todolistNo;		// 할일 리스트 번호(PK)
	private String memberEmail;	// 좋아요를 남긴 멤버 이메일(PK)
}
