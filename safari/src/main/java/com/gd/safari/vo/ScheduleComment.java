package com.gd.safari.vo;

import lombok.Data;

@Data
public class ScheduleComment {
	private int scheduleCmtNo;
	private String memberEmail;
	private String scheduleCmtContent;
	private String createDate;
	private int scheduleNo;
}
