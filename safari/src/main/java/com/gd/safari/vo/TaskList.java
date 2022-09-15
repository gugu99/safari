package com.gd.safari.vo;

import lombok.Data;

@Data
public class TaskList {				// 업무리스트를 위한 vo
	private int tasklistNo;			// 업무리스트 번호(PK)
	private String tasklistTitle;	// 업무리스트 제목
	private int projectNo;			// 프로젝트 번호(FK)
	private String createDate;		// 생성일
	private String updateDate;		// 수정일
}
