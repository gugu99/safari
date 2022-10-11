package com.gd.safari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IBoardCommentMapper;
import com.gd.safari.vo.BoardComment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardCommentService implements IBoardCommentService {
	@Autowired
	private IBoardCommentMapper boardCommentMapper;

	// 게시글 댓글 작성하기
	@Override
	public int addBoardComment(BoardComment boardComment) {
		log.debug(TeamColor.GDE + boardComment);
		
		// 댓글 작성하기
		int row = boardCommentMapper.insertBoardComment(boardComment);
		log.debug(TeamColor.GDE + "addBoardComment row --- " + row);
		
		return row;
	}

	// 게시글 댓글 삭제하기
	@Override
	public int removeBoardComment(int boardCmtNo) {
		log.debug(TeamColor.GDE + "boardCmtNo --- " + boardCmtNo);
		
		// 댓글 삭제하기
		int row = boardCommentMapper.deleteBoardComment(boardCmtNo);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		return row;
	}

}
