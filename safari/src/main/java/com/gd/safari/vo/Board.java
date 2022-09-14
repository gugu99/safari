package com.gd.safari.vo;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private int projectNo;
	private String boardTitle;
	private String boardContent;
	private String boardLocation;
	private String boardAuth;
	private String boardFix;
	private String boardWriter;
	private String createDate;
	private String updateDate;
}
