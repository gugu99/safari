package com.gd.safari.vo;

import lombok.Data;

@Data
public class Todo {				// 할일을 위한 vo
	private int todoNo;			// 할일 번호(PK)
	private int todolistNo;		// 할일 리스트 번호(FK)
	private String todoContent;	// 할일 내용
	private String todoDate;	// 할일 날짜
	private String createDate;	// 생성일
	private String updateDate;	// 수정일
}
