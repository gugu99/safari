package com.gd.safari.vo;

import lombok.Data;

@Data
public class BoardFile {
	private int boardFileNo;
	private int boardNo;
	private String uploader;
	private String filename;
	private String fileExt;
	private String originName;
	private String fileType;
	private long fileSize;
	private String createDate;
	private String updateDate;
}
