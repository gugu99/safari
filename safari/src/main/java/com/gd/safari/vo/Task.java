package com.gd.safari.vo;

import lombok.Data;

@Data
public class Task {					// 업무를 위한 vo
	private int taskNo;				// 업무 번호(PK)
	private String taskTitle;		// 업무 제목
	private String taskContent;		// 업무 내용
	private String taskWriter;		// 업무 작성자
	private String taskPoint;		// 업무 포인트(중요도)	
	private String taskStart;		// 업무 시작일
	private String taskDeadline;	// 업무 마감일
	private String taskEnd;			// 업무 종료일
	private String createDate;		// 생성일
	private String updateDate;		// 수정일
	private int tasklistNo;			// 업무리스트 번호(FK)
	private int taskUpperNo;		// 상위 업무 번호(재귀)(FK)
}
