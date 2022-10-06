package com.gd.safari.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.service.IBoardService;
import com.gd.safari.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	
	@Autowired
	private IBoardService boardService;
	
	@GetMapping("/safari/boardList")
	public String addWorkspace(@RequestParam Map<String,Object> map,Model model,HttpSession session) {
		
		// 세션 워크넘버 가져오기
		int workNo = (Integer)session.getAttribute("workNo");	
		
		// workNo map에 매핑
		map.put("workNo", workNo);
		
		// 리스트 불러오기
		List<Board> list = boardService.selectBoardList(map);
		
		// model에 boardList 매핑
		model.addAttribute("boardList", list);
		
		
		return "board/boardList";
	}
}
