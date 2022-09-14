package com.gd.safari.vo;

import lombok.Data;

@Data
public class TodoListComment {
	private int todolistCmtNo;
	private String todolistCmtContent;
	private String todolistCmtWriter;
	private String createDate;
	private String updateDate;
	private int todolistNo;
}
