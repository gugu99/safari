package com.gd.safari.vo;

import lombok.Data;

@Data
public class FeedbackReceiver {
	// 하나의 피드백을 여러 사람에게 동시 전송 가능
	
	private int feedbackNo; // PK
	private String feedbackReceiver; // 수신인
	private String createDate; // 생성일
	private String updateDate; // 수정일
}
