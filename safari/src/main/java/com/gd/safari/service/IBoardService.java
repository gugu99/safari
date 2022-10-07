package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gd.safari.vo.Board;
import com.gd.safari.vo.BoardList;

public interface IBoardService {
	List<BoardList> selectBoardList(Map<String, Object> map);

	int addBoard(Map<String, Object> map, List<MultipartFile> file);
}
