package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.BoardComment;

@Mapper
public interface IBoardCommentMapper {
	// 게시글 댓글 작성하기
	int insertBoardComment(BoardComment boardComment);
	
	// 게시글 댓글 삭제하기
	int deleteBoardComment(int boardCmtNo);
}
