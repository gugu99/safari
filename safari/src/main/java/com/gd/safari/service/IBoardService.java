package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import com.gd.safari.vo.Board;

public interface IBoardService {
	List<Board> selectBoardList(Map<String,Object> map);
}
