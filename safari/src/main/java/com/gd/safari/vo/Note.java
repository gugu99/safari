package com.gd.safari.vo;

import lombok.Data;

@Data
public class Note {
	private int noteNo;
	private String noteContent;
	private String noteWriter;
	private String createDate;
	private String updateDate;
	private int tasklistNo;
}
