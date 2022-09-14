package com.gd.safari.vo;

import lombok.Data;

@Data
public class BoardComment {
	private int boardCmtNo;
	private String boardCmtContent;
	private String boardCmtWriter;
	private String createDate;
	private String updateDate;
	private int boardNo;
}
