package com.gd.safari.vo;

import java.util.List;

import lombok.Data;

@Data
public class CopyTaskList {			// 업무리스트 복사를 위한 vo
	private int tasklistNo;			// 업무리스트 번호(PK)
	private String tasklistTitle;	// 업무리스트 제목
	private int projectNo;			// 프로젝트 번호(FK)
	private List<Task> task; 		// 같이 복사할 업무를 리스트로 받는다
}
