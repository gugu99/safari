package com.gd.safari.vo;

import lombok.Data;

@Data
public class ProjectGroupConn {
	// 프로젝트와 프로젝트그룹 연결 테이블
	
	private int projectNo; // 프로젝트 테이블의 PK
	private int projectGroupNo; // 프로젝트그룹 테이블의 PK
	private String createDate; // 생성일(수정일X)
}
