package com.gd.safari.vo;

import lombok.Data;

@Data
public class NoteComment {
	private int noteCmtNo;			// 노트 코멘트 번호
	private int noteNo;				// 노트 번호
	private String notecmtContent;	// 노트 코멘트내용
	private String notecmtWriter;	// 노트 코멘트 작성자
	private String notecmtFix;		// 노트 코멘트 고정여부
	private String createDate;		// 노트코멘트 생성일
	private String updateDate;		// 노트코멘트 수정일
	private int noteCmtUpperNo;		// 노트코멘트 상위코멘트번호
}
