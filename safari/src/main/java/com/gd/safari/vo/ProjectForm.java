package com.gd.safari.vo;

import java.util.List;

import lombok.Data;

@Data
public class ProjectForm {
	private int projectNo;
	private int workNo;
	private String projectName;
	private String projectAuth;
	private List<Integer> projectMemberList;
	private int projManagerNo;
}
