package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.BoardFile;

@Mapper
public interface IBoardFileMapper {
	
	// 보드파일 인서트
	int insertBoardFile(Map<String,Object> map);
	
	// 게시글 수정을 위한 파일 조회
	List<BoardFile> selectBoardFileByBoardNo(int boardNo);
	
	// 게시글 수정을 위한 파일삭제
	int deleteBoardFile(Map<String, Object> map);
}
