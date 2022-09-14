package com.gd.safari.vo;

import lombok.Data;

@Data
public class Schedule {
	private int scheduleNo;
	private int projectNo;
	private String scheduleStart;
	private String scheduleEnd;
	private String scheduleTitle;
	private String scheduleLocation;
	private String scheduleContent;
	private String scheduleAuth;
	private String createDate;
	private String updateDate;
}
