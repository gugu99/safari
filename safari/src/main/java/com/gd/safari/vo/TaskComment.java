package com.gd.safari.vo;

import lombok.Data;

@Data
public class TaskComment {
	private int taskCmtNo;			// 업무 코멘트번호
	private int taskNo;				// 업무번호
	private String taskCmtContent;	// 업무 코멘트내용
	private String taskCmtWriter;	// 업무 코멘트작성자
	private String taskCmtFix;		// 업무 코멘트 고정여부
	private String createDate;		// 생성일
	private String updateDate;		// 수정일
	private int taskCmtUpperNo;		// 업무 코멘트 상위번호
	
}
