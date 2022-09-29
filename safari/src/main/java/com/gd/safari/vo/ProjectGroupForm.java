package com.gd.safari.vo;

import java.util.List;

import lombok.Data;

@Data
public class ProjectGroupForm {
	private int projectGroupNo;
	private String projectGroupName;
	private List<Integer> projectList;
}
