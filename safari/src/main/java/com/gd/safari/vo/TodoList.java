package com.gd.safari.vo;

import lombok.Data;

@Data
public class TodoList {				// 할일 리스트를 위한 vo
	private int todolistNo;			// 할일 리스트 번호(PK)
	private int projectNo;			// 프로젝트 번호(FK)
	private String todolistTitle;	// 할일 리스트 제목
	private String todolistAuth;	// 할일 리스트 공개 범위
	private String todolistFix;		// 할일 리스트 고정
	private String createDate;		// 생성일
	private String updateDate;		// 수정일
}
