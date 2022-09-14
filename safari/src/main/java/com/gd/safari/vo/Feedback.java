package com.gd.safari.vo;

import lombok.Data;

@Data
public class Feedback {
	private int feedbackNo;
	private int taskNo;
	private String feedbackContent;
	private String feebackSender;
	private String feedbackAuth;
	private String createDate;
	private String updateDate;
}
