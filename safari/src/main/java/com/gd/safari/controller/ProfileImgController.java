package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		@PostMapping("/safari/addProfileImg")
		public String addWorkspace (@RequestParam("imgFile") MultipartFile imgFile,
									HttpSession session) {
			int workMemberNo = (Integer)session.getAttribute("workMemberNo");				 // workMemberNo 세션 불러오기
			log.debug(TeamColor.CJM+imgFile +"Controller imgFile");							 // imgFile 디버깅
			String path = session.getServletContext().getRealPath("/resources/upload/");	 // path 설정
			map.put("imgFile", imgFile);													 // map에 imgFile 설정
			map.put("workMemberNo", workMemberNo);										     // map에 workMemberNo 설정
			map.put("path", path);															 // map에 path 설정
			profileImgService.addProfileImg(map);
			return "redirect:/safari/workspaceMemberOne";									 // redirect 워크스페이스멤버 상세보기로 
		}
}
