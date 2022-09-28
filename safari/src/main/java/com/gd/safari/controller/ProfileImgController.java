package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IProfileImgService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProfileImgController {
		@Autowired private IProfileImgService profileImgService;
		@Autowired private Map<String,Object> map;
			
		// 워크스페이스생성
		@PostMapping("/member/addProfileImg")
		public String addWorkspace (@RequestParam("imgFile") MultipartFile imgFile,
									HttpSession session) {
			
			// workMemberNo 세션 불러오기
			int workMemberNo = (Integer)session.getAttribute("workMemberNo");				 		
			
			// imgFile 디버깅
			log.debug(TeamColor.CJM+imgFile.getOriginalFilename() +"imgFile.getOriginalFilename");  
			
			// imgFile 디버깅
			log.debug(TeamColor.CJM+imgFile.getName() +"imgFile.getName"); 							
			
			// path 설정
			String path = session.getServletContext().getRealPath("/resources/upload/");			
			
			// map에 imgFile 설정
			map.put("imgFile", imgFile);															 
			
			// map에 workMemberNo 설정
			map.put("workMemberNo", workMemberNo);										   			 
			
			// map에 path 설정
			map.put("path", path);							
			
			// 프로필 이미지 추가
			profileImgService.addProfileImg(map);
			
			// redirect 워크스페이스멤버 상세보기로
			return "redirect:/member/workspaceMemberOne";											  
		}
		@GetMapping("/member/removeProfileImg")
		public String removeWorkspace (	HttpSession session) {
								
			
			// workMemberNo 세션 불러오기
			int workMemberNo = (Integer)session.getAttribute("workMemberNo");				
			
			// path 설정
			String path = session.getServletContext().getRealPath("/resources/upload/");	 
			
			// 이미지삭제
			profileImgService.removeProfileImg(workMemberNo,path);
			
			 // redirect 워크스페이스멤버 상세보기로
			return "redirect:/member/workspaceMemberOne";									 
		}
}
