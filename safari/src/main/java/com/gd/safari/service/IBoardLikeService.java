package com.gd.safari.service;

import com.gd.safari.vo.BoardLike;

public interface IBoardLikeService {
	// 게시글 좋아요 추가하기
	int addBoardLike(BoardLike boardLike);
}
