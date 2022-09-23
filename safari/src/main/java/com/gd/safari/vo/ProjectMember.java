package com.gd.safari.vo;

import lombok.Data;

@Data
public class ProjectMember {
	private int projectMemberNo; // PK
	private int workMemberNo; // 워크스페이스 멤버 테이블의 PK
	private int projectNo; // 프로젝트 테이블의 PK
	private String projectMemberAuth; // 관리자 여부
	private String active; // 현재 프로젝트에 속해있지 않은 사람의 정보도 삭제되면 안되므로
	private String createDate; // 생성일
	private String updateDate; // 수정일
}
