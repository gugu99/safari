package com.gd.safari.vo;

import lombok.Data;

@Data
public class TodoListComment {			// 할일 리스트 댓글을 위한 vo	
	private int todolistCmtNo;			// 할일 리스트 댓글 번호(PK)
	private String todolistCmtContent;	// 할일 리스트 댓글 내용
	private String todolistCmtWriter;	// 할일 리스트 댓글 작성자
	private String createDate;			// 생성일
	private String updateDate;			// 수정일
	private int todolistNo;				// 할일 리스트 번호(FK)
}
