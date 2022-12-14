package com.gd.safari.restController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IFileService;
import com.gd.safari.vo.File;
import com.gd.safari.vo.Task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestFileController {
	@Autowired private IFileService fileService;
	
	
		// 아이디에 맞는 Code 가져오기
		@PostMapping("/member/tasklist")
		public @ResponseBody List<Task> TaskList(@RequestParam(value="tasklistNo") int tasklistNo) {
			
			// 업무리스트번호 디버깅
			log.debug(TeamColor.CJM+tasklistNo +"tasklistNo RestController");
			
			// code 불러오기
			List<Task> list = fileService.getTaskList(tasklistNo);	  
			
			// task 리턴 코드
			return list;
		}
		
		// 아이디에 맞는 Code 가져오기
		@PostMapping("/member/taskFileList")
		public @ResponseBody List<Map<String,Object>> taskFileList(@RequestParam(value="taskNo") int taskNo) {
			
			// 업무리스트번호 디버깅
			log.debug(TeamColor.CJM+taskNo +"taskNo RestController");
			
			// code 불러오기
			List<Map<String,Object>> list = fileService.getTaskNoFileList(taskNo);	  
			
			
			// task 리턴 코드
			
			if (list.size() == 0) {
				Map<String,Object> nullFile = new HashMap<String,Object>();
				nullFile.put("filename", "널");
				list.add(nullFile);
				
				return list;
			}else {
			return list;}
		}
		
		// 아이디에 맞는 Code 가져오기
		@PostMapping("/member/tasklistNoFileList")
		public @ResponseBody List<Map<String,Object>> tasklistNoFileList(@RequestParam(value="tasklistNo") int tasklistNo) {
			
			// 업무리스트번호 디버깅
			log.debug(TeamColor.CJM+tasklistNo +"tasklistNo RestController");
			
			// code 불러오기
			List<Map<String,Object>> list = fileService.getTasklistNoFileList(tasklistNo);	  
			
			// task 리턴 코드
			
			if (list.size() == 0) {
				Map<String,Object> nullFile = new HashMap<String,Object>();
				nullFile.put("filename", "널");
				list.add(nullFile);
				
				return list;
			}else {
			return list;}
		}


}
