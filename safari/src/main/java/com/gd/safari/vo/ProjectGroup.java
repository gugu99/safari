package com.gd.safari.vo;

import lombok.Data;

@Data
public class ProjectGroup {
	// 프로젝트를 묶어 보는 기능. 폴더와 유사. 필수값 X
	private int projectGroupNo; // PK
	private String projectGroupName; // 프로젝트 그룹 이름
	private String createDate; // 생성일
	private String updateDate; // 수정일
	private int workNo; // workspace No
}
