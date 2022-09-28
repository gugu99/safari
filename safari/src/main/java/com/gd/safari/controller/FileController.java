package com.gd.safari.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IFileService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FileController {
	@Autowired private IFileService fileService;
	
	
	@GetMapping("/safari/fileList")
	public String index(HttpSession session ,Model model) {
		
		// 세션 가져오기 projectNo
		int projectNo=(int)session.getAttribute("projectNo");
		
		// 세션 프로젝트 No 
		log.debug(TeamColor.CJM +projectNo+"Controller projectNo");
		
		// 프로젝트 리스트 뽑아오기
		List<com.gd.safari.vo.File> list= fileService.selectAllFileList(projectNo);
		
		model.addAttribute("fileList",list);
		
		// list 디버깅
		log.debug(TeamColor.CJM +list+"Controller list");
		
		// index 이동
		return "file/ProjectFileList"; 														
	}

}
