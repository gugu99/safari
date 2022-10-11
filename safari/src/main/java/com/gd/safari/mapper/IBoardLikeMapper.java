package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.BoardLike;

@Mapper
public interface IBoardLikeMapper {
	// 좋아요 했는지 안했는지 조회
	String selectBoardLikeByBoardNoAndMemberEmail(BoardLike boardlike);
	
	// 좋아요 추가하기
	int insertBoardLike(BoardLike boardLike);
}
