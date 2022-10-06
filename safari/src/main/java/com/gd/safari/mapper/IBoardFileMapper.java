package com.gd.safari.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IBoardFileMapper {
	
	// 보드파일 인서트
	int insertBoardFile(Map<String,Object> map);
}
