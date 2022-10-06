package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.mapper.IBoardMapper;
import com.gd.safari.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class BoardService implements IBoardService{

	@Autowired
	private IBoardMapper boardMapper;
	
	@Override
	public List<Board> selectBoardList(Map<String, Object> map) {
		
		// 워크넘버 디버깅
		log.debug(TeamColor.CJM + map.get("workNo") + "Controller workNo");
		
		// 보드 리스트 메서드
		return boardMapper.selectBoardList(map);
	}

}
