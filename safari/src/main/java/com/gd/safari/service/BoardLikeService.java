package com.gd.safari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IBoardLikeMapper;
import com.gd.safari.vo.BoardLike;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardLikeService implements IBoardLikeService {
	@Autowired
	private IBoardLikeMapper boardLikeMapper;

	// 게시글 좋아요 추가하기
	@Override
	public int addBoardLike(BoardLike boardLike) {
		// 좋아요가 추가되었으면 이미 좋아요를 해서 추가가 안됐으면 0 리턴
		int row = 0;
		
		// 좋아요 눌렀는지 안눌렀는지 조회
		String email = boardLikeMapper.selectBoardLikeByBoardNoAndMemberEmail(boardLike);
		log.debug(TeamColor.GDE + "email --- " + email);
		
		// email이 null이면 좋아요 안누른사람
		if (email == null) {
			row = boardLikeMapper.insertBoardLike(boardLike);
		}
		log.debug(TeamColor.GDE + "row --- " + row);
		
		return row;
	}

}
