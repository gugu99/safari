package com.gd.safari.vo;

import lombok.Data;

@Data
public class TaskMember {			// 업무멤버를 위한 vo
	private int taskNo;				// 업무 번호(PK)
	private int projectMemberNo;	// 프로젝트 멤버 번호(FK)
}
