package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Task;

@Mapper
public interface IFileMapper {
	
	// 프로젝트 전체 파일 리스트
	List<Map<String,Object>> selectAllFileList(Map<String,Object> map);
	
	// 파일 삽입 
	int insertFile(Map<String, Object> map);
	
	// 파일 삭제
	int deleteFile(int fileNo);
	
	// 파일 정보상세보기
	com.gd.safari.vo.File selectFileOne(int FileNo);
	
	// 리스트에 따른 파일 업무리스트 받아오기
	List<Task>selectTaskList(int tasklistNo);
	
	// 업무 번호에 따른 리스트
	List<Map<String,Object>>  selectTaskNoFileList (int taskNo);
	
	// 업무리스트 번호에 따른 리스트
	List<Map<String,Object>> selectTasklistNoFileList(int tasklistNo);
}	
