package com.gd.safari.vo;

import lombok.Data;

@Data
public class BoardComment {			// 보드(게시판) 댓글을 위한 vo
	private int boardCmtNo;			// 보드 댓글 번호(PK)
	private String boardCmtContent; // 보드 댓글 내용
	private String boardCmtWriter;	// 보드 댓글 작성자
	private String createDate;		// 생성일
	private String updateDate;		// 수정일
	private int boardNo;			// 보드 번호(FK)
}
