package com.gd.safari.vo;

import lombok.Data;

@Data
public class TodoList {
	private int todolistNo;
	private int projectNo;
	private String todolistTitle;
	private String todolistAuth;
	private String todolistFix;
	private String createDate;
	private String updateDate;
}
