package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gd.safari.vo.Board;
import com.gd.safari.vo.BoardList;

public interface IBoardService {
	// 게시글 리스트
	Map<String, Object> getBoardList(Map<String, Object> map);
	
	// 게시글 작성하기
	int addBoard(Map<String, Object> map, List<MultipartFile> file);
	
	// 게시글 고정 여부 변경
	int modifyBoardFixByBoardNo(Board board);
	
	// 게시글 삭제하기
	int removeBoard(int boardNo);
	
	// 수정을 위한 게시글 한개 조회(수정폼)
	Map<String, Object> getBoardOne(int boardNo);
	
	// 게시글 수정하기
	void modifyBoard(Map<String, Object> map, List<MultipartFile> file, int[] boardFileNo);
}
