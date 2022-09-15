package com.gd.safari.vo;

import lombok.Data;

@Data
public class Note {				// 노트를 위한 vo
	private int noteNo;			// 노트 번호(PK)
	private String noteContent;	// 노트 내용
	private String noteWriter;	// 노트 작성자
	private String createDate;	// 생성일
	private String updateDate;	// 수정일
	private int tasklistNo;		// 업무리스트 번호(FK)
}
