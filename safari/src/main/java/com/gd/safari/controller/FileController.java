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
import com.gd.safari.service.IFileService;
import com.gd.safari.service.ITaskListService;
import com.gd.safari.vo.TaskList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FileController {
	@Autowired private IFileService fileService;
	@Autowired private ITaskListService taskListService;
	
	
	@GetMapping("/member/fileList")
	public String index(HttpSession session ,Model model) {
		
		// 세션 가져오기 projectNo
		int projectNo=(int)session.getAttribute("projectNo");
		
		// 세션 프로젝트 No 
		log.debug(TeamColor.CJM +projectNo+"Controller projectNo");
		
		// 프로젝트 리스트 뽑아오기
		List<com.gd.safari.vo.File> list= fileService.selectAllFileList(projectNo);
		
		// 업무 리스트 뽑아오기
		List<TaskList> taskList = taskListService.getTaskList(projectNo);
		
		// 업무리스트 매핑
		model.addAttribute("taskList", taskList);
		
		// 파일리스트 매핑
		model.addAttribute("fileList",list);
		
		// list 디버깅
		log.debug(TeamColor.CJM +list+"Controller list");
		
		// index 이동
		return "file/ProjectFileList"; 														
	}
	
	@PostMapping("/member/addFile")
	public String addWorkspace (@RequestParam("file") List<MultipartFile> file, 
								@RequestParam Map<String,Object> map,
								HttpSession session) {
		
		// file 디버깅
		for(MultipartFile a : file) {
		log.debug(TeamColor.CJM+a.getOriginalFilename() +"imgFile.getOriginalFilename");
		log.debug(TeamColor.CJM+a.getName() +"imgFile.getName");
		}
		
		// 어드민 이메일
		String adminEmail = ((String) session.getAttribute("login"));
		
		// path 설정
		String path = session.getServletContext().getRealPath("/resources/fileupload/");			
		
		// map에 path 설정
		map.put("path", path);	
		
		// upload 추가
		map.put("uploader", adminEmail);
		
		// 프로필 이미지 추가
		fileService.addFile(map,file);
		
		// redirect 워크스페이스멤버 상세보기로
		return "redirect:/member/fileList";											  
	}

	@GetMapping("/member/removeFile")
	public String addWorkspace (@RequestParam("fileNo") int fileNo, 
								HttpSession session) {
		log.debug(TeamColor.CJM+fileNo +"fileNoe");
		
		// path 설정
		String path = session.getServletContext().getRealPath("/resources/fileupload/");	 
		
		// 이미지삭제
		fileService.removeFile(fileNo,path);
		
		 // redirect 워크스페이스멤버 상세보기로
		return "redirect:/member/fileList";									  
	}
	
	
	
}
