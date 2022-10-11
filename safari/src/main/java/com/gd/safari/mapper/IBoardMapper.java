package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Board;
import com.gd.safari.vo.BoardList;


@Mapper
public interface IBoardMapper {
	
	// boardList 띄우기
	List<BoardList> selectBoardList(int workNo);
	
	// board 추가
	int insertBoard(Map<String,Object> map);
	
	// 게시글 고정여부 수정
	int updateBoardFixByBoardNo(Board board);
	
	// 게시글 삭제
	int deleteBoard(int boardNo);
	
	// 게시글 수정을 위한 게시글 한 개 가져오기(수정폼에 사용)
	Board selectBoardOne(int boardNo);
	
	// 게시글 수정하기
	int updateBoard(Map<String, Object> map);
}
