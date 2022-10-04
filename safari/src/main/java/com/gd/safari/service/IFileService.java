package com.gd.safari.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.gd.safari.vo.Task;

public interface IFileService {
	
	// 프로젝트 전체에 따른 리스트
	List<com.gd.safari.vo.File> selectAllFileList(int ProjectNo);
	
	// 파일 인서트
	int addFile(Map<String, Object>map ,List<MultipartFile> file);
	
	// 파일 삭제
	int removeFile(int fileNo,String path);
	
	// 업무리스트번호에따른 업무 리스트
	List<Task>getTaskList(int tasklistNo);
	
	// 업무번호에 따른 리스트
	List<com.gd.safari.vo.File>  getTaskNoFileList (int taskNo);
}
