package com.gd.safari.service;

import com.gd.safari.vo.BoardComment;

public interface IBoardCommentService {
	// 게시글 댓글 작성하기
	int addBoardComment(BoardComment boardComment);
	
	// 게시글 댓글 삭제하기
	int removeBoardComment(int boardCmtNo);
}
