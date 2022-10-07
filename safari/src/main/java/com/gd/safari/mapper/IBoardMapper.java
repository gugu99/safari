package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.BoardList;


@Mapper
public interface IBoardMapper {
	
	// boardList 띄우기
	List<BoardList>selectBoardList(Map<String,Object> map);
	
	// board 추가
	int insertBoard(Map<String,Object> map);
}
