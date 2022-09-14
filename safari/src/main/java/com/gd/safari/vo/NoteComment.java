package com.gd.safari.vo;

import lombok.Data;

@Data
public class NoteComment {
	int noteCmtNo;
	int notNO;
	String notecmtContent;
	String notecmtWriter;
	String notecmtFix;
	String createDate;
	String updateDate;
	int noteCmtUpperNo;
}
