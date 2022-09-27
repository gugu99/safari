package com.gd.safari.vo;

import java.util.List;

import lombok.Data;

@Data
public class FeedbackList {
	private int feedbackNo;
	private int workNo;
	private int taskNo;
	private String feedbackSender; // 멤버 email
	private String feedbackContent;
	private String feedbackAuth;
	private String createDate;
	private String senderName;
	private String senderFilename;
	private String senderFileExt;
	private String taskTitle;
	
	private List<FeedbackReceiverList> feedbackReceivers;
}
