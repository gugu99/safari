package com.gd.safari.vo;

import lombok.Data;

@Data
public class Feedback {
	private int feedbackNo; // PK
	private int taskNo; // 업무 번호
	private String feedbackContent; // 피드백 내용
	private String feebackSender; // 보낸 이
	private String feedbackAuth; // 공개 범위(공개, 비공개)
	private String createDate; // 생성일
	private String updateDate; // 수정일
}
