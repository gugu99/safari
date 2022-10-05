package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Board;

@Mapper
public interface IBoardMapper {
	List<Board> selectBoardList(Map<String,Object> map);  
}
