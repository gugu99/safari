package com.gd.safari.vo;

import lombok.Data;

@Data
public class ProjectMember {
	private int projectMemberNo;
	private int workMemberNo;
	private int projectNo;
	private String projectMemberAuth;
	private String active;
	private String createDate;
	private String updateDate;
}
