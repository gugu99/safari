package com.gd.safari.vo;

import lombok.Data;

@Data
public class Todo {
	private int todoNo;
	private int todolistNo;
	private String todoContent;
	private String todoDate;
	private String createDate;
	private String updateDate;
}
