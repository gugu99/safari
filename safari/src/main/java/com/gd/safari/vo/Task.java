package com.gd.safari.vo;

import lombok.Data;

@Data
public class Task {
	private int taskNo;
	private String taskTitle;
	private String taskContent;
	private String taskWriter;
	private String taskPoint;
	private String taskStart;
	private String taskDeadline;
	private String taskEnd;
	private String createDate;
	private String updateDate;
	private int tasklistNo;
	private int taskUpperNo;
}
