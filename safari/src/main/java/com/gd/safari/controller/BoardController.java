package com.gd.safari.controller;

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
	public String addWorkspace(@RequestParam Map<String,Object> map,Model model,HttpSession session) {
		
		// 세션 워크넘버 가져오기
		int workNo = (Integer)session.getAttribute("workNo");	
		
		// workNo map에 매핑
		map.put("workNo", workNo);
		
		// 리스트 불러오기
		List<BoardList> list = boardService.selectBoardList(map);
		
		//
		log.debug(TeamColor.CJM+list.get(0).getFilename() +"getFilename CONTROLLER");
		
		// model에 boardList 매핑
		model.addAttribute("boardList", list);
		
		
		return "board/boardList";
	}
	
	// 파일추가
		@PostMapping("/member/addBoard")
		public String addWorkspace (@RequestParam(value ="file",required = false) List<MultipartFile> file, 
									@RequestParam Map<String,Object> map,
									HttpSession session) {
			
			
			// 어드민 이메일
			String adminEmail = ((String) session.getAttribute("login"));
			
			// workNo 가져오기
			int workNo = (Integer)session.getAttribute("workNo");
			
			// 보드라이터 추가
			map.put("boardWriter", adminEmail);
			
			// map에 workNo 추가
			map.put("workNo", workNo);
			
			if (file.isEmpty()) {

			}else {
				// file 디버깅
				for(MultipartFile a : file) {
				log.debug(TeamColor.CJM+a.getOriginalFilename() +"getOriginalFilename");
				log.debug(TeamColor.CJM+a.getName() +"getName");
				}
				
				// path 설정
				String path = session.getServletContext().getRealPath("/resources/fileupload/");			
				
				// map에 path 설정
				map.put("path", path);	
				
				// upload 추가
				map.put("uploader", adminEmail);
			}
			
			// 보드 추가
			boardService.addBoard(map,file);
			
			// redirect 멤
			return "redirect:/member/boardList";											  
		}
	
}
