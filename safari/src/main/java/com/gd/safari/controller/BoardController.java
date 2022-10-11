package com.gd.safari.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IBoardService;
import com.gd.safari.vo.Board;
import com.gd.safari.vo.BoardList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	
	@Autowired
	private IBoardService boardService;
	
	@GetMapping("/member/boardList")
	public String boardList(Model model, HttpSession session) {
		
		// 세션 워크넘버 가져오기
		int workNo = (Integer)session.getAttribute("workNo");	
		
		// 세션 로그인 이메일 가져오기
		String email = (String)session.getAttribute("login");
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("workNo", workNo);
		paramMap.put("senderWorkMemberEmail", email);
		
		// 리스트 불러오기
		Map<String, Object> map = boardService.getBoardList(paramMap);
		
		
		// model에 boardList
		model.addAttribute("boardList", map.get("boardList"));
		model.addAttribute("manager", map.get("manager"));
		
		
		return "board/boardList";
	}
	
	// 파일추가
	@PostMapping("/member/addBoard")
	public String addBoard (@RequestParam(value ="file",required = false) List<MultipartFile> file, 
								@RequestParam Map<String,Object> map,
								HttpSession session) {
		log.debug(TeamColor.GDE + "file --- " + file);
		log.debug(TeamColor.GDE + "map --- " + map);
		
		// 어드민 이메일
		String adminEmail = ((String) session.getAttribute("login"));
		
		// workNo 가져오기
		int workNo = (Integer)session.getAttribute("workNo");
		
		// map에 workNo 추가
		map.put("workNo", workNo);
		
		// 첨부파일이 있는지 없는지 확인
		for(MultipartFile a : file) {
			if (a.isEmpty()) {
				file = null;
			}
		}
		
		if (file != null) {
			
			log.debug(TeamColor.GDE + "file.isEmpty() --- " + file.isEmpty());
			// file 디버깅
			for(MultipartFile a : file) {
				log.debug(TeamColor.CJM + a.getOriginalFilename() +" -- getOriginalFilename");
				log.debug(TeamColor.CJM + a.getName() + " -- getName");
			}
			
			// path 설정
			String path = session.getServletContext().getRealPath("/resources/fileupload/");			
			
			// map에 path 설정
			map.put("path", path);	
			
			// upload 추가
			map.put("uploader", map.get("boardWriter"));
		}
		
		// 보드 추가
		boardService.addBoard(map,file);
		
		// redirect 멤
		return "redirect:/member/boardList";											  
	}
	
	// 게시글 고정 여부 변경
	@GetMapping("/member/modifyBoardFix")
	public String modifyBoardFixByBoardNo(RedirectAttributes redirectAttributes, Board board) {
		log.debug(TeamColor.GDE + board);
		
		// 게시글 고정 여부 변경하기
		int row = boardService.modifyBoardFixByBoardNo(board);
		log.debug(TeamColor.GDE + "row --- " + row);
		
		if (row == 1) {
			String boardFixMsg = board.getBoardFix().equals("Y") ? "게시글이 고정되었습니다." : "게시글 고정이 해제되었습니다.";
			redirectAttributes.addFlashAttribute("boardFixMsg", boardFixMsg);
		}
		
		return "redirect:/member/boardList";
	}
	
	// 게시글 삭제하기
	@GetMapping("/member/removeBoard")
	public String removeBoard(RedirectAttributes redirectAttributes, @RequestParam int boardNo) {
		log.debug(TeamColor.GDE + "boardNo --- " + boardNo);
		
		// 게시글 삭제하기
		int row = boardService.removeBoard(boardNo);
		
		// 게시글이 삭제되었으면 메세지 
		if (row == 1) {
			redirectAttributes.addFlashAttribute("boardRemoveMsg", "게시글이 삭제되었습니다.");
		}
		
		return "redirect:/member/boardList";
	}
	
	// 게시글 수정 폼
	@GetMapping("/member/modifyBoard")
	public String modifyBoard(Model model , @RequestParam int boardNo) {
		log.debug(TeamColor.GDE + "boardNo --- " + boardNo);
		
		// 게시글 한개 조회하기
		Map<String, Object> map = boardService.getBoardOne(boardNo);
		log.debug(TeamColor.GDE + "map --- " + map);
		
		model.addAttribute("boardOne", map.get("boardOne"));
		model.addAttribute("fileList", map.get("fileList"));
		
		return"board/modifyBoard";
	}
	
	// 게시글 수정하기 action
	@PostMapping("/member/modifyBoard")
	public String modifyBoard(HttpSession session, 
								@RequestParam(value ="file", required = false) List<MultipartFile> file, 
								@RequestParam(value ="boardFileNo", required = false) int[] boardFileNo,
								@RequestParam Map<String,Object> map) {
		log.debug(TeamColor.GDE + "map --- " + map);
		log.debug(TeamColor.GDE + "file --- " + file);
		log.debug(TeamColor.GDE + "boardFileNo --- " + Arrays.toString(boardFileNo));
		
		// 어드민 이메일
		String adminEmail = ((String) session.getAttribute("login"));
		
		
		// 첨부파일이 있는지 없는지 확인
		for(MultipartFile a : file) {
			if (a.isEmpty()) {
				file = null;
			}
		}
		
		if (file != null) {
			
			// path 설정
			String path = session.getServletContext().getRealPath("/resources/fileupload/");			
			
			// map에 path 설정
			map.put("path", path);	
			
			// upload 추가
			map.put("uploader", adminEmail);
		}
		
		// 게시글 수정하기
		boardService.modifyBoard(map, file, boardFileNo);
	
		return "redirect:/member/boardList";
	}
	
}
