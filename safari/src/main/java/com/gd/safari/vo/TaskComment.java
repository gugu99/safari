package com.gd.safari.vo;

import lombok.Data;

@Data
public class TaskComment {
	int taskCmtNo;
	int taskNo;
	String taskCmtContent;
	String taskCmtWriter;
	String taskCmtFix;
	String createDate;
	String updateDate;
	int taskCmtUpperNo;
	
}
