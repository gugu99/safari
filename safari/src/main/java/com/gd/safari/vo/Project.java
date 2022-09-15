package com.gd.safari.vo;

import lombok.Data;

@Data
public class Project {
	private int projectNo; // PK
	private int workNo; // 워크스페이스PK(FK)
	private String projectName; // 프로젝트명(not null)
	private String projectExpl; // 프로젝트 설명
	private String projectAuth; // 프로젝트 공개범위(공개/비공개)
	private String projectStart; // 프로젝트 시작일
	private String projectDeadline; // 프로젝트 마감일
	private String projectEnd; // 프로젝트 실제 종료일
	private String projectKeep; // 프로젝트 보관여부("Y" == readonly)
	private String createDate; // 생성일
	private String updateDate; // 수정일
}
