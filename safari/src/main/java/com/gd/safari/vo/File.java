package com.gd.safari.vo;

import lombok.Data;

@Data
public class File {
	int fileNo;
	int taskNo;
	String uploader;
	String filename;
	String fileExt;
	String originName;
	String fileType;
	long fileSize;
	String createDate;
	String updateDate;
	
}
